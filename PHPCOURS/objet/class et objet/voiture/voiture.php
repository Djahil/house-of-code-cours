<?php

/*cette class parle de voiture*/
class Voiture {
    public $marque;
    public $modele;
    public $proprietaire;
    public $vitesse = 0;
    private $numeroSrérie;

    public function __construct($marque, $modele, $couleur, $proprietaire){
    
        $this->marque = $marque;
        $this->modele = $modele;
        $this->couleur = $couleur;
        $this->proprietaire = $proprietaire;
        $this->numeroSerie = rand( 1,2000);



    }
    /**
    * on crée une méthode avancer(){} pour faire avancer les voitures
    * à une vitesse précise
    * @param $vitesse int
    * @return //string
    */

    public function avancer($vitesse){
        $this->vitesse += $vitesse ;
        return "la voiture roule à :" .$this->vitesse."km/h";

    }


}

?>