<!DOCTYPE html> 
<html>
    <HEAD>
    






  
    </HEAD>

    <script src="../js/jquery-1.8.2.js" type="text/javascript"></script>

 <script src="../js/jquery.ui.js" type="text/javascript"></script>
    <script src="../js/EditarPreguntaSeguridad.js" type="text/javascript"></script>

   <link rel="stylesheet" href="../js/jquery-ui.css" media="all" type="text/css"  />
    
     <link rel="stylesheet" href="../css/bootstrap.css" media="all" type="text/css"  />
     <link rel="stylesheet" href="../css/grids.css" media="all" type="text/css"  />

    <BODY style=" background-color:transparent">

<div class="clearfloat"/>
        

       
<div class="clearfloat"/>
<br />
<br />
 
<div align="center">
       
<form method="post" id="formularioBuscarUs" align="center">
        <fieldset>
        <legend>Recuperar Contrasena</legend>
        <input type="Hidden"  name="MetodoE" value="BuscarUsuario" />
       <div class="editor-label">
                <label>Usuario</label>
        </div>        
        <div class="editor-field">
            <input type="text" name="Usuario" id="login" value=""/>
        </div>
         
        <p>
            <input type="button" value="Buscar" id="recContrasena" class="btn btn-primary" onclick="BuscarUsuario()" />
        </p>
    </fieldset>
  </form>

</div>        
<div> 
       <form method="post" id="formularioRecuperarContrasena" align="center">
        
        <fieldset>
        <legend>Seguridad</legend>
      
        <input type="Hidden"  name="MetodoE" value="RecuperarContrasena" />

       <div class="editor-label">
                <label>Pregunta De Seguridad</label>
        </div>        
        <input type="Hidden" value="" name="idpreguntarespuesta" id="idpreguntarespuesta" value="" />
        <input type="Hidden" value="" name="idusuario" id="idusuario" value="" />
        <div class="editor-field">
            <input type="text" disabled="disabled" value="" name="pregunta" id="pregunta" />
        </div>
          <div class="editor-label">
                <label>Respuesta</label>
        </div>        
        <div class="editor-field">
            <input type="password" name="respuesta" id="respuesta" value=""/>
        </div>
        <p>
            <input type="button" value="Recuperar" id="botonpreg" class="btn btn-primary" onclick="ValidarPreguntasSeguridad()" />
        </p>
    </fieldset>
    </form>
</div>
<div> 
    <form method="post" id="FormOlvidoClave" align="center">

        <fieldset>
        <legend>Cambio de Contrasena</legend>

        <input type="Hidden"  name="MetodoE" value="OlvidoClave" />
        <input type="Hidden" value="" name="idusuarios" id="idusuarios" value="" />
         <div class="editor-label">
                <label>Contrasena Nueva</label>
        </div>
        
        <div class="editor-field">
            <input type=password name="nueva" id="nueva"/>
        </div>
         <div class="editor-label">
                <label>Confirmar Contrasena Nueva</label>
        </div>
        
        <div class="editor-field">
            <input type=password name="confirmarnueva" id="confirmarnueva" onkeyup="ValidarContrasena()" >  
            
        </div>
        <label style="color:red"  id="mensaje">La Contrasena no coincide</label>
        <p>
            <input type="button" value="Guardar" id="CambioContrasena" class="btn btn-primary" onclick="RecuperarContrasena()" />
        </p>
    </fieldset>
    </form>
</div>
  </BODY>




</html>
