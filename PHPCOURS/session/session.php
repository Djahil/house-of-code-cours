<?php
//avoir acces au session :
session_start();

/*socker un info persistante en session :
$_SESSION["prenom"] = "hafidhou";*/

/*pour faire disparaitre le tableau :
session_destroy();*/

session_destroy();

var_dump($_SESSION);


?>

<!DOCTYPE html>

<hmtl lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>session</title>
    </head>
    <body>
   
    </body>
</html>      