class API {
	
		constructor(app) {

			this.app = app;
			//this.urlAPI = urlAPI;

			
		}

		callAPIsearch(inputValue){
			let self = this;

			// console.log('call api avec ça :', inputValue)
			$.ajax({
				method: "GET",
				url: "https://api.deezer.com/search?q="+ inputValue + "&limit=8&output=jsonp" ,
				dataType: "jsonp",
				crossDomain: true
			})
			.done(function(data){

				self.app.autocomplet.render(data);



			})
			.fail(function(error){
				console.log("404", error);

			})
			
		}

		callAPItrack(track) {
			let self = this;
			$.ajax({
				method: "GET",
				url: "https://api.deezer.com/track/" + track + "&output=jsonp",
				dataType: "jsonp",
				crossDomain:  true
			})
			.done(function(data){
				//console.log(data);
				self.app.showTrack(data);
			})
			.fail(function(error){
				console.log("404", error);
			});
		}
    }