<?php 

//declararion d'une variable en php 
$ballon = "rouge";

//afficher le contenue de $ballon
//echo $ballon;

$age = 24;

$garçon = true;

$prixBaguette = 0.85;

/* OPERATION SUR VARIABLES
+ addition
- soustraction
* multiplication
/ division
% modulo =reste de la divison
*/

$nombre1 = 12;
$nombre2 = 14;

// Le piont '.' sert à concaténer
/*echo $nombre1 + $nombre2 . '<br>';
echo $nombre1 - $nombre2 . '<br>';
echo $nombre1 * $nombre2 . '<br>';
echo $nombre1 / $nombre2 . '<br>';
echo $nombre1 % $nombre2;*/

/* En JS pour delarer une condition :
if(condition){
}
else{
}
c'est pareil en PHP 
*/

/*OPERATEUR DE COMPARAISON :
== compare deux données
===compare deux données (valeur & type)
!= différence entre deux données
!== différence entre deux donées (valeur & type)
< 
> 
<=
>=
&& (ET)
|| (OU)
*/

if($garçon === false){
//echo "coucou";
}
else if ($garçon === true){
//echo "tu es un garçon";
}
else{
//echo "pas la";
}


/*Les boucles
for
foreach
while
do while

// $index++ ==> $index + 1
// $index -- ==> $index  -1
// $index += 2 ==> $index = index + 2 
// $index -= 4 ==> $index  = index - 4
// $index /= 2 ==> $index = $index / 2 



//for( déclarartion condition incrémentation){}*/
for ($index = 0; $index < 10; $index++ ){
echo "Nous sommes dans le tour ". $index . "<br>";
}

//while
$compter = 1;
while($compter < 5){
echo "un tour <br>";
$compter++;    
}

// do While
$age = 18;
do {
    echo "je suis dans le do";
 $age++;
}
while($age < 18); 

?>