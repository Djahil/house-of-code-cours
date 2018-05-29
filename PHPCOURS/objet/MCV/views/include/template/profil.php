<?php
session_start();

var_dump($_SESSION["username"]);

include('include/header.php'); 
?>

		Je suis connecté sous le nom : <?php echo $_SESSION["username"]; ?> 
		
		<br>
		<a href="logout.php">Me déconnecter</a>

<?php include('include/footer.php');