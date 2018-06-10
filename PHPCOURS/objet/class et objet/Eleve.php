<?php
//cette classe permet de crée des eleves == objet
 class eleve {

    public $nom = "hafidhou";    
    //une fonction dans une class est dite methode

    /*methode protected qui permet de saluer est limité à la class elle même, 
    ainsi qu'aux classes qui en héritent
     protected function saluer(){
        echo"coucou";
    }*/

    /*la méthode private qui permet de saluer est uniquement réservé à la classe qui les a défini.
    private function saluer(){
        echo"coucou";
    }*/
    
    //la méthode public peut être utilisés par n'importe quelle partie du programme.
    public function saluer(){
        echo"coucou";
    }

    public function __construct($nom ,$prenom){
        $this->nom = $nom;
        $this->prenom = $prenom;
    }
    // methode static
    public static function courir(){
        echo "je cours";
        } 
}


?>