<?php
//demarrage de la session : 
session_start();
//tester si$_SESSION["username"]existe
if(!empty($_SESSION["username"])){
	header('Location:profil.php');
	exit();
}
include('include/header.php'); 
?>

		<form action="traitement.php" method="post">
			<label for="username">Username</label>
			<input type="text" name="username" placeholder="Username" id="username" />

			<label for="password">Mot de passe</label>
			<input type="password" name="password"  placeholder="Mot de passe" id="password" />

			<input type="submit" />
		</form>
<?php include('include/footer.php');


