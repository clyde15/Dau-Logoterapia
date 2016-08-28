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


<script src="../js/Buscador.js" type="text/javascript"></script>
   <script src="../js/jquery.tablesorter.js" type="text/javascript"></script>  
     <script src="../js/jquery.tablesorter.pager.js" type="text/javascript"></script>
  

<script type="text/javascript">

    $(document).ready(function () {

        $(".tablesorter").tablesorter({ headers: { 0: { sorter: false }, 1: { sorter: false }, 2: { sorter: false }, 3: { sorter: false }, 4: { sorter: false}} }).tablesorterPager({ container: $("#pager"), size: $(".pagesize option:selected").val() });
    });
    
</script>




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
<p align="center"><H3>Lista de Formaciones</H3></p>        

</div>        
        

<div class="row" >
  <div class="col-md-6 col-md-offset-3">	

  <table class="tablesorter table table-striped table-hover table-bordered table-condensed ">  
    <thead>
        <tr >
        <div class="row" >
          <div class="col-md-5" style="padding-left: 0px; padding-right: 0px;">	
            <td id="pager" colspan="5" >
            <!--<a style="color:black" href="#EditarU" onclick="CrearUsuario()" ><img title="Crear Usuario" alt="" SRC="../wp-content/uploads/2015/10/System-icon.png" width="30px"/></a>-->
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
           <th style=" text-align: center">
            Nombre de la Formacion 
           </th>        
            <th style=" text-align: center">Cantidad de Alumnos(Pago Completo)</th>
            <th style=" text-align: center">Cantidad de Alumnos(Pago En Cuotas)</th>
            
    </tr>   
 </thead>
<tbody class="buscar">
   <?php   
    $query = "select Nombre, c.IDConfiguracion  from formacion d
              inner join configuraciones c on d.idformaciones = c.ID_Formacion
                where c.activo = 1 and c.Eliminado = 0";

    $resultados = $conexion->query($query);

    while( $registros = $resultados->fetch_array()){
     ?>
    <tr >
         <td style=" text-align: center"> <?php echo $registros['Nombre'] ?>  </td>
       
         
         <?php
         $idformacion = $registros['IDConfiguracion'];
         
             $queryCantidadPagosC = "select count(p.id_alumno) as cantidadalumnos, d.Descripcion, c.IDConfiguracion, p.id_tipoPago 
                        from formacion d
			inner join configuraciones c on d.idformaciones = c.ID_Formacion
			inner join Pagos p on c.IDConfiguracion = p.ID_Configuracion
			inner join tipopagos tp on p.ID_TipoPago = tp.idTipoPagos
                        where p.ID_Configuracion = '$idformacion'
                        and tp.idTipoPagos = 1
                        group by d.Descripcion, c.IDConfiguracion, p.id_tipoPago";

    $resultadosCantidadPagosC = $conexion->query($queryCantidadPagosC);
         $registrosCantidadPagosC = $resultadosCantidadPagosC->fetch_array();
                 $IDConfiguracion = $registrosCantidadPagosC['IDConfiguracion'];
                 $id_tipoPago = $registrosCantidadPagosC['id_tipoPago'];
         ?>
         <td style=" text-align: center"> <a href="ListadoAlumnos.php?idconfiguracion=<?php echo $IDConfiguracion ?>&idtipopago=<?php echo $id_tipoPago?>&PaginaRegresar=ListadoFormacionesAlumnos.php" target="principal"><?php echo$registrosCantidadPagosC['cantidadalumnos'] ?></a> </td>  
         
             <?php
            
             $queryCantidadPagosCU = "select count(p.id_alumno) as cantidadalumnos, d.Descripcion, c.IDConfiguracion, p.id_tipoPago 
                        from formacion d
			inner join configuraciones c on d.idformaciones = c.ID_Formacion
			inner join Pagos p on c.IDConfiguracion = p.ID_Configuracion
			inner join tipopagos tp on p.ID_TipoPago = tp.idTipoPagos
                        where p.ID_Configuracion = '$idformacion'
                        and tp.idTipoPagos = 2
                        group by d.Descripcion, c.IDConfiguracion, p.id_tipoPago";

    $resultadosCantidadPagosCU = $conexion->query($queryCantidadPagosCU);
         $registrosCantidadPagosCU = $resultadosCantidadPagosCU->fetch_array();
                  $id_tipoPagoCuota = $registrosCantidadPagosCU['id_tipoPago'];
                 
         ?>
         <td style=" text-align: center">  <a href="ListadoAlumnos.php?idconfiguracion=<?php echo $IDConfiguracion ?>&idtipopago=<?php echo $id_tipoPagoCuota?>&PaginaRegresar=ListadoFormacionesAlumnos.php" target="principal"><?php echo$registrosCantidadPagosCU['cantidadalumnos'] ?></a> </td> 
      </tr>
        
    <?php
    } ?>
 </tbody>                             
     </table>
    </div>

<!-- Modal Eliminar -->
<div class = "modal fade" id = "eliminarPerf" tabindex = "-1" role = "dialog" aria-labelledby = "myModalLabel" aria-hidden = "true">
   
   <div class = "modal-dialog">
      <div class = "modal-content">
         
         <div class = "modal-header">
            <button type = "button" class = "close" data-dismiss = "modal" aria-hidden = "true">
                  &times;
            </button>
            
          <div>
            <iframe name="EliminarPerfil" scrolling="yes" frameborder="0"></iframe>
         </div>
         <div class = "modal-footer">
            <button type = "button" class = "btn btn-default" data-dismiss = "modal">
               Cerrar
            </button>
            
            <button type = "button" class = "btn btn-primary">
               Eliminar
            </button>
         </div>
         
      </div><!-- /.modal-content -->
   </div><!-- /.modal-dialog -->
  
</div><!-- /.modal -->
</div>


  </BODY>

</html>


<?php  

}



?>