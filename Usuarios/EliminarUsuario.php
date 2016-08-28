 <?php   
 error_reporting(0);
 session_start();

 
 $varsession = $_SESSION['User'];

     if ($varsession == NULL || $varsession =='') {
    
    echo $varsession;
    echo 'usuario no logueado por favor validar con el administrador';
    
    
}
     else
     {
         $iduser = $_GET["idUsuario"];
         $user = $_GET["usuario"];
     
       
 ?>

<!-- Modal -->
<html lang="es-ES" xml:lang="es-ES">
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
        <script src="../js/bootstrap.min.js" type="text/javascript"></script>
         <script src="../js/EditarUsuario.js" type="text/javascript"></script>
       <link rel="stylesheet" href="../css/bootstrap.css" media="all"/>
  </head>
    <body>

    <form method="post" id="formularioEliminar">
   <input type="Hidden"  name="MetodoE" value="Eliminar" />
   <input type="Hidden"  name="idusuarios" value="<?php echo $iduser ?>" />
  <p>Esta a punto de eliminar el usuario <?php echo $user;?> , ¿Esta usted seguro?</p>

  </form>
</body>

</html>

<?php

   }
     
 ?>