package com.example.ef_grupo_2.Beans;

public class Impresion3D extends Servicio{


    private int DensidadPieza;//: Indica cuán resistente va a ser la impresión, a mayor densidad, mayor resistencia. Valores aceptados: 10, 15, 20, 30, 50 o 90.
    private String grosor;   //Se tienen 3 opciones: fino, normal o grueso.

    private Double alturaCapa; //Se tienen 4 opciones: 0.1, 0.2, 0.3 o 0.4.
    private String material; //: Existen 3 tipos de materiales para imprimir: abs, pla y flexible.


    private String urlImagen; //: El usuario ingresa el nombre del archivo (no es necesario subir un archivo de la PC)
    private boolean autoservicio; //: Dos opciones “Si” o “No”.


    public int getDensidadPieza() {
        return DensidadPieza;
    }

    public void setDensidadPieza(int densidadPieza) {
        DensidadPieza = densidadPieza;
    }

    public String getGrosor() {
        return grosor;
    }

    public void setGrosor(String grosor) {
        this.grosor = grosor;
    }

    public Double getAlturaCapa() {
        return alturaCapa;
    }

    public void setAlturaCapa(Double alturaCapa) {
        this.alturaCapa = alturaCapa;
    }

    public String getMaterial() {
        return material;
    }

    public void setMaterial(String material) {
        this.material = material;
    }

    public String getUrlImagen() {
        return urlImagen;
    }

    public void setUrlImagen(String urlImagen) {
        this.urlImagen = urlImagen;
    }

    public boolean isAutoservicio() {
        return autoservicio;
    }

    public void setAutoservicio(boolean autoservicio) {
        this.autoservicio = autoservicio;
    }
}
