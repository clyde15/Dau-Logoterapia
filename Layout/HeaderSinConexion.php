<?php

    include_once '../Conexion.php';
?>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">


<head>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <?php
        include ('Tittle.php');
        ?>
<script src="../js/jquery-1.8.2.js" type="text/javascript"></script>

 <script src="../js/jquery.ui.js" type="text/javascript"></script>
    <link rel="stylesheet" href="../css/grids.css" media="all" type="text/css"  />
    <link rel="stylesheet" href="../css/personalizados.css" media="all" type="text/css"  />  
    <script type='text/javascript' src='../wp-includes/js/jquery/jqueryc1d8.js?ver=1.11.3'></script>
    <script type='text/javascript' src='../js/Hora.js'></script>

</head>
<body class="prueba">



<div>
    <div class="row" >
          <div class="col-md-5" style="padding-left: 0px; padding-right: 0px;">	
              
          <p align="left" style="padding-left: 15px;"><img class="normal_logo" src="../wp-content/uploads/2015/10/logo-footer.jpg" alt="Logo" title="Logo" style="width:110; height:90px;padding-bottom: 0px;padding-top: 0px;padding-right: 0px;padding-left: 8px;border-bottom-width: 0px;border-left-width: 0px;border-top-width: 0px;border-right-width: 0px;"/>
                <br /> 
                <input type="text" id="hora" value=""style=" width: 204px;padding-bottom: 0px;padding-top: 0px;padding-right: 0px;padding-left: 8px;border-bottom-width: 0px;border-left-width: 0px;border-top-width: 0px;border-right-width: 0px;border-style: solid"/> </p>   
          </div>
    </div>
</div>
 <div class="clearfloat">

</div>
        <div>
<center>
  <?php
        include ('../SeguridadContrasena/OlvidoContrasena.php');
        ?>
</center>
</div>
</body>

</html>


