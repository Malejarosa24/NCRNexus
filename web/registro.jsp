<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Registro NCR Nexus</title>

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

    justify-content:center;

    align-items:center;

    background-image:url("img/fondo.png");

    background-size:cover;

    background-position:center;

    background-repeat:no-repeat;

}

.contenedor{

    width:450px;

    background:rgba(0,0,0,0.90);

    border:2px solid #00ff66;

    border-radius:20px;

    padding:35px;

    text-align:center;

    color:white;

    box-shadow:0px 0px 25px #00ff66;

}

h1{

    font-size:40px;

    margin-bottom:10px;

}

h3{

    margin-bottom:30px;

    color:#b8ffcf;

    font-weight:normal;

}

input, select{

    width:100%;

    padding:15px;

    margin-top:15px;

    border:none;

    border-radius:10px;

    background:#1c1c1c;

    color:white;

    font-size:16px;

}

input::placeholder{

    color:#cccccc;

}

button{

    width:100%;

    padding:15px;

    margin-top:25px;

    border:none;

    border-radius:10px;

    background:#00cc44;

    color:white;

    font-size:20px;

    font-weight:bold;

    cursor:pointer;

    transition:0.3s;

}

button:hover{

    background:#00ff55;

}

.login{

    margin-top:25px;

}

.login a{

    color:#00ff99;

    text-decoration:none;

    font-weight:bold;

}

.login a:hover{

    text-decoration:underline;

}

</style>

</head>

<body>

<div class="contenedor">

    <h1>Crear cuenta</h1>

    <h3>Registro de empleados NCR Nexus</h3>

    <form action="RegistroServlet" method="POST">

        <input type="text"
               name="nombre"
               placeholder="Ingrese nombre"
               required>

        <input type="email"
               name="correo"
               placeholder="Ingrese correo"
               required>

        <input type="password"
               name="password"
               placeholder="Ingrese contraseña"
               required>

        <select name="area" required>

            <option value="">Seleccione área</option>

            <option>Soporte tecnico</option>

            <option>Ventas</option>

            <option>Atencion al cliente</option>

        </select>

        <button type="submit">

            Registrarse

        </button>

    </form>

    <div class="login">

        ¿Ya tienes cuenta?

        <br><br>

        <a href="login.jsp">

            Iniciar sesión

        </a>

    </div>

</div>

</body>
</html>