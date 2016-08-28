<?php
include_once '../Conexion.php';

session_start();

error_reporting(0);

$varsession = $_SESSION['User'];

if ($varsession == NULL || $varsession =='') {
    
    echo $varsession;
    echo 'usuario no logueado por favor validar con el administrador';
    
    
}else{

 
?>

<html>
    <HEAD>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/bootstrap-table.css">

<script src="../js/jquery.min.js" type="text/javascript"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/bootstrap-table.js"></script>
<script src="../js/bootstrap-table-export.js"></script>
<script src="../js/tableExport.js"></script>

<script src="../js/bootstrap-table-editable.js"></script>
<script src="../js/bootstrap-editable.js"></script>


 <link rel="stylesheet" href="../css/grids.css" media="all" type="text/css"  />


    </HEAD>
    <BODY style=" background-color:transparent">
   
        <div id="ReportePagos">    
<div class="container" style=" height: 200px;">

      <table data-show-header="true" data-sortable="true" data-sort-class="table" data-sort-order="asc" class="tablesorter table table-striped table-hover table-condensed " data-toggle="table" id="table" data-search="true" style="width: 1121px;" data-show-export="true" data-pagination="true"
            data-sortable="true"  data-page-list="[10, 25, 50, 100, ALL]" data-show-columns="true" data-minimum-count-columns="2" data-toolbar="#toolbar" style="margin-top: -81px;" > 
          <thead class="sort"> 
        <tr>
           <th >
            Descripcion
           </th>        
           <th >
            Fecha Solicitud
           </th>        
           <th >
            Fecha Resolucion 
           </th>  
       
           <th>
            Aprobar
           </th>        
           <th>
            Estatus
           </th>
           <th>
            Entrega de dinero
           </th>
         
           <th>
            Cargar Evidencia
           </th>
    </tr>   
    </thead>
    <tbody>
   <?php   
   
   
    $query = "SELECT * FROM solicitudes";

    $resultados = $conexion->query($query);

   
    
    while( $registros = $resultados->fetch_array()){
     ?>
      <tr>
         <td> <?php echo $registros['Descripcion'] ?>  </td>
          <td> <?php echo $registros['FechaSolicitud'] ?>  </td>
           <td> <?php echo $registros['FechaResolucion'] ?>  </td>
   
           <?php
             if ($registros['Procesado']) {
             ?>
             <td style="text-align: center">  <a style="color:black" id="<?php echo $registros['idSolicitudes']?>"  ><img title="Solicitud Aprobada" alt="" SRC="../wp-content/uploads/2015/10/expediente.png" width="30px"/></a> </td>
             <td style="text-align: center"><img title="Solicitud Aprobada" alt="" SRC="../wp-content/uploads/2015/10/circulo-verde.png" width="30px"/></td>
             <?php
             }  else {
              ?>
             <td style="text-align: center">  <a style="color:black" id="<?php echo $registros['idSolicitudes']?>" onclick="AprobarSolicitud(<?php echo $registros['idSolicitudes']?>)" ><img class="btn-link" title="Aprobar Solicitud" alt="" SRC="../wp-content/uploads/2015/10/expedienteSinAprobar.png" width="30px"/></a> </td>
             <td style="text-align: center"><img title="Solicitud Pendiente por Aprobar" alt="" SRC="../wp-content/uploads/2015/10/circulo-rojo.png" width="30px"/></td>
             <?php   
              }
           ?>
              <?php
             if ($registros['EntregaDinero']) {
             ?>
             <td style="text-align: center">  <a style="color:black" href="#ir" id="<?php echo $registros['idSolicitudes']?>" onclick="EntregarDineroPouUp(<?php echo $registros['idSolicitudes']?>)"><img class="btn-link" title="Dinero Entregado" alt="" SRC="../wp-content/uploads/2015/10/dinero.png" width="30px"/></a> </td>
             <?php
             }  else {
              ?>
             <td style="text-align: center">  <a style="color:black" href="#ir" id="<?php echo $registros['idSolicitudes']?>" onclick="EntregarDineroPouUp(<?php echo $registros['idSolicitudes']?>)" ><img class="btn-link" title="Pendiente por entregar Dinero" alt="" SRC="../wp-content/uploads/2015/10/contrato.png" width="30px"/></a> </td>
             <?php   
              }
               
       }    
           ?>
             
         <?php
             if ($registros['EvidenciaRegistrada']) {
             ?>
             <td style="text-align: center">  <a style="color:black" href="ConsultaDeEvidencia.php?idSolicitudes=<?php echo $registros['idSolicitudes']?>" id="<?php echo $registros['idSolicitudes']?>" target="_blank" ><img class="btn-link" title="Consultar Evidencia/Factura" alt="" SRC="../wp-content/uploads/2015/10/binoculares.png" width="30px"/></a> </td>
             
             <?php
             }  else {
              ?>
             <td style="text-align: center">  <a style="color:black" href="#ir" id="<?php echo $registros['idSolicitudes']?>" onclick="CargarEvidenciaPopUp(<?php echo $registros['idSolicitudes']?>)" ><img class="btn-link" title="Cargar Evidencia/Factura" alt="" SRC="../wp-content/uploads/2015/10/CargarEvidencia.png" width="30px"/></a> </td>
             <?php   
              }
           ?>
          
            
             
      </tr>
        
 
    </tbody>                  
     </table>
      
  
</div>

  </div>       
  </BODY>

</html>


<?php  

}



?>