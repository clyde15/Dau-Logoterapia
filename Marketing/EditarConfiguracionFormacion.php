<html lang="es-ES" xml:lang="es-ES">
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
        <script src="../js/bootstrap.min.js" type="text/javascript"></script>
                <script src="../Marketing/js/validaciones.js" type="text/javascript"></script>
         <script src="../js/Formaciones.js" type="text/javascript"></script>
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
  $idresp = $_SESSION['Responsable'];
  
 $query = "SELECT * FROM configuraciones c WHERE  c.IDConfiguracion = '$IDConfiguracion' ";

 $resultados = $conexion->query($query);
 $registros = $resultados->fetch_array();

 $queryP = "SELECT * FROM tipo where activo=1";

 $resultadosP = $conexion->query($queryP);

    
 ?>
        <script>
                     $("#dos").datepicker({
                    changeMonth: true,
                    changeYear: true,
                    dateFormat: 'yy-mm-dd'
                });
                     $("#tres").datepicker({
                    changeMonth: true,
                    changeYear: true,
                    dateFormat: 'yy-mm-dd'
                });
        
        </script>
 <form method="post" id="formularioEditarFormacion">

        <fieldset>
        
        <input type="Hidden" name="idconfiguracion" value="<?php echo $IDConfiguracion?>" />
        <input type="Hidden" name="idresponsable" value="<?php echo $idresp;?>" />
        <input type="Hidden"  name="MetodoE" value="EditarConfiguracionFormacion" />
        
        <table>
                 <tr>
                     <td colspan="2">
                         <div>
                                <legend>Formacion</legend> 
                        </div>
                     </td>
                 </tr>
                 <tr>
                     <td>
                          <div class="editor-label">
                                    <label>Diplomado</label>
                            </div>
                            <div class="editor-field">
                                <select name="idformacion" class="validarcampos">
                                    <option></option>
                                    <?php
                                    $querydiplo = "SELECT `idformaciones`, `Nombre`, `Descripcion`, `Activo`, `Eliminado` FROM `formacion` WHERE `Activo` = 1";

                                    $resultadosdiplo = $conexion->query($querydiplo);
                                           while( $registrosd = $resultadosdiplo->fetch_array()){
                                           ?>

                                                           <?php 
                                                if ($registros['ID_Formacion'] == $registrosd['idformaciones'])
                                                {
                                                           ?>
                                           <option selected="selected"  value="<?php echo  $registrosd['idformaciones'];?>"><?php echo  $registrosd['Nombre'];?> </option>
                                           <?php
                                                }else{
                                                    ?>
                                                    <option  value="<?php echo  $registrosd['idformaciones'];?>"><?php echo  $registrosd['Nombre'];?> </option>
                                           <?php
                                                }

                                                               ?>

                                           <?php
                                            }
                                            ?>
                                </select>
                            </div>
                     </td>
                     <td colspan="2">
                                 <div class="editor-label">
                                        <label>Formacion</label>
                                </div>
                                <div class="editor-field">
                                    <select name="tipo" class="validarcampos">
                                        <option></option>
                                        <?php
                                         while( $registrosP = $resultadosP->fetch_array()){
                                        ?>

                                                        <?php 
                                             if ($registrosP['idTipo'] == $registros['ID_Tipo'])
                                             {
                                                        ?>
                                        <option selected="selected"  value="<?php echo  $registrosP['idTipo'];?>"><?php echo  $registrosP['Nombre'];?> </option>
                                        <?php
                                             }else{
                                                 ?>
                                                 <option value="<?php echo  $registrosP['idTipo'];?>"><?php echo  $registrosP['Nombre'];?> </option>
                                        <?php
                                             }

                                                            ?>

                                        <?php
                                         }
                                         ?>
                                    </select>
                                </div>
                     </td>
                 </tr>
                 <tr>
                     <td>
                            <div class="editor-label">
                                    <label>Fecha Inicio Formacion</label>
                            </div>
                            <div class="editor-field">
                             <input type="text" name="fechaini" id="dos" value="<?php echo  $registros['FechaInicio'];?>" class="validarcampos"/>
                            </div>
                     </td>
                     <td>
                            <div class="editor-label">
                                   <label>Fecha Fin Formacion</label>
                           </div>
                           <div class="editor-field">
                            <input type="text" name="fechafin" id="tres" value="<?php echo  $registros['FechaFin'];?>" class="validarcampos"/>
                           </div>
                     </td>
                 </tr>
                 <tr>
                     <td>
                            <div class="editor-label">
                                   <label>Cantidad de Modulos</label>
                           </div>
                           <div class="editor-field">
                            <input type="text" name="Cantidad" value="<?php echo  $registros['CantidadModulos'];?>" onkeypress="return isNumberKey(event)" class="validarcampos" />
                           </div>
                     </td>
                     <td>
                            <div class="editor-label">
                                  <label>Cupo Minimo</label>
                          </div>
                          <div class="editor-field">
                           <input type="text" name="minimo" value="<?php echo  $registros['CupoMinimo'];?>"  onkeypress="return isNumberKey(event)" class="validarcampos"/>
                          </div>
                     </td>
                 </tr>
                 <tr>
                     <td colspan="2">
                            <p align="center">
                                <input type="button" value="Guardar" onclick="POSTEditFormacionConfiguracion()" class="btn btn-primary" />
                                <input type="button" value="Cancelar" class="btn btn-primary" onclick="Cancelar()" />
                            </p>
                     </td>
                 </tr>
        </table>
    </fieldset>
    </form>

    </body>
</html>
<?php }?>