class Deezertrack {

	constructor(app, data) {
		this.app = app;
		this.data = data;
		this.div = $("#track");

		this.render();
		this.togglePlayPAuse();
		this.vote();

	}
		
	render(){

		this.div.html('');
		$('#deezer-widget-loader').remove();

		this.div.html(
			/*'<div'+
				 'class="deezer-widget-player"'+
				'data-scrolling="no"'+ 
				'data-frameborder="0"'+
				'data-allowTransparency="true"'+
				'data-width="300" '+
				'data-height="300"'+
				'data-src="https://www.deezer.com/plugins/player?'+
						'format=square' +
						'&autoplay=false'+
						'&playlist=false'+
						'&width=300'+
						'&height=300'+
						'&color=fc002d'+
						'&layout=dark'+
						'&size=medium'+
						'&type=tracks'+
						'&id='+ this.data.id +
						'&app_id=1"><div>'*/

			'<div '+
				'class="deezer-widget-player" '+
				'data-scrolling="no" '+
				'data-frameborder="0" '+
				'data-allowTransparency="true" '+
				'data-width="700" '+
				'data-height="350" '+ 
				'data-src="https://www.deezer.com/plugins/player?'+
						'format=classic'+
						'&autoplay=false'+
						'&playlist=false'+
						'&width=700'+
						'&height=350'+
						'&color=007FEB'+
						'&layout=dark'+
						'&size=medium'+
						'&type=tracks'+
						'&id='+ this.data.id +
						'&app_id=1"></div>'
		);

		(function(d, s, id) { 
		var js, djs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id)) return; 
		js = d.createElement(s); js.id = id; 
		js.src = "https://e-cdns-files.dzcdn.net/js/widget/loader.js"; 
		 djs.parentNode.insertBefore(js, djs);
		}(document, "script", "deezer-widget-loader"));



	}

	togglePlayPAuse(){

	}

	vote(){


	}

}



