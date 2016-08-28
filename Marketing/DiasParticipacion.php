<html lang="es-ES" xml:lang="es-ES">
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
        <script src="../js/bootstrap.min.js" type="text/javascript"></script>
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

    
 include_once '../Conexion.php';

 $IDConfiguracion = $_GET["IDConfiguracion"];




  $queryP = "SELECT `idDiasSemana`, `Nombre`, `Activo` FROM `diassemana` WHERE `Activo` = 1";


 $resultadosP = $conexion->query($queryP);

 

    
 ?>

 <form method="post" id="Participacion">

        <fieldset>
        <legend>Dias de Participacion</legend>
        <input type="Hidden" name="IDConfiguracion" id="IDConfiguracion" value="<?php echo $registros['idperfiles'];?>" />
        <input type="Hidden"  name="MetodoE" value="Editar" id="MetodoE" />
                
        <div class="editor-field" id="DiasParticipacion">
  <ul>
    
      <?php
                        while ($registrosP = $resultadosP->fetch_array())  
                        { 
                            ?>
                             <li> 
                            <?php
                            $iddiasemana = $registrosP['idDiasSemana'];
                            
                             $query = "SELECT COUNT(ID_DiasSemana) as Cantidad FROM `participacion` WHERE `ID_Configuracion` = '$IDConfiguracion' AND `ID_DiasSemana` = '$iddiasemana'";
                               $resultados = $conexion->query($query);
                               $resultados->data_seek(0);
                               $resultados2 = $resultados->fetch_array();
                               
                               if ($resultados2['Cantidad'] == 0)
                               {
                                 ?>
                                      <input type="checkbox"  value="<?php echo $registrosP['idDiasSemana'] ?>"  class="dias"> <?php echo $registrosP['Nombre'] ?>   
                                <?php 
                               }else{
                                ?>
                                     <input type="checkbox" checked="checked" value="<?php echo $registrosP['idDiasSemana'] ?>"  class="dias"> <?php echo $registrosP['Nombre'] ?>
                                <?php

                            }    
                            ?>
                           </li>
                            <?php
                            
                        }
                                          
                                       ?>  
          
 </ul>



        </div>

        <p>
            <input type="button" value="Guardar" class="btn btn-primary" onclick="POSTParticipacion(<?php echo $IDConfiguracion;?>)" />
        </p>
    </fieldset>
    </form>

    </body>
</html>
<?php }?>
