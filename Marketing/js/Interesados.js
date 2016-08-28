$(document).ready(function () {
  
  $("#FormularioInteresados").hide();
  
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
    
    $('#BuscarInteresadoDNI').attr("disabled", true);
});
  


function PostGuardarInteresados()
{
    var Diplomados = [];
    var Formaciones = [];


    var fecharegistro = $("#fecharegistro").val();
    var idresponsable = $("#idresponsable").val();
    var nombres = $("#nombres").val();
    var apellidos = $("#Apellidos").val();
    var DNI = $("#DNIre").val();
    var edad = $("#edad").val();
    var ocupacion = $("#ocupacion").val();
    var distrito = $("#distrito").val();
    var nacimiento = $("#fechanacimiento").val();
    var direccion = $("#direccion").val();
    var numerocasa = $("#numerocasa").val();
    var celular = $("#celular").val();
    var skype = $("#skype").val();
    var correo = $("#Correo1").val();
    var observacion = $("#observacion").val();

    nacimiento += ' 00:00:00';
  
    $("#iddiplomados").find(".diplomados").each(function () {
        if ($(this).is(":checked")) {
            Diplomados.push($(this).val());
        }
    });
    
    $("#idformacion").find(".formacion").each(function () {
        if ($(this).is(":checked")) {
            Formaciones.push($(this).val());
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
     
  
   if (vacio === false && vallidarcorreo === true){
       $.ajax({
        dataType: "text",
        type: "POST",
        url: "Guardar.php",
        data: {MetodoE: 'GuardarInteresados', fecharegistro: fecharegistro, idresponsable: idresponsable, nombres: nombres, apellidos: apellidos, DNI: DNI, edad: edad, ocupacion: ocupacion, distrito: distrito, nacimiento: nacimiento,direccion: direccion, numerocasa: numerocasa, celular: celular, skype: skype, correo: correo, observacion: observacion, Formaciones: Formaciones, Diplomados: Diplomados },
        success: function (msg) {
            alert(msg);
            location.reload();
        },
        error: function () {
            alert("Ocurrio un error en el registro de interesados");
        }
    });
   }
    
}

function BuscarInteresado()
{

       $.ajax({
        dataType: "text",
        type: "POST",
        url: "Guardar.php",
        data: $("#FormularioInteresadoBuscar").serialize(),
        success: function (msg) {
            if (msg === 'SI')
            {
                var usuario = $("#usuario").val();
              $("#FormularioInteresados").show();
              $("#usuarioresponsable").val(usuario);
              $("#fecharegistro").val();
              

                $("#nombres").val("").removeAttr("disabled");
                $("#Apellidos").val("").removeAttr("disabled");
                $("#DNIre").val("").removeAttr("disabled");
                $("#edad").val("").removeAttr("disabled");
                $("#ocupacion").val("").removeAttr("disabled");
                $("#distrito").val("").removeAttr("disabled");
                $("#fechanacimiento").val("").removeAttr("disabled");
                $("#direccion").val("").removeAttr("disabled");
                $("#numerocasa").val("").removeAttr("disabled");
                $("#celular").val("").removeAttr("disabled");
                $("#skype").val("").removeAttr("disabled");
                $("#Correo1").val("").removeAttr("disabled");
                $("#observacion").val("").removeAttr("disabled");
                $("#informacion").hide();   
                
                var d = new Date();
               $("#fecharegistro").val(d.getDate() + "/" + (d.getMonth() +1) + "/" + d.getFullYear());
              
                     $("#guardar").show();
                    $("#InformacionAdi").show();
                    $("#InformacionAdi2").show();
                    $("#diploform").show();
                    $("#diploform2").show();
              
              
            }else{
                var separar = msg.split(',');
                
                if (separar[0] === 'NO')
                {
                        var nombres = separar[1];
                        var apellidos = separar[2];
                        var numerocasa = separar[5];
                        var celular = separar[6];
                        var correo = separar[7];
                        var skype = separar[8];
                        var nacimiento = separar[9];
                        var DNI = separar[3];
                        var direccion = separar[4];
                        
                        $("#nombres").val(nombres).attr('disabled', 'disabled');
                        $("#Apellidos").val(apellidos).attr('disabled', 'disabled');
                        $("#DNIre").val(DNI).attr('disabled', 'disabled');
                        $("#fechanacimiento").val(nacimiento).attr('disabled', 'disabled');
                        $("#direccion").val(direccion).attr('disabled', 'disabled');
                        $("#numerocasa").val(numerocasa).attr('disabled', 'disabled');
                        $("#celular").val(celular).attr('disabled', 'disabled');
                        $("#skype").val(skype).attr('disabled', 'disabled');
                        $("#Correo1").val(correo).attr('disabled', 'disabled');
                        $("#edad").val("").attr('disabled', 'disabled');
                        $("#ocupacion").val("").attr('disabled', 'disabled');
                        $("#distrito").val("").attr('disabled', 'disabled');
                        $("#fecharegistro").attr('disabled', 'disabled');
                        
                        $("#guardar").hide();
                        $("#InformacionAdi").hide();
                        $("#InformacionAdi2").hide();
                        $("#diploform").hide();
                        $("#diploform2").hide();
                        
                        $("#informacion").show();
                        
                  
                }else{
                        var nombres = separar[0];
                        var apellidos = separar[1];
                        var ocupacion = separar[2];
                        var numerocasa = separar[3];
                        var celular = separar[4];
                        var correo = separar[5];
                        var observacion = separar[6];
                        var skype = separar[7];
                        var nacimiento = separar[8];
                        var distrito = separar[9];
                        var DNI = separar[10];
                        var direccion = separar[12];
                        var edad = separar[13];
                        var fechacreacion = separar[14];
                        var usuarioresponsable = separar[15];

                        $("#fecharegistro").val(fechacreacion);
                        $("#nombres").val(nombres);
                        $("#Apellidos").val(apellidos);
                        $("#DNIre").val(DNI);
                        $("#edad").val(edad);
                        $("#ocupacion").val(ocupacion);
                        $("#distrito").val(distrito);
                        $("#fechanacimiento").val(nacimiento);
                        $("#direccion").val(direccion);
                        $("#numerocasa").val(numerocasa);
                        $("#celular").val(celular);
                        $("#skype").val(skype);
                        $("#Correo1").val(correo);
                        $("#observacion").val(observacion);
                        $("#usuarioresponsable").val(usuarioresponsable);
                        
                        $("#informacion").hide();
                }               
                $('#FormularioInteresados').show();
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

function Nuevo()
{
    $('#FormularioInteresados').show();
    
      var usuario = $("#usuario").val();
      $("#FormularioInteresados").show();
      $("#usuarioresponsable").val(usuario);
      $("#fecharegistro").val();


        $("#nombres").val("").removeAttr("disabled");
        $("#Apellidos").val("").removeAttr("disabled");
        $("#DNIre").val("").removeAttr("disabled");
        $("#edad").val("").removeAttr("disabled");
        $("#ocupacion").val("").removeAttr("disabled");
        $("#distrito").val("").removeAttr("disabled");
        $("#fechanacimiento").val("").removeAttr("disabled");
        $("#direccion").val("").removeAttr("disabled");
        $("#numerocasa").val("").removeAttr("disabled");
        $("#celular").val("").removeAttr("disabled");
        $("#skype").val("").removeAttr("disabled");
        $("#Correo1").val("").removeAttr("disabled");
        $("#observacion").val("").removeAttr("disabled");
        $("#DNI").val("").removeAttr("disabled");
        
        $("#informacion").hide();
        var d = new Date();
       $("#fecharegistro").val(d.getDate() + "/" + (d.getMonth() +1) + "/" + d.getFullYear());
       
       $("#guardar").show();
        $("#InformacionAdi").show();
        $("#InformacionAdi2").show();
        $("#diploform").show();
        $("#diploform2").show();
       
       
}