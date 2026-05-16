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

@WebServlet("/EliminarTicketServlet")
public class EliminarTicketServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");

        try {

            conexion cn = new conexion();

            Connection con = cn.conectar();

            String sql = "DELETE FROM tickets WHERE ID=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, id);

            ps.executeUpdate();

            response.sendRedirect("MostrarTickets.jsp");

        } catch (Exception e) {

            System.out.println("Error eliminar: " + e);

        }

    }

}