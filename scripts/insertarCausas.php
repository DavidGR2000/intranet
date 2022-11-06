<?php
require "./funciones.php";
$id_causa=$_POST["causa"];
$nombreCausa=$_POST["cusa"];
$motivo=$_POST["motivo"];
conectar();
insertCausas($id_causa,$nombreCausa,$motivo);
insertIdc($id_causa);

?>