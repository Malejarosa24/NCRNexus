<%@page import="java.sql.*"%>
<%@page import="modelo.conexion"%>

<%

String busqueda = request.getParameter("buscar");

if(busqueda == null){
    busqueda = "";
}

%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<style>

body{
    background: transparent;
    font-family: Arial;
}

table{
    width: 100%;
    border-collapse: collapse;
    color: white;
}

th{
    background: #00e676;
    padding: 12px;
}

td{
    padding: 10px;
    border-bottom: 1px solid #1f1f1f;
    text-align: center;
}

.estado{
    padding: 6px 12px;
    border-radius: 10px;
    font-size: 13px;
    font-weight: bold;
}

.abierto{
    background: green;
}

.proceso{
    background: orange;
}

.resuelto{
    background: dodgerblue;
}

.btnEstado{

    background: orange;
    color: black;
    border: none;
    padding: 8px 12px;
    border-radius: 8px;
    cursor: pointer;
    font-weight: bold;

}

.btnEliminar{

    background: crimson;
    color: white;
    border: none;
    padding: 8px 12px;
    border-radius: 8px;
    cursor: pointer;
    font-weight: bold;

}

</style>

</head>

<body>

<table>

<tr>

<th>ID</th>
<th>Cliente</th>
<th>Problema</th>
<th>Estado</th>
<th>Prioridad</th>
<th>Fecha</th>
<th>Acciones</th>

</tr>

<%

try{

    conexion cn = new conexion();

    Connection con = cn.conectar();

    String sql = "SELECT * FROM tickets WHERE cliente LIKE ? ORDER BY fecha DESC";

    PreparedStatement ps = con.prepareStatement(sql);

    ps.setString(1, "%" + busqueda + "%");

    ResultSet rs = ps.executeQuery();

    while(rs.next()){

        String estado = rs.getString("estado");

        String claseEstado = "";

        if(estado.equals("Abierto")){

            claseEstado = "abierto";

        }else if(estado.equals("En proceso")){

            claseEstado = "proceso";

        }else{

            claseEstado = "resuelto";

        }

%>

<tr>

<td><%= rs.getString("ID") %></td>

<td><%= rs.getString("cliente") %></td>

<td><%= rs.getString("problema") %></td>

<td>

<span class="estado <%= claseEstado %>">

<%= estado %>

</span>

</td>

<td><%= rs.getString("prioridad") %></td>

<td><%= rs.getString("fecha") %></td>

<td>

<a href="CambiarEstadoServlet?id=<%= rs.getString("ID") %>">

<button class="btnEstado">

Cambiar

</button>

</a>

<a href="EliminarTicketServlet?id=<%= rs.getString("ID") %>"
onclick="return confirm('¿Deseas eliminar este ticket?')">

<button class="btnEliminar">

Eliminar

</button>

</a>

</td>

</tr>

<%

    }

}catch(Exception e){

    out.println("Error: " + e);

}

%>

</table>

</body>

</html>