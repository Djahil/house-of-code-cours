<?php

// Ceci est le personnel autorisé
$employees = array(
	0 => array(
		"username" => "toto",
		"password" => "haha",
		"age" => "25",
	),
	1 => array(
		"username" => "titi",
		"password" => "hehe",
		"age" => "52",
	),
	2 => array(
		"username" => "john",
		"password" => "123123",
		"age" => "5",
	),
);

$username = $_POST["username"];
$password = $_POST["password"];

// Si mon username et mon passeword ont bien été fixé
if(!empty($username) && !empty($password)){
	
	//Si mon username et mon passeword ont bien un chaine supériaur à 4; on exécute la fonction
	if(strlen($username) >= 4 && strlen($password) >= 4){
		
		$username = strip_tags($username); 
		$password = strip_tags($password);
		var_dump($username);
		var_dump(is_int($username));
	} else {
		echo "Erreur: chaine inférieure à 10 caractères";
	}
} 
else {
	echo "Erreur: chaine vide";
}
 

//la boucle foreach recupere un index du tableau à chaque tour
foreach($employees as $employee){
	
	//on test si le nom saisie par l'utilisateur est contenue dans la tableau
	if($username == $employee["username"] && $password == $employee["password"]){
	
		//si la condition est vrai on donne acces à la variable session
		session_start();
		$_SESSION["username"] = $username;
		$_Session["age"]= $employee["age"];
		header('Location:profil.php');
  		exit();
	}	
}


?> 