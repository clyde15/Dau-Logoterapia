<?php
 

	/**
	 * Class1 short summary.
	 *
	 * Class1 description.
	 *
	 * @version 1.0
	 * @author gtorres
	 */

   $metodo =  addslashes(htmlspecialchars($_POST["MetodoE"]));

   ValidarF($metodo);
   
     function ValidarF($metodo)
{
   switch ($metodo)
   {

    case "Editar":

      $perfil = addslashes(htmlspecialchars($_POST["IDPerfil"]));
      $estadoPerfil = addslashes(htmlspecialchars($_POST["estadoPerfil"]));
       $descripcionPerfil = addslashes(htmlspecialchars($_POST["descripcionPerfil"]));
       $ListaPaginas =  $_POST["ListaPaginas"];


    EditarP($perfil,$ListaPaginas,$descripcionPerfil,$estadoPerfil);

    break;

    case "Eliminar":

     $perfil = addslashes(htmlspecialchars($_POST["IDPerfil"]));
        
        EliminarP($perfil);

    break;

    case "Crear":

       $descripcionPerfil = addslashes(htmlspecialchars($_POST["descripcionPerfil"]));
       $ListaPaginas =  $_POST["ListaPaginas"];

       CrearP($ListaPaginas,$descripcionPerfil);

    break;
    }

    

}



	function EditarP($perfil,$ListaPaginas,$descripcionPerfil,$estadoPerfil)
	{
        include '../Conexion.php';

        $estadoPerfilF = 0;

        if ($estadoPerfil == true)
        {
        	$estadoPerfilF = 1;

        }else{
            $estadoPerfilF = 0;
        }
        
        
            $queryUpdateP = "UPDATE `perfiles` SET `descripcion`='$descripcionPerfil', `activo`='$estadoPerfilF' WHERE `idperfiles`= '$perfil'";
              
              $resultadosPUpdateP = $conexion->query($queryUpdateP);

            $queryDeleteP = "DELETE FROM `permisos` WHERE `IDperfil`= '$perfil'";
              
              $resultadosPDeleteP = $conexion->query($queryDeleteP);

            foreach ($ListaPaginas as &$valor ) {
                    
              $queryInsert = "INSERT INTO `permisos`(`IDperfil`, `IDPagina`, `Acceso`) VALUES ('$perfil',$valor,1)";
              
              $resultadosInsert = $conexion->query($queryInsert);
                }

      

        echo "Actualización Con Exito";

	}

     function CrearP($ListaPaginas,$descripcionPerfil)
	{
        
     include_once '../Conexion.php';

     $QueryConsultaPerfil = "select * from perfiles where descripcion like '$descripcionPerfil' ";

        $resultadoConsulta = $conexion->query($QueryConsultaPerfil);

         if ( $resultadoConsulta->fetch_array() == 0)
         {
         	              
        $query = "INSERT INTO `perfiles`(`descripcion`, `activo`, `eliminado`) VALUES ('$descripcionPerfil',1,0)";

        $resultados = $conexion->query($query);

             $queryP = "SELECT @@identity AS id";

             $resultadosP = $conexion->query($queryP);

          $registrosP = $resultadosP->fetch_array();

            $id = $registrosP['id'];
         
         foreach ($ListaPaginas as &$valor ) {
                    
              $queryInsert = "INSERT INTO `permisos`(`IDperfil`, `IDPagina`, `Acceso`) VALUES ('$id',$valor,1)";
              
              $resultadosInsert = $conexion->query($queryInsert);
                }

        echo true;
        }else
         {
         	echo false;
         }
         
	}

    function EliminarP($idperfiles){
        
        include_once '../Conexion.php';
        
        $query = "DELETE FROM perfiles WHERE idperfiles = $idperfiles";
        
        $resultados = $conexion->query($query);
        echo $idperfiles;
        echo "Perfil eliminado correctamente";
        
        
    }
