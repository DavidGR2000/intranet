<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Sección de Curiosidades</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="./style1.css">
    <link rel="stylesheet" href="http://localhost/estudiantil/intranet/css/grupos.css">
    <style>
    body { padding-top: 50px; }
    .starter-template { padding: 40px 15px; text-align: center; }
    </style>
  </head>

  <body>
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="cn-nv">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>

        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a  href="../panelUsuario.php">Principal</a></li>
            <li ><a href="./curiosidades.php">Estudiante</a></li>
            <li><a href="#">Causas</a></li>
            <li><a href="#contact"></a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>

    <div class="contai">
      <div class="cotainer-form">
      <form action="../scripts/insertarCausas.php"  class="form"method="POST">
                  
                  <div class="form-group">
                  <label for="cusa">Causa</label>
                <select class="form-control color" id="cusa" name="cusa" required>
                <option>Economica</option>
                <option>Academica</option>
                <option>Personal</option>
                <option >Cambio de residencia</option>
                  </select>
                  </div>
                  <div class="form-group">
                    <label for="motivo">Motivo</label>
                   <textarea name="motivo" id="motivo" cols="99" rows="6" class="form-control" required></textarea>
                  </div>

                  <button type="submit" class="btnn btn btn-default">Guardar</button>
                  <input type="reset" class=" btnl btn btn-default" value="borrar" >
                </form>
</div>
    </div><!-- /.container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
  </body>
</html>
