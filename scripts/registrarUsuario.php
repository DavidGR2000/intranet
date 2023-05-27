<?php
require "./funciones.php";

$user = $_POST["Usuario"];
$contraseña = $_POST["Contraseña"];
$numero = getnumber();
conectar();
agregarUser($user,$contraseña,$numero);
header('Location: ../index.php');
 desconectar();

?>