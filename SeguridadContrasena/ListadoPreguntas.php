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
    
     <HEAD>
    
<script src="../js/jquery-1.8.2.js" type="text/javascript"></script>

 <script src="../js/jquery.ui.js" type="text/javascript"></script>
 <script src="../js/PreguntasSeguridad.js" type="text/javascript"></script>

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

 <script src="../js/EditarPreguntaSeguridad.js" type="text/javascript"></script>

    </HEAD>
    <BODY style=" background-color:transparent">

<div class="clearfloat"/>
              
 
<div class="clearfloat"/>
<br />
<br />
 
<div align="center">
<p align="center"><H3>Administrar Preguntas De Seguridad</H3></p>        

</div>        
 <?php   
    $query = "SELECT * FROM preguntas WHERE Eliminado = 0";

    $resultados = $conexion->query($query);
    if ($resultados->fetch_array() == 0)
    {
        ?>
 <div class="row" >
  <div class="col-md-6 col-md-offset-3">
<table class="tablesorter table table-striped table-hover table-bordered table-condensed ">
    <tr>
         <a style="color:black" onclick="CrearPreguntas()" ><img title="Crear Pregunta" alt="" SRC="../wp-content/uploads/2015/10/carpeta-de-aplicaciones.png" width="50px"/></a>
    </tr>
    <tr>
        &nbsp;
    <h3> <p align='center' style="color:red">No se encuentra ninguna pregunta de seguridad registrada en nuestro sistema</p></h3>
    </tr>
  </div>
 </div>
</table>
     
       <div id="PreguntaSeguridad"></div>  
        <?php
    }  else {
        ?>       

<div class="row" >
  <div class="col-md-6 col-md-offset-3">	

  <table class="tablesorter table table-striped table-hover table-bordered table-condensed ">  
    <thead>
        <tr >
        <div class="row" align="center" >
          <div class="col-md-5" style="padding-left: 0px; padding-right: 0px;">	
            <td id="pager" colspan="6" >
             <a style="color:black" onclick="CrearPreguntas()" ><img title="Crear Pregunta" alt="" SRC="../wp-content/uploads/2015/10/carpeta-de-aplicaciones.png" width="50px"/></a>
                        <form action="" style=" padding:2% 20% 0% 10%" >
                        <img src="../wp-content/Paginado/first.png") class="first" alt=""/>
                        <img src="../wp-content/Paginado/prev.png") class="prev" alt=""/>
                        <input type="text" style="width: 114px;" class="pagedisplay" disabled="disabled" />
                        <img src="../wp-content/Paginado/next.png") class="next" alt=""/>
                        <img src="../wp-content/Paginado/last.png") class="last" alt=""/>
                        <select class="pagesize" style="width: 65px;">
                            <option selected="selected" value="5">5</option>
                            <option value="10">10</option>
                            <option value="15">15</option>
                            <option value="20">20</option>
                        </select>
                        </form>
            </td>
          </div>
        </div>
        </tr>  

        <tr >
           <th>
             Pregunta 
           </th>     
           <th>
             Fecha Creacion / Modificacion
           </th> 
           <th>
        <center> Activar/Desactivar </center> 
           </th>
            <th></th>
            <th></th>
    </tr>   
 </thead>
<tbody>
   <?php 

   $resultados->data_seek(0); 
    while( $registros = $resultados->fetch_array()){
        $idPreguntas = $registros['idPreguntas'];
     ?>
      <tr>
          
         <td> <?php echo $registros['Descripcion'] ?>  </td>
         <td> <?php echo $registros['Fecha'] ?>  </td>

         <?php 
         if ($registros['Activo'] == false)
         {
          ?>
                 
        <td>
<center> <a style="color:black" onclick="ActivarPregunta(<?php echo $idPreguntas; ?>)" type="button"><img title="Desactivado" alt="" SRC="../wp-content/uploads/2015/10/deshabilitar.png" width="30px"/></a></center>
        </td>     
         <?php
         }else{
             ?>
        <td>
        <center> <a style="color:black" onclick="DesactivarPregunta(<?php echo $idPreguntas; ?>)" type="button"><img title="Activado" alt="" SRC="../wp-content/uploads/2015/10/habilitar.png" width="30px"/></a></center>
        </td>
         <?php   
         }
         ?>
        
         
             
        <td width="50px"><a style="color:black" href="#EditarPregunta" onclick="EditarPreguntas(<?php echo $registros['idPreguntas']; ?>)" ><img title="Editar" alt="" SRC="../wp-content/uploads/2015/10/System-icon.png" width="30px"/></a></td>
        <td width="50px"><a  class="list-group-item"  style="color:black" href="#EditarPregunta"  onclick="EliminarPregunta(<?php echo $registros['idPreguntas']; ?>,'<?php echo trim($registros['Descripcion']); ?>')" ><img title="Eliminar" alt="" SRC="../wp-content/uploads/2015/10/Trash-icon.png" width="30px"/></a></td>
              
      </tr>
        
    <?php
    } ?>
 </tbody>                             
     </table>
    </div>
    
    <a name="EditarPregunta"></a>
<div id="PreguntaSeguridad">

</div>
        </body>
        <?php
    }?>     

</html>


<?php  

}

?>


