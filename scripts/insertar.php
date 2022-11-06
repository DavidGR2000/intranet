<?php
require 'funciones.php';
$idEstudiante=$_POST["estudiante"];
$carrera=$_POST["carrera"];
$nombreEstudiante=$_POST["nombre"];
$correo=$_POST["correo"];
$telefono=$_POST["telefono"];
$departamento=$_POST["departamento"];
$municipio=$_POST["municipio"];
$direccion=$_POST["direccion"];
$fecha = $_POST["fecha"];
conectar();
ingregarDatos($idEstudiante,$carrera,$nombreEstudiante,$correo,$telefono,$departamento,$municipio,$direccion);
insertfecha($idEstudiante,$fecha);
?>


