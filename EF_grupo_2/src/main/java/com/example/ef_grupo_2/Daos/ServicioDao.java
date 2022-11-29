package com.example.ef_grupo_2.Daos;

public class ServicioDao {

    public Double calculoCosto(String servicio){

        Double costo;
        switch (servicio){

            case "impresion3D":

                costo = (densidad*0.3) * (altura*0.3) * (material) * descto;
                break;


            case "corteLaser":

                costo = (grosor) * (color) * (material) * (alto*ancho*0.1) * descto;
                break;

            case "escaneo3D":

                costo = (largo) * (ancho) * (altura) * (resolucion);
                break;

        }

        return costo;
    }


    public Float calculoTiempo(){




    }
}
