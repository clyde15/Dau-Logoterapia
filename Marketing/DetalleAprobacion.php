<html lang="es-ES" xml:lang="es-ES">
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
        <script src="../js/bootstrap.min.js" type="text/javascript"></script>
         <script src="js/Diplomados.js" type="text/javascript"></script>
       <link rel="stylesheet" href="../css/bootstrap.css" media="all"/>
       
    </head>
    <body>


 <?php   
 error_reporting(0);
 session_start();

 
 $varsession = $_SESSION['User'];
 $idresp = $_SESSION['Responsable'];
     if ($varsession == NULL || $varsession =='') {
    
    echo $varsession;
    echo 'usuario no logueado por favor validar con el administrador';
    
    
}else{

    
 include_once '../Conexion.php';

 $idconfiguracion = $_GET["idconfiguracion"];
$queryt = "SELECT D.`Nombre` as Diplomado, F.`Nombre` as Formacion, AU.`Aprobado`, AU.`Rechazado`, AU.`Solicitud`, AU.`Observacion`, AU.`FechaAprobacion`, U.`usuario` FROM `autorizacionesgerente` AU INNER JOIN configuraciones C on AU.`ID_Configuracion` = C.`IDConfiguracion` LEFT JOIN diplomados D on C.`ID_Diplomado` = D.`iddiplomados` LEFT JOIN formacion F on C.`ID_Formacion` = F.`idformaciones` INNER JOIN usuarios U on AU.`ID_Usuario` = U.`idusuarios` WHERE AU.`ID_Configuracion` = $idconfiguracion";
$resultadost = $conexion->query($queryt);
//    
 ?>

  <form method="post" id="formulariodetalle">

        <fieldset>
            <table border="1px" class="table table-striped table-hover table-bordered table-condensed  ">
                <tr>
                    <th>Nombre Solicitud</th>
                    <th>Usuario</th>
                    <th>Observacion</th>
                    <th>Solicitud</th>
                    <th>Aprobado</th>
                    <th>Rechazado</th>
                    <th>Fecha Aprobacion</th>
                </tr>
            <?php
                while( $registros = $resultadost->fetch_array()){
                    
                    if($registros['Diplomado'] == NULL)
                    {
                        $nombre = $registros['Formacion'];
                    }else{
                        $nombre = $registros['Diplomado'];
                    }
            ?>
                <tr>
                    <td><?php echo $nombre; ?></td>
                    <td><?php echo $registros['usuario']; ?></td>
                    <td><?php echo $registros['Observacion']; ?></td>
    
                    <td style="text-align:center">
                        <div><img width="30px" height="25px" src="../wp-content/uploads/2015/10/checkverde.jpg" title="Solicitud"/></div>
                    </td>
                     <?php                
                    if ($registros['Aprobado'] == null )             
                     {
                        $darinicio = FALSE;
                        ?>
                    <td style="text-align:center">
                         <div><img width="30px" height="25px" src="../wp-content/uploads/2015/10/check-rojo.jpg" title="Sin aprobar"/></div>
                    </td>
                    <?php
                    }
                    else if ($registros['Aprobado'] == false)
                    {
                        $darinicio = FALSE;
                    ?>
                    <td  style="text-align:center">
                        <div><img width="30px" height="25px" src="../wp-content/uploads/2015/10/check-rojo.jpg" title="Rechazado" /></div>
                    </td>
                   <?php
                    }
                    else
                    {
                        $darinicio = TRUE;
                    ?>
                    <td style="text-align:center">
                     <div><img width="30px" height="25px" src="../wp-content/uploads/2015/10/checkverde.jpg" title="Rechazado"/></div>
                    </td>
                   <?php
                    }   
                    ?>
                 <?php   
                    if ($registros['Rechazado'] == null )             
                     {
                        ?>
                    <td style="text-align:center">
                         <div><img width="30px" height="25px" src="../wp-content/uploads/2015/10/check-rojo.jpg" title="Sin aprobar"/></div>
                    </td>
                    <?php
                    }
                    else if ($registros['Rechazado'] == false)
                    {
                    ?>
                    <td  style="text-align:center">
                        <div><img width="30px" height="25px" src="../wp-content/uploads/2015/10/check-rojo.jpg" title="Rechazado" /></div>
                    </td>
                   <?php
                    }
                    else
                    {
                    ?>
                    <td style="text-align:center">
                     <div><img width="30px" height="25px" src="../wp-content/uploads/2015/10/checkverde.jpg" title="Rechazado"/></div>
                    </td>
                   <?php
                    }   
                    ?>
                    <?php
                                        
                        if($registros['FechaAprobacion'] == NULL)
                        {
                            $fecha = "1999-01-01 00:00:00";
                        }else{
                            $fecha = $registros['Diplomado'];
                        }
                     ?>
                    
                    <td><?php echo $fecha; ?></td>
                </tr>
            <?php
                }
            ?>
                
                <?php                
                    if ($darinicio != FALSE)             
                     {
                        ?>
                     <tr>
                         <td colspan="7">
                          <p align="center">
                            <input type="button" value="Dar Inicio" class="btn btn-primary" onclick="darincio(<?php echo $idconfiguracion; ?>,1)" />
                          </p>
                          </td>
                      </tr>
                    <?php
                    }
                    ?>
            </table>
           
         </fieldset>
    </form>
          </body>
</html>

<?php
 }
 ?>