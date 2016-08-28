<?php
include_once '../Conexion.php';

session_start();

error_reporting(0);

$varsession = $_SESSION['User'];

 $idconfiguracionG = addslashes(htmlspecialchars($_GET["idconfiguracion"]));


if ($varsession == NULL || $varsession =='') {
    
    echo $varsession;
    echo 'usuario no logueado por favor validar con el administrador';
    
    
}else{



?>

<html>
    <HEAD>

 <link rel="stylesheet" href="../css/bootstrap.min.css"/>
<link rel="stylesheet" href="../css/bootstrap-table.css">

<script src="../js/jquery.min.js" type="text/javascript"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/bootstrap-table.js"></script>
<script src="../js/bootstrap-table-export.js"></script>
<script src="../js/tableExport.js"></script>

<script src="../js/bootstrap-table-editable.js"></script>
<script src="../js/bootstrap-editable.js"></script>

 

    </HEAD>
    <BODY style=" background-color:transparent">
                   <?php   
   $idconfiguracionG = addslashes(htmlspecialchars($_GET["idconfiguracion"]));
    $queryAlumnos = "SELECT a.Nombres, a.DNI, p.idpagos, tp.Nombre FROM pagos	p
			inner join alumnos a on p.ID_Alumno = a.idalumnos
			inner join tipopagos tp on p.ID_TipoPago = tp.idTipoPagos
		where p.ID_Configuracion = '$idconfiguracionG'";

    $resultadosAlumnos = $conexion->query($queryAlumnos);

     ?>
  
<div class="container" style=" height: 200px">
   
 
   <table data-show-header="true" data-sortable="true" data-sort-class="table" data-sort-order="asc" class="table table-striped table-hover table-condensed" data-toggle="table" id="table" data-search="true" style="width: auto;" data-show-export="true" data-pagination="true"
     data-sortable="true"  data-page-list="[10, 25, 50, 100, ALL]" data-show-columns="true" data-minimum-count-columns="2" data-toolbar="#toolbar" style="margin-top: -81px;"> 
       <thead>
           
        <tr>
            <th >
            Nombres
           </th> 
           <th >
            DNI
           </th>        
           <th>Descripcion</th>
           <th>Fecha de Compromiso</th>
            <th>Estatus de Pago</th>
    </tr>   
 </thead>
<tbody>
   <?php   
  
    while( $registrosAlumnos = $resultadosAlumnos->fetch_array()){
     
             //////////se consulta la fecha de inicio para hacer el conteo de las cuotas y generar la lista
       
           $idpagosf = $registrosAlumnos['idpagos'];
           
       $queryPagosCuotas = "select CantidadCuotas, Decripcion, date(FechaInicio)as FechaInicio, Pago from pagoscuotas where ID_Pagos = '$idpagosf'";
 
  $resultadosPagosCuotas = $conexion->query($queryPagosCuotas);
  
         
//    
//         $FechasCuota;
//         $FechaInicial = $registrosPagosCuotas['FechaInicio'];
//         
//         $queryCantidadPL = "select Count(*) as CantidadP  from registropagos where ID_Pagos = '$idpagosf'";
//         
//          $resultadosCantidadPL= $conexion->query($queryCantidadPL);
//  
//         $registrosCantidadPL = $resultadosCantidadPL->fetch_array();
//        
//          $queryPagosRegistrados = "select traslado from registropagos where ID_Pagos = '$idpagosf'";
//         
//          $resultadosPagosRegistrados= $conexion->query($queryCantidadPL);
//  
         
         
//         $Cantidad = $registrosPagosCuotas['CantidadCuotas'];
         
//         if (strpos($registrosAlumnos['Nombre'], 'Pago Completo') !== false) {
//            $Cantidad = $registrosCantidadPL['CantidadP']; 
//             
//             if ($registrosCantidadPL['CantidadP'] == 0) {
//                 $FechasCuota[0][0] = "Cuota Unica";
//                 $FechasCuota[1][0] = "Pendiente Por Pagar";
//                 $Cantidad = 1;
//             }else if($registrosCantidadPL['CantidadP'] == 1){
//                $FechasCuota[0][0] = "Cuota Unica";
//                 $FechasCuota[1][0] = "Cuota Pagada";
//                 $Cantidad = 1;
//             }else {
//                 $Contador = 0;
//                 while ($registrosPagosRegistrados = $resultadosPagosRegistrados->fetch_array()) {
//                     
//                     if (!$registrosPagosRegistrados['traslado']) {
//                         $FechasCuota[0][$Contador] = "Cuota Unica";
//                         $FechasCuota[1][$Contador] = "Cuota Pagada";
//                     }  else {
//                        $FechasCuota[0][$Contador] = "Cuota Traslado";
//                         $FechasCuota[1][$Contador] = "Traslado Pagado";
//                     }
//                     $Contador = $Contador + 1;
//                 } 
             //}
             
//         }else {
         
//         for ($index = 0; $index < $Cantidad; $index++) {
//             
//             $FechasC = strtotime("+1 month", strtotime($FechaInicial));
//             
//             $FechasCuota[0][$index] = date("Y-m-j",$FechasC);
//               
//             if ($registrosCantidadPL['CantidadP'] >= $index +1) {
//                 $FechasCuota[1][$index] = "Cuota Pagada";
//             }else
//             {
//                 $FechasCuota[1][$index] = "Pendiente Por Pagar";
//             }
//             
//             
//             $FechaInicial = $FechasCuota[0][$index];
//         }
         //}
         ?>
      <tr >
               
          <td> <?php echo $registrosAlumnos['Nombres'] ?>  </td>
          <td> <?php echo $registrosAlumnos['DNI'] ?>  </td>
           <td >
             
         <?php
            while($registrosPagosCuotas = $resultadosPagosCuotas->fetch_array()){ 
          //for ($index2 = 0; $index2 < $Cantidad; $index2++){
                 ?>
         <div style="text-align: center" >
          <?php echo $registrosPagosCuotas['Decripcion'];  ?>
            </div>
        
                   <?php } 
              
          ?>
      </td> 
     <td >
             
         <?php
          $resultadosPagosCuotas->data_seek(0);
            while($registrosPagosCuotas = $resultadosPagosCuotas->fetch_array()){ 
          //for ($index2 = 0; $index2 < $Cantidad; $index2++){
                 ?>
         <div style="text-align: center" >
          <?php echo $registrosPagosCuotas['FechaInicio'];  ?>
            </div>
        
                   <?php } 
              
          ?>
      </td> 
       <td >
              <?php
              $resultadosPagosCuotas->data_seek(0);
            while($registrosPagosCuotas = $resultadosPagosCuotas->fetch_array()) {
          //for ($index2 = 0; $index2 < $Cantidad; $index2++){
          if ($registrosPagosCuotas['Pago']) {
              ?>
            <div style="text-align: center" >
                Cuota Pagada
            </div>
           <?php
          }else{
                 ?>
         <div style="text-align: center" >
          Pendiente Por Pagar
            </div>
        
                   <?php } 
                   
          } 
              
          ?>
      </td> 
      </tr>
      
           
      
      
        
    <?php
    } ?>
 </tbody>                             
     </table>
</div> 
 
  </BODY>

</html>


<?php  

}



?>