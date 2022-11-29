package com.example.ef_grupo_2.Daos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DaoBase {

    public Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch(ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        String user= "root";
        String pass="123456";

        String url = "jdbc:mysql://:3306/finalgrupo2?serverTimezone=America/Lima";
        //return DriverManager.getConnection(url,user,passBD);
        return DriverManager.getConnection(url,user,pass);
    }
}
