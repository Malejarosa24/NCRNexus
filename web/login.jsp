<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Login NCR Nexus</title>

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
    padding-right:12%;
    background-image:url("img/fondo.png");
    background-size:cover;
    background-position:left center;
    background-repeat:no-repeat;
    overflow:hidden;
}

.contenedor{
    width:100%;
    max-width:420px;
    padding:40px;
    border-radius:20px;
    background:rgba(0,0,0,0.60);
    backdrop-filter:blur(6px);
    border:1px solid #00ff66;
    box-shadow:0px 0px 20px rgba(0,255,100,0.5);
    text-align:center;
    color:white;
}

h1{
    font-size:58px;
    margin-bottom:10px;
    color:white;
}

h3{
    margin-bottom:30px;
    color:#b8ffcb;
    font-weight:normal;
    font-size:18px;
}

input{
    width:100%;
    padding:15px;
    margin-bottom:18px;
    border:none;
    border-radius:12px;
    background:rgba(255,255,255,0.12);
    color:white;
    font-size:15px;
    outline:none;
}

input::placeholder{
    color:#d9d9d9;
}

button{
    width:100%;
    padding:15px;
    border:none;
    border-radius:12px;
    background:#00d84a;
    color:white;
    font-size:17px;
    cursor:pointer;
    transition:0.3s;
    margin-top:5px;
    font-weight:bold;
}

button:hover{
    background:#00ff55;
    transform:scale(1.03);
}

.registro{
    margin-top:25px;
    font-size:15px;
}

.registro a{
    color:#00ff99;
    text-decoration:none;
    font-weight:bold;
}

.registro a:hover{
    text-decoration:underline;
}

/* adaptable para pantallas pequeñas */

@media(max-width:900px){

    body{
        justify-content:center;
        padding-right:0;
        padding-left:0;
    }

    .contenedor{
        width:90%;
    }

    h1{
        font-size:45px;
    }

}

</style>

</head>

<body>

<div class="contenedor">

<h1>NCR Nexus</h1>

<h3>Inicio de sesión</h3>

<form action="LoginServlet" method="POST">

<input type="text"
name="usuario"
placeholder="Ingrese usuario"
required>

<input type="password"
name="password"
placeholder="Ingrese contraseña"
required>

<button type="submit">

Iniciar sesión

</button>

</form>

<div class="registro">

¿No tienes cuenta?

<br><br>

<a href="registro.jsp">

Crear cuenta

</a>

</div>

</div>

</body>

</html>