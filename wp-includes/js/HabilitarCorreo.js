
function CorreoHa() {

    vaciar_campos_Contacto();
    jQuery(".CC").fadeIn('slow').show();
    jQuery(".Contactanos").hide();

}

function vaciar_campos_Contacto() {
    $("#Nombre").val("");
    $("#ApellidoM").val("");
    $("#ApellidoP").val("");
    $("#email").val("");
    $("#Titulo").val("");
    $("#MotivoContacto").val("");
}
