<!--

<?php
if(isset($_POST["nombre"]) && isset($_POST["email"]) && isset($_POST["comentario"]) && isset($_POST["apellido"]) && isset($_POST["apellidoP"]) && isset($_POST["titulo"]) ){
$to = "helenalynch92@gmail.com";
$subject = "Mensaje Enviado";
$contenido .= "Nombre Completo: ".$_POST["nombre"]."  ".$_POST["apellido"]." ".$_POST["apellidoP"]."\n";
$contenido .= "Email: ".$_POST["email"]."\n\n";
$contenido .= "Titulo: ".$_POST["titulo"]."\n\n";
$contenido .= "Comentario: ".$_POST["comentario"]."\n\n";
$header = "From: helenalynch92@gmail.com\nReply-To:".$_POST["email"]."\n";
$header .= "Mime-Version: 1.0\n";
$header .= "Content-Type: text/plain";
if(mail($to, $subject, $contenido ,$header))
    echo "Mensaje Enviado Correctamente";
else
    echo "Email sending failed";
}
?>

-->


<?php
$to       = 'helenalynch92@gmail.com';
$subject  = 'Testing sendmail.exe';
$message  = 'Hi, you just received an email using sendmail!';
$headers  = 'From: helenalynch92@gmail.com'."\r\n" .'MIME-Version: 1.0' . "\r\n" .'Content-type: text/html; charset=utf-8';
if(mail($to, $subject, $message, $headers))
    echo "Email sent";
else
    echo "Email sending failed";
?>