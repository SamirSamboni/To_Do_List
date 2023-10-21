package Servlets;

import com.mundo.lista.Metodos;
import com.mundo.lista.Persistencia;
import com.mundo.lista.Usuarios;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
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
@WebServlet(name = "SvRegistro", urlPatterns = {"/SvRegistro"})
public class SvRegistro extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {    
    }

    @Override
    
    /**
     * Método POST para agregar un usuario registrado.
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //Obtener el contexto del servlet
        ServletContext context = getServletContext();

        ArrayList<Usuarios> misUsuarios = new ArrayList<>(); //Array a cargar con el txt

        // Leer la lista de perros desde un archivo y cargarla.
        Persistencia.leerArchivo(misUsuarios, context);

        // Recopilar los datos del formulario enviados mediante el método POST.
        int cedula = Integer.parseInt(request.getParameter("cedula"));

        String nombre = request.getParameter("nombre");

        String password = request.getParameter("contrasenia");
        
        /**
         * Comprobar si el usuario ya existe; si es así, no se añade y se muestra un mensaje.
         */
        
        if(Metodos.encontrarUsuariosIg(cedula, context)){
         /**
             * En caso de que el usuario no exista, se agrega.
             */
            Usuarios user = new Usuarios(cedula, nombre, password);//Añadimos un objeto de tipo Usuarios
            
            misUsuarios.add(user); 
            
            Persistencia.escribirArchivo(misUsuarios, context);//Actualizamos el txt
            
            // Se envía una bandera que indica que la operación de añadir fue exitosa.
            String registrado = "si";
            request.setAttribute("registrado", registrado);
            
        } else if(!Metodos.encontrarUsuariosIg(cedula, context)){
            /**
             * Si el usuario ya existe, no se agrega.
             */
             
            // Se envía una bandera que indica que la operación de añadir no fue exitosa.
            String registrado = "no";
            request.setAttribute("registrado", registrado);
        }

        // Redireccionar a la página de destino internamente en el servidor
        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}