<html lang="es-ES" xml:lang="es-ES">
    <head>
                <script src="../js/jquery-1.8.2.js" type="text/javascript"></script>

        <script src="../js/jquery.ui.js" type="text/javascript"></script>

        <link rel="stylesheet" href="../js/jquery-ui.css" media="all" type="text/css"  />
       <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
        <script src="../js/bootstrap.min.js" type="text/javascript"></script>
       <link rel="stylesheet" href="../css/bootstrap.css" media="all"/>
       <script src="../Marketing/js/Validaciones.js" type="text/javascript"></script>
       <script src="../Marketing/js/Interesados.js" type="text/javascript"></script>
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
 
      <form method="post" id="FormularioInteresadoBuscar" align="center">
          <input type="Hidden"  name="MetodoE" value="BuscarInteresado" />
              <center>
          <table>
              <tr>
                  <td>DNI: </td>
                  <td><input type="text" name="DNI" id="DNI" value=""  onkeypress="return isNumberKey(event)" onkeyup="ValidarCampo()"/></td>
                  <td><p><input type="button" value="Buscar" id="BuscarInteresadoDNI" class="btn btn-primary"  onclick="BuscarInteresado()"  /></p></td>
                  <td><p><input type="button" value="Limpiar" class="btn btn-primary"  onclick="Limpiar()"  /></p></td>
                  <td><p><input type="button" value="Nuevo" class="btn btn-primary"  onclick="Nuevo()"  /></p></td>
              </tr>              
          </table>
                  </center>
    </form>
     
      <center>  
      <form method="post" id="FormularioInteresados" >
      <input type="Hidden"  name="MetodoE" value="GuardarInteresados" />
      <input type="Hidden"  name="idresponsable" id="idresponsable" value="<?php echo $idresp;?>" />
      <input type="Hidden"  name="usuarioresponsable" id="usuario" value="<?php echo $registros['usuario'];?>" />
      <table>
          <tr>
              <td colspan="3"><legend>Formulario de reserva e interesados</legend></td>
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
                    <label>Edad <strong style="color: red">*</strong></label>
                  <input type="text" name="edad" id="edad" class="validarcampos" onkeypress="return isNumberKey(event)" />
                 </div> 
                </td>
            </fieldset>
          </tr>
          <tr>
              <td>
                    <div class="editor-label">
                    <label>Profesion u Ocupacion <strong style="color: red">*</strong></label>
                    <input type="text" name="ocupacion" id="ocupacion" class="validarcampos" />
                   </div> 
                </td>

                <td>
                    <div class="editor-label">
                    <label>Distrito <strong style="color: red">*</strong></label>
                    <input type="text" name="distrito" id="distrito" class="validarcampos"  />
                   </div> 
                </td>
              <td>
                    <div class="editor-label">
                    <label>Fecha Nacimiento <strong style="color: red">*</strong></label>
                    <input type="text" name="nacimiento" id="fechanacimiento" class="validarcampos" />
                   </div> 
                </td>
          </tr>
          <tr>
              <td colspan="5">
                    <div class="editor-label">
                    <label>Direccion <strong style="color: red">*</strong></label>
                    <textarea type="text" name="direccion" id="direccion" style="margin: 0px 0px 10px; width: 819px; height: 50px;resize: none" class="validarcampos"></textarea>
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
          <tr id="diploform">
              <td colspan="2"><legend>Diplomados <strong style="color: red">*</strong></legend></td>
              <td colspan="2"><legend>Formaciones <strong style="color: red">*</strong></legend></td>
          </tr>
          <tr id="diploform2">
              <?php
                $querypart = "SELECT `iddiplomados`, `Nombre`, `Descripcion`, `Activo`, `Eliminado` FROM `diplomados` WHERE `Activo` = 1";
                $Diplomados = $conexion->query($querypart);                 
                ?>
              <td colspan="2">
                <div class="editor-field" id="iddiplomados" class="validarcampos">
                  <ul>
                      <?php

                      while( $resultadosDiplomados = $Diplomados->fetch_array()){
                       ?>
                      <li title="<?php echo $resultadosDiplomados['Descripcion'] ?>" ><?php echo $resultadosDiplomados['Nombre'] ?>   <input type="checkbox" class="diplomados" value="<?php echo $resultadosDiplomados['iddiplomados'];?>" /> </li>
                      <?php
                      }
                      ?>
                  </ul>
                </div>
              </td>
               <?php
                $queryform = "SELECT `idformaciones`, `Nombre`, `Descripcion`, `Activo`, `Eliminado` FROM `formacion` WHERE `Activo` = 1";
                $formaciones = $conexion->query($queryform);                 
                ?>
              <td colspan="2">
                <div class="editor-field" id="idformacion" class="validarcampos">
                  <ul>
                      <?php

                      while( $resultadosformaciones = $formaciones->fetch_array()){
                       ?>
                      <li title="<?php echo $resultadosformaciones['Descripcion'] ?>" ><?php echo $resultadosformaciones['Nombre'] ?>   <input type="checkbox" class="formacion" value="<?php echo $resultadosformaciones['idformaciones'];?>" /> </li>
                      <?php
                      }
                      ?>
                  </ul>
                </div>
              </td>
          </tr>
          <tr id="InformacionAdi"><td colspan="5"><legend>Informacion Adicional</legend></td></tr>
        <tr id="InformacionAdi2">
                <td colspan="3">
                    <div class="editor-label">
                    <label>Como se entero del evento</label>
                    <textarea type="text" name="observacion" id="observacion"  style="margin: 0px 0px 10px; width: 498px; height: 107px;resize: none" ></textarea>
                   </div> 
                </td>
              <td>
                    <div class="editor-label">
                    <label>Inscrito por</label>
                    <input disabled="disabled" type="text" name="usuarioresponsableS" id="usuarioresponsable" value="<?php echo  $registros['usuario'];?>" class="validarcampos"/>
                   </div> 
                </td>
        </tr>
        <tr>
            <td colspan="5">&nbsp</td>
        </tr>
          <tr id="guardar">
              <td colspan="5">
                   <p align="center">
                     <input type="button" value="Guardar" class="btn btn-primary" onclick="PostGuardarInteresados()" />
                   </p>
              </td>
          </tr>
          
          
      </table>
      <table id="informacion" hidden="hidden">
          <tr>
              <td>
                  <p style="color:red">
                    El DNI que se esta buscando ya se encuentra registrado en nuestra base de datos 
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