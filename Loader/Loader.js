
    function loader (Opciones) {

        switch (Opciones) {
            case 'Cerrar':

                $(".cs-loader").remove();
              
                return;


            default:

                var $Screen = $('<div class="cs-loader"><img class="imagen" src="' + '/wp-content/uploads/2015/10/logo-footer1.jpg' + '"><div class="cs-loader-inner"><label>●</label><label>●</label><label>●</label><label>●</label><label>●</label><label>●</label></div><div class="label"><a>Cargando...</a></div></div>').appendTo('body');
                             
                return;
        }

    }
