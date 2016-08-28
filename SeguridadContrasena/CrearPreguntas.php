<html lang="es-ES" xml:lang="es-ES">
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
       <script src="../Marketing/js/validaciones.js" type="text/javascript"></script>
        <script src="../js/bootstrap.min.js" type="text/javascript"></script>
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

 $user = $_GET["idUsuario"];
    
 ?>
  <form method="post" id="formularioCrear">

        <fieldset>
        <legend>Crear Pregunta de Seguridad</legend>
    <input type="Hidden"  name="MetodoE" value="CrearPregunta" />
        <div class="editor-label">
                <label>Pregunta</label>
        </div>
        <div class="editor-field">
         <input type="text" name="Descripcion" class="validarcampos" />
        </div>
        
        <p>
            <input type="button" class="btn btn-primary" value="Guardar" onclick="CrearPregunta()" />
        </p>

         </fieldset>
    </form>
          </body>
</html>

<?php
 }
 ?>