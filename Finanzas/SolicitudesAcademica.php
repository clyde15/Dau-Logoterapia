<?php
include_once '../Conexion.php';

session_start();

error_reporting(0);

$varsession = $_SESSION['User'];

if ($varsession == NULL || $varsession =='') {
    
    echo $varsession;
    echo 'usuario no logueado por favor validar con el administrador';
    
    
}else{

  $idperil = $_SESSION['ID_Perfil'];
      
      $queryPerfil = "select Descripcion from perfiles where idperfiles='$idperil'";
      
      $resultadosPerfil = $conexion->query($queryPerfil);
      
      $registrosPerfil = $resultadosPerfil->fetch_array();

?>

<html>
    <HEAD>
    
<script src="../js/jquery-1.8.2.js" type="text/javascript"></script>

 <script src="../js/jquery.ui.js" type="text/javascript"></script>
 <script src="../js/AceptarSolicitudesAcademica.js" type="text/javascript"></script>
 <script src="../js/Popup_Pagos.js" type="text/javascript"></script>
 <script src="../js/Buscador.js" type="text/javascript"></script>
   <link rel="stylesheet" href="../js/jquery-ui.css" media="all" type="text/css"  />
   <link rel="stylesheet" href="../css/bootstrap.css" media="all" type="text/css"  />
     <link rel="stylesheet" href="../css/grids.css" media="all" type="text/css"  />

      

<script type="text/javascript">

    $(document).ready(function () {

        $(".tablesorter").tablesorter({ headers: { 0: { sorter: false }, 1: { sorter: false }, 2: { sorter: false }, 3: { sorter: false }, 4: { sorter: false}} }).tablesorterPager({ container: $("#pager"), size: $(".pagesize option:selected").val() });
    });
    
</script>

 <script src="../js/jquery.tablesorter.pager.js" type="text/javascript"></script>
    <script src="../js/jquery.tablesorter.js" type="text/javascript"></script>



    </HEAD>
    <BODY style=" background-color:transparent">

<div class="clearfloat"/>
        
        
<div align="center">
   
<input type="text" id="filtrar" placeholder="Buscar" />
        
</div>
 
<div class="clearfloat"/>
<br />
<br />
 
<div align="center">
<p align="center"><H3>Solicitudes de Academica</H3></p>        

</div>        
        

<div class="row" >
  <div class="col-md-6 col-md-offset-3">	
      <table class="tablesorter table table-striped table-hover table-bordered table-condensed "> 
       <thead>
        <tr >
            <td id="pager" colspan="7" >
           
                        <form action="" style=" padding:2% 20% 0% 20%" >
                        <img src="../wp-content/Paginado/first.png")" class="first" alt=""/>
                        <img src="../wp-content/Paginado/prev.png")" class="prev" alt=""/>
                        <input type="text" class="pagedisplay" disabled="disabled" />
                        <img src="../wp-content/Paginado/next.png")" class="next" alt=""/>
                        <img src="../wp-content/Paginado/last.png")" class="last" alt=""/>
                        <select class="pagesize" style="width: 65px;">
                            <option selected="selected" value="5">5</option>
                            <option value="10">10</option>
                            <option value="15">15</option>
                            <option value="20">20</option>
                        </select>
                        </form>

            </td>
        </tr> 

        <tr>
           <th>
            Descripcion
           </th>        
           <th>
            Fecha Solicitud
           </th>        
           <th>
            Fecha Resolucion
           </th>  
      <?php
      
       if (strpos($registrosPerfil['Descripcion'], 'Finanza') !== false || strpos($registrosPerfil['Descripcion'], 'Administrador') !== false) 
        {
      
       ?>      
           <th>
            Aprobar
           </th>        
           <th>
            Estatus
           </th>
           <th>
            Entrega de dinero
           </th>
           <?php
        }
        ?>
           <th>
            Cargar Evidencia
           </th>
    </tr>   
 </thead>
<tbody class="buscar">
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
      
       if (strpos($registrosPerfil['Descripcion'], 'Finanza') !== false || strpos($registrosPerfil['Descripcion'], 'Administrador') !== false)
        {
      
       ?>
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
        
    <?php
    } ?>
 </tbody>                             
     </table>
            
    </div>


</div>
<a name="ir"></a>
<div id="SolicitudAcademica">
    
</div>
  </BODY>

</html>


<?php  

}



?>