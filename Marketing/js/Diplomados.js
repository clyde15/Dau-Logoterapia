$(document).ready(function () {
         $("#fechaini").datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'yy-mm-dd'
    });
         $("#fechafin").datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'yy-mm-dd'
    });
         $("#inscripcionfechaini").datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'yy-mm-dd'
    });
         $("#inscripcionfechafin").datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'yy-mm-dd'
    });
             $("#inicioinscrip").datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'yy-mm-dd'
    });
         $("#fininscrip").datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'yy-mm-dd'
    });

});


function popupDiv(div, titleDiv, w, h) {
    div.dialog({ autoOpen: true, width: w, title: titleDiv, height: h, modal: true, stack: true, draggable: false

    });
}


function ActivarDiplomado(iddiplomados) {

    $.ajax({
        dataType: "text",
        type: "POST",
        url: "../Diplomado/Guardar.php",
        data: { iddiplomados: iddiplomados, estatus: 1, MetodoE: 'Activar' },
        success: function (msg) {
            alert(msg);
            location.reload();
        },
        error: function () {
            alert("Ocurrio un error en la Actualizacion del diplomado");
        }
    });

}


function InactivarDiplomado(iddiplomados) {

    $.ajax({
        dataType: "text",
        type: "POST",
        url: "../Diplomado/Guardar.php",
        data: {iddiplomados: iddiplomados, estatus: 0, MetodoE: 'Desactivar'},
        success: function (msg) {
            alert(msg);
            location.reload();
        },
        error: function () {
            alert("Ocurrio un error en la Actualizacion del diplomado");
        }
    });

}


function GETCrearDiplomados() {

    
    var div = $("#crear");

    div.empty();
    div.load('../Diplomado/CrearDiplomados.php');
    popupDiv(div, "Crear Diplomado", 300, 500);


    div.dialog('open');
}

function InscripcionPeriodo(IDConfiguracion){
   var div = $("#crear");

    div.empty();
    div.load('PeriodoInscripcion.php?IDConfiguracion='+ IDConfiguracion);
    popupDiv(div, "Definir Periodo Inscripcion", 300, 350);


    div.dialog('open');  
}

function GETConfigurarDiplomado(){
    
   var div = $("#crear");

    div.empty();
    div.load('CrearConfigurarDiplomado.php');
    popupDiv(div, "Configurar Nuevo Diplomado", 600, 800);


    div.dialog('open');  
}

function DefinirProfesor(IDConfiguracion){
   var div = $("#crear");

    div.empty();
    div.load('AsignarProfesor.php?IDConfiguracion='+ IDConfiguracion);
    popupDiv(div, "Definir Profesores Responsables", 300, 380);


    div.dialog('open');  
}

function EditarDiplomadoConfiguracion(IDConfiguracion)
{
    var div = $("#crear");
    
    div.empty();
   div.load('EditarConfiguracionDiplomado.php?IDConfiguracion='+ IDConfiguracion);
    popupDiv(div, "Editar configuracion Diplomado", 500, 400);


    div.dialog('open'); 
}
//---------------------POST-------------------

function POSTCreardiplomado() {

    $.ajax({
        dataType: "text",
        type: "POST",
        url: "Guardar.php",
        data: $("#FormulalrioCrearDiplomado").serialize(),
        success: function (msg) {
            alert(msg);
            location.reload();
        },
        error: function () {
            alert("Ocurrio un error en la Creaci�n del diplomado");
        }
    });

}

function DefinirPeriodo(){
    
         var vacio = validar();
     
     if (vacio === false){
         $.ajax({
        dataType: "text",
        type: "POST",
        url: "Diplomado/Guardar.php",
        data: $("#formularioDefinirPeriodoInscripcion").serialize(),
        success: function (msg) {
            alert(msg);
            location.reload();
        },
        error: function () {
            alert("Ocurrio un error en la Actualizacion de la inscripcion");
        }
    });
     }
}

function POSTConfigurarDiplomado(){
    
        var ListaDias = [];

    $("#DiasParticipacion").find(".dias").each(function () {
        if ($(this).is(":checked")) {
            ListaDias.push($(this).val());
        }
    });
    
     var iddiplomado =  $("#iddiplomado").val();
     var fechaini =  $("#fechaini").val();
     var fechafin =  $("#fechafin").val();
     var Cantidad =  $("#Cantidad").val();
     var minimo =  $("#minimos").val();
     var tipo =  $("#tipo").val();
     var inscripcionfechaini =  $("#inscripcionfechaini").val();
     var inscripcionfechafin =  $("#inscripcionfechafin").val();     
     var gerente =  $("#gerente").val();
     var profesor =  $("#profesor").val();    
     var idresponsable =  $("#idresponsable").val();
    
     var vacio = validar();
     
     if (vacio === false){
                $.ajax({
               dataType: "text",
               type: "POST",
               url: "Diplomado/Guardar.php",
               data: {MetodoE: "ConfigurarDiplomado",iddiplomado: iddiplomado,fechaini: fechaini,fechafin:fechafin,Cantidad:Cantidad,minimo:minimo,tipo:tipo,inscripcionfechaini:inscripcionfechaini,inscripcionfechafin:inscripcionfechafin,gerente:gerente,profesor:profesor,idresponsable:idresponsable,ListaDias: ListaDias },
               success: function (msg) {
                   if(msg === "NO"){
                       alert("Hubo un error al configurar el diplomado, Por Favor Intentelo mas tarde. Si la Falla persiste comunicarse con el administrador del sistema");
                   }else{
                       alert("Se ha guardado la configuracion del diplomado exitosamente.");
                       location.reload();
                   }

               },
               error: function () {
                   alert("Ocurrio un error en la Actualizacion de la inscripcion");
               }
           });
     }
}

