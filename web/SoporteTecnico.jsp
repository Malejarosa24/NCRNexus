<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Soporte Técnico NCR Nexus</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

body{

    font-family:Arial, sans-serif;
    background-image:url("img/fondoDashboard.png");
    background-size:cover;
    background-position:center;
    background-repeat:no-repeat;
    color:white;

}

.contenedor{

    display:flex;
    min-height:100vh;

}

.sidebar{

    width:250px;
    background:rgba(0,0,0,0.75);
    border-right:1px solid #00ff66;
    padding:25px 15px;
    display:flex;
    flex-direction:column;
    justify-content:space-between;

}

.logo{

    text-align:center;

}

.logo img{

    width:130px;
    margin-bottom:10px;

}

.logo h2{

    color:white;
    font-size:20px;

}

.menu{

    margin-top:30px;

}

.menu a{

    display:block;
    padding:16px;
    margin-bottom:14px;
    background:rgba(0,0,0,0.55);
    border-radius:10px;
    text-decoration:none;
    color:white;
    transition:0.3s;

}

.menu a:hover{

    background:#00cc66;

}

.logout{

    background:#cc0000 !important;

}

.principal{

    flex:1;
    padding:30px;

}

.encabezado{

    display:flex;
    justify-content:space-between;
    align-items:flex-start;
    margin-bottom:25px;

}

.titulo h1{

    font-size:60px;
    margin-bottom:10px;

}

.titulo p{

    color:#00ff66;
    font-size:20px;

}

.usuario-box{

    width:230px;
    background:rgba(0,0,0,0.75);
    border:2px solid #00ff66;
    border-radius:15px;
    padding:20px;
    box-shadow:0px 0px 20px #00ff66;

}

.usuario-box h3{

    color:#00ff66;
    font-size:20px;
    margin-bottom:10px;

}

.usuario-box p{

    margin-top:6px;
    font-size:16px;

}

.cards{

    display:grid;
    grid-template-columns:repeat(4,1fr);
    gap:18px;
    margin-bottom:25px;

}

.card{

    background:rgba(0,0,0,0.7);
    border:2px solid #00ff66;
    border-radius:15px;
    padding:22px;

}

.card .numero{

    font-size:60px;
    color:#00ff66;
    font-weight:bold;

}

.contenido{

    display:grid;
    grid-template-columns:40% 58%;
    gap:2%;

}

.formulario{

    background:rgba(0,0,0,0.75);
    border:1px solid #00ff66;
    border-radius:15px;
    padding:25px;

}

.formulario h2{

    color:#00ff66;
    margin-bottom:25px;
}

.formulario label{

    display:block;
    margin-top:15px;
    margin-bottom:8px;

}

.formulario input,
.formulario select,
.formulario textarea{

    width:100%;
    padding:14px;
    border-radius:10px;
    border:1px solid #00ff66;
    background:#111;
    color:white;

}

.formulario textarea{

    resize:none;
    height:120px;

}

.formulario button{

    width:100%;
    padding:15px;
    margin-top:20px;
    border:none;
    border-radius:10px;
    cursor:pointer;
    font-size:17px;
    font-weight:bold;

}

.btn-registrar{

    background:#00cc66;
    color:white;

}

.btn-limpiar{

    background:#222;
    color:white;

}

.tabla-box{

    background:rgba(0,0,0,0.75);
    border:1px solid #00ff66;
    border-radius:15px;
    padding:25px;

}

.tabla-header{

    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:20px;

}

.tabla-header h2{

    color:#00ff66;

}

.buscar{

    width:230px;
    padding:12px;
    border-radius:10px;
    border:1px solid #00ff66;
    background:#111;
    color:white;

}

.botones-tabla{

    margin-top:20px;

}

.actualizar{

    width:100%;
    padding:15px;
    border:none;
    border-radius:10px;
    background:#00aa55;
    color:white;
    font-weight:bold;
    cursor:pointer;

}

iframe{

    background:transparent;

}

</style>

</head>

<body>

<div class="contenedor">

<div class="sidebar">

<div>

<div class="logo">

<img src="img/logo.png">

<h2>SISTEMA INTELIGENTE</h2>

</div>

<div class="menu">

<a href="#">🏠 Inicio</a>

<a href="#">🎫 Tickets</a>

<a href="#">📋 Mis asignados</a>

<a href="#">📊 Reportes</a>

<a href="#">⚙ Configuración</a>

</div>

</div>

<div class="menu">

<a href="login.jsp" class="logout">

🚪 Cerrar sesión

</a>

</div>

</div>

<div class="principal">

<div class="encabezado">

<div class="titulo">

<h1>MÓDULO DE SOPORTE TÉCNICO</h1>

<p>Gestión de tickets e incidencias</p>

</div>

<div class="usuario-box">

<h3>

<%= request.getParameter("usuario") %>

</h3>

<p>

Área:
<%= request.getParameter("area") %>

</p>

<p>

ID:
<%= request.getParameter("codigo") %>

</p>

</div>

</div>

<div class="cards">

<div class="card">

<h3>Tickets abiertos</h3>

<div class="numero">12</div>

</div>

<div class="card">

<h3>En proceso</h3>

<div class="numero">4</div>

</div>

<div class="card">

<h3>Resueltos</h3>

<div class="numero">8</div>

</div>

<div class="card">

<h3>Total tickets</h3>

<div class="numero">24</div>

</div>

</div>

<div class="contenido">

<div class="formulario">

<h2>Registrar nuevo ticket</h2>

<form action="TicketServlet" method="post">

<input type="hidden"
name="usuario"
value="<%= request.getParameter("usuario") %>">

<label>Cliente</label>

<input type="text"
name="cliente"
required>

<label>Problema</label>

<select name="problema">

<option>Error inicio de sesion</option>

<option>No carga el sistema</option>

<option>Fallo conexion</option>

<option>Error base de datos</option>

<option>Impresora sin respuesta</option>

<option>Error guardando datos</option>

</select>

<label>Prioridad</label>

<select name="prioridad">

<option>Alta</option>

<option>Media</option>

<option>Baja</option>

</select>

<label>Descripcion</label>

<textarea name="descripcion"></textarea>

<button type="submit"
class="btn-registrar">

Registrar ticket

</button>

<button type="reset"
class="btn-limpiar">

Limpiar

</button>

</form>

</div>

<div class="tabla-box">

<div class="tabla-header">

<h2>Lista de tickets</h2>

<form action="MostrarTickets.jsp"
method="get"
target="frameTickets">

<input type="text"
name="buscar"
placeholder="Buscar ticket..."
class="buscar">

</form>

</div>

<iframe
id="frameTickets"
name="frameTickets"
src=""
width="100%"
height="420px"
style="border:none;">
</iframe>

<div class="botones-tabla">

<button class="actualizar"
onclick="actualizarTabla()">

🔄 Actualizar

</button>

</div>

</div>

</div>

</div>

</div>

<script>

function actualizarTabla(){

    document.getElementById("frameTickets").src =
    "MostrarTickets.jsp";

}

</script>

</body>

</html>