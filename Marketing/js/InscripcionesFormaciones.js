$(document).ready(function () {
  
  $("#DetalleTipoPago").hide();
  $("#DetallePago").hide();
  $("#DetallePago2").hide();
  
  $("#Interes").hide(); 
  $("#InteresFormacion").hide();
  $("#FormularioInscripcionFormacion").hide();
  $("#NoCumpleRequisitos").hide();
  
      $("#Correo1").focusout(function () {

            correo($("#Correo1").val());

        });
        
       $("#fechanacimiento").datepicker({
      changeMonth: true,
      changeYear: true,
      dateFormat: 'yy-mm-dd'
    });
    
    
    $("#fecharegistro").datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'yy-mm-dd'
    });
    
     $("#InicioPago").datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'yy-mm-dd'
    });
    
     $("#Vencimiento").datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'yy-mm-dd'
    });

    $('#BuscarInteresadoDNI').attr("disabled", true);
});
  

function jsFunction(value)
{
    if (value === "2")
    {
        $("#DetalleTipoPago").show();
        $("#DetallePago").show();
        $("#DetallePago2").show();
        $("#cuotas").addClass("validarcampos");
        $("#InicioPago").addClass("validarcampos");
        $("#Vencimiento").addClass("validarcampos");
        $("#Frecuencia").addClass("validarcampos");
    }else{
        
        $("#cuotas").removeClass("validarcampos");
        $("#InicioPago").removeClass("validarcampos");
        $("#Vencimiento").removeClass("validarcampos");
         $("#Frecuencia").removeClass("validarcampos");
        
        $("#DetalleTipoPago").hide();
         $("#DetallePago").hide();
         $("#DetallePago2").hide();
    }
}

function BuscarInteresado()
{

       $.ajax({
        dataType: "text",
        type: "POST",
        url: "Guardar.php",
        data: $("#FormularioBuscar").serialize(),
        success: function (msg) {
            var separar = msg.split(',');
            if (separar[0] === 'SI')
            {
               $("#NoCumpleRequisitos").show();
               $('#FormularioInscripcionFormacion').hide();           
            }else if (separar[0] === 'NO')
            {
                var separar = msg.split(',');
                
                var nombres = separar[1];
                var apellidos = separar[2];               
                var numerocasa = separar[5];
                var celular = separar[6];
                var correo = separar[7];
                var skype = separar[8];
                var nacimientos = separar[9];               
                var DNI = separar[3];
                var direccion = separar[4];

                $("#Interes").hide(); 
                $("#InteresFormacion").hide();
                
                $("#nombres").val(nombres);
                $("#Apellidos").val(apellidos);
                $("#DNIre").val(DNI);
                $("#direccion").val(direccion);
                $("#numerocasa").val(numerocasa);
                $("#celular").val(celular);
                $("#skype").val(skype);
                $("#Correo1").val(correo);
                $("#observacion").val(direccion);
                $("#fechanacimiento").val(nacimientos);
                
                var d = new Date();
               $("#fecharegistro").val(d.getDate() + "/" + (d.getMonth() +1) + "/" + d.getFullYear());
               
                $('#FormularioInscripcionFormacion').show();
                $("#guardar").show();
                $("#NoCumpleRequisitos").hide();
                $("#ocultar").show();
                $("#ocultar1").show();
                $("#ocultar2").show();
                $("#ocultar3").show();
                $("#ocultar4").show();
                $("#formacocul").show();
                $("#form").show();
            }else{
               
                var separar = msg.split(',');
                
                var nombres = separar[0];
                var nombre = nombres.split('</font>');
                var apellidos = separar[1];               
                var numerocasa = separar[3];
                var celular = separar[4];
                var correo = separar[5];
                var observacion = separar[6];
                var skype = separar[7];
                var nacimientos = separar[8]; 
                var DNI = separar[10];
                var direccion = separar[12];
                var fechacreacion = separar[14];
                var usuarioresponsable = separar[15];
                var diplomados = separar[16];
                    
                
                $("#fecharegistro").val(fechacreacion);
                $("#nombres").val(nombre[2]);
                $("#Apellidos").val(apellidos);
                $("#DNIre").val(DNI);
                $("#fechanacimiento").val(nacimientos);
                $("#direccion").val(direccion);
                $("#numerocasa").val(numerocasa);
                $("#celular").val(celular);
                $("#skype").val(skype);
                $("#Correo1").val(correo);
                $("#observacion").val(observacion);
                $("#usuarioresponsable").val(usuarioresponsable);
               
                if (diplomados === ""){
                    $("#Interes").hide(); 
                    $("#InteresFormacion").hide();

                }else{
                    $("#Interes").show(); 
                    $("#InteresFormacion").show();
                   $("#Formaciones").val(diplomados); 
                }
                
               
                $('#FormularioInscripcionFormacion').show();
                $("#guardar").hide();
                $("#NoCumpleRequisitos").show();
                $("#ocultar").hide();
                $("#ocultar1").hide();
                $("#ocultar2").hide();
                $("#ocultar3").hide();
                $("#ocultar4").hide();
                $("#formacocul").hide();
                $("#form").hide();
            }
        },
        error: function () {
            alert("Ocurrio un error al buscar al usuario");
        }
    });
   
    
}

