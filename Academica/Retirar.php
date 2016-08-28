<html lang="es-ES" xml:lang="es-ES">
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
        <script src="../js/bootstrap.min.js" type="text/javascript"></script>
        <script src="../js/JsAcademica.js" type="text/javascript"></script>
       <link rel="stylesheet" href="../css/bootstrap.css" media="all"/>
       <link rel="stylesheet" href="../js/Dise.css" media="all"/>
    </head>
    <body>
<?php
include_once '../Conexion.php';

session_start();

error_reporting(0);

$varsession = $_SESSION['User'];



if ($varsession == NULL || $varsession =='') {
    
    echo $varsession;
    echo 'usuario no logueado por favor validar con el administrador';
    
    
}else{

 $ID = $_GET["ID"];
 $IDC = $_GET["IDC"];
    
?>

        <div align="center">
<p align="center"><H3>Retirar Alumno</H3></p>        
<div class="row" aling="center">
  <div class="col-md-6 col-md-offset-3">	
      <form id="RetirarAlumno">
      <center>
      <input type="Hidden"  name="MetodoE" value="RetirarA" />
      <input type="Hidden"  name="IDA" value="<?php echo $ID ?>" />
      <input type="Hidden"  name="IDC" value="<?php echo $IDC ?>" />
          <table>
              <tr style="text-align: center">
                  <td><textarea rows="6" cols="50" id="Motivo" name="Motivo" placeholder="Ingrese el motivo del Retiro" style="margin: 0px 0px 10px; width: 259px; height: 130px;"></textarea></td>
                
              </tr>
              <tr style="text-align: center">
                  <td><p><input type="button" value="Retirar" id="Retirar" class="btn btn-primary"  onclick="RetirarA()"  /></p></td>
                  
              </tr>
          </table>
      
      </center>
      </form>
      
  </div>
</div>
    </div>
        
      </BODY>

</html>


<?php  

}