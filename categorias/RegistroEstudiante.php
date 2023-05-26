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
        </div>
        
        <div class="navbarr">
          <ul class="navbarrr">
          <li class="active"><a  href="../index.php">Regresar</a></li>
          <img src="../logo.png" alt="logo" />
          </ul>
        </div>
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
                <option>ADME1</option>
                <option>CONTP1</option>
                <option>INGAG1</option>
                <option >INGCV1</option>
                <option >INGID1</option>
                <option>ISUM1</option>
                <option >PGI1</option>
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
                    <label for="municipio">Municipio</label>
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
                <option>Economico</option>
                <option>Academico</option>
                <option>Personal</option>
                <option >Institucional</option>
                  </select>
                  </div>
                  <div class="form-group">
                    <label for="motivo">Motivo</label>
                   <textarea name="motivo" id="motivo" cols="99" rows="6" class="form-control" required></textarea>
                  </div>

                  <button type="submit" class="btnn">Guardar</button>
                  <input type="reset" class=" btnl" value="Borrar" >
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
