<?php
include_once '../Conexion.php';

session_start();

error_reporting(0);

$varsession = $_SESSION['User'];



if ($varsession == NULL || $varsession =='') {
    
    echo $varsession;
    echo 'usuario no logueado por favor validar con el administrador';
    
    
}else{



?>

<html>
    <HEAD>
    
<script src="../js/jquery-1.8.2.js" type="text/javascript"></script>

 <script src="../js/jquery.ui.js" type="text/javascript"></script>
 <script src="../js/JsAcademica.js" type="text/javascript"></script>


   <link rel="stylesheet" href="../js/jquery-ui.css" media="all" type="text/css"  />
    
     <link rel="stylesheet" href="../css/bootstrap.css" media="all" type="text/css"  />
     <link rel="stylesheet" href="../css/grids.css" media="all" type="text/css"  />
     <link rel="stylesheet" href="../js/Dise.css" media="all" type="text/css"  />

    </HEAD>
    <BODY style=" background-color:transparent">

<div class="clearfloat"/>
        
        
<div align="center">
           
</div>
 
<div class="clearfloat"/>
<br />
<br />
 
<div align="center">
<p align="center"><H3>Retiro de Alumnos</H3></p>        
<div class="row" aling="center">
  <div class="col-md-6 col-md-offset-3">	
    
      
         
          <input type="Hidden"  name="MetodoE" value="BuscarAlumnosI" />
          <table>
              <tr style="text-align: center">
                  <td><input type="text" name="DNI" id="DNI" value=""  onkeypress="return isNumberKey(event)" onkeyup="ValidarCampo()" placeholder="Ingrese DNI" /></td>
                <td><p><input type="button" value="Buscar" id="BuscarAlumnoR" class="btn btn-primary"  onclick="BuscarAlumnosR()"  /></p></td>
              </tr>
              
          </table>
             
       
         
        <div id="BuscaAlumnos">
</div>
    
      
     

  </div>
  </div>
</div>

<a name="DetalleD"></a>

  </BODY>

</html>


<?php  

}



?>