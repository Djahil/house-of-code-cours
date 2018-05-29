<?php
include("Eleve.php");

$Hafidhou = new Eleve("hafidhou");
var_dump($Hafidhou);
// -> permet d'ateindre les propieté est methode d'un objet
$Hafidhou->saluer();

//victor est un objet 
$Victor = new Eleve("victor");
var_dump($Victor);

// permet d'ateindre une méthode static  
Eleve :: courir();


?>