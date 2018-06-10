<?php
//tableau numératif
/*
en JS 
let arrey =[]
ou arrey.push( blabla)
ou arrey [0]*/

/*en php
$array[]
ou
$array = arrey();
*/
//stocker une information
$array = array("blabla");
$array = ["balbla"];
$array[0] ="blabla"; 




//tableau associatif
$associatif = array();
$associatif["prenom"] = "hafidhou";
$associatif["age"] = 24;

//echo $associatif["prenom"]; 

// tableau multidimensionnel
$multi = array();
$multi[0] = array();
$mutli[0][0] = " blabla";

//exercice

$class = array(
            0 => array(
                "prenom" => "Hafidhou",
                "age" => "24",
                "ville" => "lyon"
            ),
            1 => array(
                    "prenom" => "Yoan",
                    "age" => "23",
                    "ville" => "lyon"
            )
        );
print_r($class);
var_dump($class);
//foreach
foreach($class as $index => $eleve){
    echo " prenom :" . $eleve["prenom"] . "<br>";
    echo " age :" . $eleve["age"] . "<br>";
    echo " ville :" . $eleve["ville"] . "<br>";
}
?>