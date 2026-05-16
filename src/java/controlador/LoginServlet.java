package controlador;

import modelo.conexion;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String usuario = request.getParameter("usuario");
        String password = request.getParameter("password");

        try {

            conexion cn = new conexion();
            Connection con = cn.conectar();

            String sql = "SELECT * FROM usuarios WHERE nombre=? AND password=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, usuario);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if(rs.next()){

                request.setAttribute("usuario",
                        rs.getString("nombre"));

                request.setAttribute("area",
                        rs.getString("area"));

                request.setAttribute("codigo",
                        rs.getString("codigo"));

                request.getRequestDispatcher("bienvenida.jsp")
                        .forward(request, response);

            }else{

                response.sendRedirect("login.jsp");

            }

        } catch (Exception e) {

            System.out.println("Error login: " + e);

        }

    }

}