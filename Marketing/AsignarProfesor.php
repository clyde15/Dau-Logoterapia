<html lang="es-ES" xml:lang="es-ES">
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
        <script src="../js/bootstrap.min.js" type="text/javascript"></script>
        <script src="../Marketing/js/validaciones.js" type="text/javascript"></script>
        <script src="../Marketing/js/Diplomados.js" type="text/javascript"></script>
       <link rel="stylesheet" href="../css/bootstrap.css" media="all"/>
       
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

    
 include_once '../Conexion.php';

 $IDConfiguracion = $_GET["IDConfiguracion"];
 $queryt = "SELECT `IDConfiguracion`, `ID_ProfesorInicial`, U.`idusuarios`, U.`nombre` as GerebtNomb, U.`apellido` as gerenteape, P.`idprofesores`, P.`Nombre` as profnom, P.`Apellido` as profapell  FROM `configuraciones` C INNER JOIN Usuarios U on C.ID_ProfesorInicial = U.idusuarios INNER JOIN Profesores P on C.ID_GerenteResponsable = P.idprofesores WHERE `IDConfiguracion` =  $IDConfiguracion";

 $resultadost = $conexion->query($queryt);
$registros = $resultadost->fetch_array();
    
 ?>

  <form method="post" id="formularioDefinirProfesor">

        <fieldset>

    <input type="Hidden"  name="MetodoE" value="DefinirProfesor" />
    <input type="Hidden" name="ID_Configuracion" value="<?php echo $IDConfiguracion;?>" />
    <table>
        <tr>
            <td><legend>Gerente Responsable</legend></td>
        </tr>
        <tr>
            <td>
                <div class="editor-label">
                        <label>Gerente</label>
                </div>
                <div class="editor-field">
                    <select name="gerente" class="validarcampos">
                        <option></option>
                        <?php
                        $queryperfil = "SELECT u.`idusuarios`, u.`id_perfil`, u.`nombre`, u.`apellido`, u.`usuario`, u.`contrasenia`, u.`fechamodificacion`, u.`idusuariomodificacion`, u.`activo`, u.`eliminado` FROM `usuarios` u inner join `perfiles` p on u.id_perfil = p.idperfiles WHERE p.`descripcion` in ('Gerente','jefe')";

                        $resultadosperf = $conexion->query($queryperfil);
                         while( $registrospp = $resultadosperf->fetch_array()){
                        ?>
                        <option selected='<?php echo  $registros['idusuarios'];?>' value="<?php echo  $registrospp['idusuarios'];?>"><?php echo  $registrospp['nombre'];echo '  '; echo  $registrospp['apellido'];?> </option>
                        <?php
                         }
                         ?>

                    </select>
                </div>              
            </td>
        </tr>
        <tr>
            <td>
                <legend>Profesor Inicial</legend>               
            </td>
        </tr>
        <tr>
            <td>
                <div class="editor-label">
                        <label>Profesor</label>
                </div>
                  <div class="editor-field">
                    <select name="profesor" class="validarcampos">
                        <option></option>
                        <?php
                        $queryprof = "SELECT `idprofesores`, `Nombre`, `Apellido`, `DNI`, `FechaNacimiento`, `Correo`, `Telefono`, `TelefonoSecundario`, `UsuarioSkype`, `FechaModificacion`, `IDUsuarioModificacion`, `Activo`, `Eliminado` FROM `profesores` WHERE Activo = 1";

                        $resultadospro = $conexion->query($queryprof);
                         while( $resultadosprofesor = $resultadospro->fetch_array()){
                        ?>
                        <option  selected='<?php echo  $registros['idprofesores'];?>'  value="<?php echo  $resultadosprofesor['idprofesores'];?>"><?php echo  $resultadosprofesor['Nombre'];echo '  '; echo  $resultadosprofesor['Apellido'];?> </option>
                        <?php
                         }
                         ?>

                    </select>
                </div>              
            </td>
        </tr>
        <tr>
            <td>
                <p>
                    <input type="button" value="Guardar" class="btn btn-primary" onclick="POSTDefinirProfesor()" />
                    <input type="button" value="Cancelar" class="btn btn-primary" onclick="Cancelar()" />
                </p>
            </td>
        </tr>
    </table>
         </fieldset>
    </form>
          </body>
</html>

<?php
 }
 ?>
