var cont = 0;
$(document).on("click", ".list-group-item", function () {

    
    $("button#wp-submit").click(function () {
        $.ajax({
            dataType: "text",
            type: "POST",
            url: "Autenticacion.php",
            data: $("form.loginform").serialize(),
            success: function (msg) {
                var str = $.trim(msg).toLowerCase();

                if (str.localeCompare("correcto".toLowerCase()) == 0) {
                    window.location.href = "Layout/PaginaPrincipal.php";
                } else {
                    if (cont == 1) {
                        $("#mensaje_oculto").html(msg);
                    } else {
                        $("#mensaje_oculto").html(msg);
                        $('#mensaje_oculto').fadeOut('slow', function () {
                            $('#mensaje_oculto').fadeIn('slow');
                        });
                    }
                }
                cont = cont + 1;
            },
            error: function () {
                alert("Ocurrio un error con la ventana emergente");
            }
        });
    });
});


function vaciar_campos(){
	$("#mensaje_oculto").html("");
	$("#user").val("");
	$("#password").val("");
}

function Prueba() {
    alert("hola");
    $.ajax({
        dataType: "text",
        type: "POST",
        url: "EnvioCorreo.php",
        data: $("form.FContacto").serialize(),
        success: function () {
            alert("Mensaje Enviado");
            },
        error: function () {
            alert("Ocurrio un error con la ventana emergente");
        }
    });

}



