
$(document).ready(function () {
    
    $("#Consulta").change(function(){
    
        if ($("#Consulta :selected").val() != 0) {
            
        
            if ($("#Consulta :selected").val() == 1) {
                Diplomados()
                $(".diplomados").show("slow");
                $(".Formaciones").hide();
            }else {
                Formaciones()
                $(".Formaciones").show("slow");
                $(".diplomados").hide();
            }
        }else {
            $(".Formaciones").hide();
            $(".diplomados").hide();
         
            $("#FormacionSeleccionada").find('option').remove().end();
            $("#diplomadoSeleccionado").find('option').remove().end();
        }

        
    });
 
           $("#FormacionSeleccionada").change(function(){  
               
                 var ResultadoReporte = $("#ResultadoReporte");
              var idconfiguracion = $("#FormacionSeleccionada :selected").val();
           
             ResultadoReporte.load('../Finanzas/ReporteDetalleCobranza.php?idconfiguracion='+idconfiguracion);
               

           });
           
           $("#diplomadoSeleccionado").change(function(){        
                    
                    var ResultadoReporte = $("#ResultadoReporte");
              var idconfiguracion = $("#diplomadoSeleccionado :selected").val();
            
             ResultadoReporte.load('../Finanzas/ReporteDetalleCobranza.php?idconfiguracion='+idconfiguracion);
              
                   
         });
  
         
         
 });
 
 
 
function Diplomados() {
    
                    $.ajax({
                        type: "POST",
                        url: "Guardar.php",
                       dataType: 'json',
                        data: {MetodoE: "CargaListaDiplomados"},
                        
                        success: function (msg) {
         
                        $("#diplomadoSeleccionado").find('option').remove().end();
                        $("#diplomadoSeleccionado").append("<option value='0'>--Seleccionar--</option>");
                          for (var i in msg) {
                              
                              $("#diplomadoSeleccionado").append("<option value="+msg[i].IDConfiguracion+">"+msg[i].Nombre+"</option>");
                            }
                           

                        },
                        error: function () {
                            alert("Ocurrio un error en la carga de lista de diplomados");
                        }
                    });
}

function Formaciones() {
    
                    $.ajax({
                        type: "POST",
                        url: "Guardar.php",
                       dataType: 'json',
                        data: {MetodoE: "CargaListaFormaciones"},
                        
                        success: function (msg) {
         
                        $("#FormacionSeleccionada").find('option').remove().end();
                        $("#FormacionSeleccionada").append("<option value='0'>--Seleccionar--</option>");
                          for (var i in msg) {
                              
                              $("#FormacionSeleccionada").append("<option value="+msg[i].IDConfiguracion+">"+msg[i].Nombre+"</option>");
                            }
                           

                        },
                        error: function () {
                            alert("Ocurrio un error en la carga de lista de Formaciones");
                        }
                    });
}