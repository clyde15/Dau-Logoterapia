<?php

include_once '../Conexion.php';

session_start();

error_reporting(0);

$varsession = $_SESSION['User'];



if ($varsession == NULL || $varsession =='') {
    
    echo $varsession;
    echo 'usuario no logueado por favor validar con el administrador';
    
    
}else{
    $nombre = $_SESSION['NombreCompleto'];
    $perfil = $_SESSION['ID_Perfil'];
    $apellido = $_SESSION['Apellido'];
    $query = "SELECT pag.idpagina, pag.IDPagina_FK, pag.Descripcion, pag.URL FROM permisos p, pagina pag, perfiles per where (p.IDperfil = per.IDperfiles) AND (pag.IDPagina = p.IDPagina) AND (p.Acceso = 1) AND (pag.activo = 1) AND (per.IDperfiles =  '$perfil')";

    

    $resultados = $conexion->query($query);
    
?>
<html>
    <head>
    
<script src="../js/jquery-1.8.2.js" type="text/javascript"></script>
     <link href="../css/menu_multinivel.css" rel="stylesheet" type="text/css"/>
     <script type='text/javascript' src='../js/bootstrap.js'></script>
     <script type='text/javascript' src='../js/CargarVistaMenu.js'></script>

     <link href="../css/bootstrap25.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="../css/grids.css" media="all" type="text/css"  />
    <link rel="stylesheet" href="../css/personalizados.css" media="all" type="text/css"  /> 
	  <!-- Tittle -->
        <?php include ('../Layout/Tittle.php');?>
    </head>
    <body>
<nav class="navbar navbar-inverse" style="background-color:#72A3D0; border-color:#72A3D0;" >
	  <div class="container-fluid">
		<div class="navbar-header">			   
			<p style="margin-top: -15;"><a class="navbar-brand" href="PaginaPrincipal.php" alegn="center"><strong><img  src="../wp-content/uploads/2015/10/inicio-icono-5909-64.png" style="width: 50px;"/>Inicio</strong></a></p>  
		</div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	        <ul class="nav navbar-nav">
                <?php
                    //Genera Padres
                        while ($registros = $resultados->fetch_array())  
                        {
                            if ($registros['IDPagina_FK'] == null)
                            {
                                $pag = $registros['URL'];
                ?>                               
                                       <?php   
                                          $idpagina = $registros['idpagina'];

                                          $submenu = "SELECT DISTINCT pag.idpagina, pag.IDPagina_FK, pag.Descripcion, pag.URL FROM pagina pag, permisos per where (pag.IDPagina_FK = $idpagina) AND (per.acceso =1) AND (pag.idpagina = per.IDpagina) AND (pag.Activo = 1) AND (per.IDperfil = '$perfil')";

                                          $subpaginas = $conexion->query($submenu);
                                        
                                          if ($subpaginas->fetch_array() != 0)
                                          {

                                       ?>
                                            <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" style="background-color:#72A3D0;padding-bottom: 0px;padding-top: 15px;" href="<?php echo $pag;?>"><?php echo $registros['Descripcion'] ?><span class="caret"></span></a>

                                             <ul class="dropdown-menu">
                                              <?php
                                              //Primeros Hijos 
                                              $subpaginas->data_seek(0);
                                              while ($prueba = $subpaginas->fetch_array())  
                                              {
                                                  $url = $prueba['URL'];
                                              ?>
                                                <li>                                                        
                                                    <a onMouseover="this.style.color='white'" onMouseout="this.style.color='black'" href="<?php echo $url;?>" target="principal">
<!--                                                    <a onMouseover="this.style.color='white'" onMouseout="this.style.color='black'" id="<?php //echo $url;?>" onclick="CargarPagina(this.id)" class="btn-link" >-->
                                                  <?php
                                                  echo $prueba['Descripcion'];
                                                ?>
                                                </a>

                                                <?php   
                                                  $idpagina3nivel = $prueba['idpagina'];

                                                  $submenu3 = "SELECT pag.idpagina, pag.IDPagina_FK, pag.Descripcion, pag.URL FROM pagina pag, permisos per where (pag.IDPagina_FK = $idpagina3nivel) AND (pag.idpagina = per.idpagina) AND (per.acceso = 1)";

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
                                           <li><a style="background-color:#72A3D0;padding-bottom: 0px;padding-top: 15px;" href="<?php $_POST['URL'] = $pag; echo $pag;?>" target="principal"><?php echo $registros['Descripcion'] ?></a></li>
                                        <?php
                                          }
                                          
                                       ?>                           
                               
                           
                               <?php                            
                            }
                        }
                               ?>
	        </ul>
		</div><!-- /.navbar-collapse -->
	  </div><!-- /.container-fluid -->
	</nav>


    </body>
</html>
 <?php  

}




 ?>