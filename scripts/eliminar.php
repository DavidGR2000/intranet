<?php
  require 'funciones.php';
  // Validación de la sesión como administrador:
  if(! haIniciadoSesion() || ! esAdmin() )
  {
    header('Location: ../index.html');
  }else{
  conectar();

  $referencia = $_GET["id"];
  $data = getDesertores($referencia);
  eliminard($referencia);
  header('Location: ../admin/graficas.php');
  }
