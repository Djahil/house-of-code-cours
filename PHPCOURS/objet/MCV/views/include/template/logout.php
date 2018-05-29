<?php
//je doit utiliser session_start()pour pouvoir intreagir avec
session_start();

//et mainteant je détruie complètement la session
session_destroy();

include('include/header.php'); 
?>

		<a href="login.php">Retourner sur la page de connexion</a>

<?php include('include/footer.php');