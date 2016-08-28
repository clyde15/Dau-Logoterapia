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

    case "RetirarA":

      $IDA = addslashes(htmlspecialchars($_POST["IDA"]));
      $IDC = addslashes(htmlspecialchars($_POST["IDC"]));
      $Motivo = addslashes(htmlspecialchars($_POST["Motivo"]));
      
      RetirarAlumno($IDA,$IDC,$Motivo);
      break;
}
}


	function RetirarAlumno($IDA,$IDC,$Motivo)
	{
        include '../Conexion.php';
        
        
        $Query = "INSERT INTO `logoterapia`.`alumnosdebaja`(`ID_Alumno`,`ID_Configuracion`,`FechaDeBaja`,`FechaSolicitud`,`Motivo`,`Solicitado`,`DeBaja`) VALUES ($IDA,$IDC,null,NOW(),'$Motivo',1,0)";
        //echo $Query;
        $resultados = $conexion->query($Query);
        echo "Solicitud de Retiro Aceptada";
	}