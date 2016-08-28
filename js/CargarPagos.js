
function GenerarRegistroPago() {

var vacio = false;

    $(".validarcampos").each(function(){
        
        if ($(this).val() == "") {
            vacio = true;
            return false;
//             ListaCampos.push({
//                Campo: $(this).attr("id"),
//                Vacio: true
//            });
        }else {
            vacio = false;
//                ListaCampos.push({
//                Campo: $(this).attr("id"),
//                Vacio: false
//            }); 
        }
        
    });
    
    if (vacio) {
        
        
    $(".validarcampos").each(function(){
        
        if ($(this).val() == "") {
                
            $(this).css("backgroundColor", "#FFE4C4");
            
        }  
        else {
         $(this).css("backgroundColor", ""); 
        }
        
    });
        alert("los campos sombreados en rojo son requeridos!!");
        
    }else {
    
    $.ajax({
        dataType: "text",
        type: "POST",
        url: "Guardar.php",
        data: $("#formularioRegistrarPago").serialize(),
        success: function (msg) {
            alert(msg);
            //Sirve para salir del Iframe y redireccionar a la pagina que te de la gana y se cargue en la ventana del navegador.
            location.reload();

        },
        error: function () {
            alert("Ocurrio un error en el registro del pago");
        }
    });
    
    
    }
}

