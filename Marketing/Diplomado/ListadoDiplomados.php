<?php
    include_once '../../Conexion.php';

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
    
     <?php
        include ('../../Layout/Tittle.php');
     ?>

        <script src="../../js/jquery-1.8.2.js" type="text/javascript"></script>

 <script src="../../js/jquery.ui.js" type="text/javascript"></script>
 <script src="../../js/PreguntasSeguridad.js" type="text/javascript"></script>

   <link rel="stylesheet" href="../../js/jquery-ui.css" media="all" type="text/css"  />
    
     <link rel="stylesheet" href="../../css/bootstrap.css" media="all" type="text/css"  />
     <link rel="stylesheet" href="../../css/grids.css" media="all" type="text/css"  />

      <script src="../../js/jquery.tablesorter.pager.js" type="text/javascript"></script>
    <script src="../../js/jquery.tablesorter.js" type="text/javascript"></script>

        
   <script src="../../Marketing/js/Diplomados.js" type="text/javascript"></script>
   <script src="../../Buscador/Buscador.js" type="text/javascript"></script>
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
<p align="center"><H3>Administrar Diplomados</H3></p>        

</div>        

<div class="clearfloat"></div>
<div class="row"  >
  <div class="col-md-6 col-md-offset-3">
      <table class="tablesorter table table-striped table-hover table-bordered table-condensed  " >  
        <thead>  
        <tr >
            <td id="pager" colspan="4" >
           <a style="color:black" onclick="GETCrearDiplomados()" ><img title="Crear Pregunta" alt="" SRC="../../wp-content/uploads/2015/10/AdmDipomado.png" width="50px"/></a>
                        <form action="" style=" padding:2% 20% 0% 20%" >
                        <img src="../../wp-content/Paginado/first.png" class="first" alt=""/>
                        <img src="../../wp-content/Paginado/prev.png" class="prev" alt=""/>
                        <input type="text" class="pagedisplay" disabled="disabled" />
                        <img src="../../wp-content/Paginado/next.png" class="next" alt=""/>
                        <img src="../../wp-content/Paginado/last.png" class="last" alt=""/>
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
                Nombre
                </th>
                <th>
                Descripcion
                </th>
               <!-- <th></th>
                <th></th>
                <th></th>-->
                <th></th>
        </tr>   
  </thead>
   <tbody class="buscar">
         <?php   
        $query = "Select * from diplomados where eliminado = 0";

        $resultados = $conexion->query($query);

        if ($resultados->fetch_array() == 0)
        {
            ?>
       
           
           <td> <p align="center"><strong>No Hay Ningun Diplomado Registrado en nuestro sistema</strong></p> </td>

                 <?php 
            
        }  else {
            
          $resultados->data_seek(0);
            while( $registros = $resultados->fetch_array()){
         ?>
          <tr> 

             <td> <?php echo $registros['Nombre']; ?>  </td>
             <td> <?php echo $registros['Descripcion']; ?>  </td>                                    
                      
<?php
             if ($registros['Activo']) {
             ?>
                             <td width="50px"><a href="#" onclick="InactivarDiplomado(<?php echo $registros['iddiplomados']?>)"><img title="Activado" alt="" SRC="../../wp-content/uploads/2015/10/Habilitar.png" width="30px"/></a></td>
             <?php
             }  else {
              ?>
                             <td width="50px"><a href="#" onclick="ActivarDiplomado(<?php echo $registros['iddiplomados']?>)" style="color:black" ><img title="Desactivado" alt="" SRC="../../wp-content/uploads/2015/10/Deshabilitar.png" width="30px"/></a></td>
             <?php   
              }
           ?>
                       
          </tr>
        
        <?php 
        } 
        }?>
        
      </tbody>                        
         </table>

</div>
</div>
<div id="crear"></div>
  </BODY>

</html>


<?php  

}



?>

