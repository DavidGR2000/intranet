<!DOCTYPE html>

<html>
    <head>
        <meta charset="UTF-8">
        <title>Transacciones</title>
    </head>
    <body>
        <?php
        
            require '../scripts/funciones.php';

            echo '<form method="post" action="index.php">';
            echo '<input type="submit" name="commit" value="commit">';
            echo '</form>';
            
            echo '<form method="post" action="index.php">';
            echo '<input type="submit" name="rollback" value="rollback">';
            echo '</form>';
    
         global $con;
         $con=conectar();


            
            
            try {
                if (isset ($_POST["commit"])) {

                    $con -> beginTransaction();

                    $con -> exec("UPDATE producto_tienda SET cantidad=cantidad-7 WHERE id_tienda=1 AND id_producto=2");
                    $con -> exec("UPDATE producto_tienda SET cantidad=cantidad+7 WHERE id_tienda=2 AND id_producto=2");

                    $con -> commit();

                } else if (isset ($_POST["rollback"])) {

                    $con -> beginTransaction();

                    $con -> exec("UPDATE producto_tienda SET cantidad=cantidad-7 WHERE id_tienda=1 AND id_producto=2");
                    $con -> exec("UPDATE producto_tienda SET cantidad=cantidad+7 WHERE id_tienda=2 AND id_producto=2");

                    $con -> rollBack();
                }
            } catch (Exception $e){
                    $con -> rollBack();
                    echo 'No se ha podido completar la transacción. La base de datos se queda como estaba.';
            } finally {
                    $con = null;
            }
        ?>
    </body>
</html>
