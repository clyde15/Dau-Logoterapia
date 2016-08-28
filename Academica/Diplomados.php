<?php
include_once '../Conexion.php';

session_start();

error_reporting(0);

$varsession = $_SESSION['User'];



if ($varsession == NULL || $varsession =='') {
    
    echo $varsession;
    echo 'usuario no logueado por favor validar con el administrador';
    
    
}else{



?>

<html>
    <HEAD>
    
<script src="../js/jquery-1.8.2.js" type="text/javascript"></script>

 <script src="../js/jquery.ui.js" type="text/javascript"></script>
 <script src="../js/JsAcademica.js" type="text/javascript"></script>


   <link rel="stylesheet" href="../js/jquery-ui.css" media="all" type="text/css"  />
    
     <link rel="stylesheet" href="../css/bootstrap.css" media="all" type="text/css"  />
     <link rel="stylesheet" href="../css/grids.css" media="all" type="text/css"  />
     <link rel="stylesheet" href="../js/Dise.css" media="all" type="text/css"  />
  <script>
      $( function() {
          
          $("#tabs").tabs();
          
           var div = $("#tabs-1");
           var div2 = $("#tabs-2"); 
    div.load('ListadoDiplomadosActivos.php?Estado=0');
    div2.load('ListadoDiplomadosActivos.php?Estado=1');
  //popupDiv(div, "Detalle Formaciones", 500, 315);
          
      });
  </script>

    </HEAD>
    <BODY style=" background-color:transparent">

<div class="clearfloat"/>
        
        
<div align="center">
           
</div>
 
<div class="clearfloat"/>
<br />
<br />
 
<div align="center">
<p align="center"><H3>Lista de Diplomados</H3></p>        
<div class="row" aling="center">
  <div class="col-md-6 col-md-offset-3">	

<div id="tabs">
  <ul id="ListaColor">
    <li><a href="#tabs-1" style="color: #000000">Activos Recientemente</a></li>
    <li><a href="#tabs-2" style="color: #000000">Listado Completo</a></li>
  </ul>
  <div id="tabs-1">
    
  </div>
  <div id="tabs-2">
   
  </div>
</div>

</div></div>
</div>

<a name="DetalleD"></a>
<div id="DetalleDiplomado">
</div>
  </BODY>

</html>


<?php  

}



?>