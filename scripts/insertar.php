<?php
require 'funciones.php';
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
conectar();
ingregarDatos($idEstudiante,$carrera,$nombreEstudiante,$correo,$telefono,$departamento,$municipio,$direccion);
insertCausas($aliatorio,$nombreCausa,$motivo);
insertfecha($aliatorio,$idEstudiante,$fecha);


?>


