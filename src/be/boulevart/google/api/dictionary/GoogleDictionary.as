/**
 * GOOGLE API - AS3 LIBRARY
 *
 * @author Joris Timmerman
 * @version 3.0
 *
 * GoogleDictionary - Find definitions, meanings,... for a keyword.
 * Build by Joris Timmerman, this class uses an unofficial Google API.
 * You are solely responsible for its use, and I urge you not to abuse the Google Dictionary API or use it for commercial projects.
 *
 * These classes are using methods and classes from the Adobe Core Libary, downloadable @ http://code.google.com/p/as3corelib/
 *
 * THIS IS AN OPEN SOURCE PROJECT DELIVERED BY BOULEVART NV (www.boulevart.be)
 */
package be.boulevart.google.api.dictionary {
	import be.boulevart.google.api.core.GoogleAPIServiceURL;
	import be.boulevart.google.api.dictionary.data.GoogleDictionaryEntry;
	import be.boulevart.google.api.dictionary.data.GoogleDictionaryResult;
	import be.boulevart.google.api.dictionary.data.GoogleDictionaryTerm;
	import be.boulevart.google.api.dictionary.data.GoogleDictionaryWebDefinition;
	import be.boulevart.google.events.GoogleAPIErrorEvent;
	import be.boulevart.google.events.GoogleAPIEvent;
	import be.boulevart.google.utils.APIUtil;

	import com.adobe.serialization.json.JSON;

	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLVariables;

	/** GoogleDictionary - Find definitions, meanings,... for a keyword<br/>
	 * Based upon an unofficial API, you are solely responsible for its use, and I urge you not to abuse the Google Dictionary API or use it for commercial projects.
	 * @author Joris Timmerman
	 */
	public class GoogleDictionary extends EventDispatcher {

		/** GoogleDictionary - Find definitions, meanings,... for a keyword.
		 * Object in result event is a GoogleDictionaryResult-object
		 * @param searchTerm Keyword to lookup in dictionary
		 * @param sourceLanguage Source language of keyword
		 * @param targetLanguage Target language of keyword and descriptions (optional)<br/>default: value of source language
		 */
		public function search(searchTerm:String, sourceLanguage:String, targetLanguage:String = ""):void {
			var serviceURL:String = GoogleAPIServiceURL.GOOGLE_DICTIONARY_SERVICE;
			var loader:URLLoader = new URLLoader();
			var request:URLRequest = new URLRequest(serviceURL);

			searchTerm = APIUtil.formatInputString(searchTerm);
			sourceLanguage = APIUtil.formatInputString(sourceLanguage);
			targetLanguage = APIUtil.formatInputString(targetLanguage);

			var vars:URLVariables = new URLVariables();
			vars.callback = "foo";
			vars.restrict = "pr,de"

			vars.q = searchTerm;
			vars.sl = sourceLanguage;

			if (targetLanguage != "") {
				vars.tl = targetLanguage;
			} else {
				targetLanguage = sourceLanguage;
			}

			request.data = vars;

			loader.addEventListener(Event.COMPLETE, onDictionaryResponse);
			loader.addEventListener(IOErrorEvent.IO_ERROR, onIOError);
			loader.load(request);
		}

		private function onDictionaryResponse(event:Event):void {
			var response:String = event.target.data as String;

			if (response != "") {
				response = response.substring(4, response.length - 1);

				var tresponse:Array = response.split(",");

				var fault:String = tresponse.pop();
				var resultCode:int = tresponse.pop();

				if (resultCode == 200) {
					response = tresponse.join(",").toString();

					var json:Object = JSON.decode(response);

					var dictionaryResult:GoogleDictionaryResult = new GoogleDictionaryResult();
					dictionaryResult.query = json.query;
					dictionaryResult.sourceLanguage = json.sourceLanguage;
					dictionaryResult.targetLanguage = json.targetLanguage;

					dictionaryResult.webDefinitions = [];
					for each (var definition:Object in json.webDefinitions) {
						var webDefinition:GoogleDictionaryWebDefinition = new GoogleDictionaryWebDefinition();

						webDefinition.entries = [];
						for each (var entry:Object in definition.entries) {
							var definitionEntry:GoogleDictionaryEntry = new GoogleDictionaryEntry();

							definitionEntry.terms = [];
							for each (var term:Object in entry.terms) {
								var definitionTerm:GoogleDictionaryTerm = new GoogleDictionaryTerm();
								definitionTerm.language = term.language;
								definitionTerm.text = term.text;
								definitionTerm.type = term.type;

								definitionEntry.terms.push(definitionTerm);
							}

							definitionEntry.type = entry.type;
							webDefinition.entries.push(definitionEntry);
						}

						webDefinition.terms = [];
						for each (var webTerm:Object in definition.terms) {
							var webDefTerm:GoogleDictionaryTerm = new GoogleDictionaryTerm();
							webDefTerm.language = webTerm.language;
							webDefTerm.text = webTerm.text;
							webDefTerm.type = webTerm.type;
							webDefinition.terms.push(webDefTerm);
						}

						webDefinition.type = definition.type;
						dictionaryResult.webDefinitions.push(webDefinition);
					}

					dispatchEvent(new GoogleAPIEvent(GoogleAPIEvent.DICTIONARY_RESULT, dictionaryResult));
				} else {
					dispatchEvent(new GoogleAPIErrorEvent(GoogleAPIErrorEvent.API_ERROR, fault, resultCode));
				}
			} else {
				dispatchEvent(new GoogleAPIErrorEvent(GoogleAPIErrorEvent.API_ERROR, "Empty result, check your query.", -1));
			}
		}

		private function onIOError(event:IOErrorEvent):void {
			dispatchEvent(new GoogleAPIEvent(GoogleAPIEvent.ON_ERROR, "IOERROR: " + event.text));
		}
	}
}