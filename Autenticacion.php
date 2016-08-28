
<?php

include_once 'Conexion.php';

session_start();

error_reporting(0);

$user = $_POST['user'];

$password = $_POST['password'];
      

$query = "select * from usuarios where usuario= '$user' and contrasenia= '$password' and activo=1 and eliminado= 0";

$resultados = $conexion->query($query);

if ($resultados->num_rows > 0) {
    
    //echo 'Autentico';
    while ($registros = $resultados->fetch_array()){
        $Nombre = $registros['usuario'];
        $contrasenia = $registros['contrasenia'];
        $perfil = $registros['id_perfil'];
        $Apellido = $registros['apellido'];
        $NombreCompleto = $registros['nombre'];
        $idresponsable = $registros['idusuarios'];
        
        $_SESSION['User'] = $Nombre;
        $_SESSION['Apellido'] = $Apellido;
        $_SESSION['ID_Perfil'] = $perfil;
        $_SESSION['NombreCompleto'] = $NombreCompleto;
        $_SESSION['Responsable'] = $idresponsable;

   
      
         echo 'correcto';    
       
       // header('location:Inicio.php');
    }
    
    
}else{

   echo "<p style='color:Red'> Usuario o password invalido, por favor intente nuevamente </p>";

}


