<html lang="es-ES" xml:lang="es-ES">
    <head>
        

        
        
       <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
        <script src="../js/bootstrap.min.js"></script>
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
 $queryt = "SELECT count(ID_Configuracion) as cantidad,`fechainicio`,`fechafin` FROM `inscripciones` where `ID_Configuracion` = $IDConfiguracion";

 $resultadost = $conexion->query($queryt);
$registros = $resultadost->fetch_array();
    
 ?>

  <form method="post" id="formularioDefinirPeriodoInscripcion">

        <fieldset>

    <input type="Hidden"  name="MetodoE" value="DefinirPeriodo" />
    <input type="Hidden" name="ID_Configuracion" value="<?php echo $IDConfiguracion;?>" />
        
    <table>
        <tr>
            <td> <legend>Periodo de Inscripcion</legend></td>
        </tr>
        <tr>
            <td>
                <div class="editor-label">
                    <label>Fecha Inicio de inscripcion</label>
                </div>
                <div class="editor-field">
                    <input type="text" name="inicioinscrip" id="inicioinscrip" class="validarcampos" value="<?php echo $registros['fechainicio'];?>"/>
                </div>
                
            </td>
        </tr>
        <tr>
            <td>
                <div class="editor-label">
                    <label>Fecha Fin de inscripcion</label>
                </div>
                <div class="editor-field">
                     <input type="text" name="fininscrip" id="fininscrip"  class="validarcampos" value="<?php echo $registros['fechafin'];?>"/>
                </div>  
            </td>
        </tr>
        
        <tr>
            <td>
                <p>
                    <input type="button" value="Guardar" class="btn btn-primary" onclick="DefinirPeriodo()" />
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



