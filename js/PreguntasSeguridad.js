//jQuery(document).ready(function () {

$(document).ready(function () {

});


function popupDiv(div, titleDiv, w, h) {
    div.dialog({ autoOpen: true, width: w, title: titleDiv, height: h, modal: true, stack: true, draggable: false

    });
}


//function ConfirmPopUp(div, titleDiv, w, h) {S
//    div.dialog({
//        resizable: false,
//        height: 220,
//        width: 300,
//        modal: true,
//        buttons: {
//            "Eliminar": function () {
//                EliminarPreguntas();
//            },
//            "Cancelar": function () {
//                $(this).dialog("close");
//                location.reload();
//            }
//        }
//    });
//
//}




function EditarPreguntas(idPreguntas) {

    var div = $("#PreguntaSeguridad");

    div.empty();
    div.load('EditarPreguntas.php?idPreguntas=' + idPreguntas);
     popupDiv(div, "Modificar Pregunta", 300, 300);


    div.dialog('open');
}

function CrearPreguntas() {

    
    var div = $("#PreguntaSeguridad");

    div.empty();
    div.load('CrearPreguntas.php');
    popupDiv(div, "Crear Pregunta", 300, 300);


    div.dialog('open');
}

function EliminarPregunta(idPreguntas) {

    var div = $("#PreguntaSeguridad");

    div.empty();
    div.load('EditarPreguntas_1.php?idPreguntas=' + idPreguntas);
     popupDiv(div, "Eliminar Pregunta de Seguridad", 500, 175);

    div.dialog('open');


}

function EliminarPreguntas() {
    
    $.ajax({
        dataType: "text",
        type: "POST",
        url: "Guardar.php",
        data: $("#formularioEliminar2").serialize(),
        success: function (msg) {
            alert(msg);
            location.reload();
        },
        error: function () {
            alert("Ocurrio un error en la eliminacion de preguntas");
        }
    });

}


function Cancelar()
{
   location.reload(); 
}

