package controlador;

import modelo.conexion;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/TicketServlet")
public class TicketServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String cliente = request.getParameter("cliente");
        String problema = request.getParameter("problema");
        String prioridad = request.getParameter("prioridad");
        String descripcion = request.getParameter("descripcion");
        String usuario = request.getParameter("usuario");

        String estado = "Abierto";

        LocalDate fechaActual = LocalDate.now();

        try {

            conexion cn = new conexion();
            Connection con = cn.conectar();

            String idTicket = "TKT-" + System.currentTimeMillis();

            String sql = "INSERT INTO tickets VALUES(?,?,?,?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, idTicket);
            ps.setString(2, cliente);
            ps.setString(3, problema);
            ps.setString(4, prioridad);
            ps.setString(5, descripcion);
            ps.setString(6, estado);
            ps.setDate(7, java.sql.Date.valueOf(fechaActual));
            ps.setString(8, usuario);

            ps.executeUpdate();

            con.close();

            response.sendRedirect(
                "SoporteTecnico.jsp?usuario="
                + usuario
                + "&area=Soporte tecnico&codigo=SOT-9"
            );

        } catch (Exception e) {

            e.printStackTrace();

        }

    }

}