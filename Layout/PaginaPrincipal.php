
<html>
    <head>

      <link rel="stylesheet" href="../css/bootstrap.css" media="all" type="text/css"  />
     <link rel="stylesheet" href="../css/grids.css" media="all" type="text/css"  />

  
        <?php
        include ('Tittle.php');
        ?>
      
    </head>
    <body>
        <div style="position:relative;">
        <?php
        include ('Header.php');
        ?>
</div>
<div class="clearfloat" >
     
</div>
        <div>
         <?php
            include ('menu.php');
         ?>
</div>

<div class="clearfloat">
  
</div>
        <div>
            <?php

//include ('../Finanzas/Diplomados-Formaciones.php'); 

//        include_once '../Conexion.php';
//         $idperil = $_SESSION['ID_Perfil'];
//      
//      $queryPerfil = "select Descripcion from perfiles where idperfiles='$idperil'";
//      
//      $resultadosPerfil = $conexion->query($queryPerfil);
//      
//      $registrosPerfil = $resultadosPerfil->fetch_array();
//
//      if (strpos($registrosPerfil['Descripcion'], 'Administrador') !== false) {
//
//          
//          
//      }else if (strpos($registrosPerfil['Descripcion'], 'Finanza') !== false) 
//      {
//         //include ('../Finanzas/Diplomados-Formaciones.php'); 
//       include ('menu.php');
//          
//      }
        ?>
<center>
<!--    <div id="CPagina" width="100%" height="100%">
        
    </div>-->
    <iframe name="principal" scrolling="auto" frameborder="0" width="100%" height="100%" >
        
  
        
    </iframe>
</center>
</div>


   </body>
</html>
