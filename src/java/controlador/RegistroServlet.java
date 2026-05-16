package controlador;

import modelo.conexion;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RegistroServlet")
public class RegistroServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String nombre = request.getParameter("nombre");
        String correo = request.getParameter("correo");
        String password = request.getParameter("password");
        String area = request.getParameter("area");

        String codigo = "";

        if(area.equals("Soporte tecnico")){

            codigo = "SOT-" + (int)(Math.random()*1000);

        }else if(area.equals("Ventas")){

            codigo = "VEN-" + (int)(Math.random()*1000);

        }else if(area.equals("Atencion al cliente")){

            codigo = "ATC-" + (int)(Math.random()*1000);

        }

        try {

            conexion cn = new conexion();
            Connection con = cn.conectar();

            String sql = "INSERT INTO usuarios(nombre, correo, password, area, codigo) VALUES(?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, nombre);
            ps.setString(2, correo);
            ps.setString(3, password);
            ps.setString(4, area);
            ps.setString(5, codigo);

            ps.executeUpdate();

            response.sendRedirect("login.jsp");

        } catch (Exception e) {

            System.out.println("Error: " + e);

        }

    }

}