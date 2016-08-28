<?php

session_start();

error_reporting(0);

$varsession = $_SESSION['User'];

if ($varsession == NULL || $varsession =='') {
    
 echo 'usuario no logueado por favor validar con el administrador';
}else{
    
   session_destroy();
header('location:Index.html');
    
}



