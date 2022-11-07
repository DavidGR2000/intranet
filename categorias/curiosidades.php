<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Registro de Estudiantes</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="./style1.css">
    <link rel="stylesheet" href="../css/gaficas.css">
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
<<<<<<< HEAD
            <li class="active"><a href="#">Estudiante</a></li>
=======
          <li class="active"><a  href="../panelUsuario.php">Principal</a></li>
            <li ><a href="#">Registro de Estudiantes</a></li>
            <li><a href="./causas.php">Causas</a></li>
            <li><a href="#contact"></a></li>
>>>>>>> 7053df9f00b442998856410e442f4feac2893eb3
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>

    <div class="contai">
      <div class="cotainer-form">
      <form action="../scripts/insertar.php"  class="form"method="POST">
        <div class="cntfor">
                  <div class="form-group">
                    <label for="estudiante">Id Estudiante</label>
                    <input type="text" class="form-control" id="estudiante" name="estudiante" required>
                  </div>                
                  <div class="form-group">
                    <label for="nombre">Nombre Completo</label>
                    <input type="text" class="form-control" id="nombre"  name="nombre" required>
                  </div>
                  <div class="form-group">
                    <label for="carrera">Id Carrera</label>
                  <select class="form-control color" id="carrera" name="carrera" required>
                <option>adme1</option>
                <option>contp1</option>
                <option>ingag1</option>
                <option >ingcv1</option>
                <option >ingid1</option>
                <option>isum1</option>
                <option >pgi1</option>
                  </select>
                </div>
                <div class="form-group">
                    <label for="fecha">Fecha De Registro</label>
                    <input type="date" class="form-control" id="fecha" name="fecha" required>
                  </div>
                  <div class="form-group">
                    <label for="correo">Correo Electronico</label>
                    <input type="email" class="form-control" id="correo" name="correo" required>
                  </div>
                  <div class="form-group">
                    <label for="telefono">Numero Telefonico</label>
                    <input type="text" class="form-control" id="telefono" name="telefono" required>
                  </div>   
                  <div class="form-group">
                    <label for="departamento">Departamento</label>
                    <input type="text" class="form-control" id="departamento" name="departamento" required>
                  </div> 
                  <div class="form-group">
                    <label for="municipio">municipio</label>
                    <input type="text" class="form-control" id="municipio" name="municipio" required>
                  </div> 
                  <div class="form-group">
                    <label for="direccion">Direccion</label>
                    <input type="text" class="form-control" id="direccion" name="direccion" required>
                  </div>   
          </div>
          <div class="ctnfr2">
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
          </div>

                </form>
</div>
    </div><!-- /.container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
  </body>
</html>
