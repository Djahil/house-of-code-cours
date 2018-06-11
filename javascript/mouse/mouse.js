
        let mouse = document.getElementsByClassName("mouse"); 

       document.onmousemove = function(event){
            console.log("Position de la souris :  X=" + event.clientX + "   Y="+ event.clientY);
            let mouvX = event.clientX;
            let mouvY = event.clientY;
            mouse.style.left = mouvX + "px";
            mouse.style.top = mouvY + "px";
          
            
            for(let i = 0 ; i < mouse.length; i++){
                let mouseMouv = mouse[i];
                
                setTimeout((function(mouse){

                    200* i, mouseMouv}));

                
            }
            
            
       }  
            
            /* let currentPositionLeft = mouvX ;
             let currentPositionTop = mouvY;

            let mouseWidth = mouse.offsetWidth;
            let containWidth = container.offsetWidth;
           
            if (currentPositionTop < 0 ){
             mouvY  = - mouvY ;
            }
            //bottom
            if (currentPositionTop > containWidth - mouseWidth){
                mouvY  = - mouvY ;
             }*/
            // //left
            // if (currentPositionLeft < 0 ){
            //     mouvX = - mouvX;
            // }
            // //Right
            // if ( currentPositionLeft > bodyWidth - mouseWidth){
            //     mouvX = - mouvX;
            // } 
         
// let mouse = document.querySelectorAll('#mouse') // Je déclare ma variable qui est mon image
//     delay = 200; // Délai de déplacement en MS


//     document.onmousemove = function(event) {
//         for (let i = 0; i < mouse.length; i++) { // Incrémentation + appel de la variable 0 (index numéro 1)
//             setTimeout(function(mouse) {
//                 mouse.style.left = event.clientX; 
//                 mouse.style.top = event.clientY;
//             }, setTimeout + i, mouse[i]);
//         }
//     };