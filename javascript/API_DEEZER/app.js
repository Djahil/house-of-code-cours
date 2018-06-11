class App {

	constructor () {
		this.api = null;
		this.autocomplet = null;
		this.deezertrack = null ;
	}

    
    start() {

    	this.api = new API(this);
    	this.autocomplet = new Autocomplet(this);
    }

    showTrack(file){
	    this.autocomplet.close();

    	this.deezertrack = new Deezertrack(this, file);
	}
}



