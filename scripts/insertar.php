<?php
require 'funciones.php';
if(! haIniciadoSesion() )
{
    header('Location: ../index.html');
}

$user = $_SESSION["usuario"];

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
$fecha = $_POST["fecha"];
$nombreCausa=$_POST["cusa"];
$motivo=$_POST["motivo"];
global $user;
$conexion = getconectar();
$statement = $conexion->prepare("CALL insertRegis(?,?,?,?,?,?,?,?,?,?,?,?,?)");
$statement->bind_param("sssssssssssss",$idEstudiante,$carrera,$nombreEstudiante,$correo,$telefono,$departamento,$municipio,$direccion,$aliatorio,$nombreCausa,$motivo,$fecha,$user);
$statement->execute();
if($statement->error){
      print_r("es este error");
      print($statement->error);
      header('Location: ../categorias/curiosidades.php');
}else{
      $statement->close();
      header('Location: ../panelUsuario.php');
}

}
procAlmaIsert();
?>

