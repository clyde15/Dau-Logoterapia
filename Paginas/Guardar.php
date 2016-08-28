<?php
 

	/**
	 * Class1 short summary.
	 *
	 * Class1 description.
	 *
	 * @version 1.0
	 * @author gtorres
	 */
        include '../Conexion.php';

         $estatus =  $_POST["estatus"];
        $idpagina = $_POST["idpagina"];

        $estatusF = false;

        if ($estatus == 1)
            {
            	$estatusF = true;
            }else
             {
             	  $estatusF = false; 
             }
             


        //echo $estatus;
            $queryUpdateP = "UPDATE `pagina` SET `Activo`='$estatusF' WHERE idpagina='$idpagina'";
              
              $resultadosPUpdateP = $conexion->query($queryUpdateP);

            if ($estatus == 1)
            {
            	echo "Pagina Activa";
            }else
             {
             	   echo "Pagina Inactiva"; 
             }
             
                

        

