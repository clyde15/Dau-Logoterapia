
$(document).ready(function () {
    
    $("#Consulta").change(function(){
       $("#AlumnoSeleccionado").find('option').remove().end();
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
             $(".AlumnosDiv").hide();
            $("#AlumnoSeleccionado").find('option').remove().end();
            $("#FormacionSeleccionada").find('option').remove().end();
            $("#diplomadoSeleccionado").find('option').remove().end();
        }

        
    });
 
           $("#FormacionSeleccionada").change(function(){        
                    
                $.ajax({
                        type: "POST",
                        url: "Guardar.php",
                       dataType: 'json',
                        data: {id: $("#FormacionSeleccionada :selected").val(), MetodoE: "CargarLista", Tipo:"Formacion"},
                        
                        success: function (msg) {
         
                        $("#AlumnoSeleccionado").find('option').remove().end();
                         $("#AlumnoSeleccionado").attr("class",$("#FormacionSeleccionada :selected").val());
                        $("#AlumnoSeleccionado").append("<option value='0'>--Seleccionar--</option>");
                          for (var i in msg) {
                              
                              $("#AlumnoSeleccionado").append("<option value="+msg[i].idalumnos+">"+msg[i].Nombres+"</option>");
                            }
                           $(".AlumnosDiv").show("slow");

                        },
                        error: function () {
                            alert("Ocurrio un error en la consulta de Alumnos");
                        }
                    });     

           });
           
           $("#diplomadoSeleccionado").change(function(){        
                    
                    $.ajax({
                        type: "POST",
                        url: "Guardar.php",
                       dataType: 'json',
                        data: {id: $("#diplomadoSeleccionado :selected").val(), MetodoE: "CargarLista", Tipo:"Diplomado"},
                        
                        success: function (msg) {
         
                        $("#AlumnoSeleccionado").find('option').remove().end();
                        $("#AlumnoSeleccionado").attr("class",$("#diplomadoSeleccionado :selected").val());
                        $("#AlumnoSeleccionado").append("<option value='0'>--Seleccionar--</option>");
                          for (var i in msg) {
                              
                              $("#AlumnoSeleccionado").append("<option value="+msg[i].idalumnos+">"+msg[i].Nombres+"</option>");
                            }
                           $(".AlumnosDiv").show("slow");

                        },
                        error: function () {
                            alert("Ocurrio un error en la consulta de Alumnos");
                        }
                    });
                   
         });
         
         $("#AlumnoSeleccionado").change(function(){        
                  
              var ResultadoReporte = $("#ResultadoReporte");
              var idconfiguracion = $("#AlumnoSeleccionado").attr("class");
              var alumnos = $("#AlumnoSeleccionado :selected").val();
             ResultadoReporte.load('../Finanzas/ReporteResumenPorAlumno.php?idconfiguracion='+idconfiguracion+"&Alumnos="+alumnos);
                  
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