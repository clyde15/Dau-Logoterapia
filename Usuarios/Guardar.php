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

     $IDUsuario =  addslashes(htmlspecialchars($_POST["idusuarios"]));
      $nombre =  addslashes(htmlspecialchars($_POST["nombre1"]));
       $apellido =  addslashes(htmlspecialchars($_POST["apellido"]));
        $usuario =  addslashes(htmlspecialchars($_POST["usuario"]));
        $contrasenia =  addslashes(htmlspecialchars($_POST["contrasenia"]));
        $perfil =  addslashes(htmlspecialchars($_POST["perfil"]));
        $responsable = addslashes(htmlspecialchars($_POST["idresponsable"]));
        
        
        if (empty($_POST["estadoUsuariof"]))
        {
            $estadoUsuario = false;
        }else
         {
         	    $estadoUsuario = true;
         }
         
        
    EditarU($IDUsuario,$nombre,$apellido,$usuario,$contrasenia,$perfil,$estadoUsuario,$responsable);

    break;

    case "Eliminar":
     
        $IDUsuario =  addslashes(htmlspecialchars($_POST["idusuarios"]));
        
        EliminarU($IDUsuario);

    break;

    case "Crear":

    $nombre =  addslashes(htmlspecialchars($_POST["nombre1"]));
       $apellido =  addslashes(htmlspecialchars($_POST["apellido"]));
        $usuario =  addslashes(htmlspecialchars($_POST["usuario"]));
        $contrasenia =  addslashes(htmlspecialchars($_POST["contrasenia"]));
        $perfil =  addslashes(htmlspecialchars($_POST["perfil"]));
        $pregunta = addslashes(htmlspecialchars($_POST["pregunta"]));
        $respuesta = addslashes(htmlspecialchars($_POST["respuesta"]));
        $responsable = addslashes(htmlspecialchars($_POST["idresponsable"]));

        CrearU($nombre,$apellido,$usuario,$contrasenia,$perfil,$pregunta,$respuesta,$responsable);

    break;
    }

    

}



	function EditarU($IDUsuario,$nombre,$apellido,$usuario,$contrasenia,$perfil,$estadoUsuario,$responsable)
	{
        
     include '../Conexion.php';
           
        $query = "UPDATE usuarios SET nombre='$nombre', apellido='$apellido', usuario='$usuario', activo='$estadoUsuario', contrasenia='$contrasenia', id_perfil='$perfil', idusuariomodificacion ='$responsable',fechamodificacion=NOW()  WHERE idusuarios = '$IDUsuario' ";

        $resultados = $conexion->query($query);

        echo "Actualizacion Con Exito";

	}

    function CrearU($nombre,$apellido,$usuario,$contrasenia,$perfil,$pregunta,$respuesta,$responsable)
	{
        
     include_once '../Conexion.php';
     
     $query2 = "Select * from usuarios where usuario = '$usuario'";
     $resultados2 = $conexion->query($query2);
     
     $numfilas = $resultados2->num_rows;
    if ($numfilas >= 1)
        {
           echo "Error - el nombre de usuario que desea registrar ya esta en uso";
           
        }else{
     
              $query = "INSERT INTO `usuarios`(`id_perfil`, `nombre`, `apellido`, `usuario`, `contrasenia`, `fechamodificacion`,`idusuariomodificacion`, `activo`, `eliminado`) VALUES ('$perfil','$nombre','$apellido','$usuario','$contrasenia',NOW(),$responsable,1,0) ";

              $resultados = $conexion->query($query); 


              $query3 = "SELECT * FROM usuarios WHERE usuario = '$usuario'";
              $resultados3 = $conexion->query($query3);
              $registros4 = $resultados3->fetch_array();
              
              $usuarionuevo = $registros4['idusuarios'];

              $query4 = "INSERT INTO `preguntarespuesta`(`idpregunta`, `idusuario`, `respuesta`) VALUES ('$pregunta','$usuarionuevo','$respuesta')";
              $resultados6 = $conexion->query($query4);
              
              echo "Creacion de Usuario Con Exito";
            } 
	}
    
     function EliminarU($idusuario){
    
        include_once '../Conexion.php';
        
        $query = "DELETE FROM usuarios WHERE idusuarios = $idusuario";
        
        $resultados = $conexion->query($query);
        
        echo "Usuario eliminado correctamente";
    
    
    }
    
    
    