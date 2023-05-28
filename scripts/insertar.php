<?php
require 'funciones.php';

function procAlmaIsert(){
      $aliatorio=generarRamdon();
      $idEstudiante=$_POST["estudiante"];
      $carrera=$_POST["carrera"];
      $nombreEstudiante=$_POST["nombre"];
      $correo=$_POST["correo"];
      $telefono=$_POST["telefono"];
      $departamento=$_POST["departamento"];
      $municipio=$_POST["municipio"];
      $direccion=$_POST["direccion"];
      $genero= $_POST["genero"];
      $fecha = $_POST["fecha"];
      $nombreCausa=$_POST["cusa"];
      $motivo=$_POST["motivo"];
      $conexion = getconectar();
      $statement = $conexion->prepare("CALL insertRegis(?,?,?,?,?,?,?,?,?,?,?,?,?)");
      $statement->bind_param("sssssssssssss",$idEstudiante,$carrera,$nombreEstudiante,$correo,$telefono,$departamento,$municipio,$direccion,$aliatorio,$nombreCausa,$motivo,$fecha,$genero);
      $statement->execute();
 if($statement->error){
      print_r("es este error");
      print($statement->error);
      header('Location: ../RegistroEstudiante.php');
}else{
      $statement->close();
      header('Location: ../index.php');
}

}
procAlmaIsert();
?>

