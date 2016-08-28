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
    case "GuardarInteresados":
        $fecharegistro = addslashes(htmlspecialchars($_POST["fecharegistro"]));
        $idresponsable = addslashes(htmlspecialchars($_POST["idresponsable"]));
        $nombres = addslashes(htmlspecialchars($_POST["nombres"]));
        $apellidos = addslashes(htmlspecialchars($_POST["apellidos"]));
        $DNI = addslashes(htmlspecialchars($_POST["DNI"]));
        $edad = addslashes(htmlspecialchars($_POST["edad"]));
        $ocupacion = addslashes(htmlspecialchars($_POST["ocupacion"]));
        $distrito = addslashes(htmlspecialchars($_POST["distrito"]));
        $nacimiento = addslashes(htmlspecialchars($_POST["nacimiento"]));
        $direccion = addslashes(htmlspecialchars($_POST["direccion"]));
        $numerocasa = addslashes(htmlspecialchars($_POST["numerocasa"]));
        $celular = addslashes(htmlspecialchars($_POST["celular"]));
        $skype = addslashes(htmlspecialchars($_POST["skype"]));
        $correo = addslashes(htmlspecialchars($_POST["correo"]));
        $observacion = addslashes(htmlspecialchars($_POST["observacion"]));
        $Formaciones = $_POST["Formaciones"];
        $Diplomados = $_POST["Diplomados"];
        
        
        GuardarInteresados($fecharegistro,$idresponsable,$nombres,$apellidos,$DNI,$edad,$ocupacion,$distrito,$nacimiento,$direccion,$numerocasa,$celular,$skype,$correo,$observacion,$Formaciones,$Diplomados);
     break;
     
    case "BuscarInteresado":
        $DNI = addslashes(htmlspecialchars($_POST["DNI"]));
        
        BuscarInteresado($DNI);
    break;
    case "BuscarInteresadoDiplomado":
        $DNI = addslashes(htmlspecialchars($_POST["DNI"]));
        
        BuscarInteresadoDiplomado($DNI);
    break;
    case "GuardarInscripcionDiplomados":

        $nombres = addslashes(htmlspecialchars($_POST["nombres"]));
        $apellidos = addslashes(htmlspecialchars($_POST["apellidos"]));
        $DNI = addslashes(htmlspecialchars($_POST["DNI"]));
        $nacimiento = addslashes(htmlspecialchars($_POST["nacimiento"]));
        $direccion = addslashes(htmlspecialchars($_POST["direccion"]));
        $numerocasa = addslashes(htmlspecialchars($_POST["numerocasa"]));
        $celular = addslashes(htmlspecialchars($_POST["celular"]));
        $skype = addslashes(htmlspecialchars($_POST["skype"]));
        $correo = addslashes(htmlspecialchars($_POST["correo"]));
        $Configuracion = $_POST["Configuracion"];
        $tipopago = addslashes(htmlspecialchars($_POST["tipopago"]));
        $cuotas = addslashes(htmlspecialchars($_POST["cuotas"]));
        $Vencimiento = addslashes(htmlspecialchars($_POST["Vencimiento"]));
        $InicioPago = addslashes(htmlspecialchars($_POST["InicioPago"]));
        $idmetodopago = addslashes(htmlspecialchars($_POST["idmetodopago"]));
        $Frecuencia = addslashes(htmlspecialchars($_POST["Frecuencia"]));
       
        GuardarInscripcion($nombres,$apellidos,$DNI,$nacimiento,$direccion,$idmetodopago,$numerocasa,$celular,$skype,$correo,$Configuracion,$tipopago,$cuotas,$Vencimiento,$InicioPago,$Frecuencia);
    break;
    case "BuscarInteresadoFormacion":
        $DNI = addslashes(htmlspecialchars($_POST["DNI"]));
        
        BuscarInteresadoFormacion($DNI);
    break;
    case "SolicitarAutorizacion":
        $idresp = addslashes(htmlspecialchars($_POST["idusuarios"]));
        $idconfiguracion = addslashes(htmlspecialchars($_POST["idconfiguracion"]));
        $inscritos = addslashes(htmlspecialchars($_POST["inscritos"]));
        $minimo = addslashes(htmlspecialchars($_POST["minimo"]));
         $Observacion = addslashes(htmlspecialchars($_POST["Observacion"]));
        
        
        SolicitarAutorizacion($idresp,$idconfiguracion,$inscritos,$minimo,$Observacion);

        break;
    case "EliminarConfiguracion":
        $idconfiguracion = addslashes(htmlspecialchars($_POST["IDConfiguracion"]));
        $responsable = addslashes(htmlspecialchars($_POST["responsable"]));
        
        EliminarConfiguracion($idconfiguracion,$responsable);
    break;
    }
    
}



     function GuardarInteresados($fecharegistro,$idresponsable,$nombres,$apellidos,$DNI,$edad,$ocupacion,$distrito,$nacimiento,$direccion,$numerocasa,$celular,$skype,$correo,$observacion,$Formaciones,$Diplomados)
    {
        include_once '../Conexion.php';
       
          $query3 = "SELECT * FROM `temp_interesados` TU WHERE TU.DNI = $DNI";
        $resultados3 = $conexion->query($query3);
        $registrosP3 = $resultados3->fetch_array();
       
        if ($registrosP3 == 0)
        {
                $query = "INSERT INTO `temp_interesados`(`Nombres`, `Apellidos`, `Profesion`, `TelefonoCasa`, `TelefonoCelular`, `Email`, `Observacion`, `UsuarioSkype`, `FechaNacimiento`, `Distrito`, `DNI`, `ID_Responsable`, `FechaCreacion`, `Activo`, `Eliminado`, `direccion`, `edad`) VALUES ('$nombres','$apellidos','$ocupacion','$numerocasa','$celular','$correo','$observacion','$skype','$nacimiento','$distrito','$DNI', '$idresponsable',NOW(),1,0,'$direccion','$edad')";
                $resultados = $conexion->query($query);

                $queryP = "SELECT @@identity AS id";

                $resultadosP = $conexion->query($queryP);

                $registrosP = $resultadosP->fetch_array();

                $id = $registrosP['id'];

                 foreach ($Formaciones as &$valor ) {

                      $queryInsert = "INSERT INTO `temp_interesadosdf`(`idTemp_Interesados`, `iddiplomados`, `idformaciones`) VALUES ($id,NULL,$valor)";

                      $resultadosInsert = $conexion->query($queryInsert);
                }

                foreach ($Diplomados as &$valor1 ) {

                      $queryInsert = "INSERT INTO `temp_interesadosdf`(`idTemp_Interesados`, `iddiplomados`, `idformaciones`) VALUES ($id,$valor1,NULL)";

                      $resultadosInsert = $conexion->query($queryInsert);
                }

                echo 'Se registrado exitoxamente su interes por nuestos Diplomados/Formaciones'; 
        }else{
            
                $idtmp = $registrosP3['idTemp_Interesados'];
                
                $queryeliminar = "DELETE FROM `temp_interesadosdf` WHERE `idTemp_Interesados` = $idtmp";
                $resul = $conexion->query($queryeliminar);
                
                $queryeliminartemp = "DELETE FROM `temp_interesados` WHERE `idTemp_Interesados` = $idtmp";
                $resulta = $conexion->query($queryeliminartemp);
            
                $query = "INSERT INTO `temp_interesados`(`Nombres`, `Apellidos`, `Profesion`, `TelefonoCasa`, `TelefonoCelular`, `Email`, `Observacion`, `UsuarioSkype`, `FechaNacimiento`, `Distrito`, `DNI`, `ID_Responsable`, `FechaCreacion`, `Activo`, `Eliminado`, `direccion`, `edad`) VALUES ('$nombres','$apellidos','$ocupacion','$numerocasa','$celular','$correo','$observacion','$skype','$nacimiento','$distrito','$DNI', '$idresponsable',NOW(),1,0,'$direccion','$edad')";
                $resultados = $conexion->query($query);

                $queryP = "SELECT @@identity AS id";

                $resultadosP = $conexion->query($queryP);

                $registrosP = $resultadosP->fetch_array();

                $id = $registrosP['id'];

                 foreach ($Formaciones as &$valor ) {

                      $queryInsert = "INSERT INTO `temp_interesadosdf`(`idTemp_Interesados`, `iddiplomados`, `idformaciones`) VALUES ($id,NULL,$valor)";

                      $resultadosInsert = $conexion->query($queryInsert);
                }

                foreach ($Diplomados as &$valor1 ) {

                      $queryInsert = "INSERT INTO `temp_interesadosdf`(`idTemp_Interesados`, `iddiplomados`, `idformaciones`) VALUES ($id,$valor1,NULL)";

                      $resultadosInsert = $conexion->query($queryInsert);
                }

                echo 'Se registrado exitoxamente su interes por nuestos Diplomados/Formaciones'; 
        }
    }
    
    function BuscarInteresado($DNI){
        
        include_once '../Conexion.php';
        $query = "SELECT * FROM `temp_interesados` TU WHERE TU.DNI = $DNI";
        $resultados = $conexion->query($query);
        $registrosP = $resultados->fetch_array();
       
        if ($registrosP == 0)
        {
            $queryyy = "SELECT `idalumnos`, `Nombres`, `Apellidos`, `DNI`, `Direccion`, `Telefono`, `TelefonoSecundario`, `Correo`, `UsuarioSkype`, `FechaNacimiento`, `Activo`, `Eliminado` FROM `alumnos` WHERE `DNI` = $DNI";
            $resultadosyy = $conexion->query($queryyy);
            $registrosPyy = $resultadosyy->fetch_array();
            
            if ($registrosPyy == 0){
                
                 echo 'SI';
            }else{
                
                
                echo 'NO'.",".$registrosPyy['Nombres'].",".$registrosPyy['Apellidos'].",".$registrosPyy['DNI'].",".$registrosPyy['Direccion'].",".$registrosPyy['Telefono'].",".$registrosPyy['TelefonoSecundario'].",".$registrosPyy['Correo'].",".$registrosPyy['UsuarioSkype'].",".$registrosPyy['FechaNacimiento'] ;
                   
            }
           
        }else{
            
         $idresponsable = $registrosP['ID_Responsable'];   
         
         $query2 = "SELECT * FROM `usuarios` WHERE `idusuarios` =  $idresponsable";
         $resultados2 = $conexion->query($query2);
        $registrosP2 = $resultados2->fetch_array();
        
        $responsable = $registrosP2['usuario'];
                
            echo $registrosP['Nombres'].",".$registrosP['Apellidos'].",".$registrosP['Profesion'].",".$registrosP['TelefonoCasa'].",".$registrosP['TelefonoCelular'].",".$registrosP['Email'].",".$registrosP['Observacion'].",".$registrosP['UsuarioSkype'].",".$registrosP['FechaNacimiento'].",".$registrosP['Distrito'].",".$registrosP['DNI'].",".$registrosP['ID_Responsable'].",".$registrosP['direccion'].",".$registrosP['edad'].",".$registrosP['FechaCreacion'].",".$responsable ;
      
        }
                       
    }
    
    
       function BuscarInteresadoDiplomado($DNI){
        
        include_once '../Conexion.php';
        $query = "SELECT * FROM `temp_interesados` TU WHERE TU.DNI = $DNI";
        $resultados = $conexion->query($query);
        $registrosP = $resultados->fetch_array();
       
        if ($registrosP == 0)
        {
            $queryyy = "SELECT `idalumnos`, `Nombres`, `Apellidos`, `DNI`, `Direccion`, `Telefono`, `TelefonoSecundario`, `Correo`, `UsuarioSkype`, `FechaNacimiento`, `Activo`, `Eliminado` FROM `alumnos` WHERE `DNI` = $DNI";
            $resultadosyy = $conexion->query($queryyy);
            $registrosPyy = $resultadosyy->fetch_array();
            
            if ($registrosPyy == 0){
                
                 echo 'SI';
            }else{
                
                
                echo 'NO'.",".$registrosPyy['Nombres'].",".$registrosPyy['Apellidos'].",".$registrosPyy['DNI'].",".$registrosPyy['Direccion'].",".$registrosPyy['Telefono'].",".$registrosPyy['TelefonoSecundario'].",".$registrosPyy['Correo'].",".$registrosPyy['UsuarioSkype'].",".$registrosPyy['FechaNacimiento'] ;
                   
            }
        }else{
            
         $idresponsable = $registrosP['ID_Responsable'];   
         $idTemp_Interesados = $registrosP['idTemp_Interesados'];
         
         $query2 = "SELECT * FROM `usuarios` WHERE `idusuarios` =  $idresponsable";
         $resultados2 = $conexion->query($query2);
        $registrosP2 = $resultados2->fetch_array();
        
        $responsable = $registrosP2['usuario'];
        
        
        $queryinte = "SELECT td.`idtemp_interesadosDF`, td.`idTemp_Interesados`, td.`iddiplomados`, d.`nombre` FROM `temp_interesadosdf` td INNER JOIN diplomados d on td.`iddiplomados` = d.`iddiplomados` WHERE `idTemp_Interesados` = $idTemp_Interesados AND td.`iddiplomados` is not null";
        $resultadosInt = $conexion->query($queryinte);
        //$registrosInt = $resultadosInt->fetch_array();
        
        while ($registrosInt = $resultadosInt->fetch_array()) {
            $diplomados .= $registrosInt['nombre'];
            $diplomados .= "-";
            $Contador = $Contador + 1;
       }
       $diplomados = trim($diplomados, '-');
                               
                
            echo $registrosP['Nombres'].",".$registrosP['Apellidos'].",".$registrosP['Profesion'].",".$registrosP['TelefonoCasa'].",".$registrosP['TelefonoCelular'].",".$registrosP['Email'].",".$registrosP['Observacion'].",".$registrosP['UsuarioSkype'].",".$registrosP['FechaNacimiento'].",".$registrosP['Distrito'].",".$registrosP['DNI'].",".$registrosP['ID_Responsable'].",".$registrosP['direccion'].",".$registrosP['edad'].",".$registrosP['FechaCreacion'].",".$responsable.",".$diplomados ;
      
        }
                       
    }
    
     function GuardarInscripcion($nombres,$apellidos,$DNI,$nacimiento,$direccion,$idmetodopago,$numerocasa,$celular,$skype,$correo,$Configuracion,$tipopago,$cuotas,$Vencimiento,$InicioPago,$Frecuencia)
     {
         include_once '../Conexion.php';
         
         $queryyy = "SELECT `idalumnos`, `Nombres`, `Apellidos`, `DNI`, `Direccion`, `Telefono`, `TelefonoSecundario`, `Correo`, `UsuarioSkype`, `FechaNacimiento`, `Activo`, `Eliminado` FROM `alumnos` WHERE `DNI` = $DNI";
         $resultadosyy = $conexion->query($queryyy);
         $registrosPyy = $resultadosyy->fetch_array();         
         
         foreach ($Configuracion as &$valor ) {

                 $idconfiguracion = $valor;
             }   
         
         if ($registrosPyy == 0){
             $insertquery = "INSERT INTO `alumnos`(`Nombres`, `Apellidos`, `DNI`, `Direccion`, `Telefono`, `TelefonoSecundario`, `Correo`, `UsuarioSkype`, `FechaNacimiento`, `Activo`, `Eliminado`) VALUES ('$nombres','$apellidos','$DNI','$direccion','$numerocasa','$celular','$correo','$skype','$nacimiento',1,0)";
             $resultados = $conexion->query($insertquery);

             $queryP = "SELECT @@identity AS id";

                $resultadosP = $conexion->query($queryP);

                $registrosP = $resultadosP->fetch_array();

                $id = $registrosP['id'];
             
            
                
            $querypago = "INSERT INTO `pagos`(`ID_TipoPago`, `ID_Configuracion`, `ID_Alumno`, `ID_MetododePagos`,`ID_Frecuencia`) VALUES ($tipopago,$idconfiguracion,$id,$idmetodopago,$Frecuencia)"; 
            $resultadosPago = $conexion->query($querypago);  
            
            $queryPa = "SELECT @@identity AS id";

                $resultadosPa = $conexion->query($queryPa);

                $registrosPa = $resultadosPa->fetch_array();

                $idpagos = $registrosPa['id'];
                
            if ($tipopago != "1")
            {
                
                $selectF = "SELECT `Valor` FROM `frecuencia` WHERE `idFrecuencia` = $Frecuencia";
                $result = $conexion->query($selectF);
                $valorfrecuencia = $result->fetch_array();
                
                $valorFrecuenciaPago = $valorfrecuencia['Valor'];
                $FechaInicio = $InicioPago;
                for ($i = 1; $i <= $cuotas; $i++){
                    
                    $descripcion = "Cuota ".$i;
                    $querycuotas = "INSERT INTO `pagoscuotas`(`ID_Pagos`, `CantidadCuotas`, `FechaVencimiento`, `FechaInicio`, `Pago`, `Traslado`, `Decripcion`) VALUES ($idpagos,$cuotas,'$Vencimiento','$FechaInicio',0,0,'$descripcion')";
                    $resultadosPagocouta = $conexion->query($querycuotas);                     
                       
                    $nuevafecha = strtotime ( $valorFrecuenciaPago , strtotime ( $FechaInicio ) ) ;
                    $FechaInicio = date ( 'Y-m-j' , $nuevafecha );
                 }
               
                 $descripcion2 = "Traslado";
                 $querytrasla = "INSERT INTO `pagoscuotas`(`ID_Pagos`, `CantidadCuotas`, `FechaVencimiento`, `FechaInicio`, `Pago`, `Traslado`, `Decripcion`) VALUES ($idpagos,$cuotas,'$Vencimiento','$InicioPago',0,1,'$descripcion2')";
                 $resultadosPagocoutaTras = $conexion->query($querytrasla);                     
                
               echo 'Se ha inscrito al alumno con exito';
            }else{
                echo 'Se ha inscrito al alumno con exito';
            }
            
         }else{
              $id = $registrosPyy['idalumnos'];
             $queryConfigu = "SELECT `idPagos`, `ID_TipoPago`, `ID_Configuracion`, `ID_Alumno`, `ID_MetododePagos` FROM `pagos` WHERE `ID_Configuracion` = $idconfiguracion AND `ID_Alumno` = $id" ;
             $resultadosConfigu = $conexion->query($queryConfigu);
             $registrosConfigu = $resultadosConfigu->fetch_array(); 
             
             if ($registrosConfigu == 0){
               
                $querypago = "INSERT INTO `pagos`(`ID_TipoPago`, `ID_Configuracion`, `ID_Alumno`, `ID_MetododePagos`,`ID_Frecuencia`) VALUES ($tipopago,$idconfiguracion,$id,$idmetodopago,$Frecuencia)"; 
                $resultadosPago = $conexion->query($querypago);  
            
                $queryPa = "SELECT @@identity AS id";

                $resultadosPa = $conexion->query($queryPa);

                $registrosPa = $resultadosPa->fetch_array();

                $idpagos = $registrosPa['id'];
                
                if ($tipopago != "1")
                {
                    $selectF = "SELECT `Valor` FROM `frecuencia` WHERE `idFrecuencia` = $Frecuencia";
                    $result = $conexion->query($selectF);
                    $valorfrecuencia = $result->fetch_array();

                    $valorFrecuenciaPago = $valorfrecuencia['Valor'];
                    $FechaInicio = $InicioPago;
                    for ($i = 1; $i <= $cuotas; $i++){

                        $descripcion = "Cuota ".$i;
                        $querycuotas = "INSERT INTO `pagoscuotas`(`ID_Pagos`, `CantidadCuotas`, `FechaVencimiento`, `FechaInicio`, `Pago`, `Traslado`, `Decripcion`) VALUES ($idpagos,$cuotas,'$Vencimiento','$FechaInicio',0,0,'$descripcion')";
                        $resultadosPagocouta = $conexion->query($querycuotas);                     

                        $nuevafecha = strtotime ( $valorFrecuenciaPago , strtotime ( $FechaInicio ) ) ;
                        $FechaInicio = date ( 'Y-m-j' , $nuevafecha );
                     }

                     $descripcion2 = "Traslado";
                     $querytrasla = "INSERT INTO `pagoscuotas`(`ID_Pagos`, `CantidadCuotas`, `FechaVencimiento`, `FechaInicio`, `Pago`, `Traslado`, `Decripcion`) VALUES ($idpagos,$cuotas,'$Vencimiento','$InicioPago',0,1,'$descripcion2')";
                     $resultadosPagocoutaTras = $conexion->query($querytrasla);                     

                   echo 'Se ha inscrito al alumno con exito';
                }else{
                    echo 'Se ha inscrito al alumno con exito';
                } 
                 
             }else{
                 echo 'El Alumno '.$nombres.' DNI: '.$DNI.' ya se encuentra inscrito en el diplomado/formacion seleccionado';
             }
             
         }
     }
     
     
     function BuscarInteresadoFormacion($DNI){
        
        include_once '../Conexion.php';
        
         $queryyy = "SELECT `idalumnos`, `Nombres`, `Apellidos`, `DNI`, `Direccion`, `Telefono`, `TelefonoSecundario`, `Correo`, `UsuarioSkype`, `FechaNacimiento`, `Activo`, `Eliminado` FROM `alumnos` WHERE `DNI` = $DNI";
         $resultadosyy = $conexion->query($queryyy);
         $registrosPyy = $resultadosyy->fetch_array();
         
          if ($registrosPyy == 0)
        {
                $queryIF = "SELECT * FROM `temp_interesados` TU WHERE TU.DNI = $DNI";
                $resultadosIF = $conexion->query($queryIF);
                $registrosIF = $resultadosIF->fetch_array();
                
                if ($registrosIF == 0)
                {
                    echo 'SI';
                }  else {
                
                    $idresponsable = $registrosIF['ID_Responsable'];   
                    $idTemp_Interesados = $registrosIF['idTemp_Interesados'];
         
                     $query2 = "SELECT * FROM `usuarios` WHERE `idusuarios` =  $idresponsable";
                     $resultados2 = $conexion->query($query2);
                     $registrosP2 = $resultados2->fetch_array();
        
                    $responsable = $registrosP2['usuario'];
        
        
                    $queryinte = "SELECT td.`idtemp_interesadosDF`, td.`idTemp_Interesados`, td.`idformaciones`, d.`nombre` FROM `temp_interesadosdf` td INNER JOIN formacion d on td.`idformaciones` = d.`idformaciones` WHERE `idTemp_Interesados` = $idTemp_Interesados AND td.`idformaciones` is not null";
                    $resultadosInt = $conexion->query($queryinte);
        
                    while ($registrosInt = $resultadosInt->fetch_array()) {
                        $formacion .= $registrosInt['nombre'];
                        $formacion .= "-";
                        $Contador = $Contador + 1;
                   }
                        $formacion = trim($formacion, '-');
                               
                
                    echo $registrosIF['Nombres'].",".$registrosIF['Apellidos'].",".$registrosIF['Profesion'].",".$registrosIF['TelefonoCasa'].",".$registrosIF['TelefonoCelular'].",".$registrosIF['Email'].",".$registrosIF['Observacion'].",".$registrosIF['UsuarioSkype'].",".$registrosIF['FechaNacimiento'].",".$registrosIF['Distrito'].",".$registrosIF['DNI'].",".$registrosIF['ID_Responsable'].",".$registrosIF['direccion'].",".$registrosIF['edad'].",".$registrosIF['FechaCreacion'].",".$responsable.",".$formacion ;
                }
              
              
        }  else {
            $idalumno = $registrosPyy['idalumnos'];
            $query = "SELECT COUNT(P.`idPagos`) as Canti_Diplomados FROM `pagos`  P INNER JOIN `configuraciones` C on P.`ID_Configuracion` = C.IDConfiguracion INNER JOIN `alumnos` A on P.`ID_Alumno`= A.`idalumnos` where A.`idalumnos`= '$idalumno' AND C.`ID_Formacion`is null";
            $resultadosform = $conexion->query($query);
            $registrosForm = $resultadosform->fetch_array();
            
            if ($registrosForm['Canti_Diplomados'] > 0)
            {
                echo 'NO'.",".$registrosPyy['Nombres'].",".$registrosPyy['Apellidos'].",".$registrosPyy['DNI'].",".$registrosPyy['Direccion'].",".$registrosPyy['Telefono'].",".$registrosPyy['TelefonoSecundario'].",".$registrosPyy['Correo'].",".$registrosPyy['UsuarioSkype'].",".$registrosPyy['FechaNacimiento'] ;
            }else{
                echo 'SI';
            }
            
        }
                       
    }
    
    function SolicitarAutorizacion($idresp,$idconfiguracion,$inscritos,$minimo,$Observacion)
    {
        include_once '../Conexion.php';
        
        $query = "SELECT `idAutorizacionesGerente`, `ID_Configuracion`, `ID_Usuario`, `Aprobado`, `Rechazado`, `Solicitud`, `Observacion`, `FechaAprobacion` FROM `autorizacionesgerente` WHERE `ID_Configuracion` = $idconfiguracion";
        $resultados = $conexion->query($query);
        $registros = $resultados->fetch_array();
        
        if ($registros == 0)
        {
             $queryyy = "INSERT INTO `autorizacionesgerente`(`ID_Configuracion`, `ID_Usuario`, `Aprobado`, `Rechazado`, `Solicitud`, `Observacion`, `FechaAprobacion`) VALUES ($idconfiguracion,$idresp,NULL,NULL,1,'$Observacion',NULL)";
            $resultadosyy = $conexion->query($queryyy);
         
            echo 'Se ha realizado la solicitud con exito';
        }  else {
            echo 'Ya se realizo esta solicitud por favor espere la respuesta del Gerente General';
        }
        
    }
    
    function EliminarConfiguracion($idconfiguracion,$responsable)
    {
        include_once '../Conexion.php';
        
        $query = "UPDATE `configuraciones` SET `Activo`= 0,`Eliminado`= 1, `ID_UsuarioResponsable` = $responsable, `FechaActualizacion` = NOW() WHERE `IDConfiguracion` = $idconfiguracion";
        $resultados = $conexion->query($query);
        
        echo 'Configuracion Eliminada con exito';
    }