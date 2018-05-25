$(document).ready(function(){
    $("ul li").click(function(){    
    
        $("ul li p").hide();
        $("li .current").hide();
        //$(this).find('p').show();
        $(this).find('li .current').show();
        
        // /*$("li.current").show();*/
        // console.log($("li .current"));
        // $("h3:first").show();
        // console.log( $("h3:first"));
    })
    console.log( $("ul li "));
    
});