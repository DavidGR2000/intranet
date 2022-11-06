<?php 
	$conexion = null;

	function conectar()
	{
		global $conexion;
		$conexion = mysqli_connect('localhost', 'root', '', 'intranet');
		mysqli_set_charset($conexion, 'utf8');
	}

	function getTodasCategorias()
	{
		global $conexion;
		$respuesta = mysqli_query($conexion, "SELECT * FROM categorias");
		// return $respuesta->fetch_all();
		$respuestas_array = array();
		while ($fila = $respuesta->fetch_row())
		  $respuestas_array[] = $fila;
		return $respuestas_array;		
	}

	function getCategoriasPorUser()
	{
		global $conexion;
		$respuesta = mysqli_query($conexion, "SELECT C.categoria, C.descripcion, C.ruta FROM permisos P INNER JOIN categorias C ON P.ID_Categoria = C.ID_Categoria WHERE usuario =  '".$_SESSION['usuario']."'");		
		// return $respuesta->fetch_all();
		$respuestas_array = array();
		while ($fila = $respuesta->fetch_row())
		  $respuestas_array[] = $fila;
		return $respuestas_array;
	}

	function getCategoriaPorId($id)
	{
		global $conexion;
		$respuesta = mysqli_query($conexion, "SELECT * FROM categorias WHERE ID_Categoria =  ".$id);		
		return mysqli_fetch_row($respuesta);
	}

	function getUsuarios()
	{
		global $conexion;
		$respuesta = mysqli_query($conexion, "SELECT * FROM usuarios WHERE admin<>1");		
		// return $respuesta->fetch_all();
		$respuestas_array = array();
		while ($fila = $respuesta->fetch_row())
		  $respuestas_array[] = $fila;
		return $respuestas_array;		
	}
	
	function validarLogin($usuario, $clave)
	{
		global $conexion;
		$consulta = "SELECT * FROM usuarios WHERE usuario='".$usuario."' AND clave='".$clave."'";
		$respuesta = mysqli_query($conexion, $consulta);
		
		if( $fila = mysqli_fetch_row($respuesta) )
		{
			session_start();
			$_SESSION['usuario'] = $usuario;
			$_SESSION['admin'] = $fila[2];
			return true;
		}
		return false;
	}

	function eliminarPermisos($usuario)
	{
		global $conexion;
		mysqli_query($conexion, "DELETE FROM permisos WHERE usuario='".$usuario."'");		
	}

	function asignarPermisos($usuario, $idCat)
	{
		global $conexion;
		mysqli_query($conexion, "INSERT INTO permisos VALUES('".$usuario."', ".$idCat.")");		
	}

	function tienePermiso($usuario, $idCat)
	{
		global $conexion;
		$result = mysqli_query($conexion, "SELECT COUNT(*) AS total FROM permisos WHERE usuario='".$usuario."' AND ID_Categoria=".$idCat);
		$row = mysqli_fetch_assoc($result);
		$numero = $row['total'];
		return $numero > 0;
	}

	function editarCategoria($id, $nombre, $descripcion, $ruta)
	{
		global $conexion;
		mysqli_query($conexion, "UPDATE categorias SET categoria='".$nombre."', descripcion='".$descripcion."', ruta='".$ruta."' WHERE ID_Categoria = ".$id);
	}
		
	function haIniciadoSesion()
	{
		session_start();
		return isset( $_SESSION['usuario'] );
	}

	function esAdmin()
	{
		return $_SESSION['admin'];
	}

	function desconectar()
	{
		global $conexion;
		mysqli_close($conexion);
	}

	function ingresar($nombre, $descripcion, $ruta){
		global $conexion;
		$sql= "INSERT INTO categorias (categoria, descripcion, ruta) VALUES('$nombre','$descripcion','$ruta')";
		$result  =mysqli_query($conexion,$sql)or trigger_error("Query failed SQL-Error");
	}

	function ingregarDatos($id,$carrera,$nombre,$correo,$telefono,$departamento,$municipio,$direccion){
		global $conexion;
		$sql= mysqli_query($conexion,"INSERT INTO estudiante(`id_estudiante`, `id_carrera`, `nombre`, `correo`, `telefono`, `departamento`, `municipio`, `direccion`) 
		VALUES ('$id','$carrera','$nombre','$correo','$telefono','$departamento','$municipio','$direccion')");
	}

	function insertCausas($id,$nombre,$motivo){
		global $conexion;
		$sql= "INSERT INTO causas(id_causa,nombre,motivo) 
		VALUES('$id','$nombre','$motivo')";
		$result  =mysqli_query($conexion,$sql)or trigger_error("Query failed SQL-Error");
	}

	function dataTable(){
		global $conexion;
		$respuesta = mysqli_query($conexion,"SELECT estudiante.nombre,carrera.nombre,carrera.semestre,carrera.modalidad,desertores.fecha,causas.nombre,causas.motivo FROM carrera INNER JOIN estudiante ON carrera.id_carrera=estudiante.id_carrera INNER JOIN desertores ON estudiante.id_estudiante=desertores.id_estudiante INNER JOIN causas ON desertores.id_causa=causas.id_causa");
		$respuestas_array = array();
		while ($fila = $respuesta->fetch_row())
		  $respuestas_array[] = $fila;
		return $respuestas_array;
	}

	function insertfecha($id,$fecha){
		global $conexion;
		$sql= "INSERT INTO desertores(id_estudiante,fecha)VALUES('$id','$fecha')";
		$result  =mysqli_query($conexion,$sql)or trigger_error("Query failed SQL-Error");
	}
	function insertIdc($id){
		global $conexion;
		$sql= "INSERT INTO desertores(id_causa)VALUES('$id')";
		$result  =mysqli_query($conexion,$sql)or trigger_error("Query failed SQL-Error");
	}

?>