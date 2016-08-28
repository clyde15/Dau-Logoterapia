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
          $idresp = $_SESSION['Responsable'];
         
         $idconfiguracion = $_GET["idconfiguracion"];
         $inscritos = $_GET["inscritos"];
         $minimo = $_GET["minimo"];
            
 ?>

<!-- Modal -->
<html lang="es-ES" xml:lang="es-ES">
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
        <script src="../js/bootstrap.min.js" type="text/javascript"></script>
         <script src="js/Diplomados.js" type="text/javascript"></script>
       <link rel="stylesheet" href="../css/bootstrap.css" media="all"/>
        <script src="../Marketing/js/Validaciones.js" type="text/javascript"></script>
  </head>
    <body>

    <form method="post" id="SolicitarAutorizacion">
   <input type="Hidden"  name="MetodoE" value="SolicitarAutorizacion" />
   <input type="Hidden"  name="idusuarios" value="<?php echo $idresp ?>" />
   <input type="Hidden"  name="inscritos" value="<?php echo $inscritos ?>" />
   <input type="Hidden"  name="idconfiguracion" value="<?php echo $idconfiguracion ?>" />
   <input type="Hidden"  name="minimo" value="<?php echo $minimo ?>" />
   <table border="1px" class="table table-striped table-hover table-bordered table-condensed">
           <tr>
               <th colspan="2">No se le puede dar inicio al Diplomado/Formacion sin la autorizacion del Gerente General ¿Desea Solicitar la autorizacion?</th>
           </tr>
           <tr>
               <td><div>Motivo de Solicitud</div></td>
               <td><textarea id="observacion" name="Observacion" class="validarcampos" style="margin: 0px 0px 10px; width: 471px; height: 67px;resize: none"></textarea></td> 
           </tr>
           <tr>               
               <td colspan="2"><p align="center"><input type="button" value="Solicitar Autorizacion" class="btn btn-primary" onclick="SolicitarAutorizacion()" />   <input type="button" value="Cancelar" class="btn btn-primary" onclick="Cancelar()" /></p></p></td>
           </tr>
       </table> 
  </form>
        
        
</body>

</html>

<?php

   }
     
 ?>