<html lang="es-ES" xml:lang="es-ES">
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
        <script src="../js/bootstrap.min.js" type="text/javascript"></script>
         <script src="../js/EditarPerfil.js" type="text/javascript"></script>
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

 $user = $_GET["idPerfil"];

 $query = "SELECT descripcion,activo,eliminado,idperfiles FROM perfiles where idperfiles = '$user' ";

 $resultados = $conexion->query($query);
 $registros = $resultados->fetch_array();

  $queryP = "SELECT pag.idpagina, pag.IDPagina_FK, pag.Descripcion, pag.URL FROM pagina pag where (pag.activo = 1)";


 $resultadosP = $conexion->query($queryP);

 

    
 ?>

 <form method="post" id="formularioPerfilEditar">

        <fieldset>
        <legend>Datos Del Perfil</legend>
        <input type="Hidden" name="IDPerfiles" id="IDPerfil" value="<?php echo $registros['idperfiles'];?>" />
        <input type="Hidden"  name="MetodoE" value="Editar" id="MetodoE" />
        <div class="editor-label">
                <label>Nombre del Perfil</label>
        </div>
        <div class="editor-field">
         <input type="text" name="nombre1" id="descripcionPerfil" value="<?php echo  $registros['descripcion'];?>" />
        </div>
        <div class="editor-label">
                <label>Estatus del Perfil</label>
        </div>
        <div class="editor-field">
        <input type="checkbox" name="Activo" id="estadoPerfil" title="Al marcar el check, el perfil se activara al momento de guardar"
        <?php
        if ($registros['activo'] == true)
        {
        	
        ?>
        checked
        <?php
        }
        ?>
          />
        </div>
                
        <div class="editor-label">
                <label>Permisos</label>
        </div>
        <div class="editor-field" id="PermisosPagina">
  <ul>
                <?php

                        while ($registrosP = $resultadosP->fetch_array())  
                        {
                            if ($registrosP['IDPagina_FK'] == null)
                            {
                                $pag = $registrosP['URL'];
                ?>                               
                                       <?php   
                                          $idpagina = $registrosP['idpagina'];

                                          $submenu = "SELECT DISTINCT pag.idpagina, pag.IDPagina_FK, pag.Descripcion, pag.URL FROM pagina pag where (pag.IDPagina_FK = $idpagina)  AND (pag.Activo = 1)";

                                          $subpaginas = $conexion->query($submenu);

                                           $queryPG = "SELECT per.Acceso FROM pagina pag, permisos per where (pag.activo = 1) and (pag.IDPagina = per.IDPagina) AND (per.IDperfil =  '$user') AND (per.IDPagina = '$idpagina')";
                                            
                                                $resultadosPG = $conexion->query($queryPG);

                                          if ($subpaginas->fetch_array() != 0)
                                          {
                                           
                                                
                                       ?>
                                            <li ><?php echo $registrosP['Descripcion'] ?> <input type="checkbox" class="pagina"

                                            <?php
                                               if ($resultadosPG->fetch_array() != 0)
                                                 {
                                               ?>
                                                checked
                                                <?php
                                                }
                                                ?>


                                                value="<?php echo $registrosP['idpagina'];?>" />

                                             <ul>
                                              <?php
                                              $subpaginas->data_seek(0);
                                              while ($prueba = $subpaginas->fetch_array())  
                                              {
                                                  $url = $prueba['URL'];

                                                  $IDPagina2 = $prueba['idpagina'];

                                                   $queryPG2 = "SELECT per.Acceso FROM pagina pag, permisos per where (pag.activo = 1) and (pag.IDPagina = per.IDPagina) AND (per.IDperfil =  '$user') AND (per.IDPagina = '$IDPagina2')";
                                            
                                                $resultadosPG2 = $conexion->query($queryPG2);
                                                                                               

                                              ?>
                                                <li>                                                        
                                                   
                                                  <?php
                                                  echo $prueba['Descripcion'];
                                                ?>
                                               <input type="checkbox" class="pagina" 
                                               <?php
                                               if ($resultadosPG2->fetch_array() != 0)
                                                 {
                                               ?>
                                                checked
                                                <?php
                                                }
                                                ?>

                                                value="<?php echo $prueba['idpagina'] ?>" />

                                                <?php   
                                                  $idpagina3nivel = $prueba['idpagina'];

                                                  $submenu3 = "SELECT pag.idpagina, pag.IDPagina_FK, pag.Descripcion, pag.URL FROM pagina pag where (pag.IDPagina_FK = $idpagina3nivel) ";

                                                  $subpaginas3 = $conexion->query($submenu);
                                                                        ?>
                                                                    </li>
                                                          <?php
                                              }
                                                          ?>
                                             </ul>
                                        </li> 
                                            <?php 
                                                
                                          }else{
                                            ?>
                                           <li><?php echo $registrosP['Descripcion'] ?> <input type="checkbox" 

                                            <?php
                                               if ($resultadosPG->fetch_array() != 0)
                                                 {
                                               ?>
                                                checked
                                                <?php
                                                }
                                                ?>

                                           class="pagina"  value="<?php echo $registrosP['idpagina'] ?>" /></li>
                                        <?php
                                          }
                                          
                                       ?>                           
                               
                           
                               <?php                            
                            }
                        }
                               ?>
	        </ul>



        </div>

        <p>
            <input type="button" value="Guardar" onclick="Editar()" />
        </p>
    </fieldset>
    </form>

    </body>
</html>
<?php }?>