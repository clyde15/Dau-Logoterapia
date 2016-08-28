function correo(campo) {
    //    alert("dwad");
    var filtro = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

    if (filtro.test(campo)) {
        
        return true;
    } else {
        alert("Correo no posee formato correcto");
 
        return false;
    }

}

function validar()
{
        var vacio = false;

        $(".validarcampos").each(function(){

            if ($(this).val() === "") {
                vacio = true;
                return false;

            }else {
                vacio = false;
            }

        });

    if (vacio) {


        $(".validarcampos").each(function(){

            if ($(this).val() === "") {

                $(this).css("backgroundColor", "#FFE4C4");

            }  
            else {
             $(this).css("backgroundColor", ""); 
            }

        });
            alert("los campos sombreados en rojo son requeridos!!");
            return true ;
        }else{
            return false ;
        }
}


function isNumberKey(evt)
      {
         var charCode = (evt.which) ? evt.which : event.keyCode
         if (charCode > 31 && (charCode < 48 || charCode > 57))
            return false;
 
         return true;
      }
