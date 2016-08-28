<html lang="es-ES" xml:lang="es-ES">
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="../js/bootstrap.min.js" type="text/javascript"></script>
         <script src="../js/AceptarSolicitudesTraslado.js" type="text/javascript"></script>
       <link rel="stylesheet" href="../css/bootstrap.css" media="all"/>
       
    </head>
    <body>


 <?php   
 error_reporting(0);
 session_start();

 
 $varsession = $_SESSION['User'];

     if ($varsession == NULL || $varsession =='') {
    
    echo $varsession;
    echo 'usuario no logueado por favor validar con el administrador';
    
    
}else{

    
 include_once '../Conexion.php';

 $idalumnostraslado = $_GET["idalumnostraslado"];

 $query = "SELECT * FROM alumnostraslado ab
			inner join alumnos a on ab.ID_Alumno = a.idalumnos
                where ab.idAlumnosTraslado = '$idalumnostraslado' ";

 $resultados = $conexion->query($query);
 $registros = $resultados->fetch_array();

      
 ?>

        <script>
    
         $('#FechaCompromisoPago').datepicker({
            dateFormat:"yy-mm-dd",
            minDate: new Date()
            
        });
        
         function validarNro(e) {
        var key;
        if (window.event) // IE
        {
            key = e.keyCode;
        }
        else if (e.which) // Netscape/Firefox/Opera
        {
            key = e.which;
        }

        if (key < 48 || key > 57) {
            if (key == 8) // Detectar . (punto) y backspace (retroceso)
            { return true; }
            else
            { return false; }
        }
        return true;
    }
        
        
        </script>
        
 <form method="post" id="formularioAceptarTraslado">

        <fieldset>
        <legend>Aceptar Traslado de alumno</legend>
        <input type="Hidden" name="idAlumnosTraslado" id="idAlumnosTraslado" value="<?php echo $registros['idAlumnosTraslado'];?>" />
        <input type="Hidden"  name="MetodoE" value="AceptarTraslado" id="MetodoE" />
        <div class="editor-label">
                <label>Fecha Compromiso de Pago</label>
        </div>
        <div class="editor-field">
         <input type="text" name="FechaCompromisoPago" id="FechaCompromisoPago" value="<?php echo  $registros['FechaCompromisoPago'];?>" />
        </div>
        <div class="editor-label">
                <label>Duracion del traslado</label>
        </div>
        <div class="editor-field">
            <input type="text" name="DiasTraslado" id="DiasTraslado" onkeypress = "return validarNro(event)" value="1 Año" disabled="disable" title="Por defecto es un Año, no se puede modificar!"/>
       </div>

        <p>
            <input type="button" value="Guardar" class="btn btn-primary" onclick="AceptarTraslado()" />
        </p>
    </fieldset>
    </form>

    </body>
</html>
<?php }?>