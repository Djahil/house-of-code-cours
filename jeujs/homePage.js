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
        this.characterListLi = this.el.querySelectorAll('.character_li');
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

    
        let characterChosen = event.currentTarget.dataset.character;
        for( let i = 0; )
        this.app.onChooseCharacter(characterChosen);
    }
    /**
     * Click on button start game
     *
     * @param event
     */
    onStartGame(event) {

        
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
    initKeyboardListener(){

        document.addEventListener('keydown', this.onKeyDown.bind(this));
        //document.addEventListener('keypress',this.onKeyPress.bind(this));
        //document.addEventListener('keyup', this.onKeyUp.bind(this));
    }
   
   onKeyDown(event){
        this.onSelectCharacterFromKeyboard(event);
        this.onChooseCharacterFromKeyboard(event);
   }

   onSelectCharacterFromKeyboard(){
          // récupérer l'index du current default 0
     let monChoix = document.querySelector('li.current');
     let indexCurrent = 0;
    
     for(let i = 0; i < this.characterListLi.length; i++){
            
            let li = this.characterListLi[i];
            li.classList.remove('current');
            
            
            if(li == monChoix){
                indexCurrent = i;
            }     
        }
        console.log(event.keyCode)

        if(event.keyCode == 39){
            indexCurrent++;
        }
        else if(event.keyCode == 37){
            indexCurrent--;
        }
     
        if(indexCurrent < 0){
            indexCurrent ++;
        }
        else if (indexCurrent > 3){
            indexCurrent --;
        }

    this.characterListLi[indexCurrent].classList.add('current');
   }

   onChooseCharacterFromKeyboard(event){
       //keyPress enter
        if(event.keyCode != 13){
            return;
        }
        let li = document.querySelector('li.current');
        if(li!= undefined){

            for(let i = 0; i < this.characterListLi.length; i++){
                this.characterListLi[i].classList.remove('checked');
            }

            // li add class checked
            li.classList.add('checked');

            let characterChosen = li.querySelector('a').dataset.character;
        this.app.onChooseCharacter(characterChosen);
        }    
    }

}

