<?php

    /**
     * Autor: Camilo Figueroa ( Crivera )
     * Script para crear funciones y procedimientos almacenados
     * a manera de instalador. 
     * No se debe usar los delimitadores, y la ejecución consta de varias 
     * sub-ejecuciones para cada función o procedimiento almacenado.
     */

    $bd = "intranet"; //Se debe sacar aparte el nombre de la BD para la verificación final.

    //Estos paràmetros pueden venir de un include. 
    //Ojo, el nombre de la base de datos, solito, se usará más tarde.
    $conexion = mysqli_connect( "localhost", "root", "intranet", $bd );
    
    $sql  = " ";
    
    //$sql .= " delimiter // "; //No se usan los delimitadores.
    $sql .= " create function algo3() returns int ";
    $sql .= " begin ";
    $sql .= " 	return 3; ";
    $sql .= " end ";
    //$sql .= " // ";
    //$sql .= " delimiter ; "; //No se usan los delimitadores.
    $resultado = $conexion->query( $sql ); //Una ejecución para cada función

    echo "Error ".$conexion->errno; //Se imprime un error, cero si no hay.

    //$sql .= " delimiter // "; //No se usan los delimitadores.
    $sql  = " create function algo4() returns double "; //Borra el sql anterior.
    $sql .= " begin ";
    $sql .= "   select 3.3333 into @mi_variable; ";
    $sql .= " 	return @mi_variable; ";
    $sql .= " end ";
    //$sql .= " // ";
    //$sql .= " delimiter ; "; //No se usan los delimitadores.

    $resultado = $conexion->query( $sql ); //Una ejecución para cada función

    echo "Error ".$conexion->errno; //Se imprime un error, cero si no hay.

    //$sql .= " delimiter // "; //No se usan los delimitadores.
    $sql  = " create procedure proc1() "; //Borra el sql anterior.
    $sql .= " begin ";
    $sql .= "   select 'Hola' into @mi_variable; ";
    $sql .= " 	select @mi_variable; ";
    $sql .= " end ";
    //$sql .= " // ";
    //$sql .= " delimiter ; "; //No se usan los delimitadores.

    $resultado = $conexion->query( $sql ); //Una ejecución para cada procedimiento almacenado.

    echo "Error ".$conexion->errno; //Se imprime un error, cero si no hay.

    //------------------------------------------------------------------------------
    //El siguiente código es para verificar las funciones creadas en el sistema.
    //------------------------------------------------------------------------------

    $sql  = " select routine_schema as database_name, ";
    $sql .= "     routine_name, ";
    $sql .= "     routine_type as type,  ";
    $sql .= "     data_type as return_type, ";
    $sql .= "     routine_definition as definition ";
    $sql .= " from information_schema.routines ";
    $sql .= " where routine_schema not in ('sys', 'information_schema', ";
    $sql .= "                             'mysql', 'performance_schema') ";
    $sql .= " and routine_schema = '$bd'  ";
    $sql .= " order by routine_schema, ";
    $sql .= "         routine_name; ";

    //echo $sql;

    $resultado = $conexion->query( $sql );

    echo "<br><br>Funciones existentes:<br>";

    while( $fila = mysqli_fetch_array( $resultado ) )
    {
        for( $i = 0; $i < 4; $i ++ ) echo $fila[ $i ]." ";
        
        echo "<br>";  
    }

    $conexion->close(); //Cerramos la conexión para liberar memoria.

