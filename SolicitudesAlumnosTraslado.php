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
    
<script src="../js/jquery-1.8.2.js" type="text/javascript"></script>

 <script src="../js/jquery.ui.js" type="text/javascript"></script>
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
<p align="center"><H3>Solicitudes de Traslados</H3></p>        

</div>        
        

<div class="row" >
  <div class="col-md-6 col-md-offset-3">	
      <table class="tablesorter table table-striped table-hover table-bordered table-condensed "> 
       <thead>
        <tr >
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
           <th>
            Nombres
           </th>        
           <th>
            Apellidos
           </th>        
           <th>
            DNI
           </th>        
           <th>
            Aceptar
           </th>        
           <th>
               Estatus                
           </th>
           <th>
               Uso
           </th>
          
            
    </tr>   
 </thead>
<tbody class="buscar">
   <?php   
   
   
    $query = "SELECT * FROM alumnostraslado ab
			inner join alumnos a on ab.ID_Alumno = a.idalumnos
                where ab.Solicitud = true  ";

    $resultados = $conexion->query($query);

    while( $registros = $resultados->fetch_array()){
     ?>
      <tr>
         <td> <?php echo $registros['Nombres'] ?>  </td>
          <td> <?php echo $registros['Apellidos'] ?>  </td>
           <td> <?php echo $registros['DNI'] ?>  </td>
           <td>  <a style="color:black" href="#ir" onclick="AceptarTrasladoPopUp(<?php echo $registros['idAlumnosTraslado']?>)" ><img class="btn-link" title="Aceptar Traslado" alt="" SRC="../wp-content/uploads/2015/10/avion-de-papel.png" width="30px"/></a> </td>
           <?php
             if ($registros['Traslado']) {
             ?>
             <td><img title="Traslado Aceptado" alt="" SRC="../wp-content/uploads/2015/10/Habilitar.png" width="30px"/></td>
             <?php
             }  else {
              ?>
             <td><img title="Traslado Pendiente por Aceptar" alt="" SRC="../wp-content/uploads/2015/10/Deshabilitar.png" width="30px"/></td>
             <?php   
              }
           ?>
             <?php
             if ($registros['UsoTraslado']) {
             ?>
             <td><img title="Ya Uso El Traslado" alt="" SRC="../wp-content/uploads/2015/10/circulo-verde.png" width="30px"/></td>
             <?php
             }  else {
              ?>
             <td><img title="Traslado Sin Uso" alt="" SRC="../wp-content/uploads/2015/10/circulo-rojo.png" width="30px"/></td>
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
<div id="Traslado">
    
</div>
  </BODY>

</html>


<?php  

}



?>