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
    $queryAlumnos = "SELECT distinct a.Nombres, a.DNI, p.idpagos, tp.Nombre FROM pagos	p
                        inner join PagosCuotas pc on p.idpagos = pc.ID_Pagos
			inner join alumnos a on p.ID_Alumno = a.idalumnos
			inner join tipopagos tp on p.ID_TipoPago = tp.idTipoPagos
		where p.ID_Configuracion = '$idconfiguracionG' and pc.Pago = 0";

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
            <th>Estatus de Cuota</th>
            
    </tr>   
 </thead>
<tbody>
   <?php   
  
    while( $registrosAlumnos = $resultadosAlumnos->fetch_array()){
     
             //////////se consulta la fecha de inicio para hacer el conteo de las cuotas y generar la lista
       
           $idpagosf = $registrosAlumnos['idpagos'];
           
       $queryPagosCuotas = "select CantidadCuotas, Decripcion, date(FechaInicio)as FechaInicio, Pago from pagoscuotas where ID_Pagos = '$idpagosf' and Pago = 0";
 
  $resultadosPagosCuotas = $conexion->query($queryPagosCuotas);
  
     
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
               $fechaGlobal = getdate();
               $mes;
               if (strlen($fechaGlobal[mon]) == 1) {
                   $mes = "-0".$fechaGlobal[mon];
               }else{
                   $mes = "-".$fechaGlobal[mon];
               }
         $fechaActual = $fechaGlobal[year].$mes."-".$fechaGlobal[mday];
              $resultadosPagosCuotas->data_seek(0);
            while($registrosPagosCuotas = $resultadosPagosCuotas->fetch_array()) {
          //for ($index2 = 0; $index2 < $Cantidad; $index2++){
          if ($registrosPagosCuotas['FechaInicio'] < $fechaActual) {
              ?>
            <div style="text-align: center" >
                Cuota Vencida
            </div>
           <?php
          }else{
                 ?>
         <div style="text-align: center" >
          Cuota Pendiente Por Vencer
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