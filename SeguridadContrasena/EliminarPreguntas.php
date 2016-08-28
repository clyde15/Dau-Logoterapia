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
 
  $query = " SELECT `Descripcion` FROM `preguntas` WHERE `idPreguntas` = $idPreguntas";

 $resultados = $conexion->query($query);
 $registros = $resultados->fetch_array();

$descripcion = $registros['Descripcion'];

    
 ?>

 <form method="post" id="formularioEliminar2">

 <input type="Hidden"  name="MetodoE" value="EliminarPregunta" />
 <input type="Hidden"  name="idPreguntas" value="<?php echo $idPreguntas; ?>" />
 <table>
     <Th colspan="2">
         <div>
             <p align="left">Esta a punto de eliminar la pregunta de seguridad "<?php echo $descripcion; ?> " , �Esta usted seguro?</p>
         </div>
     </Th>
     <tr>
     
         <td colspan="2">
             <p align="right">
                <input type="button" value="Eliminar" onclick="EliminarPreguntas()" class="btn btn-primary"  />
                <input type="button" value="Cancelar" onclick="Cancelar()" class="btn btn-primary"  />
             </p>
         </td>
     </tr>
 </table>

    </form>

    </body>
</html>
<?php }?>