<?php
require 'funciones.php';

if(! haIniciadoSesion() || ! esAdmin() )
{
  header('Location: ../index.html');
}

      $nombre= $_POST["nombre"];
      $descripcion=$_POST["descripcion"];
      $ruta = $_POST["ruta"];  

conectar();
ingresar($nombre,$descripcion,$ruta)

?>