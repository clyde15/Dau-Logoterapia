<html lang="es-ES" xml:lang="es-ES">
    <head>
        
       <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
        <script src="../js/bootstrap.min.js" type="text/javascript"></script>
       
       <link rel="stylesheet" href="../css/bootstrap.css" media="all"/>
       <script src="../Marketing/js/validaciones.js" type="text/javascript"></script>
        <script src="../Marketing/js/Diplomados.js" type="text/javascript"></script>
    </head>
    <body>


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

 $queryt = "SELECT idtipo, Nombre FROM tipo where Activo=1";

 $resultadost = $conexion->query($queryt);

    
 ?>
     <link rel="stylesheet" href="../css/bootstrap.css" media="all" type="text/css"  />
     <link rel="stylesheet" href="../css/grids.css" media="all" type="text/css"  />  


  <form method="post" id="formularioCrearConfiguracionDiplomado" >
    <input type="Hidden"  name="MetodoE" value="ConfigurarDiplomado" />
    <input type="Hidden" name="idresponsable" id="idresponsable" value="<?php echo $idresp;?>" />
      <table>
          <tr>
              <td colspan="3"><legend>Configurar Diplomado</legend></td>
          </tr>
          <tr>
              <td>       
                  <div class="editor-label">
                        <label>Diplomado</label>
                    </div>
                  <div class="editor-field">
                        <select name="iddiplomado" id="iddiplomado" class="validarcampos">
                            <option></option>
                            <?php
                            $querydiplo = "SELECT `iddiplomados`, `Nombre`, `Descripcion`, `Activo`, `Eliminado` FROM `diplomados` WHERE `Activo` = 1";

                            $resultadosdiplo = $conexion->query($querydiplo);
                             while( $registrosd = $resultadosdiplo->fetch_array()){
                            ?>
                            <option value="<?php echo  $registrosd['iddiplomados'];?>"><?php echo  $registrosd['Nombre'];?> </option>
                            <?php
                             }
                             ?>

                        </select>
                    </div>  
              </td>
              <td>
                  <div class="editor-label">
                        <label>Tipo Diplomado</label>
                    </div>
                    <div class="editor-field">
                        <select name="tipo" id="tipo" class="validarcampos">
                            <option></option>
                            <?php
                             while( $registrostt = $resultadost->fetch_array()){
                            ?>
                            <option class="validarcampos" value="<?php echo  $registrostt['idtipo'];?>"><?php echo  $registrostt['Nombre'];?> </option>
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
                            <label>Fecha Inicio</label>
                    </div>
                    <div class="editor-field">
                     <input type="Datetime" id="fechaini" name="fechaini" class="validarcampos" />

                    </div>                 
              </td>  
              <td>
                 <div class="editor-label">
                    <label>Fecha Fin</label>
                </div>
                <div class="editor-field">
                 <input type="Datetime" name="fechafin" id="fechafin"  class="validarcampos" />
                </div>
              </td>
              
          </tr>
            <tr>
              <td>
                    <div class="editor-label">
                       <label>Cantidad Modulos</label>
                    </div>
                    <div class="editor-field">
                        <input type="text" name="Cantidad" id="Cantidad" onkeypress="return isNumberKey(event)" class="validarcampos"/>
                    </div>
              </td>  
              <td>  
                    <div class="editor-label">
                        <label>Cupo Minimo</label>
                    </div>
                    <div class="editor-field">
                        <input type="text" name="Minimos" id="minimos" onkeypress="return isNumberKey(event)" class="validarcampos"/>
                    </div>
              </td>
              
          </tr>
          <tr>
               <td colspan="3"><legend>Periodo Inscripcion</legend></td>                
          </tr>
          <tr>
              <td>
                    <div class="editor-label">
                         <label>Fecha Inicio</label>
                    </div>
                    <div class="editor-field">
                          <input type="Datetime" name="inscripcionfechaini" id="inscripcionfechaini" class="validarcampos"/>
                    </div>
              </td>
              <td>
                    <div class="editor-label">
                        <label>Fecha Fin</label>
                    </div>
                    <div class="editor-field">
                        <input type="Datetime" name="inscripcionfechafin" id="inscripcionfechafin" class="validarcampos" />
                    </div> 
              </td>
          </tr>
          <tr>
              <td><legend>Gerente Responsable</legend></td>
              <td colspan="2"><legend>Profesor Inicial</legend></td>
          </tr>
          <tr>
              <td>
                    <div class="editor-label">
                         <label>Gerente</label>
                    </div>
                    <div class="editor-field">
                        <select name="gerente" id="gerente" class="validarcampos">
                            <option></option>
                            <?php
                            $queryperfil = "SELECT u.`idusuarios`, u.`id_perfil`, u.`nombre`, u.`apellido`, u.`usuario`, u.`contrasenia`, u.`fechamodificacion`, u.`idusuariomodificacion`, u.`activo`, u.`eliminado` FROM `usuarios` u inner join `perfiles` p on u.id_perfil = p.idperfiles WHERE p.`descripcion` in ('Gerente','jefe')";

                            $resultadosperf = $conexion->query($queryperfil);
                             while( $registrospp = $resultadosperf->fetch_array()){
                            ?>
                            <option value="<?php echo  $registrospp['idusuarios'];?>"><?php echo  $registrospp['nombre'];echo '  '; echo  $registrospp['apellido'];?> </option>
                            <?php
                             }
                             ?>

                        </select>
                    </div>
              </td>
              
               <td>
                    <div class="editor-label">
                        <label>Profesor</label>
                    </div>
                     <div class="editor-field">
                          <select name="profesor" id="profesor" class="validarcampos">
                              <option></option>
                              <?php
                              $queryprof = "SELECT `idprofesores`, `Nombre`, `Apellido`, `DNI`, `FechaNacimiento`, `Correo`, `Telefono`, `TelefonoSecundario`, `UsuarioSkype`, `FechaModificacion`, `IDUsuarioModificacion`, `Activo`, `Eliminado` FROM `profesores` WHERE Activo = 1";

                              $resultadospro = $conexion->query($queryprof);
                               while( $resultadosprofesor = $resultadospro->fetch_array()){
                              ?>
                              <option value="<?php echo  $resultadosprofesor['idprofesores'];?>"><?php echo  $resultadosprofesor['Nombre'];echo '  '; echo  $resultadosprofesor['Apellido'];?> </option>
                              <?php
                               }
                               ?>

                          </select>
                      </div>
              </td>
          </tr>
          <tr>              
              <td colspan="3"><legend>Dias de Participacion</legend></td>
          </tr>
          <tr>
              <td>
                    <?php
                    $querypart = "SELECT `idDiasSemana`, `Nombre`, `Activo` FROM `diassemana` WHERE `Activo` = 1";
                    $resultadosDias = $conexion->query($querypart);                 
                    ?>
                    <div class="editor-field" id="DiasParticipacion">
                      <ul>
                          <?php

                          while( $resultadosPartDias = $resultadosDias->fetch_array()){
                           ?>
                          <li ><?php echo $resultadosPartDias['Nombre'] ?>     <input type="checkbox" class="dias" value="<?php echo $resultadosPartDias['idDiasSemana'];?>" /> </li>
                          <?php
                          }
                          ?>
                      </ul>
                    </div>
              </td>
          </tr>
      </table>    
        <p align="center">
            <input type="button" value="Guardar"  class="btn btn-primary" onclick="POSTConfigurarDiplomado()" />
        </p>
    </form>
          </body>
</html>

<?php
 }
 ?>
