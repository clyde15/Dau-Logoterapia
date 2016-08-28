<?php

$conexion = new mysqli();

$conexion->connect("localhost", "root", "","logoterapia");

if ($conexion->connect_error) {
    die("No hubo conexion: ".$conexion->connect_error);
}