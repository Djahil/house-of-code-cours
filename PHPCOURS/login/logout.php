<?php
session_start();
session_destroy();
	
header('Location:login.php');
exit();

?><!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>Déconnexion</title>
	</head>

	<body>

		<a href="login.php">Retourner sur la page de connexion</a>
	</body>
</html>