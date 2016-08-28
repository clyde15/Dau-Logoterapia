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
    
     <?php
        include ('../Layout/Tittle.php');
     ?>

    <link rel="stylesheet" href="../css/bootstrap.css" media="all" type="text/css"  />

    <link rel="stylesheet" href="../css/grids.css" media="all" type="text/css"  />
    <script src="../js/jquery-1.8.2.js" type="text/javascript"></script>
   <script src="../js/jquery.tablesorter.pager.js" type="text/javascript"></script>
   <script src="../js/jquery.tablesorter.js" type="text/javascript"></script>


<script type="text/javascript">
    
    $(document).ready(function () {

            $(".tablesorter").tablesorter({ headers: { 0: { sorter: false }, 1: { sorter: false }, 2: { sorter: false }, 3: { sorter: false }, 4: { sorter: false}} }).tablesorterPager({ container: $("#pager"), size: $(".pagesize option:selected").val() });
        });
    
</script>

    </HEAD>
    <BODY style=" background-color:transparent">


<div class="clearfloat"/>
        
 
<div class="clearfloat"/>
<br />
<br />
 
<div align="center">
<p align="center"><H3>Diplomados y Formaciones Activas</H3></p>        

</div>        

<div class="clearfloat"></div>
<div class="row"  >
  <div class="col-md-6 col-md-offset-3">
      <table class="tablesorter table table-striped table-hover table-bordered table-condensed  " >  
        <thead>   
        <tr>      
                <th>
                Nombre
                </th>
                <th>
                Activos
                </th>
                <th>
                En Curso
                </th>

        </tr>   
  </thead>
   <tbody>
         <?php


             $query = "SELECT COUNT(`ID_Diplomado`) AS Diplomados FROM `configuraciones` WHERE `Activo` = 1";             
              $resultados3 = $conexion->query($query);
              $registros4 = $resultados3->fetch_array();
             ?>
             <tr> 

             <td> Diplomados </td>
             <?php
             if ($registros4['Diplomados'] == 0)
             {
                ?>
                <td><a href="#"> <?php echo $registros4['Diplomados']; ?> </a> </td> 
                <?php 
             }else{
               ?>
                <td><a href="ConfiguracionDiplomados.php?EnCurso=0&Activo=1"> <?php echo $registros4['Diplomados']; ?> </a> </td> 
                <?php  
             }             


             $query5 = "SELECT COUNT(`ID_Diplomado`) AS Diplomados FROM `configuraciones` WHERE `EnCurso` = 1";             
              $resultados = $conexion->query($query5);
              $resultados->data_seek(0);
              $registros = $resultados->fetch_array();
             if ($registros['Diplomados'] == 0)
             {
                 ?>
              <td><a href="#">  <?php echo $registros['Diplomados']; ?></a>  </td> 
             <?php
             }else{
               ?>
              <td><a href="ConfiguracionDiplomados.php?EnCurso=1&Activo=1">  <?php echo $registros['Diplomados']; ?></a>  </td> 
             <?php  
             }
             ?>
             </tr>

             <?php 
             $query2 = "SELECT COUNT(`ID_Formacion`) AS Formaciones FROM `configuraciones` WHERE `Activo` = 1";
             $resultados2 = $conexion->query($query2);
             $resultados2->data_seek(0);
             $registrosFor=$resultados2->fetch_array();
             ?>
            <tr> 
             <td> Formaciones </td>
              <?php  
             if ($registrosFor['Formaciones'] == 0)
             {
                 ?>
              <td><a href="#">  <?php echo $registrosFor['Formaciones']; ?></a>  </td> 
            
             <?php
             }else{
               ?>
              <td><a href="ConfiguracionFormacion.php?EnCurso=0&Activo=1">  <?php echo $registrosFor['Formaciones']; ?></a>  </td> 
          
             <?php  
             }

             $query2 = "SELECT COUNT(`ID_Formacion`) AS Formaciones FROM `configuraciones` WHERE `EnCurso` = 1";             
              $resultados3 = $conexion->query($query2);
              $resultados3->data_seek(0);
              $registros4 = $resultados3->fetch_array();
              
              
              if ($registros4['Formaciones'] == 0)
             {
                 ?>
              <td><a href="#">  <?php echo $registros4['Formaciones']; ?></a>  </td> 
            
             <?php
             }else{
               ?>
              <td><a href="ConfiguracionFormacion.php?EnCurso=1&Activo=1">  <?php echo $registros4['Formaciones']; ?></a>  </td> 
           
             <?php  
             }
              
             ?>
             </tr>
      </tbody>                        
         </table>

</div>
</div>
<div id="Editar"></div>
  </BODY>

</html>


<?php  
}
?>