function POSTDefinirProfesor(){
    
    var vacio = validar();
     
     if (vacio === false){
                $.ajax({
               dataType: "text",
               type: "POST",
               url: "Diplomado/Guardar.php",
               data: $("#formularioDefinirProfesor").serialize(),
               success: function (msg) {
                   alert(msg);
                   location.reload();
               },
               error: function () {
                   alert("Ocurrio un error en la Actualizacion de los profesores");
               }
           });
     }
}

function POSTEditDiplomaConfiguracion(){

var vacio = validar();
     
     if (vacio === false){
            $.ajax({
           dataType: "text",
           type: "POST",
           url: "Diplomado/Guardar.php",
           data: $("#formularioEditarDiplomado").serialize(),
           success: function (msg) {
               alert(msg);
               location.reload();
           },
           error: function () {
               alert("Ocurrio un error en la Actualizacion de los profesores");
           }
       });
    }
}

//---------------INICIAR DIPLOMADO---------------

function IniciarDiplomado(idconfiguracion, estado, inscritos, minimo, solicitud)
{
    if (solicitud === 0)
    {
        if (inscritos < minimo) {

                var div = $("#autorizar");

                div.empty();
                div.load('SolicitarAutorizacion.php?idconfiguracion=' + idconfiguracion + '&inscritos=' + inscritos + '&minimo=' + minimo );
                popupDiv(div, "Solicitar Autorizacion", 600, 300);


                div.dialog('open');

        }else{
            $.ajax({
            dataType: "text",
            type: "POST",
            url: "Diplomado/Guardar.php",
            data:  {idconfiguracion: idconfiguracion, estatus: estado, MetodoE: 'Comenzar'},
            success: function (msg) {
                alert(msg);
                location.reload();
            },
            error: function () {
                alert("Ocurrio un error en la Actualizacion de los profesores");
            }
        });
        }
    }else{
          var div = $("#detalle");

            div.empty();
            div.load('DetalleAprobacion.php?idconfiguracion=' + idconfiguracion);
            popupDiv(div, "Detalle Aprobacion", 650, 400);


            div.dialog('open');
    }
 
}

function Detener(idconfiguracion, estado)
{
     $.ajax({
        dataType: "text",
        type: "POST",
        url: "Diplomado/Guardar.php",
        data:  {idconfiguracion: idconfiguracion, estatus: estado, MetodoE: 'Finalizar'},
        success: function (msg) {
            alert(msg);
            location.reload();
        },
        error: function () {
            alert("Ocurrio un error en la Actualizacion de los profesores");
        }
    }); 
}

function SolicitarAutorizacion() {

var vacio = validar();

if (vacio === false)
{
    $.ajax({
        dataType: "text",
        type: "POST",
        url: "Guardar.php",
        data: $("#SolicitarAutorizacion").serialize(),
        success: function (msg) {
            alert(msg);
            location.reload();
        },
        error: function () {
            alert("Ocurrio un error en la solicitud de autorizacion");
        }
    });
}


}

function darincio(idconfiguracion,estado)
{

   $.ajax({
            dataType: "text",
            type: "POST",
            url: "Diplomado/Guardar.php",
            data:  {idconfiguracion: idconfiguracion, estatus: estado, MetodoE: 'Comenzar'},
            success: function (msg) {
                alert(msg);
                location.reload();
            },
            error: function () {
                alert("Ocurrio un error en dar inicio al diplomado/formacion");
            }
        });
 
}

function Cancelar()
{
    location.reload();
}



//----------------EDITAR PARTICIPACION------------------------///
function Participacion(idconfiguracion)
{
    var div = $("#crear");
    
    div.empty();
   div.load('DiasParticipacion.php?IDConfiguracion='+ idconfiguracion);
    popupDiv(div, "Dias de Participacion", 300, 400);


    div.dialog('open'); 
}

function POSTParticipacion(idconfiguracion)
{
    
     var ListaDias = [];
     var validar = 0;
    $("#DiasParticipacion").find(".dias").each(function () {
        if ($(this).is(":checked")) {
            ListaDias.push($(this).val());
            validar++;
        }
    });
    
    if (validar === 0){
        alert("Debe seleccionar al menos un dia");
    }else{
         $.ajax({
            dataType: "text",
            type: "POST",
            url: "Diplomado/Guardar.php",
            data:  {idconfiguracion: idconfiguracion, MetodoE: 'Participacion',ListaDias:ListaDias},
            success: function (msg) {
                alert(msg);
                location.reload();
            },
            error: function () {
                alert("Ocurrio un error en dar inicio al diplomado/formacion");
            }
        }); 
    }

}


//Eliminaaar
function EliminarConfiguracion(IDConfiguracion){
     var div = $("#Eliminar");
    
    div.empty();
   div.load('EliminarConfiguracion.php?IDConfiguracion='+ IDConfiguracion);
    popupDiv(div, "Eliminar Configuracion", 300, 200);


    div.dialog('open');
}

function EliminarConfiguracionPOST()
{

    $.ajax({
            dataType: "text",
            type: "POST",
            url: "Guardar.php",
            data: $("#formularioEliminarConfi").serialize(),
            success: function (msg) {
                alert(msg);
                location.reload();
            },
            error: function () {
                alert("Ocurrio un error en eliminar la configuracion");
            }
        }); 
}