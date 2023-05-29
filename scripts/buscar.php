<?php include("./funciones.php");

$conexion=getconectar();

$buscardor=mysqli_query($conexion,"SELECT 
estudiante.id_estudiante,estudiante.nombre,estudiante.correo, estudiante.telefono,carrera.carrera,causas.causa,causas.motivo FROM carrera
    INNER JOIN estudiante on carrera.id_carrera=estudiante.id_carrera
    INNER JOIN desertores on estudiante.id_estudiante=desertores.id_estudiante
    INNER JOIN causas on desertores.id_causa=causas.id_causa WHERE causas.causa LIKE LOWER('%".$_POST["buscar"]."%') OR estudiante.genero LIKE LOWER('%".$_POST["buscar"]."%') OR carrera.carrera LIKE LOWER('%".$_POST["buscar"]."%') 
    OR estudiante.nombre LIKE LOWER('%".$_POST["buscar"]."%') OR estudiante.correo LIKE LOWER('%".$_POST["buscar"]."%') OR estudiante.id_estudiante LIKE LOWER('%".$_POST["buscar"]."%')"); 
$numero = mysqli_num_rows($buscardor); ?>



<h5 class="card-tittle">Resultados encontrados (<?php echo $numero; ?>):</h5>
<div class="table-responsive">
            <table class="table table-striped">
            <thead style="background-color: rgb(138, 99, 173);">
                <tr>
                    <th>Index</th>
                    <th>ID_estudiante</th>
                    <th>Estudiante</th>
                    <th>Correo</th>
                    <th>Telefono</th>
                    <th>Carrera</th>
                    <th>Causa</th>
                    <th>Motivo</th>
                </tr>
            </thead>
            <tbody>
<?php $i = 1;?>
<?php while($resultado = mysqli_fetch_assoc($buscardor)){ ?>

    <tr>
    <td><?php echo $i++;?></td>
    <td><?php echo $resultado["id_estudiante"]?></td>
    <td><?php echo $resultado["nombre"]?></td>
    <td><?php echo $resultado["correo"]?></td>
    <td><?php echo $resultado["telefono"]?></td>
    <td><?php echo $resultado["carrera"]?></td>
    <td><?php echo $resultado["causa"]?></td>
    <td><?php echo $resultado["motivo"]?></td>
    
    
    
  </tr>
<?php } ?>

    </table>


