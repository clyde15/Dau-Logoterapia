<html lang="es-ES" xml:lang="es-ES">
    <head>
        
       <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
        <script src="../js/bootstrap.min.js" type="text/javascript"></script>
        <script src="../js/jquery.maskMoney.js" type="text/javascript"></script>
          <link rel="stylesheet" href="../css/bootstrap.css" media="all"/>
        <script src="../js/CargarPagos.js" type="text/javascript"></script>
        
 
      
       
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

 $idpagosf = $_GET["idpagos"];
 
 

 
 
 ?>
        
         <script> 
        
        $('#FechaPago').datepicker({
            dateFormat:"yy-mm-dd",
            minDate: new Date()
            
        });
        
        $('#Monto').maskMoney();
        
        function validarNro(e) {
        var key;
        if (window.event) // IE
        {
            key = e.keyCode;
        }
        else if (e.which) // Netscape/Firefox/Opera
        {
            key = e.which;
        }

        if (key < 48 || key > 57) {
            if (key == 8) // Detectar . (punto) y backspace (retroceso)
            { return true; }
            else
            { return false; }
        }
        return true;
    }
        
        </script>
    <center>      
 <form method="post" id="formularioRegistrarPago">

        <fieldset>
        <legend>Registrar Pago del Alumno</legend>
       <input type="Hidden"  name="MetodoE" value="RegistrarPago" id="MetodoE" />
       <input type="Hidden"  name="idpagosf" value="<?php echo $idpagosf; ?>" id="idpagosf" />
       
       <?php 
//////////se consulta la fecha de inicio para hacer el conteo de las cuotas y generar la lista
       
       $queryPagosCuotas = "select CantidadCuotas, FechaInicio, Pago, idPagosCuotas, Decripcion from pagoscuotas where ID_Pagos = '$idpagosf'";
 
  $resultadosPagosCuotas = $conexion->query($queryPagosCuotas);
  
         //$registrosPagosCuotas = $resultadosPagosCuotas->fetch_array();
    
//         $FechasCuota;
//         $FechaInicial = $registrosPagosCuotas['FechaInicio'];
//         
//         $queryCantidadPL = "select Count(*) as CantidadP from registropagos where ID_Pagos = '$idpagosf'";
//         
//          $resultadosCantidadPL= $conexion->query($queryCantidadPL);
//  
//         $registrosCantidadPL = $resultadosCantidadPL->fetch_array();
//         
//         $Cantidad = $registrosPagosCuotas['CantidadCuotas'];
//         
//         for ($index = 0; $index < $Cantidad; $index++) {
//             
//             $FechasC = strtotime("+1 month", strtotime($FechaInicial));
//             
//             $FechasCuota[0][$index] = date("Y-m-j",$FechasC);
//                           
//             
//             $FechaInicial = $FechasCuota[0][$index];
//         } 
//         
//        
//            
//////////Consulta de Tipo de Pago, para habilitar la lista de cuotas pendientes por pagar/////      
//          $queryTipoPago = "select ID_TipoPago from pagos where idpagos = '$idpagosf'";
// 
//         $resultadosTipoPago = $conexion->query($queryTipoPago);
//  
//         $registrosTipoPago = $resultadosTipoPago->fetch_array(); 
//         
       ?>
       
       <?php 
       
       //if ($registrosTipoPago['ID_TipoPago']==2) {
           
           ?>
           <div class="editor-label">
                <label>Lista de Cuotas</label>
        </div>
        <div class="editor-field">
            <table border="1">
                <tr>
         <?php 
         
          //for ($index2 = 0; $index2 < $Cantidad; $index2++){
           while( $registrosPagosCuotas = $resultadosPagosCuotas->fetch_array()){
                 ?>
           
                    <th style=" background-color: #006dcc; color: white"><?php echo $registrosPagosCuotas['Decripcion']  ?></th>
          <?php } ?>
                </tr>
                <tr>
           <?php
          
            //for($index3 = 0; $index3 < $cantidadPagos; $index3++)
            //{
           $CCuotasPagadas = 0;
           $CCuotasNoPagas = 0;
           $resultadosPagosCuotas->data_seek(0);
           while( $registrosPagosCuotas = $resultadosPagosCuotas->fetch_array()){
            ?>
                <td style=" text-align: center">
              <?php
                  if ($registrosPagosCuotas['Pago']) {
                      $CCuotasPagadas = $CCuotasPagadas + 1;
              ?>
               <img title="Cuota Pagada" alt="" SRC="../wp-content/uploads/2015/10/dinero.png" width="30px"/>
               <?php               
                  }  else {
                      $CCuotasNoPagas = $CCuotasNoPagas + 1;
                  ?>
               <img title="Cuota Pendiente Por Pagar" alt="" SRC="../wp-content/uploads/2015/10/contrato.png" width="30px"/>
               <?php
                  }
               ?>
                </td>
            <?php }
