<?php
 require "./scripts/config.php";
?>
 
<!DOCTYPE html>
<html lang="es">
  <head>  
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Desercion estudiantilz">
    <meta name="author" content="Camilo Casas">
    <title>Alerta Desercion</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Edu+VIC+WA+NT+Beginner:wght@400;600;700&family=Source+Serif+Pro:ital,wght@0,600;0,700;1,300&display=swap" rel="stylesheet"> 
    <link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="./css/index.css">
    <script src="https://kit.fontawesome.com/d294018a37.js" crossorigin="anonymous"></script>
    
  </head>

  <body>
    <header class="carousel-container" id="home">
      <div class="carousel">
          <div class="slide">
            <img src="public/p1bzehqt.png" alt="Imagen 1">
          </div>
          <div class="slide">
            <img src="public/070i4vde.png" alt="Imagen 2">
          </div>
          <div class="slide">
            <img src="public/j6ltz6i8.png" alt="Imagen 3">
          </div>
        </div>
  
        <a class="prev" onclick="changeSlide(-1)">&#10094;</a>
        <a class="next" onclick="changeSlide(1)">&#10095;</a>
  
        <nav class="container-menu">
          <figure class="container-img">
              <img src="public/OIP-removebg-preview.png" alt="logo">
          </figure>
          <div class="menu">
              <ul>
                  <li><a href="#home" class="menu1" title="Home">Home<i class="fa-solid fa-house" style="color: #ffffff;"></i></a></li>
                  <li><a href="#about" class="menu2" title="Acerca de">About me<i class="fa-solid fa-address-book" style="color: #ffffff;"></i></a></li>
                  <li><a href="#form" class="menu3" title="Formulario">Form<i class="fa-solid fa-book" style="color: #ffffff;"></i></a></li>
                  <li><a href="#contact" class="menu1" title="Contacto">Contac<i class="fa-solid fa-phone" style="color: #ffffff;"></i></a></li>
                  <li><a class="btn-menu" onclick="openModal()" title="Login Administrador">Login<i class="fa-solid fa-right-to-bracket" style="color: #ffffff;"></i></a></li>
              </ul>
          </div>
      </nav>
    
    <dialog id="modal">
      <div class="container-form-solicitud">
        <h2>Bienvenido</h2>
        <div class="logo">
          <img src="./img/Uniminuto.png" alt="Uniminuto logo">
        </div>
        <p>En este apartado podras iniciar sesion como administrador<br>
        </p>
        <form action="./scripts/iniciar-sesion.php" class="form-solicitud" method="post">
          <input type="text" id="txtUsuario" name="txtUsuario" placeholder="Usuario">
          <input type="password" id="txtClave" name="txtClave" placeholder="Contraseña">

          <button class="Btnform-soli" type="submit">Ingresar</button>
        </form>
      </div>
      <button class="Btnform-sol" onclick="closeModal()">X</button>
    </dialog>
    </header>

    <div class="container contai">
      <h1 class="text">Bienvenidos a Bienestar</h1>
      <p>
        Este espacio es para el personal encargado de ayudar a nuestros
        jovenes a evitar la desercion.
      </p>
      <a class="bth" href="#4">Ver Mas</a>
    </div>
  </div>
  <div class="text2" id="4" >
    <p>
      UNIMINUTO, ha sido testigo del inicio de la etapa que emprenden muchas
      personas en sus vidas, la cual, es sinónimo de la construcción de un
      proyecto de vida, donde se forjan metas y sueños; sin embargo, también
      es testigo del alto en el camino, de ese paso al costado que muchos
      estudiantes hacen por diferentes razones.
    </p>

    <p>
      por esto, que se realiza el estudio de causas de Ausentismo y Deserción
      buscando consolidar la información de manera fidedigna, además, de
      generar mejoras como Institución de Educación Superior y de esta manera
      mantener viva nuestra misionalidad.
    </p>
    <p>
      Por esta razón, en el mes de mayo del 2021 desde el componente de
      Acompañamiento y Permanencia, del área de Bienestar Institucional en
      articulación con los docentes consejeros, se emprende esta actividad.
      Este trabajo inicia, con el reporte enviado desde la Coordinación de
      Sistemas de Información y Calidad, de la VGBI - Vicerrectoría General de
      Bienestar Institucional. Una vez, se recepciona este insumo, se realiza
      la depuración por programa y se procede a establecer contacto con cada
      estudiante.
    </p>
    <p>
      Estas llamadas tienen dos objetivos fundamentales, en primer lugar,
      conocer causas de Ausentismo y Deserción, para ello se cuenta con unos
      criterios predeterminados que engloban aspectos Socioeconómicos,
      Personales, Académicos y Personales; el resultado de este estudio
      contribuirá a establecer planes de mejora desde los actores
      correspondientes.
    </p>
  </div>
  <div class="container1" id="about">
    <article class="card">
      <div class="card__he">
        <img src="https://juanxxiiizaidin.com/wp-content/uploads/2020/03/COMUNICADO1.png" alt="seguiminto academico" />
      </div>
      <div class="card__body">
        <h3>Seguimiento Academico</h3>
        <hr class="line" />
        <div class="texto">
          <p>Estaremos pendientes de tu nivel academico durante la carrera</p>
        </div>
      </div>
    </article>

    <article class="card">
      <div class="card__he">
        <a href="https://coopminutodedios.com/" target="_blank">
          <img src="https://www.uniminutoradio.com.co/wp-content/uploads/2020/01/coop-minuto-768x306.jpg" />
        </a>
      </div>
      <div class="card__body">
        <h3>Cooperativa uniminuto</h3>
        <hr class="line" />
        <div class="texto">
          <p>Te damos un apoyo para que puedas cumplir tus sueños</p>
        </div>
      </div>
    </article>
    <article class="card">
      <div class="card_he">
        <a href="https://www.uniminuto.edu/noticias/de-bienestar-institucional-bienestar-asuntos-estudiantiles"
          target="_blank">
          <img src="http://www.uniminutoradio.com.co/wp-content/uploads/2018/09/bienestar.jpg"
            alt="seguiminto academico" />
        </a>
      </div>
      <div class="card__body">
        <h3>Bienestar institucional</h3>
        <hr class="line" />
        <div class="texto">
          <p>
            Ofrecemos nuestros servicios para que vivas una gran experiencia
            dentro de la universidad
          </p>
        </div>
      </div>
    </article>
  </div>

