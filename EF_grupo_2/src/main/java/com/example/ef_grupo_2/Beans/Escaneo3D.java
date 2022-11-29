package com.example.ef_grupo_2.Beans;

public class Escaneo3D {

    private float Largo; //: en cm. (acepta decimales)
    private float Ancho; //: en cm. (acepta decimales)
    private float altura; //: en cm. (acepta decimales)
    private String resolucion;//: Alta, Media o baja


    public float getLargo() {
        return Largo;
    }

    public void setLargo(float largo) {
        Largo = largo;
    }

    public float getAncho() {
        return Ancho;
    }

    public void setAncho(float ancho) {
        Ancho = ancho;
    }

    public float getAltura() {
        return altura;
    }

    public void setAltura(float altura) {
        this.altura = altura;
    }

    public String getResolucion() {
        return resolucion;
    }

    public void setResolución(String resolucion) {
        this.resolucion = resolucion;
    }
}
