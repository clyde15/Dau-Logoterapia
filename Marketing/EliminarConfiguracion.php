<html lang="es-ES" xml:lang="es-ES">
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
        <script src="../js/bootstrap.min.js" type="text/javascript"></script>
        <script src="../Marketing/js/validaciones.js" type="text/javascript"></script>
        <script src="js/Diplomados.js" type="text/javascript"></script>
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

    $idresp = $_SESSION['Responsable'];
    
 include_once '../Conexion.php';


 $IDConfiguracion = $_GET["IDConfiguracion"];
 
    
 ?>

 <form method="post" id="formularioEliminarConfi">

 <input type="Hidden"  name="MetodoE" value="EliminarConfiguracion" />
 <input type="Hidden"  name="IDConfiguracion" value="<?php echo $IDConfiguracion; ?>" />
 <input type="Hidden" name="responsable" value="<?php echo $idresp;?>">
 <table>
     <Th colspan="2">
         <div>
             <p align="left">Esta usted seguro de eliminar la siguiente configuracion.?</p>
         </div>
     </Th>
     <tr>
     
         <td colspan="2">
             <p align="right">
                <input type="button" value="Eliminar" onclick="EliminarConfiguracionPOST()" class="btn btn-primary"  />
                <input type="button" value="Cancelar" onclick="Cancelar()" class="btn btn-primary"  />
             </p>
         </td>
     </tr>
 </table>

    </form>

    </body>
</html>
<?php }?>