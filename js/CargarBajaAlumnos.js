
function Debaja(idAlumnoDeBaja) {

    $.ajax({
        dataType: "text",
        type: "POST",
        url: "Guardar.php",
        data: {idAlumnoDeBaja: idAlumnoDeBaja, MetodoE: "CargarBaja"},
        success: function (msg) {
            alert(msg);
            //Sirve para salir del Iframe y redireccionar a la pagina que te de la gana y se cargue en la ventana del navegador.
            location.reload();

        },
        error: function () {
            alert("Ocurrio un error en el registro del pago");
        }
    });
    
    

}

