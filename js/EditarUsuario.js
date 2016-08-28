
function Editar() {


    var estadoUsuario = $("#estadoUsuario").is(":checked");
// $("#formulario").serialize();
   

     $.ajax({
        dataType: "text",
        type: "POST",
        url: "Guardar.php",
        data: $("#formulario").serialize(),
        success: function (msg) {
            alert(msg);
            location.reload();
        },
        error: function () {
            alert("Ocurrio un error en la Actualizacion del usuario");
        }
    });

}


function CrearU() {

    $.ajax({
        dataType: "text",
        type: "POST",
        url: "Guardar.php",
        data: $("#formularioCrear").serialize(),
        success: function (msg) {
            alert(msg);
            location.reload();
        },
        error: function () {
            alert("Ocurrio un error en la Creación del usuario");
        }
    });

}

function EliminarU() {


    $.ajax({
        dataType: "text",
        type: "POST",
        url: "Guardar.php",
        data: $("#formularioEliminar").serialize(),
        success: function (msg) {
            alert(msg);
            location.reload();
        },
        error: function () {
            alert("Ocurrio un error en la Creación del usuario");
        }
    });

}




