/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import com.mundo.lista.Lista;
import com.mundo.lista.Metodos;
import com.mundo.lista.Serializacion;
import com.mundo.lista.Tareas;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
@WebServlet(name = "SvLogeo", urlPatterns = {"/SvLogeo"})
public class SvLogeo extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    Lista listaDeTarea = new Lista();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

          String nombre = request.getParameter("usuarioI");
        // Recuperar el contexto del servlet.
        ServletContext context = getServletContext();
        try {
            listaDeTarea = Serializacion.leerTareas(context);
            if(listaDeTarea == null){
                listaDeTarea = new Lista();
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SvLogeo.class.getName()).log(Level.SEVERE, null, ex);
        }

        // Obtener los parámetros del formulario.
        int id = Integer.parseInt(request.getParameter("id"));
        String titulo = request.getParameter("titulo");
        String descripcion = request.getParameter("descripcion");
        String fechaStr = request.getParameter("fecha");

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date fecha = null;

        try {
            fecha = sdf.parse(fechaStr);
        } catch (ParseException e) {
            e.printStackTrace(); // Tratamiento de errores en caso de que la fecha no sea válida.
        };
        
        String an="";
        if(!listaDeTarea.existenId(id)){
            Tareas nuevaTarea = new Tareas(id, titulo, descripcion, fecha);

            listaDeTarea.insertarPrincipio(nuevaTarea);

            Serializacion.escribirArchivo(listaDeTarea, context);
            
            listaDeTarea.mostrarTareas();
            an="si";
        } else {
            an="no";
        }


        // Realizar una redirección interna al servidor hacia la página de destino.
        // Redireccionar a la página de destino.
            response.sendRedirect("login.jsp?usuarioI="+nombre+"&add="+an);
    }

    /**
     * Método POST para verificar el inicio de sesión.
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        /**
         * Obtenemos variables
         */
        int cedula = Integer.parseInt(request.getParameter("cedula"));
        String contraseña = request.getParameter("contrasenia");

        ServletContext context = getServletContext();// Contexto de servlet para obtener la PATH

        /**
         * Llamamos al método para verificar si coincide la cédula y la contraseña
         * con los usuarios almacenados.
         */
        String usuario = Metodos.verificarUsuario(cedula, contraseña, context);

        // Comprobar si se ingresa o no.
        if (usuario.equals("No encontrado")) {

request.getRequestDispatcher("login.jsp?usuarioI=" + usuario).forward(request, response);
        } else if (!usuario.equals("No encontrado")) {

            request.getRequestDispatcher("login.jsp?usuarioI=" + usuario).forward(request, response);// Redirigimos al login con el nombre de usuario para mostrar el mensaje personalizado.
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}