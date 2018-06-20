<?php

fuction render($page){
    $filename = "vews/templates/" .$page. "php";
    
    global $employees;
    if(file_existe($filename)){
        include($filename);
    
    }
}

?>
