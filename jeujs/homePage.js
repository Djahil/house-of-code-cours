class UIHomePage {

    /**
     * @constructor
     *
     * @param app // class App qui est pris en parametre de mon constructeur
     */
    constructor(app) {
        this.app = app;

        this.el = null; // Parent DOM Element

        this.initDOMElements();
        this.initEvents();
        this.initKeyboardListener();

    }
    
    /**
     * Link to DOM elements
     */
    initDOMElements(){
        this.el = this.app.el.querySelector('#homepage');
        this.characterSelector = this.el.querySelector('#character-selector');
        this.charactersList = this.characterSelector.querySelectorAll('.character');
        this.buttonStartGame = this.el.querySelector('#btn-start-game');

    }

    /**
     * Events
     */
    initEvents(){
        // Events on characters list
        for (let i = 0; i < this.charactersList.length; i++) {
            let a = this.charactersList[i];
            a.addEventListener('click', this.onChooseCharacter.bind(this));
        }

        // Event on button start
        this.buttonStartGame.addEventListener('click', this.onStartGame.bind(this));

      
    }

    /**
     * On choose character in list
     *
     * @param event
     */

    onChooseCharacter(event) {
        event.preventDefault();

        let characterChosen = event.currentTarget.dataset.character;
        this.app.onChooseCharacter(characterChosen);


    }

    /**
     * Click on button start game
     *
     * @param event
     */
    onStartGame(event) {
        //event.preventDefaut();
        
        console.log('On click btn start')
        let onClickBntStart = event.target.disabled;
        let canBeStart = true;
        
        // check input 1 input 2 
        if(this.el.querySelector("#input_player1").value == '' && this.el.querySelector('#input_player2').value == ''){
            canBeStart = false;

            console.log("#input_player");
        }

        // P1 P2 ok
        if(this.app.characterGamer1 == null || this.app.characterGamer2 == null ){
            canBeStart = false;
        }
     
        if (canBeStart){
            this.el.style.display = 'none';
             this.app.onStartGame(onClickBntStart);
        }  
    }
    /**
     * Render view
     */
    render() {

    }
    initKeyboardListener(event){

        document.addEventListener('keydown', this.onKeyDown.bind(this));
        //document.addEventListener('keyup', this.onKeyUp.bind(this));
    }
   
   onKeyDown(event){
    event.preventDefault();
        // récupérer l'index du current default 0
       let characterChosen = event.currentTarget.dataset.character;
       
        // supprimer current sur l'ensemble
        this.element = document.getElementsByClassName("current"),
        this.moveLeft = false;
        this.moveRight = false;
        this.index = 0;
        // move left
        for(let i = 0; i < this.charactersList.length; i++){
            let a = this.charactersList[i];
            if(event.key == 'ArrowLeft' && a.value === ".character" ) {
                moveLeft = true;
            this.element.className = "none";
                index = index - 1;
            }
        }
       
            // index - 1

        // move rigth
            // index + 1

        // attribuer la class current sur le nouvel index


        // toucher entrer
       // trouver l'index et les data
    


   }
}

