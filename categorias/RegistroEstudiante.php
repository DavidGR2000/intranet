<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Registro de Estudiantes</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/formStudent.css">
    <link rel="stylesheet" href="../css/graficas.css">
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
      <form action="../scripts/insertar.php"  class="form"method="POST">
        <div class="cntfor">
                  <div class="inputs">
                    <label for="estudiante">Id Estudiante</label>
                    <input type="text" class="input" id="estudiante" name="estudiante" autocomplete="off" required>
                  </div>                
                  <div class="inputs">
                    <label for="nombre">Nombre Completo</label>
                    <input type="text" class="input" id="nombre"  name="nombre" autocomplete="off" required>
                  </div>

                  <div class="inputs">
                      <label for="genero">Genero</label>
                      <select class="input" id="genero" name="genero" required>
                        <option>Mujer</option>
                        <option>Hombre</option>
                      </select>
                  </div>

                  <div class="inputs">
                    <label for="carrera">Id Carrera</label>
                  <select class="input" id="carrera" name="carrera" required>
                <option>ADME1</option>
                <option>CONTP1</option>
                <option>INGAG1</option>
                <option >INGCV1</option>
                <option >INGID1</option>
                <option>ISUM1</option>
                <option >PGI1</option>
                  </select>
                </div>
                <div class="inputs">
                    <label for="fecha">Fecha De Registro</label>
                    <input type="date" class="input" id="fecha" name="fecha" autocomplete="off" required>
                  </div>
                  <div class="inputs">
                    <label for="correo">Correo Electronico</label>
                    <input type="email" class="input" id="correo" name="correo" autocomplete="off" required>
                  </div>
                  <div class="inputs">
                    <label for="telefono">Numero Telefonico</label>
                    <input type="text" class="input" id="telefono" name="telefono" autocomplete="off" required>
                  </div>   
                  <div class="inputs">
                    <label for="departamento">Departamento</label>
                    <input type="text" class="input" id="departamento" name="departamento" autocomplete="off" required>
                  </div> 
                  <div class="inputs">
                    <label for="municipio">Municipio</label>
                    <input type="text" class="input" id="municipio" name="municipio" autocomplete="off" required>
                  </div> 
                  <div class="inputs">
                    <label for="direccion">Direccion</label>
                    <input type="text" class="input" id="direccion" name="direccion" autocomplete="off" required>
                  </div>   
          </div>

          <div class="inputs">
                  <label for="cusa">Causa</label>
                <select class="input" id="cusa" name="cusa" required>
                <option>Economico</option>
                <option>Academico</option>
                <option>Personal</option>
                <option >Institucional</option>
                  </select>
                  </div>
                  <div class="inputs">
                    <label for="motivo">Descripcion</label>
                   <textarea name="motivo" id="motivo" cols="99" rows="6" class="input" required></textarea>
                  </div>
                <div class="cont-buttons">
                <button type="submit" class="btnl">Guardar</button>
                  <button type="reset" class=" btnl">Borrar</button>
                </div>
</div>
                </form>
    </div><!-- /.container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
  </body>
</html>
