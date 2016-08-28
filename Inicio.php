<?php

session_start();

error_reporting(0);

$varsession = $_SESSION['User'];



if ($varsession == NULL || $varsession =='') {
    
    echo $varsession;
    echo 'usuario no logueado por favor validar con el administrador';
    
    
}else{
    ?>
    <html>
        <body >
     <link href="css/IconosSociales.css" rel="stylesheet" type="text/css"/>
     
     
<link rel='stylesheet' id='dt-sc-css-css'  href='wp-content/plugins/designthemes-core-features/shortcodes/css/shortcodesb523.css?ver=4.3.3' type='text/css' media='all' />
<link rel='stylesheet' id='js_composer_front-css'  href='wp-content/plugins/js_composer/assets/css/js_composer1c9b.css?ver=4.6.1' type='text/css' media='all' />
<link rel='stylesheet' id='lms-default-css'  href='wp-content/themes/lms/styleb523.css?ver=4.3.3' type='text/css' media='all' />
<link rel='stylesheet' id='custom-font-awesome-css'  href='wp-content/themes/lms/css/font-awesome.minb523.css?ver=4.3.3' type='text/css' media='all' />
<link rel='stylesheet' id='skin-css'  href='wp-content/themes/lms/skins/white-blue/styleb523.css?ver=4.3.3' type='text/css' media='all' />
<script type='text/javascript' src='wp-includes/js/jquery/jqueryc1d8.js?ver=1.11.3'></script>

      <div style=" 
/* Permalink - use to edit and share this gradient: http://colorzilla.com/gradient-editor/#1e5799+0,2989d8+50,478bca+50,7db9e8+100,7db9e8+100&0+17,1+70,1+100 */
background: -moz-linear-gradient(top,  rgba(30,87,153,0) 0%, rgba(44,105,170,0) 17%, rgba(71,139,202,0.62) 50%, rgba(93,157,214,1) 70%, rgba(125,185,232,1) 100%); /* FF3.6-15 */
background: -webkit-linear-gradient(top,  rgba(30,87,153,0) 0%,rgba(44,105,170,0) 17%,rgba(71,139,202,0.62) 50%,rgba(93,157,214,1) 70%,rgba(125,185,232,1) 100%); /* Chrome10-25,Safari5.1-6 */
background: linear-gradient(to bottom,  rgba(30,87,153,0) 0%,rgba(44,105,170,0) 17%,rgba(71,139,202,0.62) 50%,rgba(93,157,214,1) 70%,rgba(125,185,232,1) 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#001e5799', endColorstr='#7db9e8',GradientType=0 ); /* IE6-9 */
">
        
          
          
          
 <?php
    echo 'Listado de diplomados activos';
    ?>
           
<br/>
<a href="CerrarSession.php">Salir del Sistema<a/>
    
        </div> 
    </html>
</body>     
 <?php  
        }




?>

   
   


