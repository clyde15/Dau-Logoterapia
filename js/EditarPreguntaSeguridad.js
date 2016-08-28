jQuery(document).ready(function () {
    
$("#mensaje").hide();
$('#CambioContrasena').css('background-color','gray').attr("disabled", true);
$('#formularioRecuperarContrasena').hide();
$('#FormOlvidoClave').hide();
    });      


function EditarPregunta() {

 var vacio = validar();
 
 if(vacio === false){
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
}


function CrearPregunta() {

 var vacio = validar();
 
 if(vacio === false){
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
                alert("Ocurrio un error en la Creaci�n del usuario");
            }
        });
 }
}



function ActivarPregunta(idPreguntas){
    
    
    
   $.ajax({
        dataType: "text",
        type: "POST",
        url: "Guardar.php",
        data: { idPreguntas: idPreguntas, estatus: 1,MetodoE:"Activar"},
        //data: $("#formularioActivar").serialize(),
        success: function (msg) {
            alert(msg);
            location.reload();
        },
        error: function () {
            alert("Ocurrio un error en la Creaci�n del usuario");
        }
    }); 
}

function DesactivarPregunta(idPreguntas){
    
    
   $.ajax({
        dataType: "text",
        type: "POST",
        url: "Guardar.php",
        data: { idPreguntas: idPreguntas, estatus: 0, MetodoE: "Desactivar" },
        //data: $("#formularioDesactivar").serialize(),
        success: function (msg) {
            alert(msg);
            location.reload();
        },
        error: function () {
            alert("Ocurrio un error en la Creaci�n del usuario");
        }
    }); 
}

function CambiarPregunta(){
    
      $.ajax({
        dataType: "text",
        type: "POST",
        url: "Guardar.php",
        data: $("#formularioCambiarPregunta").serialize(),
        success: function (msg) {
            alert(msg);
            location.reload();
        },
        error: function () {
            alert("Ocurrio un error en el cambio de pregunta secreta");
        }
    }); 

    
}

function ValidarContrasena()
{
   $nueva = $("#nueva").val(); 
   $confirmarnueva = $("#confirmarnueva").val(); 
   
   if($nueva !== $confirmarnueva)
   {
       $("#mensaje").show();
       $('#CambioContrasena').css('background-color','gray').attr("disabled", true);
   }else{
       $("#mensaje").hide();
       $('#CambioContrasena').attr("disabled", false);
   }
  
}

function CambiarContrasena(){
 
      $.ajax({
        dataType: "text",
        type: "POST",
        url: "Guardar.php",
        data: $("#formularioBuscarUs").serialize(),
        success: function (msg) {
            alert(msg);
            location.reload();
        },
        error: function () {
            alert("Ocurrio un error en el cambio de pregunta secreta");
        }
    }); 

    
}

function BuscarUsuario()
{
    $("#idpreguntarespuesta").val("");
    $("#idusuario").val("");
    $("#pregunta").val("");
    $("#respuesta").val("");
    $("#nueva").val("");
    $("#confirmarnueva").val("");
    $('#formularioRecuperarContrasena').hide();
    $('#FormOlvidoClave').hide();    
    $login = $("#login").val();
  
    $.ajax({
        dataType: "text",
        type: "POST",
        url: "../SeguridadContrasena/Guardar.php",
        //data: $("#formularioBuscarUs").serialize(),
        data: { Usuario:$login, MetodoE:"BuscarUsuario"},
        success: function (msg) {
            if (msg === "NO")
            {
                $("#login").val("");
                alert("El Usuario No esta registrado en nuestro sistema");
               $('#formularioRecuperarContrasena').hide(); 
            }else{
                var separar = msg.split(',');
                var idusuario = separar[0];
                var idpreguntarespuesta = separar[1];
                var descripcion = separar[2];

                $("#pregunta").val(descripcion);
                $("#idpreguntarespuesta").val(idpreguntarespuesta);
                $("#idusuario").val(idusuario);
                
                $('#formularioRecuperarContrasena').show();
            }
         
        },
        error: function () {
            alert("Ocurrio un error en la busqueda del usuario, por favor intentelo mas tarde");
        }
    }); 
    
  
}

function ValidarPreguntasSeguridad()
{
     var idusuario = $('#idusuario').val();
 
    $.ajax({
        dataType: "text",
        type: "POST",
        url: "../SeguridadContrasena/Guardar.php",
        data: $("#formularioRecuperarContrasena").serialize(),
        success: function (msg) {

            if (msg === "OK")
            {  
                $("#idusuarios").val(idusuario);
                $('#formularioRecuperarContrasena').hide();
                $('#FormOlvidoClave').show();
            }else{
               alert(msg);
               location.reload();
            }

        },
        error: function () {
            alert("Ocurrio un error en el cambio de pregunta secreta");
        }
    }); 

    
}

function RecuperarContrasena()
{
 
    $.ajax({
        dataType: "text",
        type: "POST",
        url: "../SeguridadContrasena/Guardar.php",
        data: $("#FormOlvidoClave").serialize(),
        success: function (msg) {
            if (msg === "OK")
            {                
                $('#formularioRecuperarContrasena').hide();
                $('#FormOlvidoClave').show();
            }else{
               alert(msg);
               
                window.location.href = "../Index.html";
            }

        },
        error: function () {
            alert("Ocurrio un error en el cambio de pregunta secreta");
        }
    });  
}