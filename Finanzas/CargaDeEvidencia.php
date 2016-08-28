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
     
 ?>

            
    <form method="post" enctype="multipart/form-data" id="formularioRegistrarEvidencia">

        <fieldset>
        <legend>Registrar Evidencia/Factura</legend>
        <input type="Hidden" name="idSolicitudes" id="idSolicitudes" value="<?php echo $idSolicitudes?>" />
        <input type="Hidden"  name="MetodoE" value="RegistrarEvidencia" id="MetodoE" />
        <div class="editor-label">
                <label>Descripcion de la Evidencia</label>
        </div>
        <div class="editor-field">
            
                 <input type="text" name="Descripcion" id="Descripcion" value="" />
            
        </div>
        
     <div class="editor-label">
                <label>Cargar Archivo</label>
        </div>
        <div class="editor-field">
            
            <input type="file" name="Archivo" id="Archivo" value="" />
       
        </div>
        <p>
            <input type="button" value="Guardar" class="btn btn-primary" onclick="RegistrarEvideciajs()" />
        </p>
    </fieldset>
    </form>
        <div id="mensaje"></div>
    </body>
</html>
<?php }?>