<html lang="es-ES" xml:lang="es-ES">
    <head>
                <script src="../js/jquery-1.8.2.js" type="text/javascript"></script>

        <script src="../js/jquery.ui.js" type="text/javascript"></script>

        <link rel="stylesheet" href="../js/jquery-ui.css" media="all" type="text/css"  />
       <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
        <script src="../js/bootstrap.min.js" type="text/javascript"></script>
       <link rel="stylesheet" href="../css/bootstrap.css" media="all"/>
       <script src="../Marketing/js/Validaciones.js" type="text/javascript"></script>
       <script src="../Marketing/js/InscripcionesFormaciones.js" type="text/javascript"></script>
    </head>
  <BODY style=" background-color:transparent">


 <?php   
 error_reporting(0);
 session_start();

 
 $varsession = $_SESSION['User'];
 $idresp = $_SESSION['Responsable'];
     if ($varsession == NULL || $varsession =='') {
    
    echo $varsession;
    echo 'usuario no logueado por favor validar con el administrador';
    
    
}else{

  $idresp = $_SESSION['Responsable'];
   include_once '../Conexion.php';
   
  $query = "SELECT * FROM `usuarios` WHERE `idusuarios` = $idresp";
  $resultados = $conexion->query($query);
  $registros = $resultados->fetch_array();
  
  $fecha = date("d/m/y");


 ?>
     <link rel="stylesheet" href="../css/bootstrap.css" media="all" type="text/css"  />
     <link rel="stylesheet" href="../css/grids.css" media="all" type="text/css"  />  
 
      <form method="post" id="FormularioBuscar" align="center">
          <input type="Hidden"  name="MetodoE" value="BuscarInteresadoFormacion" />
              <center>
          <table>
              <tr>
                  <td>DNI: </td>
                  <td><input type="text" name="DNI" id="DNI" value=""  onkeypress="return isNumberKey(event)" onkeyup="ValidarCampo()"/></td>
                  <td><p><input type="button" value="Buscar" id="BuscarInteresadoDNI" class="btn btn-primary"  onclick="BuscarInteresado()"  /></p></td>
                  <td><p><input type="button" value="Limpiar" class="btn btn-primary"  onclick="Limpiar()"  /></p></td>
              </tr>              
          </table>
                  </center>
    </form>
   <form method="post" id="NoCumpleRequisitos" align="center">
              <center>
          <table>
              <tr>
                  <td><p style="color: red">El Usuario no cumple con los requesitos para inscribir una formacion</p></td>
              </tr>     
               <tr>
                  <td><p style="color: red">     * Tiene que haber cursado por lo menos un diplomado</p></td>
              </tr>  
               <tr>
                  <td><p style="color: red">     * Puede cursar en paralelo un Diplomado y una Formacion</p></td>
              </tr> 
               <tr>
                  <td><p style="color: red">Para proceder con la inscripcion en la formacion, por favor inscribirse en un diplomado</p></td>
              </tr> 
              <tr>
                  <td><p align="center"><input type="button" value="Inscribir Diplomado" class="btn btn-primary"  onclick="Diplomado()"  /></p></td>
              </tr> 
          </table>
                  </center>
    </form>
      <center>  
      <form method="post" id="FormularioInscripcionFormacion" >
      <input type="Hidden"  name="MetodoE" value="GuardarAlumno" />
      <input type="Hidden"  name="idresponsable" id="idresponsable" value="<?php echo $idresp;?>" />
      <input type="Hidden"  name="usuarioresponsable" id="usuario" value="<?php echo $registros['usuario'];?>" />
      <table>
          <tr>
              <td colspan="3"><legend>Formulario de Inscripcion Formaciones</legend></td>
              <td>
                    <div class="editor-label">
                              <label>Fecha Registro</label>
                              <input type="text" name="fecharegistro" id="fecharegistro" value="<?php echo $fecha;?>" class="validarcampos"/>
                           </div> 
              </td>
          </tr>
          <tr><td colspan="5"><legend>Datos Personales</legend></td></tr>
          <tr>
            <fieldset>
                
                <td>
                   <div class="editor-label">
                       <label>Nombres <strong style="color: red">*</strong></label>
                  <input type="text" name="nombres" id="nombres" class="validarcampos"/>
                 </div>  
                </td>
                <td>
                    <div class="editor-label">
                    <label>Apellidos <strong style="color: red">*</strong></label>
                  <input type="text" name="Apellidos" id="Apellidos" class="validarcampos" />
                 </div> 
                </td>
                <td>
                    <div class="editor-label">
                    <label>DNI <strong style="color: red">*</strong></label>
                  <input type="text" name="DNI" id="DNIre" class="validarcampos" />
                 </div> 
                </td>
              <td>
                    <div class="editor-label">
                    <label>Fecha Nacimiento <strong style="color: red">*</strong></label>
                    <input type="text" name="nacimiento" id="fechanacimiento" class="validarcampos" />
                   </div> 
                </td>
            </fieldset>
          </tr>
          <tr>
              <td colspan="5">
                    <div class="editor-label">
                    <label>Direccion <strong style="color: red">*</strong></label>
                    <textarea type="text" name="direccion" id="direccion" style="margin: 0px 0px 10px; width: 819px; height: 50px;resize: none;border: none;" class="validarcampos"></textarea>
                   </div> 
                </td>
          </tr>
          <tr><td colspan="5"><legend>Contacto</legend></td></tr>
      <tr>
              <td>
                    <div class="editor-label">
                    <label>Telefono Casa <strong style="color: red">*</strong></label>
                    <input type="text" name="numerocasa" id="numerocasa" class="validarcampos" onkeypress="return isNumberKey(event)" />
                   </div> 
                </td>
              <td>
                    <div class="editor-label">
                    <label>Celular <strong style="color: red">*</strong></label>
                    <input type="text" name="celular" id="celular"  class="validarcampos" onkeypress="return isNumberKey(event)"/>
                   </div> 
                </td>
                <td>
                    <div class="editor-label">
                    <label>Usuario Skype <strong style="color: red">*</strong></label>
                    <input type="text" name="skype" id="skype" class="validarcampos"/>
                   </div> 
                </td>
              <td>
                    <div class="editor-label">
                    <label>Email <strong style="color: red">*</strong></label>
                    <input type="text" name="Correo" id="Correo1" class="validarcampos"/>
                   </div> 
                </td>
          </tr>
          <tr>
              <td colspan="5" id="formacocul"><legend>Formaciones <strong style="color: red">*</strong></legend></td>
              <td colspan="3" id="Interes"><legend>Formaciones de Interes:</legend></td>
          </tr>
          <tr>
              <?php
                $querypart = "SELECT C.IDConfiguracion, I.`FechaInicio`, I.`FechaFin`, D.`Nombre`, D.`Descripcion`, DATE(C.`FechaInicio`) as Inicio, DATE(C.`FechaFin`) as Fin FROM `configuraciones` C INNER JOIN `inscripciones` I on C.`IDConfiguracion` = I.`ID_Configuracion` INNER JOIN formacion D on C.`ID_Formacion` = D.`idformaciones` WHERE C.Activo = 1 AND (CURDATE() >= I.`FechaInicio`AND CURDATE() <= I.`FechaFin`)";
                $Formacion = $conexion->query($querypart);                 
                ?>
              <td colspan="5" id="form">
                <div class="editor-field" id="idconfiguracion" class="validarcampos">
                  <ul>
                      <?php

                      while( $resultadosFormaciones = $Formacion->fetch_array()){
                          $idconfi = $resultadosFormaciones['IDConfiguracion'];
                       ?>
                              <?php
                                $querypart = "SELECT D.nombre FROM participacion as P INNER JOIN diassemana as D on P.ID_DiasSemana = D.iddiassemana WHERE `ID_Configuracion`= $idconfi";

                                    $resultadospa = $conexion->query($querypart);
                                    $resultadospa->data_seek(0); 
                                        $dias="";
                                        $Contador=0;
                                    while ($row = $resultadospa->fetch_array()) {
                                        $dias .= $row['nombre'];
                                        $dias .= ",";
                                        $Contador = $Contador + 1;
                                    }
                                    $dias = trim($dias, ',');
                                ?>                      
                      
                      <li title="<?php echo $resultadosFormaciones['Descripcion'] ?>" ><input type="checkbox" class="configuracion" value="<?php echo $resultadosFormaciones['IDConfiguracion'];?>" />   <?php echo $resultadosFormaciones['Nombre']?> ( Inicio: <?php echo $resultadosFormaciones['Inicio'] ; ?> - Fin: <?php echo $resultadosFormaciones['Fin'] ; ?> ) Dias Participacion: ( <?php echo $dias; ?> ) </li>
                      <?php
                      }
                      ?>
                  </ul>
                </div>
              </td>
              <td id="InteresFormacion">
                  <div class="editor-label">
                  <textarea id="Formaciones" style="margin: 0px 0px 10px; width: 389px; height: 146px; resize: none;" disabled="disabled"></textarea>
                  </div>
              </td>
          </tr>
        <tr id="ocultar">
            <td colspan="5"><legend>Metodo de Pago <strong style="color:red">*</strong></legend></td>
       </tr>
        <tr id="ocultar2">
         <td>
            <div class="editor-field">
                <select name="metodopago" id="idmetodopago" class="validarcampos">
               <option></option>
                <?php
                $query4 = "SELECT `idMetodosDePago`, `Descripcion`, `Activo` FROM `metodosdepago` WHERE `Activo` = 1";
                $resultadosP= $conexion->query($query4);
                $resultadosP->data_seek(0);
                 while( $registrosP = $resultadosP->fetch_array()){
                ?>
                   <option value="<?php echo  $registrosP['idMetodosDePago'];?>"><?php echo  $registrosP['Descripcion'];?> </option>
                <?php
                 }
                 ?>

            </select>
          </div>
         </td>  
       </tr>
       <tr id="ocultar3">
           <td colspan="2"><legend>Tipo De Pago <strong style="color:red">*</strong></legend></td>
            <td colspan="2" id="DetalleTipoPago"><legend>Detalle Tipo De Pago</legend></td>
       </tr>
        <tr id="ocultar4">
            <td colspan="2">
                        <div class="editor-field">
                           <select name="tipopago" id="tipopago"  onchange="jsFunction(this.value)" class="validarcampos">
                               <option></option>
                            <?php
                            $queryTP = "SELECT `idTipoPagos`, `Nombre`, `Activo`, `Eliminado` FROM `tipopagos` WHERE `Activo` = 1";
                            $resultadosTP= $conexion->query($queryTP);
                            $resultadosTP->data_seek(0);
                             while( $registrosTP = $resultadosTP->fetch_array()){
                            ?>
                               <option value="<?php echo  $registrosTP['idTipoPagos'];?>"><?php echo  $registrosTP['Nombre'];?> </option>
                            <?php
                             }
                             ?>

                        </select>
                      </div>
                     </td> 
                     <td id="DetallePago" colspan="1">
                              <div class="editor-label">
                                           <label>Fecha Vencimiento <strong style="color: red">*</strong></label>
                                           <input type="text" name="Vencimiento" id="Vencimiento"   />
                               </div>
                                     <div class="editor-label">
                                            <label>Frecuencia<strong style="color: red">*</strong></label>
                                            <select name="Frecuencia" id="Frecuencia" style="width: 206px;height: 20px;font-size:small;padding-top: 1px;padding-bottom: 1px;">
                                                <option></option>
                                               <?php
                                               $queryF = "SELECT `idFrecuencia`, `Descripcion`, `Valor`, `Activo` FROM `frecuencia` WHERE `Activo` = 1";
                                               $resultadosF= $conexion->query($queryF);
                                               $resultadosF->data_seek(0);
                                                while( $registrosF = $resultadosF->fetch_array()){
                                               ?>
                                                  <option value="<?php echo  $registrosF['idFrecuencia'];?>"><?php echo  $registrosF['Descripcion'];?> </option>
                                               <?php
                                                }
                                                ?>

                                           </select>
                                     </div>
                        </td>
                        <td id="DetallePago2">
                                    <div class="editor-label">
                                         <label>Fecha Inicio de Pago<strong style="color: red">*</strong></label>
                                         <input type="text" name="InicioPago" id="InicioPago"  />
                                     </div>  
                                                      <div class="editor-label">
                                        <label>Cantidad Cuotas <strong style="color: red">*</strong></label>
                                        <input type="text" name="cuotas" id="cuotas"  onkeypress="return isNumberKey(event)" />
                                      </div> 
                        </td>  
 

       </tr>
        <tr style="height: 120px;">
            <td colspan="5">&nbsp</td>
        </tr>
          <tr id="guardar">
              <td colspan="5">
                   <p align="center">
                     <input type="button"  value="Guardar" class="btn btn-primary" onclick="PostGuardarInscripcionDiplomado()" />
                   </p>
              </td>
          </tr>
          
      </table>
 
    </form>
      </center>
          </body>
</html>

<?php
 }
 ?>