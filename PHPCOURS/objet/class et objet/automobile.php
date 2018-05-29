<?php
include("voiture.php");
//On cree l'objet Porsch avec ses propriétées
$Porsche = new Voiture(
    "porsche",
    911,
    "gris",
    "Yoan"
);

//On cree l'objet Bugatti avec ses propriétées
$Bugatti = new Voiture(
    "bugatti",
    "chiron",
    "noir",
    "Hafidhou"
);

echo $Porsche->avancer(50);


var_dump($Porsche);
var_dump($Bugatti);
?>