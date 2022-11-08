<?php
  require 'funciones.php';
  // Validación de la sesión como administrador:
  if(! haIniciadoSesion() || ! esAdmin() )
  {
    header('Location: ../index.html');
  }
  conectar();

  $referencia = $_GET["id"];
  $data = getDesertores($referencia);
  eliminard($referencia);
  eliminarC($data[0]);
  eliminarE($data[1]);

<<<<<<< HEAD
=======
desconectar();

>>>>>>> d7ccab25ee11b81783be441ded532b2d1dbb506c