//            $CuotasNopagadas = $Cantidad - $cantidadPagos;
//                    
//            for ($index4 = 0; $index4 < $CuotasNopagadas; $index4++) {
//            
            ?>
<!--                <td style=" text-align: center">-->
      
                    <!--<img title="Cuota Pendiente Por Pagar" alt="" SRC="../wp-content/uploads/2015/10/contrato.png" width="30px"/>-->
               
                <!--</td>-->
            <?php //} ?>    
                </tr>
            </table>
        </div>
       <?php
      //}
       ?>
       <div clas="editor-label">
           <label>Cuotas</label>
       </div>
       <div class="editor-field">
           <select id="Cuota" name="Cuota" class="validarcampos"> 
               <option value="">--Seleccionar--</option>
           <?php 
            $queryPagosCuotasNoPagadas = "select CantidadCuotas, FechaInicio, Pago, idPagosCuotas, Decripcion from pagoscuotas where ID_Pagos = '$idpagosf' and Pago=0";
 
  $resultadosPagosCuotasNoPagadas = $conexion->query($queryPagosCuotasNoPagadas);
           while( $registrosPagosCuotasNoPagadas = $resultadosPagosCuotasNoPagadas->fetch_array()){
                 ?>
               <option value="<?php echo $registrosPagosCuotasNoPagadas['idPagosCuotas']?>"><?php echo $registrosPagosCuotasNoPagadas['Decripcion']?></option>
          <?php } ?>
               </select>
       </div>
        <div class="editor-label">
                <label>Nombre Del Banco</label>
        </div>
        <div class="editor-field">
            <input type="text" name="Banco" id="Banco" maxlength="45" class="validarcampos" />
        </div>
                
        <div class="editor-label">
                 <label>Numero del Recibo</label>
        </div>
        <div class="editor-field">
        
            <input type="text" name="Recibo" id="Recibo" maxlength="11" onkeypress = "return validarNro(event)" class="validarcampos" />

        </div>
       
        <div class="editor-label">
                 <label>Fecha del Pago</label>
        </div>
        <div class="editor-field">
        
            <input type="text" name="FechaPago" id="FechaPago" class="validarcampos"/>

        </div>
       
       <div class="editor-label">
                 <label>Monto</label>
        </div>
        <div class="editor-field">
        
            <input type="text" name="Monto" id="Monto" maxlength="11" class="validarcampos" />

        </div>
<?php 

       //if ($Cantidad == $cantidadPagos && $registrosTipoPago['ID_TipoPago']==2) {
$resultadosPagosCuotas->data_seek(0);
$registrosPagosCuotas = $resultadosPagosCuotas->fetch_array();
 $cantidadPagos = $registrosCantidadPL['CantidadP'];
       if ($CCuotasPagadas == $registrosPagosCuotas['CantidadCuotas']) {
        ?>
       <div class="editor-label">
                 <label>Pagar Traslado</label>
        </div>
        <div class="editor-field">
            <input type="checkbox" name="Traslado" id="Traslado"/>
            <span style=" color: red">Se habilita el pago del traslado, debido a pago total de las cuotas, Usar solo en caso de un traslado!!!</span>
        </div>
       <?php
       }else if ($CCuotasPagadas > $registrosPagosCuotas['CantidadCuotas']) {
        ?>
       
        <div class="editor-field">
           <span style=" color: red">Todos los pagos fueron cargados, consulte el reporte de pagos para mas informacion!!!</span>
        </div>
        <script>
            $("#GenerarRegistro").hide();
        </script>
       <?php
       }
       ?>
       <br>
        <p>
            <input type="button" id="GenerarRegistro" value="Guardar" onclick="GenerarRegistroPago()" class="btn btn-primary" />
        </p>
    </fieldset>
    </form>
        </center>
          </body>
</html>

<?php
 }
 ?>