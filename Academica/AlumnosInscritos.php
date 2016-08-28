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

 $ID = $_GET["ID"];
 $Tipo = $_GET["TipoListado"];


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

      <table  class="tablesorter table table-striped table-hover table-bordered table-condensed" id="TablaColoreada">  
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
            Nombre 
           </th>        
            <th>Apellido</th>

            <th>DNI</th>
            <th>Telefono</th>
            <th>Correo</th>
            <th>Estado</th>
            <th></th>
     
    </tr>   
 </thead>
        <tbody>
   <?php   
if ($Tipo == "D") {
    $query = "SELECT Estado.ID_Configuracion,A.idalumnos,A.Nombres,A.Apellidos,A.DNI,A.Telefono,A.Correo,CASE WHEN Estado.Estado IS NULL OR Estado.Estado = "."''"." THEN 'Inscrito' ELSE Estado.Estado END as Estado FROM logoterapia.diplomados D INNER JOIN logoterapia.configuraciones C ON C.ID_Diplomado = D.iddiplomados INNER JOIN logoterapia.pagos P ON P.ID_Configuracion = C.IDConfiguracion INNER JOIN logoterapia.alumnos A ON A.idalumnos = P.ID_Alumno LEFT JOIN (SELECT ID_Configuracion,ID_Alumno, CASE WHEN Solicitado = 1 AND DeBaja = 0 THEN "."'Solicitud de retiro a espera de Aprobación'"." WHEN Solicitado = 0 AND DeBaja = 1 THEN 'Retirado' END as Estado FROM logoterapia.alumnosdebaja) as Estado ON Estado.ID_Alumno = A.idalumnos WHERE D.iddiplomados ='$ID'";
} else{
    
    $query = "SELECT Estado.ID_Configuracion,A.idalumnos,A.Nombres,A.Apellidos,A.DNI,A.Telefono,A.Correo,CASE WHEN Estado.Estado IS NULL OR Estado.Estado = "."''"." THEN 'Inscrito' ELSE Estado.Estado END as Estado FROM logoterapia.formacion F INNER JOIN logoterapia.configuraciones C ON C.ID_Formacion = F.idformaciones INNER JOIN logoterapia.pagos P ON P.ID_Configuracion = C.IDConfiguracion INNER JOIN logoterapia.alumnos A ON A.idalumnos = P.ID_Alumno LEFT JOIN (SELECT ID_Configuracion,ID_Alumno, CASE WHEN Solicitado = 1 AND DeBaja = 0 THEN "."'Solicitud de retiro a espera de Aprobación'"." WHEN Solicitado = 0 AND DeBaja = 1 THEN 'Retirado' END as Estado FROM logoterapia.alumnosdebaja) as Estado ON Estado.ID_Alumno = A.idalumnos WHERE F.idformaciones = '$ID'";
}
   
    
   
    $resultados = $conexion->query($query);

    while( $registros = $resultados->fetch_array()){
     ?>
      <tr>
         <td> <?php echo $registros['Nombres'] ?>  </td>
         <td> <?php echo $registros['Apellidos'] ?>  </td>
         <td> <?php echo $registros['DNI'] ?>  </td>
         <td> <?php echo $registros['Telefono'] ?>  </td>
         <td> <?php echo $registros['Correo'] ?>  </td>
         <td> <?php echo $registros['Estado'] ?>  </td>

                <td width=35px'">
         <?php 
             
        if (trim($registros['Estado']," ") != "Inscrito") {
      
  
             echo  "<a style="."'color:black'"." href="."'#DetalleD'"."  id="."'nestedGrow'"." onclick="."'CargarVista(".$registros['idalumnos'].",".$registros['ID_Configuracion'].")'>"." <img title="."'Detalle de Retiro'"." alt=''"."SRC="."'../wp-content/uploads/2015/10/enfocar.png'"." width="."'30px'"."/></a>";
        }     
?>
         </td>  
         
      </tr>
      <tr id="tr<?php echo $registros['idalumnos']; ?>" style="display: none" >
          
          <td id="td<?php echo $registros['idalumnos']; ?>"  colspan="7">
              <div id="target<?php echo $registros['idalumnos']; ?>"></div>
              
          </td>

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