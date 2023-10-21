<%@page import="com.mundo.lista.Lista"%>     <!-- Importa las clases necesarias -->
<%@page import="com.mundo.lista.Serializacion"%>
<%@page import="com.mundo.lista.Tareas"%>

<!-- Inclución de la plantilla de header -->
<%@include file= "templates/header.jsp" %>

<%  // Scriptlet JSP que declara una variable 'usuario' y obtiene el valor de un parámetro 'usuarioI'
    String usuario = request.getParameter("usuarioI");
%>

<div style="background-color: #FFCBA4; font-style: italic;">    <!-- Contenedor principal con estilo -->
    <%
        // Obtener el valor del parámetro 'add' y realizar comprobaciones
        String añadido = request.getParameter("add");
        System.out.println("----------------------");
        System.out.println(añadido);

        if (añadido != null && añadido.equals("no")) {   // Si 'add' es "no"
    %>
        <!-- Llama método de JavaScript para mostrar una modal en caso de que no se haya ingresado correctamente -->
        <script>
            $(document).ready(function () {
                tareaNo();
            });
        </script>
    <%
            request.removeAttribute("add");  // Elimina el atributo 'add' del request
        } else if(añadido != null && añadido.equals("si")) {  // Si 'add' es "si"
    %>
        <!-- Llama método de JavaScript para mostrar una modal en caso de que se haya ingresado correctamente -->
        <script>
            $(document).ready(function () {
                tareaSi();
            });
        </script>
        <% request.removeAttribute("add"); // Elimina el atributo 'add' del request
    }
    %>

    <!-- Mensaje de bienvenida -->
    <div class="container p-4 text-center">
        <div class="card">
            <div class="card-header"></div>
           <div class="card-body">
    <h1 style="font-style: normal; font-size: 2em;">Bienvenido</h1>
</div>

            <div class="card-footer text-body-secondary"></div>
        </div>
    </div>

    <!-- Tabla -->
    <div class="container p-4"> 
        <div class="row">
            <div class="col-md-4">  <!-- División de 4 columnas -->
                <div class="card card-body">
                    <form class="row g-3 needs-validation" action="SvLoginCheck" method="GET" novalidate>
                        <input type="hidden" name="usuarioI" value="<%=usuario%>">  <!-- Campo oculto que almacena el valor de 'usuario' -->

                        <!-- ID -->
                        <div class="input-group">
                            <label for="validationCustomUsername" class="form-label">Id</label>  <!-- Etiqueta para el campo ID -->
                            <div class="input-group">
                                <span class="input-group-text" id="inputGroupPrepend"><i class="fa-solid fa-id-card" style="color: #FFCBA4;"></i></span>  <!-- Icono con estilo -->
                                <input type="number" name="id" class="form-control" min="0" step="1" id="validationCustomUsername" aria-describedby="inputGroupPrepend" required>  <!-- Campo para ingresar el ID -->
                                <!-- Verificación de validación exitosa -->
                                <div class="valid-feedback">
                                    Excelente!
                                </div>
                                <!-- En caso de validación fallida -->
                                <div class="invalid-feedback">
                                    Introduce un id válido.
                                </div> 
                            </div>
                        </div>

                        <!-- Título -->
                        <div class="input-group">
                            <label for="floatingInputValue">Título</label>  <!-- Etiqueta para el campo Título -->
                            <div class="input-group">
                                <formu class="form-floating">
                                    <input type="text" class="form-control" id="floatingInputValue" name="titulo" placeholder="Ingrese el Título" value="" required="">  <!-- Campo de Título con estilo personalizado -->
                                    <label for="floatingInputValue">Ingrese el Título </label>  <!-- Etiqueta del campo Título -->
                                    <!-- Verificación de validación exitosa -->
                                    <div class="valid-feedback">
                                        Excelente!
                                    </div>
                                    <!-- En caso de validación fallida -->
                                    <div class="invalid-feedback">
                                        Introduce un título válido.
                                    </div> 
                                </formu>
                            </div>
                        </div>

                        <!-- Descripción -->
                        <div class="input-group">
                            <label for="descripcion" class="form-label">Descripción</label>  <!-- Etiqueta para el campo Descripción -->
                            <div class="input-group">
                                <span class="input-group-text"><i class="fa-solid fa-circle-info" style="color: #FFCBA4;"></i></span>  <!-- Icono con estilo -->
                                <textarea class="form-control" name="descripcion" id="validationTextarea" placeholder="Required example textarea" required></textarea>  <!-- Campo de Descripción -->
                                <!-- En caso de validación fallida -->
                                <div class="invalid-feedback">
                                    Introduce una descripción válida.
                                </div> 
                            </div>    
                        </div>

                        <!-- Fecha -->
                        <div class="input-group">
                            <label for="validationCustom05" class="form-label">Fecha</label>  <!-- Etiqueta para el campo Fecha -->
                            <div class="input-group">
                                <input type="date" class="form-control" name="fecha" id="validationCustom05" required>  <!-- Campo de Fecha -->
                                <!-- Verificación de validación exitosa -->
                                <div class="valid-feedback">
                                    Excelente!
                                </div>
                                <!-- En caso de validación fallida -->
                                <div class="invalid-feedback">
                                    Introduce una fecha válida.
                                </div> 
                            </div>
                        </div>

                        <!-- Botón centrado -->
                        <div style="text-align: center;">
                            <button type="submit" class="btn btn-outline-primary" style="background-color: #FFCBA4; color: black;">Agregar Tarea</button>  <!-- Botón para agregar una tarea -->
                        </div>

                    </form>
                </div>
            </div>

            <div class="col-md-8">
                <!-- Poner tabla aquí -->

                <div class="card card-body">
                    <table class="table table-striped table-hover">
                        <!-- Primera fila de la tabla -->
                        <thead>
                            <tr>
                                <th scope="col">Id</th>
                                <th scope="col">Título</th>
                                <th scope="col">Descripción</th>
                                <th scope="col">Fecha</th>
                                <th scope="col">Acciones</th>
                            </tr>
                        </thead>

                        <!-- Contenido de la tabla -->
                        <tbody>
                            <%
                                Lista listaTareas = new Lista();
                                // Obtener el contexto del servlet
                                ServletContext context = getServletContext();
                                listaTareas = Serializacion.leerTareas(context);
                                if (listaTareas == null) {
                                    listaTareas = new Lista();
                                }
                                String tablaHTML = listaTareas.generarTabla();
                            %>
                            <div>
                                <%= tablaHTML%>
                            </div>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal para eliminar tarea -->
    <div class="modal fade" id="eliminar" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="eliminarLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <h2>¿Estás seguro de que deseas eliminar esta tarea?</h2>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal" style="margin-right: 10px;">Cancelar</button>
                    <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModalConfirm" onclick="eliminarTarea()">Eliminar</button>
                </div>
            </div>
        </div>
    </div>
