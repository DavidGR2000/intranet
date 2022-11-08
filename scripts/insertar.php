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
$fecha = $_POST["fecha"];
$nombreCausa=$_POST["cusa"];
$motivo=$_POST["motivo"];
$conexion = getconectar();
$statement = $conexion->prepare("CALL insertRegis(?,?,?,?,?,?,?,?,?,?,?,?)");
$statement->bind_param("ssssssssssss",$idEstudiante,$carrera,$nombreEstudiante,$correo,$telefono,$departamento,$municipio,$direccion,$aliatorio,$nombreCausa,$motivo,$fecha);
$statement->execute();


}
procAlmaIsert();
?>


