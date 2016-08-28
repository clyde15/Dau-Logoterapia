<html lang="es-ES" xml:lang="es-ES">
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
        <script src="../js/bootstrap.min.js" type="text/javascript"></script>
        <script src="../js/JsAcademica.js" type="text/javascript"></script>
       <link rel="stylesheet" href="../css/bootstrap.css" media="all"/>
       <link rel="stylesheet" href="../js/Dise.css" media="all"/>
    </head>
    <body>
<?php
include_once '../Conexion.php';

session_start();

error_reporting(0);

$varsession = $_SESSION['User'];



if ($varsession == NULL || $varsession =='') {
    
    echo $varsession;
    echo 'usuario no logueado por favor validar con el administrador';
    
    
}else{

 $DNI = $_GET["DNI"];
 
    $query = "SELECT A.Nombres,A.Apellidos,A.Direccion,A.Telefono,A.Correo,A.UsuarioSkype,CASE WHEN D.iddiplomados is null THEN 'Formacion' ELSE 'Diplomado' END AS Tipo,CASE WHEN D.iddiplomados is null THEN F.Nombre ELSE D.Nombre END As NombreAcademico,CASE WHEN D.iddiplomados is null THEN F.Descripcion ELSE D.Descripcion END AS DescripcionAcademica, C.FechaInicio,C.FechaFin FROM logoterapia.alumnos A INNER JOIN logoterapia.pagos P ON P.ID_Alumno = A.idalumnos INNER JOIN logoterapia.configuraciones C ON C.IDConfiguracion = P.ID_Configuracion LEFT JOIN logoterapia.diplomados D ON D.iddiplomados = C.ID_Diplomado LEFT JOIN logoterapia.formacion F ON F.idformaciones = C.ID_Formacion WHERE A.DNI ='$DNI'";
    $resultados = $conexion->query($query);
    $reg = $resultados->fetch_array()
?>

<script type="text/javascript">

    $(document).ready(function () {

        $(".tablesorter").tablesorter({ headers: { 0: { sorter: false }, 1: { sorter: false }, 2: { sorter: false }, 3: { sorter: false }, 4: { sorter: false},5: { sorter: false },6: { sorter: false }} }).tablesorterPager({ container: $("#pager"), size: $(".pagesize option:selected").val() });
        
        
    });
    
</script>

 <script src="../js/jquery.tablesorter.pager.js" type="text/javascript"></script>
    <script src="../js/jquery.tablesorter.js" type="text/javascript"></script>


        
 <center>

      
	  <div >
              <table class="tablesorter table table-striped table-hover table-bordered table-condensed " id="TablaColoreada"> 
<thead>
<tr>
<th>Nombres</th>
<th>Apellidos</th>
</tr>

<tr>
    
    <td><?php echo $reg['Nombres'] ?> </td>
<td><?php echo $reg['Apellidos'] ?> </td>
    
</tr>

<tr>
    <th>Dirección</th>
    <th>Telefono</th>
    
    
</tr>

<tr>
    
        <td><?php echo $reg['Direccion'] ?> </td>
        <td><?php echo $reg['Telefono'] ?> </td>
    
</tr>
<tr>
    
    <th>Correo</th>
    <th>Usuario Skype</th>
        
</tr>


<tr>
    
<td><?php echo $reg['Correo'] ?> </td>
<td><?php echo $reg['UsuarioSkype'] ?> </td>
    
</tr>


</thead>

</table>
     
              
   <table  class="tablesorter table table-striped table-hover table-bordered table-condensed " style="align-content: center">  
    <thead>
        <tr>

       
            <td id="pager" colspan="7" >
         
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
            Tipo 
           </th>        
            <th>Nombre</th>

            <th>Descripcion</th>
            <th>Fecha Inicio</th>
            <th>Fecha Fin</th>
        
            <th></th>
     
    </tr>   
 </thead>
        <tbody>
   <?php   

    $query = "SELECT C.IDConfiguracion,A.idalumnos,A.Nombres,A.Apellidos,A.Direccion,A.Telefono,A.Correo,A.UsuarioSkype,CASE WHEN D.iddiplomados is null THEN 'Formacion' ELSE 'Diplomado' END AS Tipo,CASE WHEN D.iddiplomados is null THEN F.Nombre ELSE D.Nombre END As NombreAcademico,CASE WHEN D.iddiplomados is null THEN F.Descripcion ELSE D.Descripcion END AS DescripcionAcademica, C.FechaInicio,C.FechaFin FROM logoterapia.alumnos A INNER JOIN logoterapia.pagos P ON P.ID_Alumno = A.idalumnos INNER JOIN logoterapia.configuraciones C ON C.IDConfiguracion = P.ID_Configuracion LEFT JOIN logoterapia.diplomados D ON D.iddiplomados = C.ID_Diplomado LEFT JOIN logoterapia.formacion F ON F.idformaciones = C.ID_Formacion WHERE A.DNI ='$DNI'";
    $resultados = $conexion->query($query);
    while( $registros = $resultados->fetch_array()){
     ?>
      <tr>
         <td> <?php echo $registros['Tipo'] ?>  </td>
         <td> <?php echo $registros['NombreAcademico'] ?>  </td>
         <td> <?php echo $registros['DescripcionAcademica'] ?>  </td>
         <td> <?php echo $registros['FechaInicio'] ?>  </td>
         <td> <?php echo $registros['FechaFin'] ?>  </td>
       <td width="50px"><a style="color:black" href="#RetirarA" onclick="RetiroAlumnos(<?php echo $registros['idalumnos'].",".$registros['IDConfiguracion']; ?>)" ><img title="Retirar Alumno" alt="" SRC="../wp-content/uploads/2015/10/quitarusuario.png" width="30px"/></a></td>
         

    <?php
    } ?>
 </tbody>                             
     </table>           
              
              
              
              
              
  </div>
      

     </center>
     <div id="PopU"></div>
          </BODY>

</html>


<?php  

}