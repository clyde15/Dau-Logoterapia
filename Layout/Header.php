<?php

    include_once '../Conexion.php';

    session_start();

    error_reporting(0);

    $varsession = $_SESSION['User'];


    if ($varsession == NULL || $varsession =='') {
    
        echo $varsession;
        echo 'usuario no logueado por favor validar con el administrador';
    
    
    }else{
        $nombre = $_SESSION['NombreCompleto'];
        $perfil = $_SESSION['ID_Perfil'];
        $apellido = $_SESSION['Apellido'];       
?>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">


<head>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title> </title>

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
          <div class="col-md-7" style="padding-left: 0px; padding-right: 20px;">
           <p ALIGN=right style="border:none"><font Size="5px" Color="Black" ><right><strong>Sistema Académico Instituto Peruano De Logoterapia Viktor Frankl</strong></right></font></p> 
            <p ALIGN="right" style="border:none"><label ><strong><?php echo 'Bienvenido '.$nombre.'  '.$apellido ?></strong></label> <a title="Salir del Sistema" href="../CerrarSession.php" onMouseover="this.style.color='red'" onMouseout="this.style.color='black'">[Desconectar]<a/>  <img src="../wp-content/uploads/2015/10/salir-de-mi-perfil-icono-3964-48.png" style="width: 30px;"/></p>
          </div>
    </div>
</div>
</body>

</html>

 <?php  
    }

 ?>

