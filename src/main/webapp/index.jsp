<!-- Inclusión de la plantilla de encabezado -->
<%@include file="templates/header.jsp" %>

<!-- Inclusión de estilos -->
<%@include file="style/style.jsp" %>

<!-- Fondo de la página -->
<div class="background"></div>

<!-- Formulario que se envía por POST -->
<form action="SvLoginCheck" method="POST">
    <section class="home">
        <!-- Sección de inicio de sesión -->
        <div class="login">
            <h2>Ingresar</h2>
            
            <!-- Campo de cédula -->
            <div class="input">
                <input type="text" class="input1" name="cedula" placeholder="Cédula Usuario" maxlength="10" required pattern="[0-9]+" title="Solo se permiten números">
                <i class="fa-solid fa-id-card fa-lg" style="color: #FFCBA4;"></i>
            </div>
            
            <!-- Campo de contraseña -->
            <div class="input">
                <input type="password" class="input1" name="contrasenia" placeholder="Contraseña" required>
                <i class="fa-solid fa-lock fa-lg" style="color: #FFCBA4;"></i>
            </div>
            
            <!-- Botón para iniciar sesión -->
            <div class="button">
                <button type="submit" class="btn">Ingresar</button>
            </div>
            
            <!-- Enlace para registrarse -->
            <div class="sign-up">
                <p>No tiene una cuenta?</p>
                <!-- Abre un modal para registrarse -->
                <button type="button" class="btn btn-outline-light" style="color: black" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                    <a href="#">Regístrese aquí</a>
                </button>
            </div>
        </div>

        <!-- Información de la página -->
        <div class="content">
            <a>LOGIN</a>
            <h2>Bienvenido al Sistema de Gestión de Tareas</h2>
            <h3>¡Controla tus tareas de manera eficiente!</h3>
            <br>
            <pre> </pre>
        </div>
    </section>
</form>

<%
    // Obtiene la variable "registrado" para determinar si el usuario se registró con éxito
    String registrado = (String) request.getAttribute("registrado");

    // En caso de que el registro haya tenido éxito
    if (registrado != null && registrado.equals("si")) {
%>
    <!-- Llama a una función JS para mostrar un modal de registro exitoso -->
    <script>
        $(document).ready(function () {
            usuarioR();
        });
    </script>
<%    } 
    // En caso de que el registro no haya tenido éxito
    else if (registrado != null && registrado.equals("no")){
%>
    <!-- Llama a una función JS para mostrar un modal de registro no exitoso -->
    <script>
        $(document).ready(function () {
            usuarioNoR();
        });
    </script>
<%
    }
    
    // Obtiene la variable "valido" para verificar si los datos de inicio de sesión son válidos
    String valido = request.getParameter("valido");
    
    // En caso de que los datos de inicio de sesión no sean válidos
    if (valido != null && valido.equals("false")) {
%>
    <!-- Llama a una función JS para mostrar un modal de inicio de sesión no exitoso -->
    <script>
        $(document).ready(function () {
            usuarioNoI();
        });
    </script>
<%
    }

    // Elimina los atributos "registrado" y "valido" de la solicitud
    request.removeAttribute("registrado");
    request.removeAttribute("valido");
%>

<!-- Modal para registrar un usuario -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <form action="SvRegister" method="POST">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="staticBackdropLabel">Registro de Usuarios</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <!-- Campo para la cédula -->
                    <br>
                    <form class="form-floating">
                        <input type="text" class="form-control" id="floatingInputValue" name="cedula" placeholder="Ingrese su cédula" value="" maxlength="10" required pattern="[0-9]+" title="Solo se permiten números">
                        <label for="floatingInputValue">Cédula</label>
                    </form>
                    
                    <!-- Campo para el nombre de usuario -->
                    <br>
                    <form class="form-floating">
                        <input type="text" class="form-control" id="floatingInputValue" name="nombre" placeholder="Ingrese su cédula" value="" required>
                        <label for "floatingInputValue">Nombre de Usuario</label>
                    </form>
                    
                    <!-- Campo para la contraseña -->
                    <br>
                    <div class="form-floating">
                        <input type="password" class="form-control" id="floatingPassword" name="contrasenia" placeholder="Password" required>
                        <label for="floatingPassword">Contraseña</label>
                    </div>
                </div>

                <!-- Pie de página con botones -->
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Registrar Usuario</button>
                </div>
            </div>
        </div>
    </form>
</div>

<!-- Modal para registro exitoso -->
<div class="modal fade" id="registrado" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="registradoLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <h2>Usuario registrado exitosamente</h2>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>

<!-- Inclusión de la biblioteca Toastr para notificaciones -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

<!-- Script para mostrar notificaciones utilizando Toastr -->
<script>
    function usuarioR() {
        // Configura las opciones de Toastr para el registro exitoso
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
        // Muestra una notificación Toastr de éxito
        toastr.success('Se ha registrado exitosamente!', 'Registrado');
    }

    function usuarioNoI() {
        // Configura las opciones de Toastr para el inicio de sesión no exitoso
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
        // Muestra una notificación Toastr de advertencia
        toastr.warning('La cédula o contraseña no son correctas', 'No ha podido ingresar');
    }

    function usuarioNoR() {
        // Configura las opciones de Toastr para el registro no exitoso
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
        // Muestra una notificación Toastr de error
        toastr.error('Ya existe un usuario registrado con esa cédula', 'Error');
    }
</script>

<!-- Inclución de la plantilla de pie de página -->
<%@include file="templates/footer.jsp" %>