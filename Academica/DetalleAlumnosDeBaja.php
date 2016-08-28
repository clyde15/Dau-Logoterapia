<html lang="es-ES" xml:lang="es-ES">
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
        <script src="../js/bootstrap.min.js" type="text/javascript"></script>
        <script src="../js/JsAcademica.js" type="text/javascript"></script>
       <link rel="stylesheet" href="../css/bootstrap.css" media="all"/>
       <link rel="stylesheet" href="../js/Dise.css" media="all"/>



 <?php   
 error_reporting(0);
 session_start();

 
 $varsession = $_SESSION['User'];

     if ($varsession == NULL || $varsession =='') {
    
    echo $varsession;
    echo 'usuario no logueado por favor validar con el administrador';
    
    
}else{

     
 include_once '../Conexion.php';

 $IDA = $_GET["idalumnos"];
 $IDC = $_GET["idconfiguracion"];

 
 $query = "SELECT  DATE_FORMAT(FechaSolicitud,'%d-%m-%Y %h:%i %p') as 'Fecha De Solicitud', CASE WHEN FechaDeBaja IS NULL THEN 'N/A' ELSE DATE_FORMAT(FechaDeBaja,'%d-%m-%Y %h:%i') END as 'Fecha De Baja',CASE WHEN Solicitado = 1 AND DeBaja = 0 THEN 'Solicitud de retiro a espera de Aprobación'  WHEN Solicitado = 0 AND DeBaja = 1 THEN 'Retirado' END as Estado FROM logoterapia.alumnosdebaja WHERE ID_Configuracion = ".$IDC." AND ID_Alumno = ".$IDA;

 $resultados = $conexion->query($query);
 $registros = $resultados->fetch_array();
 
//
// $queryP = "SELECT descripcion,activo,eliminado,idperfiles FROM perfiles where activo=1";
//
// $resultadosP = $conexion->query($queryP);
     
 ?>
           </head>
    <body>
        <table class="tablesorter table table-striped table-hover table-bordered table-condensed " id="TablaColoreada">
            <tr>
                <th>Fecha de Solicitud</th>
                <th>Fecha de Baja</th>
                <th>Estado</th>
            </tr>
            <tr>
                <td><?php echo $registros['Fecha De Solicitud'] ?> </td>
                <td><?php echo $registros['Fecha De Baja'] ?> </td>
                <td><?php echo $registros['Estado'] ?> </td>
                
            </tr>
            
        </table>
        
            </body>
</html>
<?php }?>