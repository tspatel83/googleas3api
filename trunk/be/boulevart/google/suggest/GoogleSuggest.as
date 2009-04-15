/**
 * GOOGLE API - AS3 LIBRARY
 *
 * @author Joris Timmerman
 * @version 1.4
 * 
 * GoogleSuggest - Get suggestions for your search
 * Build by Joris Timmerman, these classes uses the Google webservices
 * 
 * SPECIAL THANKS TO GOOGLE FOR PROVIDING THE WEBSERVICES
 * THIS IS AN OPEN SOURCE PROJECT DELIVERED BY BOULEVART NV (www.boulevart.be)
 */
package be.boulevart.google.suggest {
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import be.boulevart.google.events.GoogleApiEvent;
	import be.boulevart.google.suggest.data.GoogleSuggestion;	
	public class GoogleSuggest extends EventDispatcher {
		/**
		 * Start search operation for suggestions
		 * Will deliver 10 results max
		 * @param searchTerm search string, get suggestions for...
		 */		
		public function suggest(searchTerm : String) {
			var serviceURL = "http://google.com/complete/search"
			
			var loader : URLLoader = new URLLoader()
			var query : String = "?"
		
			query += "output=toolbar"
			query += "&q=" + searchTerm
									
			var request : URLRequest = new URLRequest(serviceURL + query)
			
			loader.addEventListener(Event .COMPLETE , onResponse)
			loader.addEventListener(IOErrorEvent.IO_ERROR , onIOError); 
			loader.load(request)
		}

		private function onResponse(event : Event) : void {
			var data : XML = XML(event.target.data);
			var sugArr : Array = new Array()
		
			for each(var suggestion:XML in data..CompleteSuggestion) {
				var gs : GoogleSuggestion = new GoogleSuggestion()
				gs.suggestion = suggestion.suggestion.@data
				gs.numQueries = suggestion.num_queries.@int
				
				sugArr.push(gs)
			}			
			
			dispatchEvent(new GoogleApiEvent(GoogleApiEvent.SUGGESTIONS_RESULT , sugArr))
		}

		private function onIOError(event : IOErrorEvent) : void {  
			dispatchEvent(new GoogleApiEvent(GoogleApiEvent.ON_ERROR , "IOERROR: " + event.text))
		} 
	}
}