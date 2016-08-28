<?php
    include_once '../Conexion.php';

session_start();

error_reporting(0);

$varsession = $_SESSION['User'];



if ($varsession == NULL || $varsession =='') {
    
    echo $varsession;
    echo 'usuario no logueado por favor validar con el administrador';
    
    
}else{
?>
<!DOCTYPE html> 
<html>
    <HEAD>

    </HEAD>

    <script src="../js/jquery-1.8.2.js" type="text/javascript"></script>

 <script src="../js/jquery.ui.js" type="text/javascript"></script>
    <script src="../js/Usuario.js" type="text/javascript"></script>
 <script src="../js/Buscador.js" type="text/javascript"></script>
   <link rel="stylesheet" href="../js/jquery-ui.css" media="all" type="text/css"  />
    
     <link rel="stylesheet" href="../css/bootstrap.css" media="all" type="text/css"  />
     <link rel="stylesheet" href="../css/grids.css" media="all" type="text/css"  />


  <script type="text/javascript">

      $(document).ready(function () {

          $(".tablesorter").tablesorter({ headers: { 0: { sorter: false }, 1: { sorter: false }, 2: { sorter: false }, 3: { sorter: false }, 4: { sorter: false }, 5: { sorter: false }, 6: { sorter: false}} }).tablesorterPager({ container: $("#pager"), size: $(".pagesize option:selected").val() });
      });
    
    </script>


    <script src="../js/jquery.tablesorter.pager.js" type="text/javascript"></script>
    <script src="../js/jquery.tablesorter.js" type="text/javascript"></script>

    <BODY style=" background-color:transparent">

<div class="clearfloat"/>
        
       
<div align="center">
   
<input type="text" id="filtrar" placeholder="Buscar" />
        
</div>
       
<div class="clearfloat"/>
<br />
<br />
 
<div align="center">
<p align="center"><H3>Usuarios Registrados</H3></p>        

</div>        
        

<div class="row" >

  <div class="col-md-6 col-md-offset-3">	
      <table class="tablesorter table table-striped table-hover table-bordered table-condensed "> 
       <thead>
        <tr >
            <td id="pager" colspan="5" >
            <a style="color:black" href="#EditarU" onclick="CrearUsuario()" ><img title="Crear Usuario" alt="" SRC="../wp-content/uploads/2015/10/System-icon.png" width="30px"/></a>
                        <form action="" style=" padding:2% 20% 0% 20%" >
                        <img src="../wp-content/Paginado/first.png")" class="first" alt=""/>
                        <img src="../wp-content/Paginado/prev.png")" class="prev" alt=""/>
                        <input type="text" class="pagedisplay" disabled="disabled" />
                        <img src="../wp-content/Paginado/next.png")" class="next" alt=""/>
                        <img src="../wp-content/Paginado/last.png")" class="last" alt=""/>
                        <select class="pagesize" style="width: 65px;">
                            <option selected="selected" value="5">5</option>
                            <option value="10">10</option>
                            <option value="15">15</option>
                            <option value="20">20</option>
                        </select>
                        </form>

            </td>
        </tr> 

            <tr>
               <th>
                 Nombre Completo 
               </th>        
                <th>
                 Usuario
                </th>
                <th>
                Perfil
                </th>
                <th></th>
                <th></th>
        </tr>   
  </thead>     
 <tbody class="buscar">
         <?php   
        $query = "SELECT u.idusuarios, u.nombre,u.apellido,u.usuario,p.descripcion, u.activo,u.eliminado FROM usuarios u, perfiles p WHERE (u.id_perfil = p.idperfiles) AND (p.activo = 1) and u.eliminado = 0";

        $resultados = $conexion->query($query);

        while( $registros = $resultados->fetch_array()){
            $idusuario = $registros['idusuarios'];
            ?>
          <tr>

             <td> <?php echo $registros['nombre'].' '.$registros['apellido']; ?>  </td>
             <td> <?php echo $registros['usuario']; ?>  </td>
             <td> <?php echo $registros['descripcion']; ?>  </td>             
            <td width="50px"><a  class="editarU"  style="color:black" href="#EditarU" onclick="EditarUsuario(<?php echo $registros['idusuarios']; ?>)" ><img title="Editar" alt="" SRC="../wp-content/uploads/2015/10/System-icon.png" width="30px"/></a></td>
            <td width="50px"><a class="eliminarU" href="#EditarU" data-toggle="modal" data-id="3" id="3" data-target="#edit-modal" style="color:black" onclick="EliminarUsuario(<?php echo $registros['idusuarios']; ?>,'<?php echo trim($registros['usuario']); ?>')"><img title="Eliminar" alt="" SRC="../wp-content/uploads/2015/10/Trash-icon.png" width="30px"/></a></td>
                         
          </tr>
        
        <?php
        } ?>
 </tbody>                             
         </table>
         
</div>
</div>
    

<a name="EditarU"></a>
<div id="UsuariosEditar">

</div>
  </BODY>




</html>


<?php  

}



?>
