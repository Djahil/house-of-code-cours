<?php
include("Eleve.php");

$Hafidhou = new Eleve("hafidhou";"MDJAHILA");
var_dump($Hafidhou);
// -> permet d'ateindre les propieté est methode d'une class 
$Hafidhou->saluer();

//victor est un objet 
$Victor = new Eleve("victor","MAC");
var_dump($Victor);

// les :: permettent d'ateindre une méthode static dans l'eleve  
Eleve :: courir();


?>