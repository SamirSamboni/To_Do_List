/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mundo.lista;

import java.io.Serializable;

/**
 *
 * @author Brian Castro - Samir Samboni
 */
public class Lista implements Serializable {

    private Nodo encabezado;

    private class Nodo implements Serializable {

        public Tareas tareas;
        public Nodo siguientes = null;

        public Nodo(Tareas tarea) {
            this.tareas = tarea;
        }
    }

    public void insertarPrincipio(Tareas tarea) {
        Nodo nodo = new Nodo(tarea);
        nodo.siguientes = encabezado;
        encabezado = nodo;
    }

    public int longitud() {
        Nodo actual = encabezado;
        int longitud = 0;
        while (actual != null) {
            Tareas tarea = actual.tareas;
            longitud = longitud + 1;
            actual = actual.siguientes;
        }
        return longitud;
    }

    public void eliminarTarea(int id) {
        if (encabezado != null) {
            // Situación especial: eliminar el primer elemento.
            if (encabezado.tareas.getId() == id) {
                Nodo primer = encabezado;
                encabezado = encabezado.siguientes;
                primer.siguientes = null;
                return;  // Tarea eliminada, salimos del método.

            }

            Nodo anterior = encabezado;
            Nodo actual = encabezado.siguientes;

            while (actual != null) {
                if (actual.tareas.getId() == id) {
                    // Hemos encontrado la tarea que debe eliminarse.
                    anterior.siguientes = actual.siguientes;
                    actual.siguientes = null;
                    return;  // Tarea eliminada, abandonamos el método.
                }
                anterior = actual;
                actual = actual.siguientes;
            }
        }
    }

    public void mostrarTareas() {
        Nodo actual = encabezado;

        while (actual != null) {
            Tareas tarea = actual.tareas;
            System.out.println("ID: " + tarea.getId());
            System.out.println("Título: " + tarea.getTitulo());
            System.out.println("Descripción: " + tarea.getDescripcion());
            System.out.println("Fecha de Vencimiento: " + tarea.getFechaVencimiento());
            System.out.println("-----------");
            actual = actual.siguientes;
        }
    }

    public String generarTabla() {
        StringBuilder tablaHTML = new StringBuilder();
        Nodo actual = encabezado;

        while (actual != null) {
            Tareas tarea = actual.tareas;
            tablaHTML.append("<tr>");
            tablaHTML.append("<td>").append(tarea.getId()).append("</td>");
            tablaHTML.append("<td>").append(tarea.getTitulo()).append("</td>");
            tablaHTML.append("<td>").append(tarea.getDescripcion()).append("</td>");
            tablaHTML.append("<td>").append(tarea.getFechaVencimiento()).append("</td>");

            // Botones
            tablaHTML.append("<td><a href=\"#\" class=\"btn btn-outline-success\"><i class=\"fa-solid fa-pen-clip\"></i></a>");
            tablaHTML.append("<a href=\"#\" type=\"button\" class=\"btn btn-outline-danger\" data-bs-toggle=\"modal\" data-bs-target=\"#eliminar\" data-nombre=\"" + tarea.getId() + "\"><i class=\"fa-solid fa-trash\"></i></a></td>");

            tablaHTML.append("</tr>");
            actual = actual.siguientes;
        }
        tablaHTML.append("</table>");  // Cierra la tabla

        return tablaHTML.toString();
    }
    
    public boolean existenId(int id){
        Nodo actual = encabezado;
        boolean encontrado=false;
        while (actual != null && !encontrado) {
            
            
            Tareas tarea = actual.tareas;
            if(tarea.getId()==id){
               encontrado=true;
            }
           
            actual = actual.siguientes;
        }

        return encontrado;
    }

}