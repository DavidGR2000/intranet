<?php
  require '../scripts/funciones.php';
  if(! haIniciadoSesion() || ! esAdmin() )
  {
    header('Location: ../index.php');
  }
  conectar();
  $usuarios = getUsuarios();

?>
<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Panel de Administración</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <!-- Custom styles for this template -->
    <link href="../css/dashboard.css" rel="stylesheet">
    <link rel="stylesheet" href="../css/graficas.css">
  </head>

  <body>
    <?php include 'menu-superior.php'; ?>

    <div class="container-fluid">
      <div class="row">
        <?php include 'menu-lateral.php'; ?>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <h1 class="page-header">Panel de Administración</h1>

          <h4 class="sub-header">Seleccione el usuario que desea editar haciendo clic en el enlace correspondiente.</h4>
          <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th># ID</th>
                  <th>Nombre de usuario</th>
                  <th>Edición</th>
                </tr>
              </thead>
              <tbody>
        <?php 
          $i = 1;
          foreach( $usuarios as $usuario ): 
        ?>
                <tr>
                  <td><?= $i++; ?></td>
                  <td><?= $usuario[0] ?></td>
                  <td><a href="./editarPermisos.php?usuario=<?= $usuario[0] ?>">Editar permisos</a></td>
                </tr>
        <?php endforeach ?>
              </tbody>
            </table>
          </div>
          <?php desconectar();?>
        </div>
      </div>
    </div>


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
  </body>
</html>