<?php
if($config["estado"]!=true){  ?>
<section id="form">
 <div class="contenedor-registro">
  <img src="./public/OIG.jpg" alt="fondo" class="fondo23">
  <button class="boton"><a href="./categorias/RegistroEstudiante.php">Realizar formulario</a></button>
 </div>
</section>
<?php }?>

<div class="contact-container" id="contact" style="margin-top: 20vh;">
      <div class="container-form">
        <div class="text-form">
          <h3>¡ Escribenos y nos pondremos en contacto contigo !</h3>
        </div>
        <form class="form-contact" action="https://formsubmit.co/60279c7c61478e6b1886eb1f679abf17" method="POST">
          <div class="inputs">
            <label for="Nombre">Nombre Completo</label>
            <input type="text" placeholder="   Digita tu nombre" id="Nombre" name="nombre" required>
          </div>
          <div class="inputs">
            <label for="Correo">Correo</label>
            <input type="text" placeholder="   Digita tu correo @uniminuto.edu.co" id="Correo" name="correo" pattern=".+@uniminuto\.edu.co " required>
          </div>
          <div class="inputs" id="mensaje">
            <label for="Mensaje">Mensaje</label>
            <input type="text" id="Mensaje" placeholder="   Cuentanos en que podemos ayudarte" name="mensaje" required>
          </div>
          <div class="terminos">
            <input type="checkbox" id="box" required>
            <label for="myCheckBox">Acepto Terminos y Condiciones</label>
          </div>
          <div class="inputs">
            <button id="miBoton" class="Solicitud" type="submit" disabled>Enviar solicitud</button>
          </div>
          <input type="hidden" name="_next" value="http://localhost/estudiantil/intranet/index.php">
          <input type="hidden" name="_captcha" value="false">
        </form>
    </div>
  </div>  


  <footer class="pie-pagina" id="nosotros" style="margin-top: 20vh;">
    <div class="grupo-1">
      <div class="box">
        <figure>
          <a href="index.php">
            <img src="./img/logo.png" alt="logo" />
          </a>
        </figure>
      </div>
      <div class="box">
        <h2>Sobre Nosotros</h2>
        <p>
          Lorem ipsum dolor sit, amet consectetur adipisicing elit. Enim
          molestias qui, itaque cum soluta reiciendis excepturi voluptates
          earum laudantium ipsam, modi consequuntur. Consequuntur numquam quod
          quaerat molestiae natus voluptatibus commodi?
        </p>
      </div>
      <div class="box">
        <h2>Siguenos</h2>
        <div class="red-social">
          <a href="https://www.facebook.com/UNIMINUTOCOLOMBIA/?locale=es_LA" class="fa fa-facebook"></a>
          <a href="https://www.instagram.com/uniminutocol/?hl=es" class="fa fa-instagram"></a>
          <a href="https://twitter.com/uniminutocol?lang=es" class="fa fa-twitter"></a>
        </div>
      </div>
    </div>
    <div class="grupo-2">
      <small>&copy; 2023 <b></b> Todos los derechos reservados.</small>
    </div>
  </footer>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
  <script src="js/carrusel.js"></script>
  <script src="./js/js.js"></script>
  <script src="./js/modal.js"></script>
  <script src="./js/terminos.js"></script>
</body>

</html>
