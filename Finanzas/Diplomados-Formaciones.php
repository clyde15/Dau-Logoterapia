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

 <script>
  $( function() {
    $( "#tabs" ).tabs();
  } );
  </script>

 <script src="../js/jquery.ui.js" type="text/javascript"></script>
 <script src="../js/TabsDiplomadosFormacionesPagos.js" type="text/javascript"></script>
<script src="../js/Buscador.js" type="text/javascript"></script>
   <link rel="stylesheet" href="../js/jquery-ui.css" media="all" type="text/css"  />
    
        <link rel="stylesheet" href="../css/bootstrap.css" media="all" type="text/css"  />
     <link rel="stylesheet" href="../css/grids.css" media="all" type="text/css"  />
 

 
 
</head>
<body style=" background-color:transparent">
<center>
<div id="tabs" style=" background-color:transparent; border:0; ">
    <ul style="background-color:#72A3D0; border-color:#72A3D0; width:400px; height: 40px">
    <li><a href="#Diplomados">Diplomados</a></li>
    <li><a href="#Formaciones">Formaciones</a></li>

  </ul>
        <div id="Diplomados">
    
  </div>
  <div id="Formaciones">
    
  </div>

  
  
</div>
  
    </center>
 
 
</body>

</html>


<?php  

}



?>