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
    case "Activar":
        $idformaciones = addslashes(htmlspecialchars($_POST["idformaciones"]));
        
        ActivarFormacion($idformaciones);
     break;
         
    case "Desactivar":
        $idformaciones = addslashes(htmlspecialchars($_POST["idformaciones"]));
        
        DesactivarFormacion($idformaciones);
     break;
 
    case "CrearFormacion":
        $nombre = addslashes(htmlspecialchars($_POST["Nombre"]));
        $Descripcion = addslashes(htmlspecialchars($_POST["Descripcion"]));
        
        CrearFormacion($nombre,$Descripcion);
        
    break;
    case "EditarConfiguracionFormacion":
      $idconfiguracion =  addslashes(htmlspecialchars($_POST["idconfiguracion"]));
      $idformacion =  addslashes(htmlspecialchars($_POST["idformacion"]));
      $fechainicio =  addslashes(htmlspecialchars($_POST["fechaini"]));
      $fechafin =  addslashes(htmlspecialchars($_POST["fechafin"]));
      $cantidad =  addslashes(htmlspecialchars($_POST["Cantidad"]));
      $minimo =  addslashes(htmlspecialchars($_POST["minimo"]));
      $tipo =  addslashes(htmlspecialchars($_POST["tipo"]));   
      $responsable =  addslashes(htmlspecialchars($_POST["idresponsable"]));
      
      EditarConfiguracionFormacion($idconfiguracion,$idformacion,$fechainicio,$fechafin,$cantidad,$minimo,$tipo,$responsable);
    break;

    case "ConfigurarFormacion":

      $idformacion =  addslashes(htmlspecialchars($_POST["idformacion"]));
      $fechainicio =  addslashes(htmlspecialchars($_POST["fechaini"]));
      $fechafin =  addslashes(htmlspecialchars($_POST["fechafin"]));
      $cantidad =  addslashes(htmlspecialchars($_POST["Cantidad"]));
      $minimo =  addslashes(htmlspecialchars($_POST["minimo"]));
      $tipo =  addslashes(htmlspecialchars($_POST["tipo"]));
      $inscripcionfechaini =  addslashes(htmlspecialchars($_POST["inscripcionfechaini"]));
      $inscripcionfechafin =  addslashes(htmlspecialchars($_POST["inscripcionfechafin"]));     
      $gerente =  addslashes(htmlspecialchars($_POST["gerente"]));
      $profesor =  addslashes(htmlspecialchars($_POST["profesor"]));    
      $responsable =  addslashes(htmlspecialchars($_POST["idresponsable"]));
      $ListaDias = $_POST["ListaDias"];
      
    CrearConfiguracionFormacion($idformacion,$fechainicio,$fechafin,$cantidad,$minimo,$tipo,$inscripcionfechaini,$inscripcionfechafin,$gerente,$profesor,$responsable,$ListaDias);

    break;
    }
    
}



     function ActivarFormacion($idformaciones)
    {
        include_once '../../Conexion.php';
       
         $query = "UPDATE formacion SET Activo= 1 WHERE idformaciones = $idformaciones";

            $resultados = $conexion->query($query);
        
            echo "Actualizacion Con Exito";
    }
    
      function DesactivarFormacion($idformaciones)
    {
        include_once '../../Conexion.php';
        
           $query = "UPDATE formacion SET  Activo= 0 WHERE idformaciones = $idformaciones";

           $resultados = $conexion->query($query);
        
        echo "Actualizacion Con Exito"; 
    }
                
   function CrearFormacion($nombre,$Descripcion)
   {
      include_once '../../Conexion.php';
        
           $query = "INSERT INTO `formacion`(`Nombre`, `Descripcion`, `Activo`, `Eliminado`) VALUES ('$nombre','$Descripcion',1,0)";

           $resultados = $conexion->query($query);
        
        echo "Creacion de la formacion fue exitosa";   
   }
   
   function EditarConfiguracionFormacion($idconfiguracion,$idformacion,$fechainicio,$fechafin,$cantidad,$minimo,$tipo,$responsable)
   {
       include_once '../../Conexion.php';
        
                $query2 = "UPDATE `configuraciones` SET `ID_Formacion`=$idformacion,`FechaInicio`='$fechainicio',`FechaFin`='$fechafin',`CantidadModulos`=$cantidad,`CupoMinimo`=$minimo,`ID_Tipo`=$tipo,`ID_UsuarioResponsable`=$responsable,`FechaActualizacion`=NOW() WHERE `IDConfiguracion` = '$idconfiguracion'";
              
                 $resultados2 = $conexion->query($query2);
                
                echo "La Modificacion se ha guardado exitosamente";
   }

   
   function CrearConfiguracionFormacion($idformacion,$fechainicio,$fechafin,$cantidad,$minimo,$tipo,$inscripcionfechaini,$inscripcionfechafin,$gerente,$profesor,$responsable,$ListaDias)
	{
           include_once '../../Conexion.php';
     
          
           $query = "INSERT INTO `configuraciones` (`ID_Diplomado`, `ID_Formacion`, `FechaInicio`, `FechaFin`, `CantidadModulos`, `CupoMinimo`, `EnCurso`, `ID_ProfesorInicial`, `ID_GerenteResponsable`, `ID_Tipo`, `ID_UsuarioResponsable`, `FechaActualizacion`, `Activo`, `Eliminado`) VALUES (NULL, '$idformacion', '$fechainicio', '$fechafin', '$cantidad', '$minimo', b'0', '$profesor', '$gerente', '$tipo', '$responsable', 'NOW()', b'1', b'0')";
               
           $resultados = $conexion->query($query); 
            
           $queryID = "SELECT @@identity AS id";

           $resultadosID = $conexion->query($queryID);

           $registrosID = $resultadosID->fetch_array();

           $id = $registrosID['id'];
           
           if ($id == 0)
           {
               echo 'NO'; 
           }else{
               
             $query2 = "INSERT INTO `inscripciones`(`ID_Configuracion`, `fechainicio`, `fechafin`) VALUES ('$id','$inscripcionfechaini','$inscripcionfechafin')";
             $resultados2 = $conexion->query($query2);
           
             foreach ($ListaDias as &$valor ) {
                    
                    $queryInsert = "INSERT INTO `participacion`(`ID_DiasSemana`, `ID_Configuracion`) VALUES ('$valor','$id')";
              
                    $resultadosInsert = $conexion->query($queryInsert);
             }
             
             echo 'SI';
           }

            
	}