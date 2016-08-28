
function AprobarSolicitud(idsolicitudes) {

    

    $.ajax({
        dataType: "text",
        type: "POST",
        url: "Guardar.php",
        data: {idsolicitudes: idsolicitudes, MetodoE: "AprobarSolicitud"},
        success: function (msg) {
            alert(msg);
            //Sirve para salir del Iframe y redireccionar a la pagina que te de la gana y se cargue en la ventana del navegador.
         location.reload();
         
        },
        error: function () {
            alert("Ocurrio un error en aprobar la solicitud");
        }
    });
    
    

}

function EntregarDinerojs() {

var idsolicitudes = $("#idSolicitudes").val();
    $.ajax({
        dataType: "text",
        type: "POST",
        url: "Guardar.php",
        data: {idsolicitudes: idsolicitudes, MetodoE: "RegistrarEntregaDineroNombre",NombreEntregoDinero: $("#NombreEntregoDinero").val(), NombreRecibioDinero: $("#NombreRecibioDinero").val()},
        success: function (msg) {
            alert(msg);
            //Sirve para salir del Iframe y redireccionar a la pagina que te de la gana y se cargue en la ventana del navegador.
         location.reload();
         
        },
        error: function () {
            alert("Ocurrio un error en el registro de datos");
        }
    });
}


function RegistrarEvideciajs() {

var formData = new FormData(document.getElementById("formularioRegistrarEvidencia"));


 $.ajax({
                url: "Guardar.php",
                type: "post",
                dataType: "html",
                data: formData,
                cache: false,
                contentType: false,
	     processData: false
            })
                .done(function(res){
                   alert(res);
//            //Sirve para salir del Iframe y redireccionar a la pagina que te de la gana y se cargue en la ventana del navegador.
         location.reload();         
                });
     

//var idsolicitudes = $("#idSolicitudes").val();
//    $.ajax({
//        dataType: "html",
//        type: "POST",
//        url: "Guardar.php",
//        data:formData,//
//        success: function (msg) {
//            alert(msg);
//            //Sirve para salir del Iframe y redireccionar a la pagina que te de la gana y se cargue en la ventana del navegador.
//         location.reload();
//         
//        },
//        error: function () {
//            alert("Ocurrio un error en cargar evidecia");
//        }
//    });
}