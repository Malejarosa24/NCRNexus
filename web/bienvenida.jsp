<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>Bienvenida NCR Nexus</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

body{

    font-family:Arial, sans-serif;

    min-height:100vh;

    display:flex;

    justify-content:flex-end;

    align-items:center;

    padding-right:120px;

    background-image:url("img/fondo.png");

    background-size:cover;

    background-position:center;

    background-repeat:no-repeat;

}

.contenedor{

    width:520px;

    background:rgba(0,0,0,0.88);

    border:2px solid #00ff66;

    border-radius:20px;

    padding:30px;

    text-align:center;

    color:white;

    box-shadow:0px 0px 25px #00ff66;

}

h1{

    font-size:34px;

    margin-bottom:10px;

    line-height:50px;

}

.usuario{

    color:#00ff66;

    font-size:42px;

    font-weight:bold;

    margin-top:15px;

    margin-bottom:15px;

}

.info{

    margin-top:10px;

    margin-bottom:20px;

    color:#00ff66;

    font-size:18px;

    line-height:30px;

}

.frase{

    margin-top:15px;

    font-style:italic;

    font-size:16px;

    color:#dddddd;

    line-height:30px;

}

.mensaje{

    margin-top:20px;

    border:1px solid #00ff66;

    padding:15px;

    border-radius:10px;

    background:rgba(0,255,100,0.08);

    font-size:16px;

    line-height:24px;

}

.boton{

    width:100%;

    padding:15px;

    margin-top:20px;

    border:none;

    border-radius:10px;

    font-size:20px;

    cursor:pointer;

    transition:0.3s;

    font-weight:bold;

}

.entrar{

    background:#00cc44;

    color:white;

}

.entrar:hover{

    background:#00ff55;

}

.cerrar{

    background:#cc0000;

    color:white;

}

.cerrar:hover{

    background:red;

}

</style>

</head>

<body>

<div class="contenedor">

    <h1>

        Bienvenid@ de nuevo

    </h1>

    <div class="usuario">

        <%= request.getAttribute("usuario") %> 💚

    </div>

    <div class="info">

        Area · <%= request.getAttribute("area") %>

        <br>

        ID · <%= request.getAttribute("codigo") %>

    </div>

    <div class="frase">

        "La tecnología impulsa sistemas.
        Las ideas impulsan el futuro"

    </div>

    <div class="mensaje">

        En NCR Nexus impulsamos la innovación,
        la automatización y el talento humano
        para transformar ideas en soluciones
        que construyen un futuro mejor.

    </div>

<form action="SoporteTecnico.jsp" method="post">

    <input type="hidden"
           name="usuario"
           value="<%= request.getAttribute("usuario") %>">

    <input type="hidden"
           name="area"
           value="<%= request.getAttribute("area") %>">

    <input type="hidden"
           name="codigo"
           value="<%= request.getAttribute("codigo") %>">

    <button class="boton entrar" type="submit">

        Entrar al sistema

    </button>

</form>

    <br>

    <button class="boton cerrar"
            onclick="window.location='login.jsp'">

        Cerrar sesión

    </button>

</div>

</body>
</html>