<?php
session_start();
var_dump($_SESSION["username"]);

?><!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>Mon profil</title>
	</head>

	<body>

		Je suis connecté sous le nom : <?php echo $_SESSION["username"]; ?> 
		
		<br>
		<a href="logout.php">Me déconnecter</a>

	</body>
</html>