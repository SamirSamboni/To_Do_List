/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mundo.lista;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletContext;

/**
 *
 * @author Brian Castro - Samir Samboni 
 */
public class Persistencia {

    public static void escribirArchivo(ArrayList<Usuarios> misUsuarios, ServletContext context) throws FileNotFoundException {

        // Ruta del archivo de datos.
        String rutaRelativa = "/data/usuariosRegistrados.txt";
        String rutaAbsoluta = context.getRealPath(rutaRelativa);
        File archivo = new File(rutaAbsoluta);

        try (PrintWriter pluma = new PrintWriter(archivo)) {
            // Recorrer la lista de usuarios y guardar sus datos en el archivo.
            for (Usuarios usuario : misUsuarios) {
                // Organizar la información del alumno en una línea y escribirla en el archivo.
                String linea = usuario.getCedula() + "," + usuario.getNombreUsuario() + ","
                        + usuario.getContrasena();
                pluma.println(linea);
            }

        } catch (FileNotFoundException e) {
            System.out.println("El archivo de datos no pudo ser encontrado.");
        }
    }

    public static void leerArchivo(ArrayList<Usuarios> misUsuarios, ServletContext context) throws FileNotFoundException, IOException {

        // Dirección del archivo de datos.
        String rutaRelativa = "/data/usuariosRegistrados.txt";
        String rutaAbsoluta = context.getRealPath(rutaRelativa);
        File archivo = new File(rutaAbsoluta);

        try (FileReader fr = new FileReader(archivo); BufferedReader lector = new BufferedReader(fr)) {

            String linea;
            // Leer cada línea del archivo y manejar los datos correspondientes.

            while ((linea = lector.readLine()) != null) {
                String[] datos = linea.split(",");

                String cedula = datos[0].trim();
                String nombre = datos[1].trim();
                String contrasenia = datos[2].trim();

                // Construir un objeto Usuario con los datos leídos y añadirlo a la lista.
                Usuarios usuario = new Usuarios(Integer.parseInt(cedula), nombre, contrasenia);
                misUsuarios.add(usuario);
            }

        } catch (FileNotFoundException e) {
            System.out.println("No fue posible encontrar el archivo de datos.");
        } catch (IOException e) {
            System.out.println("Se produjo un error durante la lectura del archivo.");
        }
    }

}