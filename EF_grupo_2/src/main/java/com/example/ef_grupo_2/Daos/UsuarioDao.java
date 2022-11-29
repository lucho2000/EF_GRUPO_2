package com.example.ef_grupo_2.Daos;

import com.example.ef_grupo_2.Beans.Usuarios;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class UsuarioDao extends  DaoBase{

    public void crearUsuario(Usuarios usuario){
        String sql = "INSERT INTO Usuarios (correo, nombre, apellido, contraseña, tipo) VALUES (?,?,?,sha2(?,256),?)";

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, usuario.getCorreo());
            pstmt.setString(2, usuario.getNombre());
            pstmt.setString(3, usuario.getApellido());
            pstmt.setString(4, usuario.getContrasena());
            pstmt.setString(5, usuario.getTipoUsuario());

            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    public Usuarios ingresarLogin(String username, String password) {

        Usuarios usuario = new Usuarios();

        //Comparar primero con la tabla de usuarios
        //antes del sql se debe hashear el password para comparar los hashes
        String sql = "select * from usuarios where correo=? and contraseña=sha2(?,256)";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql);) {
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    String codigo = rs.getString(1);
                    usuario = buscarPorId(codigo);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return usuario;

    }


    public boolean emailisValid(String email) {
        String regex = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@" + "pucp.edu.pe";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(email);
        return matcher.find();
    }

    public boolean contrasenaisValid(String contrasenia) {
        String regex = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}$";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(contrasenia);
        return matcher.find();
    }




}
