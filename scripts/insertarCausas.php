<?php
require "./funciones.php";
$aliatorio=generarRamdon();

$nombreCausa=$_POST["cusa"];
$motivo=$_POST["motivo"];
conectar();
insertCausas($aliatorio,$nombreCausa,$motivo);
insertIdc($aliatorio);


?>