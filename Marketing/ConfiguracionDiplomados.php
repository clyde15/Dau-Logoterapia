<?php
    include_once '../Conexion.php';

session_start();

error_reporting(0);

$varsession = $_SESSION['User'];



if ($varsession == NULL || $varsession =='') {
    
    echo $varsession;
    echo 'usuario no logueado por favor validar con el administrador';
    
    
}else{
    $idresp = $_SESSION['Responsable'];
    
     $Curso = $_GET["EnCurso"];
     $Activos = $_GET['Activo'];
     
?>

<html>
    <HEAD>
    
     <?php
        include ('../Layout/Tittle.php');
     ?>

        <script src="../js/jquery-1.8.2.js" type="text/javascript"></script>

        <script src="../js/jquery.ui.js" type="text/javascript"></script>

        <link rel="stylesheet" href="../js/jquery-ui.css" media="all" type="text/css"  />
    
        <link rel="stylesheet" href="../css/bootstrap.css" media="all" type="text/css"  />
        <link rel="stylesheet" href="../css/grids.css" media="all" type="text/css"  />

        <script src="../js/jquery.tablesorter.pager.js" type="text/javascript"></script>
        <script src="../js/jquery.tablesorter.js" type="text/javascript"></script>

        
        <script src="js/Diplomados.js" type="text/javascript"></script>
        <script src="../Buscador/Buscador.js" type="text/javascript"></script>
<script type="text/javascript">
    
    $(document).ready(function () {

            $(".tablesorter").tablesorter({ headers: { 0: { sorter: false }, 1: { sorter: false }, 2: { sorter: false }, 3: { sorter: false }, 4: { sorter: false}, 5: { sorter: false}, 6: { sorter: false}, 7: { sorter: false}, 8: { sorter: false}, 9: { sorter: false}, 10: { sorter: false}, 11: { sorter: false}, 12: { sorter: false}, 13: { sorter: false}, 14: { sorter: false}, 15: { sorter: false}, 16: { sorter: false}, 17: { sorter: false}, 18: { sorter: false}, 19: { sorter: false}} }).tablesorterPager({ container: $("#pager"), size: $(".pagesize option:selected").val() });
        });
    
</script>

    </HEAD>
    <BODY style=" background-color:transparent">


<div class="clearfloat"/>
        
        
<div align="center">
   
<input type="text" id="filtrar" placeholder="Buscar"/>
        
</div>
 
<div class="clearfloat"/>
<br />
<br />
 
<div align="center">
    <?php 
    if ($Curso == 1){
     ?>
    <p align="center"><H3>Diplomados En Curso</H3></p>     
    <?php
    }else{
        ?>
    <p align="center"><H3>Diplomados Activos</H3></p>     
    <?php
    }
    ?>
   

</div>        

<div class="clearfloat"></div>

      <table style="font: small" class="tablesorter table table-striped table-hover table-bordered table-condensed  " >  
        <thead>  
        <tr >
            <td id="pager" colspan="19" >
           <a style="color:black" onclick="GETConfigurarDiplomado()" ><img title="Configurar Nuevo Diplomado" alt="" SRC="../wp-content/uploads/2015/10/AdmDipomado.png" width="50px"/></a>
        <center>      <form action="" style=" padding:2% 20% 0% 20%" >
                        <img src="../wp-content/Paginado/first.png" class="first" alt=""/>
                        <img src="../wp-content/Paginado/prev.png" class="prev" alt=""/>
                        <input type="text" class="pagedisplay" disabled="disabled" />
                        <img src="../wp-content/Paginado/next.png" class="next" alt=""/>
                        <img src="../wp-content/Paginado/last.png" class="last" alt=""/>
                        <select class="pagesize" style="width: 65px;">
                            <option selected="selected" value="5">5</option>
                            <option value="10">10</option>
                            <option value="15">15</option>
                            <option value="20">20</option>
                        </select>
            </form></center>

            </td>
        </tr>  
        <tr>
            <th>Nombre</th>
            <th>Descripcion</th>
            <th>Fecha Inicio</th>
            <th>Fecha Fin</th>
            <th>Modulos</th>
            <th>Min.</th>
            <th>Duracion</th>
<!--            <th>Tipo</th>
            <th>Profesor</th>
            <th>Gerente</th>-->
            <th>Dias</th>
            <th>En Curso</th>
            <th>Insc</th>
            <th>Inscritos</th>
            <th>On/Of</th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
        </tr>
     </thead>
     <tbody class="buscar">
        <?php
        if ($Curso == 1){
            $query = "SELECT C.IDConfiguracion, D.Nombre, D.Descripcion, DATE(C.FechaInicio) as FechaInicio, DATE(C.FechaFin) as FechaFin, C.CantidadModulos,C.CupoMinimo,C.EnCurso,T.Nombre as Tipo, U.Nombre as profinicial, U2.nombre as GerenteResponsable  FROM configuraciones As C INNER JOIN Diplomados AS D ON C.ID_Diplomado = D.iddiplomados INNER JOIN Tipo AS T ON C.ID_Tipo = T.idtipo INNER JOIN Profesores As U on C.ID_ProfesorInicial = U.idprofesores INNER JOIN Usuarios As U2 on C.ID_GerenteResponsable = U2.idusuarios WHERE (C.Activo = 1) AND (C.EnCurso=1)";
             $resultados = $conexion->query($query);
        }  else {
            $query = "SELECT C.IDConfiguracion, D.Nombre, D.Descripcion, DATE(C.FechaInicio) as FechaInicio , DATE(C.FechaFin) as FechaFin, C.CantidadModulos,C.CupoMinimo,C.EnCurso,T.Nombre as Tipo, U.Nombre as profinicial, U2.nombre as GerenteResponsable  FROM configuraciones As C INNER JOIN Diplomados AS D ON C.ID_Diplomado = D.iddiplomados INNER JOIN Tipo AS T ON C.ID_Tipo = T.idtipo INNER JOIN Profesores As U on C.ID_ProfesorInicial = U.idprofesores INNER JOIN Usuarios As U2 on C.ID_GerenteResponsable = U2.idusuarios WHERE (C.Activo = 1)";
             $resultados = $conexion->query($query);
        }
        while( $registros = $resultados->fetch_array()){
     ?>
      <tr>
          
         <td> <?php echo $registros['Nombre'] ?>  </td>
         <td> <?php echo $registros['Descripcion'] ?>  </td>
         <td> <?php echo $registros['FechaInicio'] ?>  </td>
         <td> <?php echo $registros['FechaFin'] ?>  </td>
         <td> <?php echo $registros['CantidadModulos'] ?>  </td>
         <td id="minimo"> <?php echo $registros['CupoMinimo'] ?>  </td>
         <?php
            $datetime1 = new DateTime($registros['FechaInicio']);
            $datetime2 = new DateTime($registros['FechaFin']);
            $interval = $datetime1->diff($datetime2);
            $iddiplomado = $registros['IDConfiguracion'];
            ?>
         <td><?php echo $interval->format('%R%a días'); ?></td>
         
<!--        <td> <?php echo $registros['Tipo'] ?>  </td>
         <td> <?php echo $registros['profinicial'] ?>  </td>
         <td> <?php echo $registros['GerenteResponsable'] ?>  </td>-->
        <?php
        $querypart = "SELECT D.nombre FROM participacion as P INNER JOIN diassemana as D on P.ID_DiasSemana = D.iddiassemana WHERE `ID_Configuracion`= $iddiplomado";

            $resultadospa = $conexion->query($querypart);
            $resultadospa->data_seek(0); 

            while ($row = $resultadospa->fetch_array()) {                
                $dias .= $row['nombre'];
                $dias .= ",";
                $Contador = $Contador + 1;
            }
            $dias = trim($dias, ',');
        ?>
         
         <td title="<?php echo $dias; ?>"><a onclick="Participacion(<?php echo $iddiplomado; ?>)" style="color: black"><?php echo $Contador;  ?></a> </td>
         <?php 
         $dias = ""; 
         $Contador =0;
         if ($registros['EnCurso'] == false)
         {
          ?>
         <td width="50px"><a  style="color:black"><center><img title="On" alt="" SRC="../wp-content/uploads/2015/10/circulo-rojo.png" width="30px"/></center></a></td>

         <?php
         }else{
             ?>
         <td width="50px"><a style="color:black"><center><img title="Off" alt="" SRC="../wp-content/uploads/2015/10/circulo-verde.png" width="30px"/></center></a></td>

         <?php   
         }
        ?> 
         
         <?php
            $queryt = "SELECT count(ID_Configuracion) as cantidad,`fechainicio`,`fechafin` FROM `inscripciones` where `ID_Configuracion` = $iddiplomado AND NOW() BETWEEN `fechainicio` AND `fechafin`";

            $resultadost = $conexion->query($queryt);
            $resultadost->data_seek(0); 
            $registros4 = $resultadost->fetch_array();
            
            if($registros4['cantidad']==0){
                ?> <td width="50px"><a style="color:black"><center><img title="Periodo de Inscripcion Inactivo" alt="" SRC="../wp-content/uploads/2015/10/circulo-rojo.png" width="30px"/></center></a></td> <?php 
            }else{
              ?> <td width="50px"><a style="color:black"><center><img title="Periodo de Inscripcion activo" alt="" SRC="../wp-content/uploads/2015/10/circulo-verde.png" width="30px"/></center></a></td> <?php  
            }                
        ?>
        <?php
            $queryins = "SELECT COUNT(`idPagos`) as inscritos FROM `pagos` P INNER JOIN `configuraciones` C on P.`ID_Configuracion` = C.`IDConfiguracion` WHERE `ID_Configuracion` = $iddiplomado";

            $resultadosins = $conexion->query($queryins);
            $resultadosins->data_seek(0); 
            $registrosinsc = $resultadosins->fetch_array();
         ?>  
           <td> <?php echo $registrosinsc['inscritos'] ?>  </td>            
        <?php 
         if ($registros['EnCurso'] == false)
         {
             $querySolicitud = "SELECT COUNT(`idAutorizacionesGerente`) as solicitud FROM `autorizacionesgerente` WHERE `ID_Configuracion` = $iddiplomado";
             $resultadosSolic = $conexion->query($querySolicitud);
             $resultadosSolic->data_seek(0); 
             $registroSolic = $resultadosSolic->fetch_array();
             
             if ($registroSolic['solicitud'] == 0)
             {
                 $solicitud = 0;
             }else{
                 $solicitud = 1;
             }
             
          ?>
           <td>
               <a style="color:black" onclick="IniciarDiplomado(<?php echo $iddiplomado ?>,<?php echo $registros['EnCurso'] ?>,<?php echo $registrosinsc['inscritos'] ?>,<?php echo $registros['CupoMinimo'] ?>,<?php echo $solicitud; ?>)" type="button"><img title="Iniciar Diplomado" alt="" SRC="../wp-content/uploads/2015/10/iniciar-la-reproduccion.png" width="30px"/></a>
            </td>         
         <?php
         }else{
             ?>
           <td>
                <a style="color:black" onclick="Detener(<?php echo $iddiplomado ?>,<?php echo $registros['EnCurso'] ?>)" type="button"><img title="Detener Diplomado " alt="" SRC="../wp-content/uploads/2015/10/iniciar-la-reproduccion.png" width="30px"/></a>
            </td>
 
         

         <?php   
         }
        ?>       
        <td width="50px"><a  class="list-group-item"  style="color:black"  onclick="InscripcionPeriodo(<?php echo $iddiplomado ?>)" ><img title="Periodo de Inscripcion" alt="" SRC="../wp-content/uploads/2015/10/inscripcion.png" width="30px"/></a></td> 
        <td width="50px"><a  class="list-group-item"  style="color:black"  onclick="DefinirProfesor(<?php echo $registros['IDConfiguracion']; ?>)" ><img title="Profesor/Coordinador/Jefe Academico" alt="" SRC="../wp-content/uploads/2015/10/profesor.png" width="30px"/></a></td> 
        <td width="50px"><a style="color:black" onclick="EditarDiplomadoConfiguracion(<?php echo $iddiplomado ?>)" ><img title="Editar" alt="" SRC="../wp-content/uploads/2015/10/System-icon.png" width="30px"/></a></td>
        <td width="50px"><a  class="list-group-item"  style="color:black"  onclick="EliminarConfiguracion(<?php echo $registros['IDConfiguracion']; ?>)" ><img title="Eliminar" alt="" SRC="../wp-content/uploads/2015/10/Trash-icon.png" width="30px"/></a></td>
          

        
      </tr>
        
    <?php
    } ?>
       
   </tbody>                        
</table>

<div id="crear"></div>
<div id="autorizar"></div>
<div id="detalle"></div>
<div id="Eliminar"></div>
  </BODY>

</html>


<?php  

}



?>
