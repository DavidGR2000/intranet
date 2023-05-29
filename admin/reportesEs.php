
<?php
require '../scripts/funciones.php';
if(! haIniciadoSesion() || !esAdmin())
{
    header('Location: ../index.php');
}
conectar();
?>


<!doctype html>
<html lang="es">
  <head>
    <title>Buscador</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link href="../css/dashboard.css" rel="stylesheet">
    <link rel="stylesheet" href="../css/graficas.css">
  </head>
  <body>

  <?php include 'menu-superior.php'; ?>
     <div class="container-fluid">
      <div class="row">
        <?php include 'menu-lateral.php'; ?>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <h1 class="page-header"> Reportes Especificos</h1>
          
<?php ?>

<div class="container mt-5">
    <div class="col-12"">

        <div style="max-width: 400px;
      width: 100%;
      margin: 3px auto; display:flex; flex-direction:column; border-radius:40px;  background-color: rgb(238,238,238); padding:10px 0 20px 0;  justify-content: center;
      align-items: center; " >

       <!--    <label class="" for="buscar" style="color: black;">Palabra a buscar</label>
            <input type="text" class="form-control" id="buscar" name="buscar" style="width: 300px;">
-->
            <label class="" for="buscar_1" style="color: black;">Filtrar Informacion</label>
            <input onkeyup="buscar_ahora($('#buscar_1').val());" type="text" class="form-control" id="buscar_1" name="buscar_1" style="width: 300px;">

        </div>
      <!--  <button  class="btn btn-primary"  onclick="buscar_ahora($('#buscar').val());">Buscar</button> --->

        <div class="card col-12 mt-5" style="margin:60px 0 0 0;">
            <div class="card-body">
                <div id="datos_buscador" class="container pl-5 pr-5"></div>
            </div>
        </div>
        
    </div>
</div>
</div>

<script type="text/javascript">
        function buscar_ahora(buscar) {
        var parametros = {"buscar":buscar};
        $.ajax({
        data:parametros,
        type: 'POST',
        url: '../scripts/buscar.php',
        success: function(data) {
        document.getElementById("datos_buscador").innerHTML = data;
        }
        });
        }
     //   buscar_ahora();
</script>
