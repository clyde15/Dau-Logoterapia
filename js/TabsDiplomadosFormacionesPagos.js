$(document).ready(function () {
    
    Diplomados();
});


function Diplomados() {

    var divDiplomados = $("#Diplomados");
    divDiplomados.load('../Finanzas/ListadoDiplomadosAlumnos.php');
   Formaciones();
 }

 function Formaciones() {

    var divFormaciones = $("#Formaciones");
    divFormaciones.load('../Finanzas/ListadoFormacionesAlumnos.php');

 }