function ValidarCampo()
{
    if ($("#DNI").val() === '')
    {
       $('#BuscarInteresadoDNI').attr("disabled", true); 
    }else{
      $('#BuscarInteresadoDNI').attr("disabled", false);  
    }
    
}

function Limpiar()
{
   location.reload();
}

function PostGuardarInscripcionDiplomado()
{
    var Configuracion = [];

    var fecharegistro = $("#fecharegistro").val();
    var nombres = $("#nombres").val();
    var apellidos = $("#Apellidos").val();
    var DNI = $("#DNIre").val();
    var nacimiento = $("#fechanacimiento").val();
    var direccion = $("#direccion").val();
    var numerocasa = $("#numerocasa").val();
    var celular = $("#celular").val();
    var skype = $("#skype").val();
    var correo = $("#Correo1").val();
    var idmetodopago = $("#idmetodopago").val();
    var tipopago = $("#tipopago").val();
    var cuotas = $("#cuotas").val();
    var Vencimiento = $("#Vencimiento").val();
    var InicioPago = $("#InicioPago").val();
    var Frecuencia = $("#Frecuencia").val();
    
    nacimiento += ' 00:00:00';
    Vencimiento += ' 00:00:00';
    InicioPago += ' 00:00:00';
    var validarconfiguracion = false;
    $("#idconfiguracion").find(".configuracion").each(function () {
        if ($(this).is(":checked")) {
            Configuracion.push($(this).val());
            validarconfiguracion = true;
        }
        
    });

    var filtro = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    var vallidarcorreo = false;
    if (filtro.test(correo)) {        
        vallidarcorreo = true;
    } else {
        alert("Correo no posee formato correcto");
 
        vallidarcorreo = false;
    }
  
    
    var vacio = validar();
     
     if (validarconfiguracion === false){
         alert("Debe Seleccionar la formacion al que se va a inscribir al alumno");
     }
  
   if (vacio === false && vallidarcorreo === true && validarconfiguracion === true){
       $.ajax({
        dataType: "text",
        type: "POST",
        url: "Guardar.php",
        data: {MetodoE: 'GuardarInscripcionDiplomados', fecharegistro: fecharegistro, nombres: nombres, apellidos: apellidos, DNI: DNI, nacimiento: nacimiento,direccion: direccion, numerocasa: numerocasa, celular: celular, skype: skype, correo: correo, Configuracion: Configuracion,idmetodopago: idmetodopago,tipopago:tipopago,cuotas:cuotas,Vencimiento:Vencimiento,InicioPago:InicioPago,Frecuencia:Frecuencia},
        success: function (msg) {
            alert(msg);
            location.reload();
        },
        error: function () {
            alert("Ocurrio un error en el registro de formacion");
        }
    });
   }
    
}

function Diplomado()
{
    window.location.href = "../Marketing/InscripcionDiplomado.php";
}