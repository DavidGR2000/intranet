<?php
require "./funciones.php";
$user = $_POST["Usuario"];
$contraseña = $_POST["Contraseña"];
conectar();
$numero = getnumber();
agregarUser($user,$contraseña,$numero);
 header('Location: ../index.html');
 desconectar();

?>