<?php
require '../scripts/funciones.php';
  if(! haIniciadoSesion() || !esAdmin())
  {
  	header('Location: ../index.html');
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
          <link rel="stylesheet" href="../css/graficas.css">
          <link rel="stylesheet" href="../css/backup.css">
</head>
<body> 
      <?php include 'menu-superior.php'; ?>
      <div class="container-fluid">
      <div class="row">
        <?php include 'menu-lateral.php'; ?>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <h1 class="page-header text-center" > BACKUP</h1>
      <form action="../scripts/restaurar.php" method="POST">
            <label for="selector">Seleccione el punto de restauracion</label>
            <select name="selector">
                  <option >seleccionan un punto de restauracion</option>
                  <?php
                   include_once "../scripts/generar.php";
                   $ruta= BACKUP_PATH;
                   if(is_dir($ruta)){
                        if($data = opendir($ruta)){
                              while(($file=readdir($data)) !==false){
                                   if($file !="." && $file!=".."){
                                    $nameFile=str_replace(".sql", "", $file);
                                    $nameFile= str_replace("-", ":",$nameFile);
                                    $urlFull = $ruta.$file;
                                   }
                                   if(is_dir($urlFull));
                                   else{
                                    echo `<option value="'$urlFull'">'$nameFile'</option>`;
                                   }
                              }
                        }closedir($data);

                   }
                   else{
                        echo $ruta."No es valida la ruta";
                   }
                  ?>
            </select>
            <button type="submit">
                  Restaurar
            </button>
      </form>
      <a href="../scripts/backup.php" class="boton">Generar</a>
                  </div>
                  </div>
</body>
</html>