/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import com.mundo.lista.Lista;
import com.mundo.lista.Serializacion;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Brian Castro - Samir Samboni 
 */
@WebServlet(name = "SvEliminarEditar", urlPatterns = {"/SvEliminarEditar"})
public class SvEliminarEditar extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    Lista listaDeTareas = new Lista();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        //Obtener el contexto del servlet
        
        ServletContext context = getServletContext();

        System.out.println("Corriendo metodo de eliminar");
        
        try {
            listaDeTareas = Serializacion.leerTareas(context);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SvEliminarEditar.class.getName()).log(Level.SEVERE, null, ex);
        }

        // Recupera el nombre del perro a eliminar de los parámetros de la solicitud.
        String idElimina = request.getParameter("id");

        System.out.println(idElimina);

        int eliminar = Integer.parseInt(idElimina);

        listaDeTareas.eliminarTarea(eliminar);

        Serializacion.escribirArchivo(listaDeTareas, context);

            // Dirigir a la página de destino.
            response.sendRedirect("login.jsp");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Devuelve una breve descripción del servlet.
     *
     * @return una cadena que contiene la descripción del servlet
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}