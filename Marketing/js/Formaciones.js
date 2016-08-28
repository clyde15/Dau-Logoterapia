$(document).ready(function () {

});


function popupDiv(div, titleDiv, w, h) {
    div.dialog({ autoOpen: true, width: w, title: titleDiv, height: h, modal: true, stack: true, draggable: false

    });
}

//function ConfirmPopUp(div, titleDiv, w, h) {
//    div.dialog({
//        resizable: false,
//        height: 220,
//        width: 300,
//        modal: true,
//        buttons: {
//            "Eliminar": function () {
//                
//            },
//            "Cancelar": function () {
//                $(this).dialog("close");
//            }
//        }
//    });
//
//}

function ActivarFormacion(idformaciones) {

    $.ajax({
        dataType: "text",
        type: "POST",
        url: "../Formacion/Guardar.php",
        data: { idformaciones: idformaciones, estatus: 1, MetodoE: 'Activar' },
        success: function (msg) {
            alert(msg);
            location.reload();
        },
        error: function () {
            alert("Ocurrio un error en la Actualizacion de la formacion");
        }
    });

}


function InactivarFormacion(idformaciones) {

    $.ajax({
        dataType: "text",
        type: "POST",
        url: "../Formacion/Guardar.php",
        data: {idformaciones: idformaciones, estatus: 0, MetodoE: 'Desactivar'},
        success: function (msg) {
            alert(msg);
            location.reload();
        },
        error: function () {
            alert("Ocurrio un error en la Actualizacion de la formacion");
        }
    });

}


function GETCrearFormacion() {

    
    var div = $("#crear");

    div.empty();
    div.load('../Formacion/CrearFormacion.php');
    popupDiv(div, "Crear Formacion", 300, 500);


    div.dialog('open');
}

function EditarFormacionConfiguracion(IDConfiguracion)
{
    var div = $("#crear");
    
    div.empty();
   div.load('EditarConfiguracionFormacion.php?IDConfiguracion='+ IDConfiguracion);
    popupDiv(div, "Editar configuracion Formacion", 500, 400);


    div.dialog('open'); 
}

function GETConfigurarFormacion(){
    
   var div = $("#crear");

    div.empty();
    div.load('CrearConfigurarFormacion.php');
    popupDiv(div, "Configurar Nueva Formacion", 600, 800);


    div.dialog('open');  
}

//---------------------POST-------------------

function POSTCrearFormacion() {

    $.ajax({
        dataType: "text",
        type: "POST",
        url: "Guardar.php",
        data: $("#FormulalrioCrearFormacion").serialize(),
        success: function (msg) {
            alert(msg);
            location.reload();
        },
        error: function () {
            alert("Ocurrio un error en la Creaci�n de la formacion");
        }
    });

}

function POSTEditFormacionConfiguracion(){

         var vacio = validar();
     
     if (vacio === false){
            $.ajax({
           dataType: "text",
           type: "POST",
           url: "Formacion/Guardar.php",
           data: $("#formularioEditarFormacion").serialize(),
           success: function (msg) {
               alert(msg);
               location.reload();
           },
           error: function () {
               alert("Ocurrio un error en la Actualizacion de los profesores");
           }
       });
     }
}

function POSTConfigurarFormacion(){
    
        var ListaDias = [];

    $("#DiasParticipacion").find(".dias").each(function () {
        if ($(this).is(":checked")) {
            ListaDias.push($(this).val());
        }
    });
    
     var idformacion =  $("#idformacion").val();
     var fechaini =  $("#fechaini").val();
     var fechafin =  $("#fechafin").val();
     var Cantidad =  $("#Cantidad").val();
     var minimo =  $("#minimos").val();
     var tipo =  $("#tipo").val();
     var inscripcionfechaini =  $("#inscripcionfechaini").val();
     var inscripcionfechafin =  $("#inscripcionfechafin").val();     
     var gerente =  $("#gerente").val();
     var profesor =  $("#profesor").val();    
     var idresponsable =  $("#idresponsable").val();
    
     var vacio = validar();
     
     if (vacio === false){
                $.ajax({
               dataType: "text",
               type: "POST",
               url: "Formacion/Guardar.php",
               data: {MetodoE: "ConfigurarFormacion",idformacion: idformacion,fechaini: fechaini,fechafin:fechafin,Cantidad:Cantidad,minimo:minimo,tipo:tipo,inscripcionfechaini:inscripcionfechaini,inscripcionfechafin:inscripcionfechafin,gerente:gerente,profesor:profesor,idresponsable:idresponsable,ListaDias: ListaDias },
               success: function (msg) {
                   if(msg === "NO"){S
                       alert("Hubo un error al configurar la formacion, Por Favor Intentelo mas tarde. Si la Falla persiste comunicarse con el administrador del sistema");
                   }else{
                       alert("Se ha guardado la configuracion de la formacion exitosamente.");
                       location.reload();
                   }

               },
               error: function () {
                   alert("Ocurrio un error en la creacion de la formacion");
               }
           });
     }
}