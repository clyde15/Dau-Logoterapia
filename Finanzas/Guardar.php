<?php
 

	/**
	 * Class1 short summary.
	 *
	 * Class1 description.
	 *
	 * @version 1.0
	 * @author gtorres
	 */
session_start();
   $metodo =  addslashes(htmlspecialchars($_POST["MetodoE"]));

   ValidarF($metodo);
   
     function ValidarF($metodo)
{
   switch ($metodo)
   {

    case "RegistrarPago":

      $BancoG = addslashes(htmlspecialchars($_POST["Banco"]));
      $ReciboG = addslashes(htmlspecialchars($_POST["Recibo"]));
       $FechaPagoG = addslashes(htmlspecialchars($_POST["FechaPago"]));
       $MontoG =  $_POST["Monto"];
       $CuotaG =  $_POST["Cuota"];
       $idpagosfG =  $_POST["idpagosf"];
        $UserG =  $_SESSION['User'];
 
 if (empty($_POST["Traslado"]))
        {
            $estadoTraslado = false;
        }else
         {
         	    $estadoTraslado = true;
         }

    RegistrarPago($BancoG,$ReciboG,$FechaPagoG,$MontoG,$idpagosfG,$UserG,$estadoTraslado,$CuotaG);

    break;

    case "CargarBaja":

     $idAlumnoDeBaja = addslashes(htmlspecialchars($_POST["idAlumnoDeBaja"]));
        
        CargarBaja($idAlumnoDeBaja);

    break;

    case "AceptarTraslado":

      $idAlumnosTraslado = addslashes(htmlspecialchars($_POST["idAlumnosTraslado"]));
          $FechaCompromisoPago = addslashes(htmlspecialchars($_POST["FechaCompromisoPago"]));
         

      AceptarTraslado($idAlumnosTraslado,$FechaCompromisoPago);

    break;

    case "AprobarSolicitud":
        
        $idsolicitudes = addslashes(htmlspecialchars($_POST["idsolicitudes"]));
        
        AprobarSolicitud($idsolicitudes);
        
    break;

    case "RegistrarEntregaDineroNombre":
        
         $idsolicitudes = addslashes(htmlspecialchars($_POST["idsolicitudes"]));
        $NombreEntregoDinero = addslashes(htmlspecialchars($_POST["NombreEntregoDinero"]));
        $NombreRecibioDinero = addslashes(htmlspecialchars($_POST["NombreRecibioDinero"]));
        //
        RegistrarEntregaDineroNombre($idsolicitudes,$NombreEntregoDinero,$NombreRecibioDinero);
        
    break;
    
    case "RegistrarEvidencia":
    
          $idsolicitudes = addslashes(htmlspecialchars($_POST["idSolicitudes"]));
        $Descripcion = addslashes(htmlspecialchars($_POST["Descripcion"]));
        //$Archivo = addslashes(htmlspecialchars($_FILES["Archivo"]));
        
        //
        RegistrarEvidecia($idsolicitudes,$Descripcion);
        
        
    break;

    case "CargarLista":
        
       $id = addslashes(htmlspecialchars($_POST["id"]));
        $Tipo =  addslashes(htmlspecialchars($_POST["Tipo"]));
        
         CargarListaAlumnos($id,$Tipo);   
        
        break;
    
    case "CargaListaDiplomados":
             CargarListaDiplomados();     
    break;

    case "CargaListaFormaciones":
             CargaListaFormaciones();     
    break;

    }

    

}

function CargaListaFormaciones()
{
     include '../Conexion.php';
    
    $queryFormaciones = "select Nombre, c.IDConfiguracion  from formacion d
inner join configuraciones c on d.idformaciones = c.ID_Formacion
 where c.activo = 1 and c.Eliminado = 0";

    $resultadosFormaciones = $conexion->query($queryFormaciones);
                
    $response = array();
while($row = $resultadosFormaciones->fetch_assoc()) $response[] = $row;
        
    //$registrosAlumnos = $resultadosAlumnos->fetch_array();
    echo json_encode($response);
}

function CargarListaDiplomados()
{
     include '../Conexion.php';
    
    $query = "select Nombre, c.IDConfiguracion from diplomados d
inner join configuraciones c on d.iddiplomados = c.ID_Diplomado
 where c.activo = 1 and c.Eliminado = 0";

    $resultados = $conexion->query($query);
                
    $response = array();
while($row = $resultados->fetch_assoc()) $response[] = $row;
        
    //$registrosAlumnos = $resultadosAlumnos->fetch_array();
    echo json_encode($response);
}

function CargarListaAlumnos($id,$Tipo)
{
     include '../Conexion.php';
            
             $queryAlumnosDiplomados = "select a.idalumnos, a.Nombres from pagos p 
		inner join alumnos a on p.ID_Alumno = a.idalumnos
                where p.ID_Configuracion = '$id'";

    $resultadosAlumnos = $conexion->query($queryAlumnosDiplomados);
    
    $response = array();
while($row = $resultadosAlumnos->fetch_assoc()) $response[] = $row;
        
    //$registrosAlumnos = $resultadosAlumnos->fetch_array();
    echo json_encode($response);
}

