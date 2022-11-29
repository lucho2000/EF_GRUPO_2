package com.example.ef_grupo_2.Beans;

public class CorteLaser extends Servicio{

    private String grosorLinea; //: Fino o grueso.
    private String colorLinea; //: Puede ser rojo o negro.
    private String material; //: Existen 3 tipos de materiales que se pueden cortar: acrílico, mdf y cartón.


    //Dimensiones: el usuario ingresa el alto y ancho en centímetros, valores enteros positivos.
    private int alto;
    private int ancho;

    private String urlImagen; ///: el usuario ingresa el nombre del archivo.


    public String getGrosorLinea() {
        return grosorLinea;
    }

    public void setGrosorLinea(String grosorLinea) {
        this.grosorLinea = grosorLinea;
    }

    public String getColorLinea() {
        return colorLinea;
    }

    public void setColorLinea(String colorLinea) {
        this.colorLinea = colorLinea;
    }

    public String getMaterial() {
        return material;
    }

    public void setMaterial(String material) {
        this.material = material;
    }

    public int getAlto() {
        return alto;
    }

    public void setAlto(int alto) {
        this.alto = alto;
    }

    public int getAncho() {
        return ancho;
    }

    public void setAncho(int ancho) {
        this.ancho = ancho;
    }

    public String getUrlImagen() {
        return urlImagen;
    }

    public void setUrlImagen(String urlImagen) {
        this.urlImagen = urlImagen;
    }
}
