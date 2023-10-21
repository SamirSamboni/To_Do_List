<!-- Inclusi�n de la plantilla de encabezado -->
<%@include file="templates/header.jsp" %>

<!-- Inclusi�n de estilos -->
<%@include file="style/style.jsp" %>

<!-- Fondo de la p�gina -->
<div class="background"></div>

<!-- Formulario que se env�a por POST -->
<form action="SvLoginCheck" method="POST">
    <section class="home">
        <!-- Secci�n de inicio de sesi�n -->
        <div class="login">
            <h2>Ingresar</h2>
            
            <!-- Campo de c�dula -->
            <div class="input">
                <input type="text" class="input1" name="cedula" placeholder="C�dula Usuario" maxlength="10" required pattern="[0-9]+" title="Solo se permiten n�meros">
                <i class="fa-solid fa-id-card fa-lg" style="color: #FFCBA4;"></i>
            </div>
            
            <!-- Campo de contrase�a -->
            <div class="input">
                <input type="password" class="input1" name="contrasenia" placeholder="Contrase�a" required>
                <i class="fa-solid fa-lock fa-lg" style="color: #FFCBA4;"></i>
            </div>
            
            <!-- Bot�n para iniciar sesi�n -->
            <div class="button">
                <button type="submit" class="btn">Ingresar</button>
            </div>
            
            <!-- Enlace para registrarse -->
            <div class="sign-up">
                <p>No tiene una cuenta?</p>
                <!-- Abre un modal para registrarse -->
                <button type="button" class="btn btn-outline-light" style="color: black" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                    <a href="#">Reg�strese aqu�</a>
                </button>
            </div>
        </div>

        <!-- Informaci�n de la p�gina -->
        <div class="content">
            <a>LOGIN</a>
            <h2>Bienvenido al Sistema de Gesti�n de Tareas</h2>
            <h3>�Controla tus tareas de manera eficiente!</h3>
            <br>
            <pre> </pre>
        </div>
    </section>
</form>

<%
    // Obtiene la variable "registrado" para determinar si el usuario se registr� con �xito
    String registrado = (String) request.getAttribute("registrado");

    // En caso de que el registro haya tenido �xito
    if (registrado != null && registrado.equals("si")) {
%>
    <!-- Llama a una funci�n JS para mostrar un modal de registro exitoso -->
    <script>
        $(document).ready(function () {
            usuarioR();
        });
    </script>
<%    } 
    // En caso de que el registro no haya tenido �xito
    else if (registrado != null && registrado.equals("no")){
%>
    <!-- Llama a una funci�n JS para mostrar un modal de registro no exitoso -->
    <script>
        $(document).ready(function () {
            usuarioNoR();
        });
    </script>
<%
    }
    
    // Obtiene la variable "valido" para verificar si los datos de inicio de sesi�n son v�lidos
    String valido = request.getParameter("valido");
    
    // En caso de que los datos de inicio de sesi�n no sean v�lidos
    if (valido != null && valido.equals("false")) {
%>
    <!-- Llama a una funci�n JS para mostrar un modal de inicio de sesi�n no exitoso -->
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
                    <!-- Campo para la c�dula -->
                    <br>
                    <form class="form-floating">
                        <input type="text" class="form-control" id="floatingInputValue" name="cedula" placeholder="Ingrese su c�dula" value="" maxlength="10" required pattern="[0-9]+" title="Solo se permiten n�meros">
                        <label for="floatingInputValue">C�dula</label>
                    </form>
                    
                    <!-- Campo para el nombre de usuario -->
                    <br>
                    <form class="form-floating">
                        <input type="text" class="form-control" id="floatingInputValue" name="nombre" placeholder="Ingrese su c�dula" value="" required>
                        <label for "floatingInputValue">Nombre de Usuario</label>
                    </form>
                    
                    <!-- Campo para la contrase�a -->
                    <br>
                    <div class="form-floating">
                        <input type="password" class="form-control" id="floatingPassword" name="contrasenia" placeholder="Password" required>
                        <label for="floatingPassword">Contrase�a</label>
                    </div>
                </div>

                <!-- Pie de p�gina con botones -->
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

<!-- Inclusi�n de la biblioteca Toastr para notificaciones -->
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
        // Muestra una notificaci�n Toastr de �xito
        toastr.success('Se ha registrado exitosamente!', 'Registrado');
    }

    function usuarioNoI() {
        // Configura las opciones de Toastr para el inicio de sesi�n no exitoso
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
        // Muestra una notificaci�n Toastr de advertencia
        toastr.warning('La c�dula o contrase�a no son correctas', 'No ha podido ingresar');
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
        // Muestra una notificaci�n Toastr de error
        toastr.error('Ya existe un usuario registrado con esa c�dula', 'Error');
    }
</script>

<!-- Incluci�n de la plantilla de pie de p�gina -->
<%@include file="templates/footer.jsp" %>