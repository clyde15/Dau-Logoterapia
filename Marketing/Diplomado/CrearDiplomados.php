<html lang="es-ES" xml:lang="es-ES">
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
        <script src="../../js/bootstrap.min.js" type="text/javascript"></script>
       <link rel="stylesheet" href="../../css/bootstrap.css" media="all"/>
         <script src="../../Marketing/js/Diplomados.js" type="text/javascript"></script>
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

    
 include_once '../../Conexion.php';
    
 ?>
  <form method="post" id="FormulalrioCrearDiplomado">

        <fieldset>
        <legend>Crear Diplomado</legend>
    <input type="Hidden"  name="MetodoE" value="CrearDiplomado" />
        <div class="editor-label">
                <label>Nombre</label>
        </div>
        <div class="editor-field">
         <input type="text" name="Nombre"  />
        </div>
        <div class="editor-label">
            <label>Descripcion</label>
        </div>
        <div class="editor-field">
         <input type="text" name="Descripcion"  />
        </div>
        
        <p>
            <input type="button" value="Guardar" onclick="POSTCreardiplomado()" />
        </p>

         </fieldset>
    </form>
          </body>
</html>

<?php
 }
 ?>