function   RegistrarPago($BancoG,$ReciboG,$FechaPagoG,$MontoG,$idpagosfG,$UserG,$estadoTraslado,$CuotaG)
	{
        include '../Conexion.php';
            
        $MontoG = str_replace(",", "", $MontoG);
             
        $QueryUsuario = "select * from usuarios where usuario= '$UserG'";
        
        $resultadosUsuarios = $conexion->query($QueryUsuario);
        
        $registrosUsuarios = $resultadosUsuarios->fetch_array();
        $user = $registrosUsuarios['idusuarios'];
        $hoy = date("Y-m-d H:i:s"); 
        
            $queryRegistrarP = "INSERT INTO `registropagos`
                                (`ID_Pagos`,
                                `Monto`,
                                `FechaPago`,
                                `ID_Responsable`,
                                `FechaActualizacion`,
                                `NumeroRecibo`,
                                `NombreBanco`,
                                 `Traslado`,
                                 `ID_PagosCuota`)
                                VALUES
                                (
                                  '$idpagosfG',
                                '$MontoG',
                                '$FechaPagoG',
                                '$user',
                                 '$hoy',
                                '$ReciboG',
                                '$BancoG',
                                '$estadoTraslado','$CuotaG');";
    
              $conexion->query($queryRegistrarP);
              if ($estadoTraslado) {
                  $queryPagosCuota = "Update pagoscuotas set Pago=1 where ID_Pagos = '$idpagosfG' and Traslado = 1";
              }else{
                 $queryPagosCuota = "Update pagoscuotas set Pago=1 where idPagosCuotas='$CuotaG'"; 
              }
       
       $conexion->query($queryPagosCuota);

        echo "Pago Registrado Con Exito";

	}

function CargarBaja($idAlumnoDeBaja){
    include '../Conexion.php';
    $hoy = date("Y-m-d H:i:s"); 

            $queryRegistrarP = "UPDATE `alumnosdebaja`
                                SET
                                `FechaDeBaja` = '$hoy',
                                `Solicitado` = 0,
                                `DeBaja` = 1
                                WHERE `idAlumnosDeBaja` = '$idAlumnoDeBaja';";
    
              $conexion->query($queryRegistrarP);
    

        echo "Baja Exitosa";
    
}
 
function    AceptarTraslado($idAlumnosTraslado,$FechaCompromisoPago){
    include '../Conexion.php';
    $hoy = date("Y-m-d H:i:s"); 

            $queryRegistrarP = "UPDATE `alumnostraslado`
                            SET
                            `FechaTraslado` = '$hoy',
                            `Traslado` = 1,
                            `FechaCompromisoPago` = '$FechaCompromisoPago',
                            `DiasTraslado` = 1
                            WHERE `idAlumnosTraslado` = '$idAlumnosTraslado';";
    
              $conexion->query($queryRegistrarP);
    

        echo "Traslado Exitoso";
    
}
     
function   AprobarSolicitud($idsolicitudes)
{
    include '../Conexion.php';
    $hoy = date("Y-m-d H:i:s"); 

            $queryRegistrarP = "UPDATE `solicitudes`
                                SET
                                `FechaResolucion` = '$hoy',
                                `Procesado` = 1
                                WHERE `idSolicitudes` = '$idsolicitudes';";
    
              $conexion->query($queryRegistrarP);
    
        echo "Solicitud Procesada";
}
        

function RegistrarEntregaDineroNombre($idsolicitudes,$NombreEntregoDinero,$NombreRecibioDinero)
{
      include '../Conexion.php';
    $hoy = date("Y-m-d H:i:s"); 

            $queryRegistrarP = "UPDATE `solicitudes`
                                SET
                                `FechaEntrega` = '$hoy',
                                 `FechaRecepcion` = '$hoy',
                                `EntregaDinero` = 1,
                                RecepcionDinero = 1,
                                `NombreEntregoDinero` = '$NombreEntregoDinero',
                                `NombreRecibioDinero` = '$NombreRecibioDinero'
                                WHERE `idSolicitudes` = '$idsolicitudes';";
    
              $conexion->query($queryRegistrarP);
    
        echo "Datos Registrados";
    
    
    
}

function RegistrarEvidecia($idsolicitudes,$Descripcion) {
    
    if ( !isset($_FILES["Archivo"]) || $_FILES["Archivo"]["error"] > 0){
	echo "ha ocurrido un error";
} else {
     include '../Conexion.php';
    $permitidos = array("application/pdf");
	$limite_kb = 16384;

	if (in_array($_FILES['Archivo']['type'], $permitidos) && $_FILES['Archivo']['size'] <= $limite_kb * 1024){

		//este es el archivo temporal
		$Archivo_temporal  = $_FILES['Archivo']['tmp_name'];
		//este es el tipo de archivo
		$tipo = $_FILES['Archivo']['type'];
		//leer el archivo temporal en binario
                $fp     = fopen($Archivo_temporal, 'r+b');
                $data = fread($fp, filesize($Archivo_temporal));
                fclose($fp);

                //escapar los caracteres
                $data = mysql_real_escape_string($data);

		$Query = "INSERT INTO registro_evidencias (id_Solicitud, Descripcion, Archivo) VALUES ('$idsolicitudes', '$Descripcion', '$data')";

              $resultado = $conexion->query($Query);   
       
                   $queryRegistrarP = "UPDATE `solicitudes`
                                SET
                                `EvidenciaRegistrada` = 1
                                WHERE `idSolicitudes` = '$idsolicitudes';";
    
              $conexion->query($queryRegistrarP);
              
              
		if ($resultado){
			echo "el archivo ha sido copiado exitosamente";
		} else {
			echo "ocurrio un error al copiar el archivo.";
		}
	} else {
		echo "archivo no permitido, es tipo de archivo prohibido o excede el tamano de $limite_kb Kilobytes";
	}
    
}
    
    
}