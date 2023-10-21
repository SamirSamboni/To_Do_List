package com.mundo.lista;

/**
 * 
 * @author Brian Castro - Samir Samboni 
 */
public class Usuarios {

    private int cedula;
    private String nombreUsuario;
    private String contrasena;
    /**
     * Constructor vacio
     */
    public Usuarios() {

    }
    /**
/**
 * Constructor
 * @param cedula Cédula del usuario.
 * @param nombreUsuario Nombre del usuario.
 * @param contrasena Contraseña del usuario.
 */

    public Usuarios(int cedula, String nombreUsuario, String contrasena) {
        this.cedula = cedula;
        this.nombreUsuario = nombreUsuario;
        this.contrasena = contrasena;
    }
    /**
     * Getters
     * @return 
     */
    public int getCedula() {
        return cedula;
    }

    public void setCedula(int cedula) {
        this.cedula = cedula;
    }

    public String getNombreUsuario() {
        return nombreUsuario;
    }
    /**
     * Setters
     * @param  
     */
    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

}