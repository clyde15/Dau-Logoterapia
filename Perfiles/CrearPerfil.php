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

  $queryP = "SELECT pag.idpagina, pag.IDPagina_FK, pag.Descripcion, pag.URL FROM pagina pag where (pag.activo = 1)";

 $resultadosP = $conexion->query($queryP);

    
 ?>
 <form method="post" id="formularioPerfilCrear">

        <fieldset>
        <legend>Crear Perfil</legend>
       <input type="Hidden"  name="MetodoE" value="Crear" id="MetodoE" />
        <div class="editor-label">
                <label>Nombre del Perfil</label>
        </div>
        <div class="editor-field">
         <input type="text" name="nombre1" id="descripcionPerfil" />
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

                                          $submenu = "SELECT DISTINCT pag.idpagina, pag.IDPagina_FK, pag.Descripcion, pag.URL FROM pagina pag, permisos per where (pag.IDPagina_FK = $idpagina) AND (pag.idpagina = per.IDpagina) AND (pag.Activo = 1)";

                                          $subpaginas = $conexion->query($submenu);
                                                                                    
                                          if ($subpaginas->fetch_array() != 0)
                                          {
                                           
                                                
                                       ?>
                                            <li ><?php echo $registrosP['Descripcion'] ?> <input type="checkbox" class="pagina" value="<?php echo $registrosP['idpagina'];?>" />

                                             <ul>
                                              <?php
                                              $subpaginas->data_seek(0);
                                              while ($prueba = $subpaginas->fetch_array())  
                                              {
                                                  $url = $prueba['URL'];

                                                  $IDPagina2 = $prueba['idpagina'];

                                              ?>
                                                <li>                                                        
                                                   
                                                  <?php
                                                  echo $prueba['Descripcion'];
                                                ?>
                                               <input type="checkbox" class="pagina" value="<?php echo $prueba['idpagina'] ?>" />

                                                <?php   
                                                  $idpagina3nivel = $prueba['idpagina'];

                                                  $submenu3 = "SELECT pag.idpagina, pag.IDPagina_FK, pag.Descripcion, pag.URL FROM pagina pag, permisos per where (pag.IDPagina_FK = $idpagina3nivel) AND (pag.idpagina = per.idpagina)";

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
                                           <li><?php echo $registrosP['Descripcion'] ?> <input type="checkbox" class="pagina"  value="<?php echo $registrosP['idpagina'] ?>" /></li>
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
            <input type="button" value="Guardar" onclick="CrearPerfil()" />
        </p>
    </fieldset>
    </form>
    </form>
          </body>
</html>

<?php
 }
 ?>