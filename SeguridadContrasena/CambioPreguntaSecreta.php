<?php
    include_once '../Conexion.php';

session_start();

error_reporting(0);

$varsession = $_SESSION['User'];

 $idresp = $_SESSION['Responsable'];

if ($varsession == NULL || $varsession =='') {
    
    echo $varsession;
    echo 'usuario no logueado por favor validar con el administrador';
    
    
}else{

include_once '../Conexion.php';


 $query = "SELECT * FROM preguntarespuesta u WHERE u.idusuario = '$idresp' ";

 $resultados = $conexion->query($query);
 $registros = $resultados->fetch_array();

 //$queryP = "SELECT Descripcion,idPreguntas FROM preguntas where Activo=1";

 //$resultadosP = $conexion->query($queryP);

 ?>
<html>
    <HEAD>
<script src="../js/jquery-1.8.2.js" type="text/javascript"></script>

 <script src="../js/jquery.ui.js" type="text/javascript"></script>
 <script src="../js/EditarPreguntaSeguridad.js" type="text/javascript"></script>

   <link rel="stylesheet" href="../js/jquery-ui.css" media="all" type="text/css"  />
    
     <link rel="stylesheet" href="../css/bootstrap.css" media="all" type="text/css"  />
     <link rel="stylesheet" href="../css/grids.css" media="all" type="text/css"  />

</HEAD>
    <BODY style=" background-color:transparent">
    <form method="post" id="formularioCambiarPregunta" align="center">

        <fieldset>
        <legend>Pregunta De Seguridad</legend>
        <input type="Hidden" name="idPreguntasresp" value="<?php echo $registros['idpreguntarespuesta'];?>" />
        <input type="Hidden" name="idusuario" value="<?php echo $idresp;?>" />
        <input type="Hidden"  name="MetodoE" value="CambiarPregunta" />
         <div class="editor-label">
                <label>Pregunta De Seguridad</label>
        </div>
        <div class="editor-field">
            <select name="pregunta">
<?php
 $queryPreguntas = "SELECT * FROM preguntas where Activo=1";

 $resultadosPreguntas = $conexion->query($queryPreguntas);
 $resultadosPreguntas->data_seek(0);
 
 while( $registrosPreguntas = $resultadosPreguntas->fetch_array()){
?>
                 
             <option value="<?php echo  $registrosPreguntas['idPreguntas'];?>"><?php echo  $registrosPreguntas['Descripcion'];?> </option>       
             
        <?php
     }
     $resultadosPreguntas->data_seek(0);
    ?>

            </select>
        </div>
     <div class="editor-label">
                <label>Respuesta</label>
        </div>
        
        <div class="editor-field">
            <input type=password name="respuesta" value="<?php echo $registros['respuesta'];?>"/>
        </div>
      
        <p>
            <input type="button" value="Guardar" class="btn btn-primary" onclick="CambiarPregunta()" />
        </p>
    </fieldset>
    </form>


  </BODY>

</html>


<?php  

}



?>


