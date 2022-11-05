
<?php  

 require '../scripts/funciones.php';
 if(! haIniciadoSesion() || ! esAdmin() )
 {
   header('Location: ../index.html');
 }

 conectar();
 $usuarios = dataTable();
 desconectar();
?>

<?php
$connect = mysqli_connect("localhost", "root", "", "intranet");  
$query = "SELECT nombre, count(*) as number FROM causas GROUP BY nombre";  
$result = mysqli_query($connect, $query);  
?>  

<!DOCTYPE html>  
<html>  
     <head>  
          <title> Reportes de graficas</title>  
          <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>  
          <script type="text/javascript">  
          google.charts.load('current', {'packages':['corechart']});  
          google.charts.setOnLoadCallback(drawChart);  
          function drawChart()  
          {  
               var data = google.visualization.arrayToDataTable([  
                         ['Nombre', 'Numeros'],  
                         <?php  
                         while($row = mysqli_fetch_array($result))  
                         {  
                              echo "['".$row["nombre"]."', ".$row["number"]."],";  
                         }  
                         ?>  
                    ]);  
               var options = {  
                     title: 'causas de Desercion',  
                     //is3D:true,  
                     pieHole: 0.4  
                    };  
               var chart = new google.visualization.PieChart(document.getElementById('piechart'));  
               chart.draw(data, options);  
          }  
          </script> 
          <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
          <link href="../css/dashboard.css" rel="stylesheet">
     </head>  
     <body>  
     <?php include 'menu-superior.php'; ?>
     <div class="container-fluid">
      <div class="row">
        <?php include 'menu-lateral.php'; ?>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <h1 class="page-header"> Grafica De Las Posibles Deserciones</h1>
          <div style="width:900px;">  
               <br />  
               <div id="piechart" style="width: 900px; height: 500px;"></div>  
          </div>  
       </div>   
     </div>   
     <div>
     <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th></th>
                  <th>No</th>
                  <th>Edición</th>
                </tr>
              </thead>
              <tbody>
        <?php 
          $i = 1;
          foreach( $usuarios as $usuario ): 
        ?>
                <tr>
                  <td><?= $usuario[0] ?></td>
                 
                </tr>
        <?php endforeach ?>
              </tbody>
            </table>
          </div>
        </div>

         
     </div>

</div>  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
     </body>  
</html>  

