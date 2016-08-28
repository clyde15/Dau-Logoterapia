

$(document).ready(function () {

});


function popupDiv(div, titleDiv, w, h) {
    div.dialog({ autoOpen: false, width: w, title: titleDiv, height: h, modal: true, stack: true, draggable: false

    });
}


function CargarPago(idpagos) {

    var div = $("#Pagos");
 
    div.empty();
    div.load('RegistrodePagos.php?idpagos=' + idpagos);
    popupDiv(div, "Registrar Pago", 500, 600);
    div.dialog('open');
}

function AceptarTrasladoPopUp(idalumnostraslado) {

    var div = $("#Traslado");
 
    div.empty();
    div.load('AceptarTraslado.php?idalumnostraslado=' + idalumnostraslado);
    popupDiv(div, "Aceptar Traslado", 500, 500);
    div.dialog('open');
}

function EntregarDineroPouUp(idSolicitudes) {

    var div = $("#SolicitudAcademica");
 
    div.empty();
    div.load('RegistrarDineroEntregado.php?idSolicitudes=' + idSolicitudes);
    popupDiv(div, "Registrar Entrega de Dinero", 500, 500);
    div.dialog('open');
}

function CargarEvidenciaPopUp(idSolicitudes) {

    var div = $("#SolicitudAcademica");
 
    div.empty();
    div.load('CargaDeEvidencia.php?idSolicitudes=' + idSolicitudes);
    popupDiv(div, "Registrar Evidencias", 500, 500);
    div.dialog('open');
}

function ConsultarEvidenciaPopUp(idSolicitudes) {

    var div = $("#SolicitudAcademica");
 
    div.empty();
    div.load('ConsultaDeEvidencia.php?idSolicitudes=' + idSolicitudes);
    popupDiv(div, "Consultar Evidencia", 500, 500);
    div.dialog('open');
}