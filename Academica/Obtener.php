<?php

if(!empty($_POST["Tipo"]) && !empty($_POST["Estado"])) {
    
    $Tipo = $_POST["Tipo"];
    $Estado = $_POST["Estado"];
    
    if ($Tipo == D ) {
        
         switch ($Estado)
   {
             case "T":
                 $query ="SELECT iddiplomados as ID,Nombre FROM logoterapia.diplomados";
                 break;
             case "I":
                $query ="SELECT iddiplomados as ID,Nombre FROM logoterapia.diplomados WHERE Activo = 0";
                break;
            case "A":
                $query ="SELECT iddiplomados as ID,Nombre FROM logoterapia.diplomados WHERE Activo = 1"; 
                break;
         }
                
    }else{
        switch ($Estado)
   {
             case "T":
                 $query ="SELECT idformaciones as ID,Nombre FROM logoterapia.formacion";
                 break;
             case "I":
                $query ="SELECT idformaciones as ID,Nombre FROM logoterapia.formacion WHERE Activo = 0";
                break;
            case "A":
                $query ="SELECT idformaciones as ID,Nombre FROM logoterapia.formacion WHERE Activo = 1"; 
                break;
         }
        
    }
	
	$resultados = Query($query);
?>
	<option value="">Seleccione</option>
<?php
	foreach($resultados as $state) {
?>
	<option value="<?php echo $state["ID"]; ?>"><?php echo $state["Nombre"]; ?></option>
<?php
	}
}


function Query($query){
     include_once '../Conexion.php';
    		$result = $conexion->query($query);
		while($row= $result->fetch_array()) {
			$resultset[] = $row;
		}		
		if(!empty($resultset))
			return $resultset;
    
    
}




?>