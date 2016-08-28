<?php
include_once '../Conexion.php';

session_start();

error_reporting(0);

$varsession = $_SESSION['User'];

 $idconfiguracionG = addslashes(htmlspecialchars($_GET["idconfiguracion"]));
  $Alumnos = addslashes(htmlspecialchars($_GET["Alumnos"]));

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
                 
                   <?php   
   
    
   
    $query = "select a.Nombres, a.DNI, a.Apellidos, pc.CantidadCuotas, mp.Descripcion as MetododeCancelacion , tp.Nombre as TipodePago 
		,rp.NombreBanco, rp.FechaPago, rp.Monto, rp.NumeroRecibo, p.idPagos, pc.Decripcion
		from pagos p 
                left join pagoscuotas pc on p.idPagos = pc.ID_Pagos
		inner join registropagos rp on pc.idPagosCuotas = rp.ID_PagosCuota
		inner join metodosdepago mp on p.ID_MetododePagos = mp.idMetodosDePago
		inner join tipopagos tp on p.ID_TipoPago = tp.idTipoPagos
		inner join alumnos a on p.ID_Alumno = a.idalumnos
		
                where p.ID_Configuracion = '$idconfiguracionG' and p.ID_Alumno in('$Alumnos')";

    $resultados = $conexion->query($query);
$registros = $resultados->fetch_array();


        $query2 = "select a.Nombres, a.DNI, a.Apellidos, pc.CantidadCuotas
            , tp.Nombre as TipodePago 		
		from pagos p 
                left join pagoscuotas pc on p.idPagos = pc.ID_Pagos
                inner join alumnos a on p.ID_Alumno = a.idalumnos
		inner join tipopagos tp on p.ID_TipoPago = tp.idTipoPagos
                where p.ID_Configuracion = '$idconfiguracionG' and p.ID_Alumno in('$Alumnos')";

    $resultados2 = $conexion->query($query2);
$registros2 = $resultados2->fetch_array();
    
    


$idpagosf = $registros['idPagos'];

$queryCantidadCuotasPagadas = "select Count(*) as CantidadP from registropagos where ID_Pagos = '$idpagosf'";

$resultadosCantidadPagosCuotas = $conexion->query($queryCantidadCuotasPagadas);

$registrosCantidadPagosCuotas = $resultadosCantidadPagosCuotas->fetch_array();

$cantidadTotalPagosRealizados = $registrosCantidadPagosCuotas['CantidadP'];

     ?>
    <BODY style=" background-color:transparent">
    <center>
        <div>
            <div class="row" >
                <div class="col-md-6 col-md-offset-3">	
     <table class="table table-striped table-hover table-condensed ">
            <thead>
    
           <th style="text-align: center">
            Nombres
           </th>        
           <th style="text-align: center">
            Apellidos
           </th>        
           <th style="text-align: center">
            DNI
           </th> 
         <?php
            if (strpos($registros2['TipodePago'], 'Cuotas') !== false) {
             ?> 
         <th style="text-align: center">
            Cuotas Totales
           </th>
            <?php  }    ?>
          <th style="text-align: center">
            Pagos Registrados
           </th>
           <th style="text-align: center">
            Tipo de Pago
           </th>
         
            </thead>
            <tbody>
  
      <tr >
          <td style="text-align: center"> <?php echo $registros2['Nombres'] ?>  </td>
          <td style="text-align: center"> <?php echo $registros2['Apellidos'] ?>  </td>
           <td style="text-align: center" > <?php echo $registros2['DNI'] ?>  </td>
           <?php
            if (strpos($registros2['TipodePago'], 'Cuotas') !== false) {
            
             if (empty($registros2['CantidadCuotas'])) {
             ?>
             <td style="text-align: center"> N/A </td>
             <?php
             }  else {
              ?>
                 <td style="text-align: center"> <?php echo $registros2['CantidadCuotas'] ?>  </td>
             <?php   
              }
              }
           ?>
          
           
           <td style="text-align: center"> <?php echo $cantidadTotalPagosRealizados ?>  </td>
           <td style="text-align: center"> <?php echo $registros2['TipodePago'] ?>  </td>
 
      </tr>
    </tbody>
            </table>
            </div>
                </div>
      </div> 
        </center>
    <center>
        
        
<div class="container" style=" height: 200px;width: auto">
   
 
   <table data-show-header="true" data-sortable="true" data-sort-class="table" data-sort-order="asc" class="table table-striped table-hover table-condensed" data-toggle="table" id="table" data-search="true" style="width: 1121px;" data-show-export="true" data-pagination="true"
     data-sortable="true"  data-page-list="[10, 25, 50, 100, ALL]" data-show-columns="true" data-minimum-count-columns="2" data-toolbar="#toolbar" style="margin-top: -81px;"> 
       <thead>
           
        <tr>
          
           <th >
            DNI
           </th>        
        <?php
            if (strpos($registros['TipodePago'], 'Cuotas') !== false) {
             ?> 
         <th style="text-align: center">
            Cuotas Totales
           </th>
            <?php  }    ?>
          <th >
            Pagos Registrados
           </th>
           <th >
            Cuota
           </th>
           <th>
            Metodo de Cancelacion
           </th> 
          
           <th>
            Nombre del Banco
           </th> 
           <th>
            Fecha del Pago
           </th> 
           <th>
            Monto
           </th> 
           <th>
            Numero de Recibo
           </th> 
            
    </tr>   
 </thead>
<tbody>
   <?php   
  $resultados->data_seek(0);
    while( $registros = $resultados->fetch_array()){
     ?>
      <tr >
        
           <td style="text-align: center" > <?php echo $registros['DNI'] ?>  </td>
           <?php
            if (strpos($registros['TipodePago'], 'Cuotas') !== false) {
            
             if (empty($registros['CantidadCuotas'])) {
             ?>
             <td style="text-align: center"> N/A </td>
             <?php
             }  else {
              ?>
                 <td style="text-align: center"> <?php echo $registros['CantidadCuotas'] ?>  </td>
             <?php   
              }
              }
           ?>
           <td style="text-align: center"> <?php echo $cantidadTotalPagosRealizados ?>  </td>
           <td style="text-align: center"> <?php echo $registros['Decripcion'] ?>  </td>
 
           <td style=" text-align: center"> <?php echo $registros['MetododeCancelacion'] ?>  </td>

           <td style=" text-align: center"> <?php echo $registros['NombreBanco'] ?>  </td>
           <td style=" text-align: center"> <?php echo $registros['FechaPago'] ?>  </td>
           <td style=" text-align: center"> <?php echo $registros['Monto'] ?>  </td>
           <td style=" text-align: center"> <?php echo $registros['NumeroRecibo'] ?>  </td>
           
      </tr>
        
    <?php
    } ?>
 </tbody>                             
     </table>
</div> 
        </center>
  </BODY>

</html>


<?php  

}



?>