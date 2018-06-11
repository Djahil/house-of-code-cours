class Autocomplet{
	
		constructor(app) {

			this.app = app;
			//this.div = $(Autocomplet);
			//this.data = data;

			this.initDOMElements();
    		this.initKeyBoardListener();
		}

		initDOMElements(){
			this.input = $('#autocomplet input');
			this.list = $('#Tracklist');
		}

		initKeyBoardListener(){
			this.input.on('keyup', this.onKeyPress.bind(this))
		}

		onKeyPress(event){
			let value = this.input.val();
			let error = false;
			if(value.length >= 3){
				this.app.api.callAPIsearch(value);
			}
			else{
				$("li").remove();
			}


		}


		render(file){
			let tracks = file.data;
			//console.log(file);

			let listLiHtml = '';
			
			for(let i = 0; i < tracks.length; i++){
				listLiHtml += '<li id="' + tracks[i].id + '"><a href="'+ tracks[i].link +'"><img src="'+ tracks[i].artist.picture +'">' + tracks[i].title + '</a></li>'
			}	
	
			this.list.html(listLiHtml);
			this.list.show();

			this.list.find('li').on('click', this.onChoosetrack.bind(this));

		}

		onChoosetrack(event){
			event.preventDefault();

			let trackId = event.currentTarget.id
			this.app.api.callAPItrack(trackId);

			//console.log(trackId);
		} 


		close(){
			this.list.hide();
		}
	}