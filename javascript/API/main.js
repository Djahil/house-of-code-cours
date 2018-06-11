$(document).ready(function(){
    //callOpenWeatherMap();


    
    $("#myForm").on('submit', function(event){
        event.preventDefault();

        let ville = $(".ville").val();
        
        
        //let ville = document.querySelector('.ville').value;
        
        callOpenWeatherMap(ville);
        
        
        /*let ville = document.querySelector('.ville').value;
        let meteo = "api.openweathermap.org/data/2.5/weather?q=" + ville;
        $.getJSON({meteo, method: "GET", dataType: "JSON"}).then(function(data){
        console.log(data);*/
        
     });
});



function callOpenWeatherMap(cityName,cityid){
    let apikey = "bda0468034283d7fa3a5f04348c2fdf4";

    $.ajax({
        method: "GET",
        url: "https://api.openweathermap.org/data/2.5/weather?q="+ cityName +"&units=metric&APPID=" + apikey,
        url: "https://api.openweathermap.org/data/2.5/weather?q="+ cityid +"&units=metric&APPID=" + apikey,
        dataType: "JSON"


    }).done(function(data) {
        // fonction lancée au retour de l'appel
        console.log('data', data)

        updateIcon(data);
        updateID(data);

    }).fail(function(error) {
        // Si une erreur survient lors de l'appel
        console.warn(error);
    });
}



function updateIcon(data){
    let icon = data.weather[0].icon;

    // construire l'url de l'image
    let srcimg ="http://openweathermap.org/img/w/" + icon + ".png";
    
    // sélectionner l'image dans le DOM et changer l'attr src de l'image
    document.getElementById("icon-weather").src = srcimg ;
    console.log('icon', icon);
    //OU $("icon-weather").attr("src", srcimg );
    
    let ville = data.name;
    console.log("ville :", ville );
    $("#nameVille").html(ville);

}

function updateID(data){
    let id = data.sys.id;
    console.log("identifiant :", id );

}