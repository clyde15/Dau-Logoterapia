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


 $query = "SELECT * FROM usuarios u WHERE u.idusuarios = '$idresp' ";

 $resultados = $conexion->query($query);
 $registros = $resultados->fetch_array();

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
    <form method="post" id="formularioCambiarContrasena" align="center">

        <fieldset>
        <legend>Cambio de Contrasena</legend>
         <input type="Hidden" name="idusuario" value="<?php echo $idresp;?>" />
        <input type="Hidden"  name="MetodoE" value="CambiarContrasena" />

       <div class="editor-label">
                <label>Contrasena Actual</label>
        </div>
        
        <div class="editor-field">
            <input type=password name="actual" />
        </div>
         <div class="editor-label">
                <label>Contrasena Nueva</label>
        </div>
        
        <div class="editor-field">
            <input type=password name="nueva" id="nueva"/>
        </div>
         <div class="editor-label">
                <label>Confirmar Contrasena Nueva</label>
        </div>
        
        <div class="editor-field">
            <input type=password name="confirmarnueva" id="confirmarnueva" onkeyup="ValidarContrasena()" >  <label style="color:red"  id="mensaje">La Contrasena no coincide</label>
        </div>
      
        <p>
            <input type="button" value="Guardar" id="CambioContrasena" class="btn btn-primary" onclick="CambiarContrasena()" />
        </p>
    </fieldset>
    </form>


  </BODY>

</html>


<?php  

}



?>

