<html lang="es-ES" xml:lang="es-ES">
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
        <script src="../js/bootstrap.min.js" type="text/javascript"></script>
         <script src="../js/EditarUsuario.js" type="text/javascript"></script>
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
 $idresp = $_SESSION['Responsable'];
 $queryP = "SELECT descripcion,activo,eliminado,idperfiles FROM perfiles where activo=1";

 $resultadosP = $conexion->query($queryP);

    
 ?>
  <form method="post" id="formularioCrear">

        <fieldset>
        <legend>Crear Usuario</legend>
    <input type="Hidden"  name="MetodoE" value="Crear" />
    <input type="Hidden" name="idresponsable" value="<?php echo $idresp;?>" />
        <div class="editor-label">
                <label>Nombre</label>
        </div>
        <div class="editor-field">
         <input type="text" name="nombre1"  />
        </div>
        <div class="editor-label">
                <label>Apellido</label>
        </div>
        <div class="editor-field">
         <input type="text" name="apellido"  />
        </div>

        <div class="editor-label">
                <label>Usuario</label>
        </div>
        <div class="editor-field">
         <input type="text" name="usuario"  />
        </div>

         <div class="editor-label">
                <label>Contrase�a</label>
        </div>
        <div class="editor-field">
         <input type="password" name="contrasenia"/>
        </div>

         <div class="editor-label">
                <label>Perfil</label>
        </div>
        <div class="editor-field">
            <select name="perfil">
<?php
 while( $registrosP = $resultadosP->fetch_array()){
?>
                 
               
<option value="<?php echo  $registrosP['idperfiles'];?>"><?php echo  $registrosP['descripcion'];?> </option>


<?php
 }
 ?>

            </select>
        </div>
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
 ?>

            </select>
        </div>
     <div class="editor-label">
                <label>Respuesta</label>
        </div>
        <div class="editor-field">
            <input type=text name="respuesta"/>
        </div>
    
    
        <p>
            <input type="button" value="Guardar" onclick="CrearU()" />
        </p>

         </fieldset>
    </form>
          </body>
</html>

<?php
 }
 ?>