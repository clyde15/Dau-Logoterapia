

$(document).ready(function () {

});


function popupDiv(div, titleDiv, w, h) {
    div.dialog({ autoOpen: false, width: w, title: titleDiv, height: h, modal: true, stack: true, draggable: false

    });
}


function EditarUsuario(idUsuario) {
    $.loader({
        className: "blue-with-image-2",
        content: 'CARGANDO DATOS...'
    });
    var div = $("#PopupDeuda");
    //    var Obligacion = _Obligacion;
    div.empty();
    div.load('/SIG_BBVARecovery/Pagos/PagosDeuda?_IDDeuda=' + IDDeuda);
    popupDiv(div, "Detalle Pagos", 600, 350);
    $.loader("close");
    div.dialog('open');
}

//function Cuotas(IDDeuda) {
//    $.loader({
//        className: "blue-with-image-2",
//        content: 'CARGANDO DATOS...'
//    });
//    var div = $("#CuotasDeuda");
//    div.empty();
//    div.load('/SIG_BBVARecovery/CuotasDeuda/CuotasDeuda?_IDDeuda=' + IDDeuda);
//    popupDiv(div, "Detalle Cuotas", 1000, 400);
//    $.loader("close");
//    div.dialog('open');
//}

//function OtrasFiguras(IDDeuda) {
//    $.loader({
//        className: "blue-with-image-2",
//        content: 'CARGANDO DATOS...'
//    });

//    var div = $("#PopupDeuda");
//    div.empty();
//    div.load('/SIG_BBVARecovery/OtrasFiguras/DatosOtrasFiguras?IDDeuda=' + IDDeuda);
//    popupDiv(div, "Detalle Otras Figuras", 360, 520);
//    $.loader("close");
//    div.dialog('open');


//}

//function GestionTipificacion(IDDeuda) {
//    $.loader({
//        className: "blue-with-image-2",
//        content: 'CARGANDO DATOS...'
//    });

//    var div = $("#PopupDeuda");



//    div.empty();
//    div.load('/SIG_BBVARecovery/Gestion/GestionDeuda?IDDeuda=' + IDDeuda);

//    popupDiv(div, "Detalle Gestion", 400, 550);
//    $.loader("close");
//    div.dialog('open');

//}




