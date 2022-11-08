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
?>
>>>>>>> 03e549133197393cffbb78c16a7afe85897e6d29
