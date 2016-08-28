<?php
include_once '../Conexion.php';

session_start();

error_reporting(0);

$varsession = $_SESSION['User'];



if ($varsession == NULL || $varsession =='') {
    
    echo $varsession;
    echo 'usuario no logueado por favor validar con el administrador';
    
    
}else{
$Est = $_GET["Estado"];


?>

<html>
    <HEAD>
    
<script src="../js/jquery-1.8.2.js" type="text/javascript"></script>

 <script src="../js/jquery.ui.js" type="text/javascript"></script>
 <script src="../js/JsAcademica.js" type="text/javascript"></script>


   <link rel="stylesheet" href="../js/jquery-ui.css" media="all" type="text/css"  />
   <link rel="stylesheet" href="../js/Dise.css" media="all" type="text/css"  />
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


 
<div align="center">
<p align="center"><H3>Lista de Diplomados</H3></p>        

</div>        
	

      <table class="tablesorter table table-striped table-hover table-bordered table-condensed" >  
    <thead>
        
        <tr>

       
            <td id="pager" colspan="6" >
            <center>
               <div class="row" >
                   <form action="" style=" padding:2% 20% 0% 10%" >
                        <img src="../wp-content/Paginado/first.png" class="first" alt=""/>
                        <img src="../wp-content/Paginado/prev.png" class="prev" alt=""/>
                        <input type="text" style="width: 114px;" class="pagedisplay" disabled="disabled" />
                        <img src="../wp-content/Paginado/next.png" class="next" alt=""/>
                        <img src="../wp-content/Paginado/last.png" class="last" alt=""/>
                        <select class="pagesize" style="width: 65px;">
                            <option selected="selected" value="5">5</option>
                            <option value="10">10</option>
                            <option value="15">15</option>
                            <option value="20">20</option>
                        </select><br>
                        </form>
                    </div>
            </center>
        </tr>  

        <tr>
           <th>
            Nombre del Diplomado 
           </th>        
            <th>Descripcion del Diplomado</th>

            <th>Fecha de Inicio</th>
            <th>Fecha de Fin</th>
            <th></th>
            <th></th>
    </tr>   
 </thead>
<tbody>
   <?php   
   if ($Est == 1) {
       $query = "SELECT IDConfiguracion,iddiplomados,Nombre,Descripcion,DATE_FORMAT(FechaInicio,'%d-%m-%Y') as FechaInicio,DATE_FORMAT(FechaFin,'%d-%m-%Y') as FechaFin FROM logoterapia.diplomados F INNER JOIN logoterapia.configuraciones C ON C.ID_Diplomado = F.iddiplomados WHERE F.Activo = 1 AND F.Eliminado = 0";
   }else {
    $query = "SELECT IDConfiguracion,iddiplomados,Nombre,Descripcion,DATE_FORMAT(FechaInicio,'%d-%m-%Y') as FechaInicio,DATE_FORMAT(FechaFin,'%d-%m-%Y') as FechaFin FROM logoterapia.diplomados F INNER JOIN logoterapia.configuraciones C ON C.ID_Diplomado = F.iddiplomados WHERE F.Activo = 1 AND F.Eliminado = 0 AND C.FechaInicio BETWEEN DATE_SUB(CURDATE(), INTERVAL 4 WEEK) AND CURDATE()";
   }
    $resultados = $conexion->query($query);

    while( $registros = $resultados->fetch_array()){
     ?>
      <tr>
         <td> <?php echo $registros['Nombre'] ?>  </td>
         <td> <?php echo $registros['Descripcion'] ?> </td>
         <td> <?php echo $registros['FechaInicio'] ?>  </td>
         <td> <?php echo $registros['FechaFin'] ?>  </td>
         <td width="50px"><a style="color:black" href="#DetalleD" onclick="DetalleDiplomado(<?php echo $registros['iddiplomados']; ?>)" ><img title="Detalle" alt="" SRC="../wp-content/uploads/2015/10/detalle.png" width="30px"/></a></td>
         <td width="50px"><a style="color:black" href="#DetalleD" onclick="ListaAlumnos(<?php echo $registros['iddiplomados'].",'D'"; ?>)" ><img title="Alumnos Inscritos" alt="" SRC="../wp-content/uploads/2015/10/deberes.png" width="30px"/></a></td>
             
             
      </tr>
        
    <?php
    } ?>
 </tbody>                             
     </table>
 


<a name="DetalleD"></a>
<div id="DetalleDiplomado">
</div>
  </BODY>

</html>


<?php  

}



?>