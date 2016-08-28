<html lang="es-ES" xml:lang="es-ES">
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="../js/bootstrap.min.js" type="text/javascript"></script>
        <script src="AceptaAceptarSolicitudesAcademica.js" type="text/javascript"></script>
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

 $idSolicitudes = $_GET["idSolicitudes"];

 $query = "SELECT * FROM solicitudes where idSolicitudes = '$idSolicitudes' ";

 $resultados = $conexion->query($query);
 $registros = $resultados->fetch_array();

      
 ?>

            
 <form method="post" id="formularioRegistrarDineroEntregado">

        <fieldset>
        <legend>Registrar Dinero Entregado</legend>
        <input type="Hidden" name="idSolicitudes" id="idSolicitudes" value="<?php echo $registros['idSolicitudes'];?>" />
        <input type="Hidden"  name="MetodoE" value="RegistrarEntregaDinero" id="MetodoE" />
        <div class="editor-label">
                <label>Nombre de quien hizo entrega del dinero(Finanza)</label>
        </div>
        <div class="editor-field">
            <?php
             if ($registros['EntregaDinero']) {
                 ?>
                 <input type="text" name="NombreEntregoDinero" id="NombreEntregoDinero" disabled="disabled" value="<?php echo  $registros['NombreEntregoDinero'];?>" />
             <?php
                 }  else {
                     ?>
                 <input type="text" name="NombreEntregoDinero" id="NombreEntregoDinero" value="<?php echo  $registros['NombreEntregoDinero'];?>" />
                 <?php
                    }
            ?>
         
        </div>
        
     <div class="editor-label">
                <label>Nombre de quien recibio el dinero(Academica)</label>
        </div>
        <div class="editor-field">
            <?php
             if ($registros['EntregaDinero']) {
                 ?>
         <input type="text" name="NombreRecibioDinero" disabled="disabled" id="NombreRecibioDinero" value="<?php echo  $registros['NombreRecibioDinero'];?>" />
         <?php
                 }  else {
                     ?>
         <input type="text" name="NombreRecibioDinero" disabled="disabled" id="NombreRecibioDinero" value="<?php echo  $registros['NombreRecibioDinero'];?>" />
        <?php
                 }
        ?>
        </div>
        <p>
            <input type="button" value="Guardar" class="btn btn-primary" onclick="EntregarDinerojs()" />
        </p>
    </fieldset>
    </form>

    </body>
</html>
<?php }?>