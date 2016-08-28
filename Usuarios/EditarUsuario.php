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
  
 $query = "SELECT u.idusuarios, u.nombre,u.apellido,u.usuario, u.id_perfil, u.contrasenia, u.activo FROM usuarios u WHERE  u.idusuarios = '$user' ";

 $resultados = $conexion->query($query);
 $registros = $resultados->fetch_array();

 $queryP = "SELECT descripcion,activo,eliminado,idperfiles FROM perfiles where activo=1";

 $resultadosP = $conexion->query($queryP);

    
 ?>

 <form method="post" id="formulario">

        <fieldset>
        <legend>Datos Usuario</legend>
        <input type="Hidden" name="idusuarios" value="<?php echo $registros['idusuarios'];?>" />
               <input type="Hidden" name="idresponsable" value="<?php echo $idresp;?>" />
        <input type="Hidden"  name="MetodoE" value="Editar" />
        <div class="editor-label">
                <label>Nombre</label>
        </div>
        <div class="editor-field">
         <input type="text" name="nombre1" value="<?php echo  $registros['nombre'];?>" />
        </div>
        <div class="editor-label">
                <label>Apellido</label>
        </div>
        <div class="editor-field">
         <input type="text" name="apellido" value="<?php echo  $registros['apellido'];?>" />
        </div>

        <div class="editor-label">
                <label>Usuario</label>
        </div>
        <div class="editor-field">
         <input type="text" name="usuario" value="<?php echo  $registros['usuario'];?>" />
        </div>

         <div class="editor-label">
                <label>Contrase�a</label>
        </div>
        <div class="editor-field">
         <input type="text" name="contrasenia" value="<?php echo  $registros['contrasenia'];?>" />
        </div>
        
        <div class="editor-label">
                <label>Perfil</label>
        </div>
        <div class="editor-field">
            <select name="perfil">
<?php
 while( $registrosP = $resultadosP->fetch_array()){
?>
                 
                <?php 
     if ($registrosP['idperfiles'] == $registros['id_perfil'])
     {
                ?>
<option selected="selected"  value="<?php echo  $registrosP['idperfiles'];?>"><?php echo  $registrosP['descripcion'];?> </option>
<?php
     }else{
         ?>
         <option value="<?php echo  $registrosP['idperfiles'];?>"><?php echo  $registrosP['descripcion'];?> </option>
<?php
     }
     
                    ?>

<?php
 }
 ?>

            </select>
        </div>

        <div class="editor-label">
                <label>Estatus del Usuario</label>
        </div>
        <div class="editor-field">
        <input type="checkbox" name="estadoUsuariof" id="estadoUsuario" title="Al marcar el check, el usuario se activara al momento de guardar"
        <?php
        if ($registros['activo'] == true)
        {
        	
        ?>
        checked
        <?php
        }
        ?>
          />
        </div>

        <p>
            <input type="button" value="Guardar" onclick="Editar()" />
        </p>
    </fieldset>
    </form>

    </body>
</html>
<?php }?>