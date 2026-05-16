package modelo;

import java.sql.Connection;
import java.sql.DriverManager;

public class conexion {

    Connection con;

    public Connection conectar(){

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/ncrnexus?useUnicode=true&characterEncoding=UTF-8",
            "root",
            ""
            );

            System.out.println("Conexión exitosa");

        } catch (Exception e) {

            System.out.println("Error de conexión: " + e);

        }

        return con;

    }

}