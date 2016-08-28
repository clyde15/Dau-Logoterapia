
jQuery(document).ready(function () {
    
        setInterval(function () {

            jQuery("#right").click();

        }
                    , 5000);

        jQuery(".CC").hide();

        setInterval(function () {

            var f = new Date();

            var otra = f.toString().substring(0, 24);

            jQuery("#hora").val(otra);
        }
                    , 1000);

    });          




