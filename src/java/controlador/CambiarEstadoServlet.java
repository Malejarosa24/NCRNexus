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

@WebServlet("/CambiarEstadoServlet")
public class CambiarEstadoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");

        try {

            conexion cn = new conexion();

            Connection con = cn.conectar();

            String estadoActual = "";

            String consulta =
            "SELECT estado FROM tickets WHERE ID=?";

            PreparedStatement ps1 =
            con.prepareStatement(consulta);

            ps1.setString(1, id);

            ResultSet rs = ps1.executeQuery();

            if(rs.next()){

                estadoActual = rs.getString("estado");

            }

            String nuevoEstado = "";

            if(estadoActual.equals("Abierto")){

                nuevoEstado = "En proceso";

            }
            else if(estadoActual.equals("En proceso")){

                nuevoEstado = "Resuelto";

            }
            else{

                nuevoEstado = "Abierto";

            }

            String sql =
            "UPDATE tickets SET estado=? WHERE ID=?";

            PreparedStatement ps2 =
            con.prepareStatement(sql);

            ps2.setString(1, nuevoEstado);

            ps2.setString(2, id);

            ps2.executeUpdate();

            response.sendRedirect("MostrarTickets.jsp");

        } catch (Exception e) {

            System.out.println("Error estado: " + e);

        }

    }

}