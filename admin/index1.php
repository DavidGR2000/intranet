<?php
require '../scripts/funciones.php';
// Validación de la sesión como administrador:
if(! haIniciadoSesion() || ! esAdmin() )
{
  header('Location: index.html');
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Panel Adminsitrador</title>
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
      <link rel="stylesheet" href="style.css">
      <link href="../css/dashboard.css" rel="stylesheet">
</head>
<body>
 <?php include 'menu-superior.php';?>
 <div class="container-fluid">
      <div class="row">
        <?php include 'menu-lateral.php'; ?>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <h1 class="page-header">Panel de Administración</h1>

          <h4 class="sub-header">Modificando permisos de acceso</h4>
          <p>Se están modificando los permisos para el usuario:</p> 

          <div class="row">
            <div class="col-sm-6 col-sm-offset-3">
            
            <div class="panel panel-default">
              <div class="panel-heading"><h3 class="panel-title">Edición de permisos</h3></div>
              <div class="panel-body">
                <form action="../scripts/ingresa.php" method="POST">
                  <div class="form-group">
                    <label for="txtId">ID Categoría</label>
                    <input type="number" class="form-control" id="txtId" name="txtId" value="<?= $categoria[0] ?>" readonly>
                  </div>                
                  <div class="form-group">
                    <label for="nombre">Nombre: de Categoria:</label>
                    <input type="text" class="form-control" id="nombre"  name="nombre">
                  </div>
                  <div class="form-group">
                    <label for="descripcion">Descripción:</label>
                    <input type="text" class="form-control" id="descripcion" name="descripcion" required>
                  </div>
                  <div class="form-group">
                    <label for="ruta">Ruta:</label>
                    <input type="text" class="form-control" id="ruta" name="ruta"required>
                  </div>                  
                  <button type="submit" class="btn btn-default">Guardar</button>
                   <input type="reset" class="btn btn-default" value="borrar">
                </form>
              </div>
            </div>
          </div>
            
        </div>

        </div>
      </div>
    </div>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>