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
        $iddiplomados = addslashes(htmlspecialchars($_POST["iddiplomados"]));
        
        ActivarDiplomado($iddiplomados);
     break;
         
    case "Desactivar":
        $iddiplomados = addslashes(htmlspecialchars($_POST["iddiplomados"]));
        
        DesactivarDiplomado($iddiplomados);
     break;
 
    case "CrearDiplomado":
        $nombre = addslashes(htmlspecialchars($_POST["Nombre"]));
        $Descripcion = addslashes(htmlspecialchars($_POST["Descripcion"]));
        
        CrearDiplomado($nombre,$Descripcion);
        
    break;
    case "DefinirPeriodo":

       $ID_Configuracion =  addslashes(htmlspecialchars($_POST["ID_Configuracion"]));
       $fecha_ini =  addslashes(htmlspecialchars($_POST["inicioinscrip"]));
       $fecha_fin =  addslashes(htmlspecialchars($_POST["fininscrip"]));
      
        PeriodoInscripcion($ID_Configuracion,$fecha_ini,$fecha_fin);

    break;

    case "ConfigurarDiplomado":

      $iddiplomado =  addslashes(htmlspecialchars($_POST["iddiplomado"]));
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
      
    CrearConfiguracionDiplomado($iddiplomado,$fechainicio,$fechafin,$cantidad,$minimo,$tipo,$inscripcionfechaini,$inscripcionfechafin,$gerente,$profesor,$responsable,$ListaDias);

    break;

    case "DiasParticipacion":
         $idconfiguracion =  $_POST["idconfiguracion"];
         $ListaDias =  $_POST["ListaDias"];
        
         DiasParticipacion($idconfiguracion,$ListaDias);
    break;
    case "DefinirProfesor":
         $idconfiguracion =  addslashes(htmlspecialchars($_POST["ID_Configuracion"]));
         $idprofesor =  addslashes(htmlspecialchars($_POST["profesor"]));
         $idgerente =  addslashes(htmlspecialchars($_POST["gerente"]));
         
        DefinirProfesor($idconfiguracion,$idprofesor,$idgerente);
    break;
    case "EditarConfiguracionDiplomado":
      $idconfiguracion =  addslashes(htmlspecialchars($_POST["idconfiguracion"]));
      $iddiplomado =  addslashes(htmlspecialchars($_POST["iddiplomado"]));
      $fechainicio =  addslashes(htmlspecialchars($_POST["fechaini"]));
      $fechafin =  addslashes(htmlspecialchars($_POST["fechafin"]));
      $cantidad =  addslashes(htmlspecialchars($_POST["Cantidad"]));
      $minimo =  addslashes(htmlspecialchars($_POST["minimo"]));
      $tipo =  addslashes(htmlspecialchars($_POST["tipo"]));   
      $responsable =  addslashes(htmlspecialchars($_POST["idresponsable"]));
      
      EditarConfiguracionDiplomado($idconfiguracion,$iddiplomado,$fechainicio,$fechafin,$cantidad,$minimo,$tipo,$responsable);
    break;
    case "Comenzar":
      $idconfiguracion =  addslashes(htmlspecialchars($_POST["idconfiguracion"]));
      $estado =  addslashes(htmlspecialchars($_POST["estatus"]));
      
      Comenzar($idconfiguracion,$estado);
    break;
    case "Finalizar":
      $idconfiguracion =  addslashes(htmlspecialchars($_POST["idconfiguracion"]));
      $estado =  addslashes(htmlspecialchars($_POST["estatus"]));        
        
        Finalizar($idconfiguracion,$estado);
    break;
    case "Participacion":
       $idconfiguracion =  addslashes(htmlspecialchars($_POST["idconfiguracion"]));
       $ListaDias =  $_POST["ListaDias"];
        
        Participacion($idconfiguracion,$ListaDias);
    break;
    }
    
}



     function ActivarDiplomado($iddiplomados)
    {
        include_once '../../Conexion.php';
       
         $query = "UPDATE diplomados SET Activo= 1 WHERE iddiplomados = $iddiplomados";

            $resultados = $conexion->query($query);
        
            echo "Actualizacion Con Exito";
    }
    
      function DesactivarDiplomado($iddiplomados)
    {
        include_once '../../Conexion.php';
        
           $query = "UPDATE diplomados SET  Activo= 0 WHERE iddiplomados = $iddiplomados";

           $resultados = $conexion->query($query);
        
        echo "Actualizacion Con Exito"; 
    }
                
   function CrearDiplomado($nombre,$Descripcion)
   {
      include_once '../../Conexion.php';
        
           $query = "INSERT INTO `diplomados`(`Nombre`, `Descripcion`, `Activo`, `Eliminado`) VALUES ('$nombre','$Descripcion',1,0)";

           $resultados = $conexion->query($query);
        
        echo "Creacion de Diplomado fue exitosa";   
   }
        
   //---------INSCRIPCIONES--------
      function PeriodoInscripcion($ID_Configuracion,$fecha_ini,$fecha_fin)
    {
        include_once '../../Conexion.php';
        
           $query = "SELECT count(ID_Configuracion) as cantidad FROM `inscripciones` where `ID_Configuracion` = '$ID_Configuracion'";
           $resultados4 = $conexion->query($query);
            $registros = $resultados4->fetch_array();

            if($registros['cantidad']>=1)
            {
                $query2 = "UPDATE `inscripciones` set `fechainicio`= '$fecha_ini',`fechafin`= '$fecha_fin' where `ID_Configuracion` = '$ID_Configuracion'";
                $resultados2 = $conexion->query($query2);
                
                echo "La Modificacion se ha guardado exitosamente";
            }  else {
                $query2 = "INSERT INTO `inscripciones`(`ID_Configuracion`, `fechainicio`, `fechafin`) VALUES ('$ID_Configuracion','$fecha_ini','$fecha_fin')";
                $resultados2 = $conexion->query($query2);
                
                echo "Se ha registrado la configuracion del Periodo de inscripcion";
            }

          
    }

    //------------------Configuracion Creacion de Diplomados----------------------------//
    
        function CrearConfiguracionDiplomado($iddiplomado,$fechainicio,$fechafin,$cantidad,$minimo,$tipo,$inscripcionfechaini,$inscripcionfechafin,$gerente,$profesor,$responsable,$ListaDias)
	{
           include_once '../../Conexion.php';
     
          
           $query = "INSERT INTO `configuraciones` (`ID_Diplomado`, `ID_Formacion`, `FechaInicio`, `FechaFin`, `CantidadModulos`, `CupoMinimo`, `EnCurso`, `ID_ProfesorInicial`, `ID_GerenteResponsable`, `ID_Tipo`, `ID_UsuarioResponsable`, `FechaActualizacion`, `Activo`, `Eliminado`) VALUES ('$iddiplomado', NULL, '$fechainicio', '$fechafin', '$cantidad', '$minimo', b'0', '$profesor', '$gerente', '$tipo', '$responsable', 'NOW()', b'1', b'0')";
               
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
                
        function DefinirProfesor($idconfiguracion,$idprofesor,$idgerente)
        {
           include_once '../../Conexion.php';
        
           $query = "SELECT `IDConfiguracion`, `ID_Diplomado`, `ID_Formacion`, `FechaInicio`, `FechaFin`, `CantidadModulos`, `CupoMinimo`, `EnCurso`, `ID_ProfesorInicial`, `ID_GerenteResponsable`, `ID_Tipo`, `ID_UsuarioResponsable`, `FechaActualizacion`, `Activo`, `Eliminado` FROM `configuraciones` WHERE `IDConfiguracion` = '$idconfiguracion'";
           $resultados4 = $conexion->query($query);
            $registros = $resultados4->fetch_array();


                $query2 = "UPDATE `configuraciones` SET `ID_ProfesorInicial`=$idprofesor,`ID_GerenteResponsable`=$idgerente, `FechaActualizacion` = NOW()  WHERE `IDConfiguracion` = '$idconfiguracion'";
                $resultados2 = $conexion->query($query2);
                
                echo "La Modificacion se ha guardado exitosamente";
 
        }
        
        //------------------------------------EDITAR CCONFGURACION DIPLOMADO----------------------------------------------------
        function EditarConfiguracionDiplomado($idconfiguracion,$iddiplomado,$fechainicio,$fechafin,$cantidad,$minimo,$tipo,$responsable)
        {

            include_once '../../Conexion.php';
        
                $query2 = "UPDATE `configuraciones` SET `ID_Diplomado`=$iddiplomado,`FechaInicio`='$fechainicio',`FechaFin`='$fechafin',`CantidadModulos`=$cantidad,`CupoMinimo`=$minimo,`ID_Tipo`=$tipo,`ID_UsuarioResponsable`=$responsable,`FechaActualizacion`=NOW() WHERE `IDConfiguracion` = '$idconfiguracion'";
              
                 $resultados2 = $conexion->query($query2);
                
                echo "La Modificacion se ha guardado exitosamente";
        }

        
        //--------------------------------INCIAR/DETENER Configuracion---------------------------------------------
        function Comenzar($idconfiguracion,$estado){
            
             include_once '../../Conexion.php';
             
            $query = "SELECT `IDConfiguracion`, `FechaInicio`, `FechaFin` FROM `configuraciones` WHERE `IDConfiguracion` = '$idconfiguracion'";
            $resultados4 = $conexion->query($query);
            $registros = $resultados4->fetch_array();
             
                   $query2 = "UPDATE `configuraciones` SET `EnCurso`= 1 WHERE `IDConfiguracion` = '$idconfiguracion'";
              
                   $resultados2 = $conexion->query($query2);
                   
                   echo "Se ha dado inicio al Diplomado/Formacion Seleccionado";
        }
        
        
        function Finalizar($idconfiguracion,$estado){
            
             include_once '../../Conexion.php';
             
            $query = "SELECT `IDConfiguracion`, `FechaInicio`, `FechaFin` FROM `configuraciones` WHERE `IDConfiguracion` = '$idconfiguracion'";
            $resultados4 = $conexion->query($query);
            $registros = $resultados4->fetch_array();
             
//            if (getdate() >= $registros['FechaInicio'] && getdate() <=  $registros['FechaFin'])
//            {
                   $query2 = "UPDATE `configuraciones` SET `EnCurso`= 0 WHERE `IDConfiguracion` = '$idconfiguracion'";
              
                   $resultados2 = $conexion->query($query2);
                   
             echo "Se ha dado por finalizado el Diplomado/Formacion Seleccionado";
        //}
        }
        
        //-----------------------EDITAR PARTICIPACION------------------------
        
        function Participacion($idconfiguracion,$ListaDias)
        {
            include_once '../../Conexion.php';
            
            $query = "DELETE FROM `participacion` WHERE `ID_Configuracion` =  $idconfiguracion";
            $resultados4 = $conexion->query($query);
            
            
            
             foreach ($ListaDias as &$valor ) {
                    
                    $queryinsertar = "INSERT INTO `participacion`(`ID_DiasSemana`, `ID_Configuracion`) VALUES ('$valor','$idconfiguracion')";
              
                    $resultadosInsert = $conexion->query($queryinsertar);
             }
            
            
            echo "La modificacion fue realizada con exito";
        }