
function Editar() {


    var ListaPaginas = [];

    $("#PermisosPagina").find(".pagina").each(function () {

        if ($(this).is(":checked")) {

            ListaPaginas.push($(this).val());

        }

    });

    var MetodoE = $("#MetodoE").val();
    var IDPerfil = $("#IDPerfil").val();
    var descripcionPerfil = $("#descripcionPerfil").val();
    var estadoPerfil = $("#estadoPerfil").is(":checked");

      //  alert(JSON.stringify(estadoPerfil));

    $.ajax({
        dataType: "text",
        type: "POST",
        url: "Guardar.php",
        data: { ListaPaginas: ListaPaginas, MetodoE: MetodoE, IDPerfil: IDPerfil, descripcionPerfil: descripcionPerfil, estadoPerfil: estadoPerfil },
        success: function (msg) {
            alert(msg);
            //Sirve para salir del Iframe y redireccionar a la pagina que te de la gana y se cargue en la ventana del navegador.
            top.location.href = "../Layout/PaginaPrincipal.php";

        },
        error: function () {
            alert("Ocurrio un error en la Actualizacion del perfil");
        }
    });

}

function ConfirmPopUp(div, titleDiv, w, h) {
    div.dialog({
        resizable: false,
        height: 220,
        width: 300,
        modal: true,
        buttons: {
            "Eliminar": function () {
                EliminarPerfil();
            },
            "Cancelar": function () {
                $(this).dialog("close");
            }
        }
    });

}


function EliminarPerfil() {

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





function CrearPerfil() {

    var ListaPaginas = [];

    $("#PermisosPagina").find(".pagina").each(function () {

        if ($(this).is(":checked")) {

            ListaPaginas.push($(this).val());

        }

    });

    var MetodoE = $("#MetodoE").val();
    var IDPerfil = $("#IDPerfil").val();
    var descripcionPerfil = $("#descripcionPerfil").val();

    //    alert(JSON.stringify(ListaPaginas));

    $.ajax({
        dataType: "text",
        type: "POST",
        url: "Guardar.php",
        data: { ListaPaginas: ListaPaginas, MetodoE: MetodoE, IDPerfil: IDPerfil, descripcionPerfil: descripcionPerfil },
        success: function (msg) {

            if (msg == true) {

                alert("Creacion de Usuario Con Exito y se le otorgo acceso a las paginas seleccionadas!!");
                //Sirve para recargar la ventana actual.
                location.reload();

            } else {
                alert("Usuario Existe, por favor crear otro!!");
            }


        },
        error: function () {
            alert("Ocurrio un error en la Actualizacion del perfil");
        }
    });


}





