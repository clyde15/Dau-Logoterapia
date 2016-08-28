<html lang="es-ES" xml:lang="es-ES">
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
        <script src="../js/bootstrap.min.js" type="text/javascript"></script>
        <script src="../js/JsAcademica.js" type="text/javascript"></script>
       <link rel="stylesheet" href="../css/bootstrap.css" media="all"/>
       <link rel="stylesheet" href="../js/Dise.css" media="all"/>
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

 $user = $_GET["iddiplomados"];

 $query = "SELECT D.Nombre,T.Nombre as 'Tipo de Diplomado',C.AlumnosInscritos,C.AlumnosRetirados,C.AlumnosTraslados,CONCAT(P.Nombre,' ',P.Apellido) as Profesor,GROUP_CONCAT(DS.Nombre SEPARATOR ', ') as Dias  FROM logoterapia.diplomados D INNER JOIN logoterapia.configuraciones c ON c.ID_Diplomado = D.iddiplomados INNER JOIN logoterapia.tipo T on T.idTipo = C.ID_Tipo INNER JOIN logoterapia.profesores P ON C.ID_ProfesorInicial = P.idprofesores INNER JOIN logoterapia.participacion PT ON PT.ID_Configuracion = C.IDConfiguracion INNER JOIN logoterapia.diassemana DS ON PT.ID_DiasSemana = DS.idDiasSemana WHERE D.iddiplomados = '$user' ";

 $resultados = $conexion->query($query);
 $registros = $resultados->fetch_array();
 
//
// $queryP = "SELECT descripcion,activo,eliminado,idperfiles FROM perfiles where activo=1";
//
// $resultadosP = $conexion->query($queryP);
     
 ?>

    <table class="tablesorter table table-striped table-hover table-bordered table-condensed " id="TablaColoreada"> 
<thead>
<tr>
<th>Nombre de Diplomado</th>
<th>Tipo de Diplomado</th>
</tr>

<tr>
    
    <td><?php echo $registros['Nombre'] ?> </td>
<td><?php echo $registros['Tipo de Diplomado'] ?> </td>
    
</tr>

<tr>
    <th>Profesor Inicial</th>
    <th>Días de Participacíon</th>
    
    
</tr>

<tr>
    
        <td><?php echo $registros['Profesor'] ?> </td>
        <td><?php echo $registros['Dias'] ?> </td>
    
</tr>
<tr>
    
    <th>Alumnos Inscritos</th>
    <th>Alumnos Retirados</th>
        
</tr>


<tr>
    
<td><?php echo $registros['AlumnosInscritos'] ?> </td>
<td><?php echo $registros['AlumnosRetirados'] ?> </td>
    
</tr>

<tr colspan="2">
    
    <th colspan="2">Lista de Alumnos Inscritos</th>
    
</tr>

<tr>
    
    <td colspan="2"><a href="#">Lista de Alumnos</a></td>
    
</tr>

</thead>

</table>
        
    </body>
</html>
<?php }?>