package com.example.ef_grupo_2.Daos;

import com.example.ef_grupo_2.Beans.*;

import java.sql.*;
import java.util.ArrayList;

public class ServicioDao extends DaoBase{
    Impresion3D impresion3D = new Impresion3D();
    CorteLaser corteLaser = new CorteLaser();

    Escaneo3D escaneo3D = new Escaneo3D();

    Usuarios usuario = new Usuarios();
    int material;
    int resolucion;
    float descto;
    public Double calculoCosto(String servicio){

        Double costo = null;
        int color = 0;
        int grosor = 0;
        if (usuario.getTipoUsuario().equalsIgnoreCase("interno")){
            descto = 0.2f;
        } else {
            descto = 1f;
        }
        switch (servicio){

            case "impresion3D":

                if (impresion3D.getMaterial().equalsIgnoreCase("abs")){

                    material = 3;
                } else if (impresion3D.getMaterial().equalsIgnoreCase("pla")) {
                    material = 4;
                } else if (impresion3D.getMaterial().equalsIgnoreCase("flexible")) {
                    material = 5;
                }
                

                costo = (impresion3D.getDensidadPieza() *0.3) * (impresion3D.getAlturaCapa()*0.3) * (material) * descto;
                break;


            case "corteLaser":


                if (corteLaser.getMaterial().equalsIgnoreCase("mdf")){

                    material = 3;
                } else if (corteLaser.getMaterial().equalsIgnoreCase("carton")) {
                    material = 2;
                } else if (corteLaser.getMaterial().equalsIgnoreCase("acrilico")) {
                    material = 5;
                }

                if (corteLaser.getGrosorLinea().equalsIgnoreCase("fino")){

                    grosor = 2;
                } else if (corteLaser.getMaterial().equalsIgnoreCase("grueso")) {
                    grosor = 3;
                }

                if (corteLaser.getColorLinea().equalsIgnoreCase("rojo")){

                    color = 2;
                } else if (corteLaser.getMaterial().equalsIgnoreCase("negro")) {
                    color = 3;
                }

                costo = (grosor) * (color) * (material) * (corteLaser.getAlto()*corteLaser.getAncho()*0.1) * descto;
                break;

            case "escaneo3D":
                if (escaneo3D.getResolucion().equalsIgnoreCase("alta")){

                    resolucion = 3;
                } else if (escaneo3D.getResolucion().equalsIgnoreCase("media")) {
                    resolucion = 2;
                } else if (escaneo3D.getResolucion().equalsIgnoreCase("baja")) {
                    resolucion = 1;
                }
                
                costo = (escaneo3D.getLargo()) * (escaneo3D.getAncho()) * (escaneo3D.getAltura()) * (resolucion) *1.0;
                break;

        }

        return costo;
    }


    public Float calculoTiempo(String servicio){

        Float tiempo = 0f;

        switch (servicio){

            case "impresion3D":

                tiempo =  (impresion3D.getDensidadPieza() *0.1f);
                break;


            case "corteLaser":

                if (corteLaser.getMaterial().equalsIgnoreCase("mdf")){

                    material = 3;
                } else if (corteLaser.getMaterial().equalsIgnoreCase("carton")) {
                    material = 4;
                } else if (corteLaser.getMaterial().equalsIgnoreCase("acrilico")) {
                    material = 2;
                }

                tiempo = (material) *0.1f;
                break;

            case "escaneo3D":

                if (escaneo3D.getResolucion().equalsIgnoreCase("alta")){

                    resolucion = 2;
                } else if (escaneo3D.getResolucion().equalsIgnoreCase("baja")) {
                    resolucion = 1;
                }

                tiempo = resolucion *0.2f;
                break;

        }

        return tiempo;

    }


    public void crearServicio(Servicio servicio){
        String sql = "INSERT INTO servicios (fecha, info) VALUES (?,?)";

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, servicio.getFecha());
            pstmt.setString(2, servicio.getInformacion());
            pstmt.setString(3, usuario.getApellido());


            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void borrar(int idServicio) {

        String sql = "UPDATE servicios SET valida=0 where idservicios  = ?";

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setInt(1, idServicio);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public ArrayList<Servicio> listarServicios (){

        ArrayList<Servicio> listarServicios = new ArrayList<>();
        String sql = "SELECT u.codigo, u.nombre, u.apellido, u.correo, u.DNI, u.validaUsuario, u.password, u.celular, r.idRoles, r.nombreRol, catpucp.idCategoriaPUCP, catpucp.nombreCategoria,\n" +
                "fp.idFotoPerfil, fp.nombreFoto, fp.fotoPerfil\n" +
                "FROM Usuarios u inner join Roles r on r.idRoles = u.idRoles left join CategoriaPUCP catpucp on catpucp.idCategoriaPUCP = u.idCategoriaPUCP \n" +
                "left join FotoPerfil fp on u.idFotoPerfil = fp.idFotoPerfil where validaUsuario = 1 order by u.codigo;";
        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery( sql);) {

            while (rs.next()) {
                Servicio servicio = new Servicio();
                servicio.setIdServicio(rs.getInt(1));

                usuario.setNombre(rs.getString(2));
                usuario.setApellido(rs.getString(3));
                usuario.setCorreo(rs.getString(4));
                usuario.setDni(rs.getString(5));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }





}
