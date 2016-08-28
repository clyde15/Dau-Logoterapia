<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

include_once 'Conexion.php';

session_start();

error_reporting(0);

$IDU = $_GET['IDU'];

      

$query = "select * from usuarios where idusuario= '$IDU'";

$resultados = $conexion->query($query);

if ($resultados->num_rows > 0) {
    
    //echo 'Autentico';
    while ($registros = $resultados->fetch_array()){
        $Nombre = $registros['usuario'];
        $contrasenia = $registros['contrasenia'];
        $perfil = $registros['id_perfil'];
        $Apellido = $registros['apellido'];
        $NombreCompleto = $registros['nombre'];
        
        $_SESSION['User'] = $Nombre;
        $_SESSION['Apellido'] = $Apellido;
        $_SESSION['ID_Perfil'] = $perfil;
        $_SESSION['NombreCompleto'] = $NombreCompleto;

        echo'correcto';
        // header('location:Inicio.php');
    }
    
    
}else{

   echo "<p style='color:Red'> Usuario o password invalido, por favor intente nuevamente </p>";

}
