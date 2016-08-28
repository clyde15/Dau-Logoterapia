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

    case "EditarPregunta":

     $Descripcion =  addslashes(htmlspecialchars($_POST["Descripcion"]));
     $idPreguntas =  addslashes(htmlspecialchars($_POST["idPreguntas"]));
     
    EditarPregunta($Descripcion,$idPreguntas);

    break;

    case "EliminarPregunta":
     
        $idPreguntas =  addslashes(htmlspecialchars($_POST["idPreguntas"]));
        
        EliminarPregunta($idPreguntas);

    break;

    case "CrearPregunta":

        $Descripcion =  addslashes(htmlspecialchars($_POST["Descripcion"]));

        CrearPreguntas($Descripcion);

    break;

    case "Activar":
        $idPreguntas = addslashes(htmlspecialchars($_POST["idPreguntas"]));
        
        Activar($idPreguntas);
     break;
         
    case "Desactivar":
        $idPreguntas = addslashes(htmlspecialchars($_POST["idPreguntas"]));
        
        Desactivar($idPreguntas);
     break;
 
    case "CambiarPregunta":
        $idpregunta = addslashes(htmlspecialchars($_POST["pregunta"]));
        $idpreguntarespuesta = addslashes(htmlspecialchars($_POST["idPreguntasresp"]));
        $respuesta = addslashes(htmlspecialchars($_POST["respuesta"]));
        $idusuario = addslashes(htmlspecialchars($_POST["idusuario"]));
 
        CambiarPregunta($idpregunta,$idpreguntarespuesta,$respuesta,$idusuario);
     break;
 
    case "CambiarContrasena":
        $claveactual = addslashes(htmlspecialchars($_POST["actual"]));
        $idusuario = addslashes(htmlspecialchars($_POST["idusuario"]));
        $clavenueva = addslashes(htmlspecialchars($_POST["nueva"]));
        
        CambiarClave($claveactual,$idusuario,$clavenueva);
    break;

    case "BuscarUsuario":
        $Usuario = addslashes(htmlspecialchars($_POST["Usuario"]));
        
        RecuperarClaveUsuario($Usuario);
     break;
 
    case "RecuperarContrasena":

        $idpreguntarespuesta = addslashes(htmlspecialchars($_POST["idpreguntarespuesta"]));
        $respuesta = addslashes(htmlspecialchars($_POST["respuesta"]));
        $idusuario = addslashes(htmlspecialchars($_POST["idusuario"]));
        
        ConfirmaRespuestSeguridad($idpreguntarespuesta,$respuesta,$idusuario);
     break;
 
    case "OlvidoClave":

        $idusuario = addslashes(htmlspecialchars($_POST["idusuarios"]));
        $clavenueva = addslashes(htmlspecialchars($_POST["nueva"]));
        
        OlvidoClave($idusuario,$clavenueva);
    break;
    
    }
    
}



	function EditarPregunta($Descripcion, $idPregruntas)
	{
        
        include_once '../Conexion.php';
              
        $query = "UPDATE preguntas SET Descripcion='$Descripcion', Fecha=NOW() WHERE idPreguntas = '$idPregruntas'";

        $resultados = $conexion->query($query);

        echo "Actualizacion Con Exito";

	}

    function CrearPreguntas($Descripcion)
	{
        
     include_once '../Conexion.php';
              
        $query = "INSERT INTO `preguntas`(`Descripcion`, `Fecha`, `Activo`, `Eliminado`) VALUES ('$Descripcion',NOW(),1,0) ";

        $resultados = $conexion->query($query);

        echo "Creacion de Preguntas de Seguridad Con Exito";

	}
    
     function EliminarPregunta($idPreguntas){
    
        include_once '../Conexion.php';
        
        $query1 = "SELECT count(idPregunta) as cantidad FROM preguntarespuesta WHERE idPregunta = $idPreguntas";
        $cantidad = $conexion->query($query1);
        $registros = $cantidad->fetch_array();
        
        if ($registros['cantidad'] >= 1)
        {
           echo "Error al eliminar la pregunta de seguridad - Actualmente usuarios la tienes asociada a su perfil";
           
        }else{
            $query = "DELETE FROM preguntas WHERE idPreguntas = $idPreguntas";
        
            $resultados = $conexion->query($query);
        
          echo "Pregunta de seguridad eliminada correctamente";
        }

    }
    
    function Activar($idPreguntas)
    {
        include_once '../Conexion.php';
       
         $query = "UPDATE preguntas SET Activo= 1 WHERE idPreguntas = $idPreguntas";

            $resultados = $conexion->query($query);
        
            echo "Actualizacion Con Exito";
    }
    
      function Desactivar($idPreguntas)
    {
        include_once '../Conexion.php';

           $query = "UPDATE preguntas SET  Activo= 0 WHERE idPreguntas = $idPreguntas";

           $resultados = $conexion->query($query);
        
        echo "Actualizacion Con Exito"; 
    }
    
    function CambiarPregunta($idpregunta,$idpreguntarespuesta,$respuesta,$idusuario)
    {
        include_once '../Conexion.php';
        
        if ($idpreguntarespuesta == "")
        {
            $query4 = "INSERT INTO `preguntarespuesta`(`idpregunta`, `idusuario`, `respuesta`) VALUES ('$idpregunta','$idusuario','$respuesta')";
            $resultados6 = $conexion->query($query4);
        }else{
                    $query = "UPDATE `preguntarespuesta` SET `idpregunta`= $idpregunta,`respuesta`= '$respuesta' WHERE idpreguntarespuesta = $idpreguntarespuesta";
                    $resultados = $conexion->query($query);
        }

        
        echo "Actualizacion Con Exito";
    }
    
    function CambiarClave($claveactual,$idusuario,$clavenueva)
    {
      include_once '../Conexion.php';
      
      $query2 ="SELECT * FROM usuarios WHERE idusuarios=$idusuario";
      $resultados2 = $conexion->query($query2);
      $registros = $resultados2->fetch_array();
      
      if($registros['contrasenia']==$claveactual)
      {
          $query = "UPDATE `usuarios` SET `contrasenia`= '$clavenueva',`fechamodificacion`= NOW() WHERE idusuarios = $idusuario";
          $resultados = $conexion->query($query);
          
          echo "Su Clave ha sido actualizada con exito"; 
      }else{
         echo "Su clave no coincide con la que esta registrada en nuestro sistema";
      }
      

    }
    
    function RecuperarClaveUsuario($Usuario)
    {
        include_once '../Conexion.php';
   
      $query2 ="SELECT * FROM usuarios WHERE usuario='$Usuario' AND activo='1'";
      $resultados2 = $conexion->query($query2);
      $registros = $resultados2->fetch_array(); 
      $idusuario = $registros['idusuarios'];  
      
     if ($idusuario == "")
     {
         echo 'NO';
     }else{
         $query = "SELECT `idpreguntarespuesta`, `idpregunta`, `idusuario`, `respuesta` FROM `preguntarespuesta` WHERE idusuario=$idusuario";
      $resultados3 = $conexion->query($query);
      $registros2 = $resultados3->fetch_array();
      
      $idpregunta = $registros2['idpregunta'];
      $idpreguntarespuesta = $registros2['idpreguntarespuesta'];
      
      $query3 = "SELECT * FROM `preguntas` WHERE `idPreguntas`=$idpregunta";
      $resultados4 = $conexion->query($query3);
      $registros3 = $resultados4->fetch_array();
      
      $descripcion = $registros3['Descripcion'];
      
        echo "$idusuario,$idpreguntarespuesta,$descripcion"; 
     }
      
    }
    
    function ConfirmaRespuestSeguridad($idpreguntarespuesta,$respuesta,$idusuario)
    {
      include_once '../Conexion.php';
        
      $query = "SELECT `idpreguntarespuesta`, `idpregunta`, `idusuario`, `respuesta` FROM `preguntarespuesta` WHERE idusuario=$idusuario AND `idpreguntarespuesta`= $idpreguntarespuesta";
      $resultados3 = $conexion->query($query);
      $registros2 = $resultados3->fetch_array();
      
      if ($respuesta == $registros2['respuesta'])
      {
          echo "OK";
      }else{
          echo 'Lo Sentimos la respuesta introducida no coincide con la que esta registrada en nuestro sistema';
      }
    }
    
    function OlvidoClave($idusuario,$clavenueva)
    {
      include_once '../Conexion.php';
      
      $query2 ="SELECT * FROM usuarios WHERE idusuarios=$idusuario";
      $resultados2 = $conexion->query($query2);
      $registros = $resultados2->fetch_array();
      
       $query = "UPDATE `usuarios` SET `contrasenia`= '$clavenueva',`fechamodificacion`= NOW() WHERE idusuarios = $idusuario";
       $resultados = $conexion->query($query);
   
          echo "Su Clave ha sido modificada con exito";       

    }