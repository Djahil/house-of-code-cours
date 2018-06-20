<?php
/**
*cette classe gere tous type d'articles
*(produit, poste,nouveauté)
*
*/


class Article {
    public $id_article;
    public $name;
    public $price;
    private $url;
    public $created_at;
    /*
    *ceci est le constucteur de;ma classe 
    */    


    public function __construct($id_article){
        $this->id_article = $id_article;

    }

    /** 
    * permet d'afficher les info de l'aticle
    @return array
    */
    public function display(){
        //on initialise un tableau $information
        $informations = array ();
        
        //on va stoker toutes les info de l'instance dans la tableau (un index, id_article, name, price, creat_at et url)
        $informations["id_article"]   = $this->id_article;
        $informations["name"]         = $this->name;
        $informations["price"]        = $this->price;
        $informations["created_at"]   = $this->created_at;
        $informations["url"]          = $this->url;
        
        

        //AUTRE METHODE
        $information = array(
            "id_article" = $this->id_article;
            "name"       = $this->name;
            "price"      = $this->price;
            "created_at" = $this->created_at;
            "url"        = $this->url;
        )

        //AUTRE POSSIBILITE
        return  array(
            "id_article" = $this->id_article;
            "name"       = $this->name;
            "price"      = $this->price;
            "created_at" = $this->created_at;
            "url"        = $this->url;
        )
        require
    }
 
    
    public function getUrl(){
        return $this->url;
    }
    /**
     * getUrl permet de récuperer l'url de l'instance 
     */
    

    public function setUrl($url){
        $this->url = $url;
    }
    /**
     * setUrl permet de modifier l'url de l'instance 
     */


    public static function getCountArticle(){
        return 10;
    }

}