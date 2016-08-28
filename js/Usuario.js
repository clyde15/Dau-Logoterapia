
//jQuery(document).ready(function () {

$(document).ready(function () {

});


function popupDiv(div, titleDiv, w, h) {
    div.dialog({ autoOpen: true, width: w, title: titleDiv, height: h, modal: true, stack: true, draggable: false

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
                EliminarU();
            },
            "Cancelar": function () {
                $(this).dialog("close");
            }
        }
    });

}




function EditarUsuario(idUsuario) {

    var div = $("#UsuariosEditar");

    div.empty();
    div.load('EditarUsuario.php?idUsuario=' + idUsuario);
  popupDiv(div, "Detalle Usuario", 300, 500);


    div.dialog('open');
}

function EditarPerfil(idPerfil) {

    var div = $("#PerfilesEditar");

    div.empty();
    div.load('EditarPerfiles.php?idPerfil=' + idPerfil);
    popupDiv(div, "Detalle Perfil", 300, 500);


    div.dialog('open');
}

function CrearUsuario() {

    var div = $("#UsuariosEditar");

    div.empty();
    div.load('CrearUsuario.php');
    popupDiv(div, "Crear Usuario", 300, 500);


    div.dialog('open');
}

function CrearPerfiles() {

    var div = $("#PerfilesEditar");

    div.empty();
    div.load('CrearPerfil.php');
    popupDiv(div, "Crear Perfil", 300, 500);


    div.dialog('open');
}

function EliminarP(idperfil, descripcion) {
    var div = $("#PerfilesEditar");

    div.empty();
    div.load('EliminarPerfil.php?idperfil=' + idperfil + '&descripcion=' + descripcion);
    ConfirmPopUp(div, "Eliminar Perfil");
    div.dialog('open');


}

function EliminarUsuario(idusuario, usuario) {
    var div = $("#UsuariosEditar");

    div.empty();
    div.load('EliminarUsuario.php?idUsuario=' + idusuario + '&usuario=' + usuario);
    ConfirmPopUp(div, "Eliminar Usuario");
    div.dialog('open');
}


//        var ses = $("#Editar");
//        ses.load('EditarUsuario.php');
//        ses.dialog({
//            title: 'Sesi�n Caducada',
//            width: 357.38,
//            height: 199.38,
//            modal: true,
//            buttons: {
//                Ok: function () {
//                    ses.dialog("close");
//                    location.reload();
//                }
//            }
//        });



//$('#edit-modal').on('show.bs.modal', function(e) {
//            
//            var $modal = $(this),
//                esseyId = $(".eliminarU").attr("id");
//          
//             $.ajax({
//             cache: false,
//                type: 'GET',
//                url: 'BuscarUsuario.php',
//                data: 'IDU='+esseyId,
//                success: function(data) 
//                {
//                    $modal.find('.edit-content').html(esseyId);
//               }
//            });
//            
//        });
//   

//});          




