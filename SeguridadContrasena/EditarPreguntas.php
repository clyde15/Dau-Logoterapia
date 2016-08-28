<html lang="es-ES" xml:lang="es-ES">
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
        <script src="../js/bootstrap.min.js" type="text/javascript"></script>
        <script src="../Marketing/js/validaciones.js" type="text/javascript"></script>
        <script src="../js/EditarPreguntaSeguridad.js" type="text/javascript"></script>
       <link rel="stylesheet" href="../css/bootstrap.css" media="all"/>
       
    </head>
    <body>


 <?php   
 error_reporting(0);
 session_start();

 
 $varsession = $_SESSION['User'];

     if ($varsession == NULL || $varsession =='') {
    
    echo $varsession;
    echo 'usuario no logueado por favor validar con el administrador';
    
    
}else{

    
 include_once '../Conexion.php';

 $idPreguntas = $_GET["idPreguntas"];

 $query = "SELECT * FROM preguntas p WHERE p.idPreguntas = '$idPreguntas' ";

 $resultados = $conexion->query($query);
 $registros = $resultados->fetch_array();

 $queryP = "SELECT descripcion,activo,eliminado,idperfiles FROM perfiles where activo=1";

 $resultadosP = $conexion->query($queryP);

    
 ?>

 <form method="post" id="formulario">

        <fieldset>
        <legend>Pregunta de Seguridad</legend>
        <input type="Hidden" name="idPreguntas" value="<?php echo $registros['idPreguntas'];?>" />
        <input type="Hidden"  name="MetodoE" value="EditarPregunta" />
        <div class="editor-label">
                <label>Pregunta</label>
        </div>
        <div class="editor-field">
         <input type="text" name="Descripcion" class="validarcampos" value="<?php echo  $registros['Descripcion'];?>" />
        </div>
      
        <p>
            <input type="button" value="Guardar" class="btn btn-primary" onclick="EditarPregunta()" />
        </p>
    </fieldset>
    </form>

    </body>
</html>
<?php }?>