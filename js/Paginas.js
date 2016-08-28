
function ActivarPagina(idpagina) {

    $.ajax({
        dataType: "text",
        type: "POST",
        url: "Guardar.php",
        data: { idpagina: idpagina, estatus: 1 },
        success: function (msg) {
            alert(msg);
            location.reload();
            //top.location.href = "../Layout/PaginaPrincipal.php";
        },
        error: function () {
            alert("Ocurrio un error en la Actualizacion del usuario");
        }
    });

}


function InactivarPagina(idpagina) {

    $.ajax({
        dataType: "text",
        type: "POST",
        url: "Guardar.php",
        data: {idpagina: idpagina, estatus: 0},
        success: function (msg) {
            alert(msg);
            location.reload();
            //top.location.href = "../Layout/PaginaPrincipal.php";
        },
        error: function () {
            alert("Ocurrio un error en la Actualizacion del usuario");
        }
    });

}




