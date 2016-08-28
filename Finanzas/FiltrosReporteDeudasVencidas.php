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
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link rel="stylesheet" href="../css/bootstrap.css"/>
           
<script src="../js/jquery-1.8.2.js" type="text/javascript"></script>
 
<script src="../js/FiltrosReporteDeudasVencidas.js"></script>


    </HEAD>
    <BODY style=" background-color:transparent">
    <center>
        <table>
                
            <tr>
                <th>
            <div class="editor-label"><strong>Consultar</strong></div>
            </th>
            <th class="Formaciones" style="display: none">
                <div class="editor-label"><strong>Formaciones</strong></div>
            </th>
            
            <th class="diplomados" style="display: none">
                <div class="editor-label"><strong>Diplomados</strong></b></div>                
            </th>
            
            </tr>
            
            
            <tr>
            <td >
            <div class="editor-field">
                <select id="Consulta">
                    <option value="0">--Seleccionar--</option>
                    <option value="1">Diplomados</option>
                    <option value="2">Formaciones</option>
                </select>
            </div>
        </td>
        <td class="Formaciones" style="display: none">
        <div>
            
        <div class="editor-field">
                <select id="FormacionSeleccionada">
                    
                </select>

        </div>
            </div>
        </td>
             
        <td class="diplomados" style="display: none">
            <div >
                
        <div class="editor-field">
            <select id="diplomadoSeleccionado">
                
                </select>

        </div>
                
            </div>
        </td>
        
            </tr>   
         </table>
        
        <div id="ResultadoReporte"></div>
        
        </center>
  </BODY>

</html>


<?php  

}



?>