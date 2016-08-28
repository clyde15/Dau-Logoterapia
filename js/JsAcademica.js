$(document).ready(function () {
 $("#Tipo").change(function () {
               var estado = $("#Estado option:selected").val();
               var Tipo = $(this).val();
           
  if (estado != "") {
        $.ajax({
	type: "POST",
	url: "Obtener.php",
	data:'Tipo='+Tipo+'&Estado='+estado,
	success: function(data){
		$("#Listado").html(data);
	}
	});
    
    }
        
            });
            
             $("#Estado").change(function () {
               var Tipo = $("#Tipo option:selected").val();
               var estado = $(this).val();
           
  if (Tipo != "") {
        $.ajax({
	type: "POST",
	url: "Obtener.php",
	data:'Tipo='+Tipo+'&Estado='+estado,
	success: function(data){
		$("#Listado").html(data);
	}
	});
    
    }
        
            });
});

function BuscarAlumnosI(){
        
        var ID = $("#Listado option:selected").val();
        var Tipo = $("#Tipo option:selected").val();
        var estado = $("#Estado option:selected").val();
         
        if (ID == "" && Tipo == "" && estado == "") {
        alert("Debe seleccionar una opcion para continuar")
    }
       else  if (ID == "" && Tipo == "D" ) {
        alert("Debe Seleccionar al menos un Diplomado")
    }else if (ID=="" && Tipo == "F") {
        alert("Debe Seleccionar al menos una Formacion")
    }else {
            div = $("#BuscaAlumnos");
        div.load("AlumnosInscritos.php?ID="+ID+"&TipoListado="+Tipo);
    }
        
}

function BuscarAlumnosR(){
        
        var DNI = $("#DNI").val();
        div = $("#BuscaAlumnos");
        div.load("ListaDFA.php?DNI="+DNI);
        
}

function RetiroAlumnos(ID,IDC){
    
         var div = $("#PopU");

    div.empty();
    div.load('Retirar.php?ID=' + ID+ "&IDC="+IDC);
  popupDiv(div, "Retirar Alumno", 500, 330);
    
    
}


function RetirarA(){
    
    
    $.ajax({
        dataType: "text",
        type: "POST",
        url: "Guardar.php",
        data: $("#RetirarAlumno").serialize(),
        success: function (msg) {
            alert(msg);
            
            },
        error: function () {
            alert("Ocurrio un error");
        }
    });
           
    
}

function DetalleDiplomado (IDDiplomado){
    
    var div = $("#DetalleDiplomado");

    div.empty();
    div.load('DetalleDiplomado.php?iddiplomados=' + IDDiplomado);
  popupDiv(div, "Detalle Diplomado", 500, 315);
    
    
}


function DetalleFormaciones (IDFormaciones){
    
    var div = $("#DetalleFormaciones");

    div.empty();
    div.load('DetalleFormaciones.php?idformaciones=' + IDFormaciones);
  popupDiv(div, "Detalle Formaciones", 500, 315);
    
    
}

function ListaAlumnos (IDDiplomado,Tipo){
    
        if (Tipo == "D") {
        var div = $("#DetalleDiplomado");
    }else {
            var div = $("#DetalleFormaciones");
    }

    div.empty();
    div.load('AlumnosInscritos.php?ID=' + IDDiplomado+'&TipoListado='+Tipo);
  popupDiv(div, "Alumnos Inscritos", 800, 600);
    
    
}

        function CargarVista(ID,IDC){
         $('#nestedGrow').find("img").attr("src","../wp-content/uploads/2015/10/alejar.png");
         $('#nestedGrow').load();
         $('#nestedGrow ').attr("onclick","CerrarVista("+ID+")");
         $('#tr' + ID).hide().fadeIn();
         $('#tr' + ID).css("display","table-row")
         
         $('#tr' + ID).animate({
             width: "525 px"
         }, 1000, "swing", function () {
             

        
            var div = $("#target"+ID);

    div.empty();
    div.load('DetalleAlumnosDeBaja.php?idalumnos=' + ID+"&idconfiguracion="+IDC).hide().fadeIn();
          
      
             $('#tr' + ID).animate({
                 height: "260px"
             }, 1000, "linear");
             
         });
         
            }

         
       function CerrarVista(ID){
           $("#target" + ID).hide().fadeOut("slow")
          // $("#target" + ID).empty();
          var height = $("#target" + ID).attr
           if (true) {

           }
            $('#tr'+ID).animate({
                height: "21px"
            }, 1000, "linear", function () {

                $('#tr'+ID).animate({
                    width: "525 px"
                }, 1000, "swing");
                 $('#tr' + ID).css("display","none");
                 $('#nestedGrow').find("img").attr("src","../wp-content/uploads/2015/10/enfocar.png");
         
         $('#nestedGrow ').attr("onclick","CargarVista("+ID+")");
            });
        
        }

function popupDiv(div, titleDiv, w, h) {
    div.dialog({ autoOpen: true, width: w, title: titleDiv, height: h, modal: true, stack: true, draggable: false

    });
}

function ValidarCampo()
{
    if ($("#DNI").val() === '')
    {
       $('#BuscarAlumnoR').attr("disabled", true); 
    }else{
      $('#BuscarAlumnoR').attr("disabled", false);  
    }
    
}

function isNumberKey(evt)
      {
         var charCode = (evt.which) ? evt.which : event.keyCode
         if (charCode > 31 && (charCode < 48 || charCode > 57))
            return false;
 
         return true;
      }