<div class="text-center">
    <a href="index.jsp" class="btn btn-outline-primary" style="background-color: #FFCBA4; color: black;">Cerrar sesión</a>
</div>

</div>

<!-- Javascript para manejar la lógica de los mensajes del 'required' -->

<script>
    // Función para mostrar una notificación Toastr de éxito
    function tareaSi() {
        toastr.options = {
            "closeButton": false,
            "debug": false,
            "newestOnTop": false,
            "progressBar": false,
            "positionClass": "toast-top-right",
            "preventDuplicates": false,
            "onclick": null,
            "showDuration": "300",
            "hideDuration": "1000",
            "timeOut": "5000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        };

        // Mostrar una notificación Toastr de éxito
        toastr.success('Se ha añadido exitosamente!', 'Registrado');
    }

    // Función para mostrar una notificación Toastr de error
    function tareaNo() {
        toastr.options = {
            "closeButton": false,
            "debug": false,
            "newestOnTop": false,
            "progressBar": false,
            "positionClass": "toast-top-right",
            "preventDuplicates": false,
            "onclick": null,
            "showDuration": "300",
            "hideDuration": "1000",
            "timeOut": "5000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        };

        // Mostrar una notificación Toastr de error
        toastr.warning('no', 'No ha podido ingresar');
    }

    (() => {
        'use strict';

        const forms = document.querySelectorAll('.needs-validation');

        Array.from(forms).forEach(form => {
            form.addEventListener('submit', event => {
                if (!form.checkValidity()) {
                    event.preventDefault();
                    event.stopPropagation();
                }
                form.classList.add('was-validated');
            }, false);
        });
    });

    var id = "";

    $('#eliminar').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget);
        var idTarea = button.data('nombre');
        var modal = $(this);
        id = idTarea;
    });

    // Función para eliminar una tarea
    function eliminarTarea() {
        var idTarea = id;

        $.ajax({
            url: 'SvEliminarEditar?id=' + idTarea,
            method: 'GET',
            success: function (data) {
                $('#eliminar').modal('hide');
                location.reload();
            },
            error: function () {
                console.log('Error al eliminar la tarea.');
            }
        });
    }
</script>

<!-- Inclución de la plantilla de footer -->
<%@include file= "templates/footer.jsp" %>
</div>
