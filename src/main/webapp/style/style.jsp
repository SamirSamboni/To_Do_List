<style>
/* Estilos generales */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif; /* Fuente predeterminada */
}

/* Encabezado */
.header {
    position: fixed;
    width: 100%;
    height: 60px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 20px 100px;
    z-index: 99;
    background: transparent;
}

/* Fondo de la página */
.background {
    width: 100%;
    height: 100vh;
    background: #FFCBA4; /* Naranja pastel */
    background-position: center;
    background-size: cover;
}

/* Contenedor principal de la página de inicio */
.home {
    position: absolute;
    top: 50%;
    left: 50%;
    width: 75%;
    height: 75%;
    transform: translate(-50%, -50%);
    background-image: url('img/img2.jpg'); /* Imagen de fondo */
    background-position: center;
    background-size: cover;
    display: flex;
    margin-top: 10px;
    border: 1px solid black;
    border-radius: 10px;
    border: none;
}

/* Contenido de la página de inicio */
.content {
    display: flex;
    flex-direction: column;
    width: 700px;
    padding: 100px 0;
}

/* Estilo de los enlaces */
.content a {
    position: relative;
    text-decoration: none;
    color: white; 
    font-size: 2.5em; /* Tamaño de fuente */
    font-weight: 600; /* Peso de la fuente */
    top: -40px;
    left: 80px;
}

/* Títulos */
.content h2 {
    font-size: 3em;
    text-align: center;
    color: white;
    font-style: italic; /* Estilo de letra cursiva */
    margin: 20px 0; /* Margen superior e inferior */
}

.content h3 {
    font-size: 1.8em;
    text-align: center;
    color: white;
    font-style: italic; /* Estilo de letra cursiva */
    margin: 20px 0; /* Margen superior e inferior */
}

/* Código preformateado */
.content pre {
    margin-top: 20px;
    text-align: center;
    font-size: 1.2em; /* Tamaño de fuente */
    color: black;
}

/* Iconos */
.content .icon {
    margin-top: 20px;
    font-size: 1.2em; /* Tamaño de fuente */
    display: flex;
    justify-content: center;
}

.content .icon i {
    margin-left: 20px;
    color: black;
}

/* Formulario de inicio de sesión */
.login {
    width: 500px;
    position: relative;
    padding: 80px 30px;
    background-color: white;
    backdrop-filter: blur(5px); /* Desenfoque de fondo */
}

/* Título del formulario de inicio de sesión */
.login h2 {
    font-size: 1.8em; /* Tamaño de fuente */
    text-align: center;
    margin-bottom: 30px;
    color: black; 
}

/* Campo de entrada y estilo del formulario */
.login .input {
    position: relative;
    width: 100%;
    height: 30px;
    margin-bottom: 50px;
}

/* Sección de registro */
.login .sign-up {
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
    margin: 0 auto;
}

.login .sign-up a {
    display: block;
    text-decoration: none;
    color: black; 
    font-weight: 600; 
}

.login .sign-up p {
    display: block;
    color: black; 
    margin-right: 10px;
}

.login .sign-up a:hover {
    text-decoration: underline;
    color: white; 
}

/* Estilo de los campos de entrada */
.login .input .input1 {
    font-size: 16px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    background: transparent;
    border: none;
    outline: none;
    border-bottom: 2px solid black;
    color: black;
    width: 100%;
    height: 100%;
}

/* Placeholder del campo de entrada */
::placeholder {
    color: black;
    font-size: 18px;
}

/* Icono del campo de entrada */
.login .input i {
    position: relative;
    right: -370px;
    bottom: 27px;
    color: black;
}

/* Sección de verificación */
.check {
    display: flex;
    justify-content: space-between;
    margin-bottom: 40px;
    color: black;
}

/* Enlace de verificación y estilo al pasar el mouse sobre él */
.check a {
    text-decoration: none;
    color: blue; 
}

.check a:hover {
    text-decoration: underline;
}

/* Botón de inicio de sesión */
.login .button {
    width: 100%;
    height: 40px;
    margin-bottom: 15px;
}

button {
    width: 100%;
    height: 40px;
    background-color: #FFCBA4 !important; /* Color de fondo del botón */
    border: none;
    outline: none;
    font-size: 20px;
    font-weight: 700;
    border-radius: 7px;
    color: white; 
}

/* Efecto de presión del botón */
button:active {
    font-size: 25px;
}

/* Estilo del icono de correo electrónico */
.fa-solid .fa-envelope {
    color: black;
}

</style>
