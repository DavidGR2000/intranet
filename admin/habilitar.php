<?php
require '../scripts/funciones.php';
  if(! haIniciadoSesion() || !esAdmin())
  {
  	header('Location: ../index.php');
  }

  if($_SERVER["REQUEST_METHOD"]=== "POST"){
    $configFile = "../scripts/config.php";
    include $configFile;

    $estado=!$config["estado"];
    $config["estado"]=$estado;
    file_put_contents($configFile, '<?php $config = ' . var_export($config, true) . ';');
    header("location: ./habilitar.php");
    exit;
  }
?>

<!DOCTYPE html>
<html lang="en">
<head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Document</title>
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
          <link href="../css/dashboard.css" rel="stylesheet">
          <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
          <link rel="stylesheet" href="../css/graficas.css">
          <link rel="stylesheet" href="../css/backup.css">
</head>
<body> 
      <?php include 'menu-superior.php'; ?>
      <div class="container-fluid">
      <div class="row">
        <?php include 'menu-lateral.php'; ?>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <h1 class="page-header text-center" > Habilitar Formulario</h1>

          <div class="card" style=" width:400px; height:400px; overflow:hidden; border-radius:5px; margin:40px auto; background-color:aliceblue;">
            <img src="../public/OIG.jpg" class="card-img-top" style="width: 100%; height:200px;"  alt="...">
            <div class="card-body">
                <h4 class="card-title" style="text-align: center; font-weight:bold;">Habilita el formulario</h5>
                <p class="card-text" style="text-align: center;">Formulario estudiantil que se hace cada semestre como una alerta temprana</p>
                <form method="POST">
                  <input type="submit" class="btn btn-primary" name="toggle" value="Ocultar" style="margin: 5px 150px; padding:10px 20px;">
                </form>
            </div>
        </div>
        </div>
    </div>
</body>
</html>