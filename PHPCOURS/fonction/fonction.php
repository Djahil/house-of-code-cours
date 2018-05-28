<?php
$nom = "hafidhou";
//addition
function addition($a, $b){
    global $nom;
    return $a + $b;
}
//soustraction
function soustraction($a, $b){
    return $a - $b;
}
//multiplications
function multiplication($a, $b){
    return $a * $b;
}

//division
function division($a, $b){
    return $a / $b;
}

echo addition(2, 13)."<br>";
echo soustraction(50, 25);


?>