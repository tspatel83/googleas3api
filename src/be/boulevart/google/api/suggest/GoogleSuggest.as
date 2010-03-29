/**
 * GOOGLE API - AS3 LIBRARY
 *
 * @author Joris Timmerman
 * @version 3.0
 *
 * GoogleSuggest - Get suggestions for your search
 * Build by Joris Timmerman, this class uses an unofficial Google API.
 * You are solely responsible for its use, and I urge you not to abuse the Google Suggest API or use it for commercial projects.
 *
 * SPECIAL THANKS TO GOOGLE FOR PROVIDING THE WEBSERVICES
 * THIS IS AN OPEN SOURCE PROJECT DELIVERED BY BOULEVART NV (www.boulevart.be)
 */
package be.boulevart.google.api.suggest {
	import be.boulevart.google.api.core.GoogleAPIServiceURL;
	import be.boulevart.google.api.core.GoogleAPISettings;
	import be.boulevart.google.api.suggest.data.GoogleSuggestion;
	import be.boulevart.google.events.GoogleAPIEvent;
	import be.boulevart.google.utils.APIUtil;

	import com.adobe.utils.StringUtil;

	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLVariables;
	import flash.utils.escapeMultiByte;

	public class GoogleSuggest extends EventDispatcher {
		/**
		 * Start search operation for suggestions.<br/>
		 * Based upon an unofficial API, you are solely responsible for its use, and I urge you not to abuse the Google Suggest API or use it for commercial projects.
		 * Will deliver 10 results max
		 * @param searchTerm search string, get suggestions for...
		 */
		public function suggest(searchTerm:String, languageCode:String = ""):void {
			trace("[WARNING] The function you are using is based upon an unofficial API, you are solely responsible for its use, and I urge you not to abuse the Google Suggest API or use it in commercial projects.");

			var serviceURL:String = GoogleAPIServiceURL.SUGGEST_SERVICE;

			var loader:URLLoader = new URLLoader();
			var request:URLRequest = new URLRequest(serviceURL);

			searchTerm = APIUtil.formatInputString(searchTerm);
			languageCode = APIUtil.formatInputString(languageCode);

			var vars:URLVariables = new URLVariables();
			vars.output = "toolbar";
			vars.q = searchTerm;

			if (StringUtil.trim(languageCode).length > 0) {
				vars.hl = languageCode;
			} else if (GoogleAPISettings.useMainLanguageAsDefaultLanguage) {
				vars.hl = GoogleAPISettings.MAIN_LANGUAGE;
			}

			request.data = vars;

			loader.addEventListener(Event.COMPLETE, onResponse);
			loader.addEventListener(IOErrorEvent.IO_ERROR, onIOError);
			loader.load(request);
		}

		private function onResponse(event:Event):void {
			var data:XML = XML(event.target.data);
			var sugArr:Array = [];

			for each (var suggestion:XML in data..CompleteSuggestion) {
				var gs:GoogleSuggestion = new GoogleSuggestion();
				gs.suggestion = suggestion.suggestion.@data;
				gs.numQueries = suggestion.num_queries.@int;

				sugArr.push(gs);
			}

			dispatchEvent(new GoogleAPIEvent(GoogleAPIEvent.SUGGESTIONS_RESULT, sugArr));
		}

		private function onIOError(event:IOErrorEvent):void {
			dispatchEvent(new GoogleAPIEvent(GoogleAPIEvent.ON_ERROR, "IOERROR: " + event.text));
		}
	}
}