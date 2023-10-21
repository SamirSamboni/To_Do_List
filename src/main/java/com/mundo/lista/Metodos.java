/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mundo.lista;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletContext;

/**
 * 
 * @author Brian Castro - Samir Samboni 
 */

public class Metodos {
    
/**
 * Método para verificar el usuario en el inicio de sesión.
 * @param cedulaS Cédula del usuario.
 * @param password2 Contraseña del usuario.
 * @param context Contexto del servlet.
 * @return
 * @throws IOException 
 */

    public static String verificarUsuario(int cedulaS, String password2, ServletContext context) throws IOException{
        ArrayList<Usuarios> misUsuarios = new ArrayList<>(); 

        Persistencia.leerArchivo(misUsuarios, context); 
        
        for (Usuarios u: misUsuarios){ 
            //Si se encuentran coincidencias de cédula y contraseña en un mismo objeto.
            if (u.getCedula()==cedulaS && u.getContrasena().equals(password2)){
                return u.getNombreUsuario(); 
            }
        }
        return "No encontrado"; //Si no se encuentran coincidencias, se envía un mensaje indicando que no se encontró.
    }
/**
 * Método para encontrar cédulas iguales.
 * @param cedulaM Cédula a comparar.
 * @param context Contexto del servlet.
 * @return
 * @throws IOException 
 */

    public static boolean encontrarUsuariosIg(int cedulaM, ServletContext context) throws IOException{
        ArrayList<Usuarios> misUsuarios = new ArrayList<>(); 

        Persistencia.leerArchivo(misUsuarios, context); 
        
        for (Usuarios u: misUsuarios){ 
             //En caso de hallar una cedula igual
            if (u.getCedula()==cedulaM){
                return false; //Se devuelve false
            }
        }
        return true; //Si no se encontró coincidencias se envia true.
    }
    
    
}