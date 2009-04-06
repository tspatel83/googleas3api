/** * GOOGLE SEARCH AS3 Library *  * @author Joris Timmerman * @version 1.3.1 *  * GoogleTranslations - Translate using Google * Build by Joris Timmerman, these classes uses the Google Ajax API *  * These classes are using methods and classes from the Adobe Core Libary, downloadable @ http://code.google.com/p/as3corelib/ *  * SPECIAL THANKS TO GOOGLE FOR PROVIDING THE AJAX API * THIS IS AN OPEN SOURCE PROJECT DELIVERED BY BOULEVART NV (www.boulevart.be) * */package be.boulevart.google {	import be.boulevart.google.data.GoogleLanguageDetectionResult;	import be.boulevart.google.data.GoogleTranslationResult;	import be.boulevart.google.events.GoogleTranslationEvent;		import com.adobe.serialization.json.JSON;		import flash.events.Event;	import flash.events.EventDispatcher;	import flash.events.IOErrorEvent;	import flash.net.URLLoader;	import flash.net.URLRequest;			/**	 * @author joris	 */	public class GoogleTranslation extends EventDispatcher {				private var _orig:String		private var _from:String		private var _to:String				public function translate(textToTranslate : String,langFromCode:String,langToCode:String) : void {			var serviceURL:String="http://ajax.googleapis.com/ajax/services/language/translate?v=1.0"			var query:String=""						_orig = textToTranslate			_from=langFromCode			_to=langToCode						query+= "&q=" + textToTranslate			query+="&langpair=" + langFromCode + "%7C" + langToCode;			var request : URLRequest = new URLRequest(serviceURL + query)			var loader : URLLoader = new URLLoader()			loader.addEventListener(Event .COMPLETE , onResponse)			loader.addEventListener(IOErrorEvent.IO_ERROR , onIOError); 			loader.load(request)					}				public function detectLanguage(text:String) : void{			var serviceURL:String = "http://ajax.googleapis.com/ajax/services/language/detect?v=1.0"			var query:String= "&q=" + text						var request : URLRequest = new URLRequest(serviceURL + query)			var loader : URLLoader = new URLLoader()			loader.addEventListener(Event .COMPLETE , onDetectionResponse)			loader.addEventListener(IOErrorEvent.IO_ERROR , onIOError); 			loader.load(request)								}				private function onResponse(event : Event) : void {			var json : Object = JSON.decode("" + event.target.data);			var results : String = json.responseData.translatedText as String						var t : GoogleTranslationResult = new GoogleTranslationResult()			t.result = results			t.from=_from			t.to = _to			t.orig = _orig						dispatchEvent(new GoogleTranslationEvent(GoogleTranslationEvent.TRANSLATION_RESULT , t))		}				private function onDetectionResponse(event : Event) : void {			var json : Object = JSON.decode("" + event.target.data);			var language : String = json.responseData.language as String			var isReliable : Boolean = json.responseData.isReliable as Boolean			var confidence:Number=json.responseData.confidence as Number 					var detect:GoogleLanguageDetectionResult=new GoogleLanguageDetectionResult()			detect.language=language			detect.isReliable=isReliable			detect.confidence=confidence						dispatchEvent(new GoogleTranslationEvent(GoogleTranslationEvent.LANGUAGE_DETECTION_RESULT , detect))		}		private function onIOError(event : IOErrorEvent) : void {  			dispatchEvent(new GoogleTranslationEvent(GoogleTranslationEvent.ON_ERROR , "IOERROR: " + event.text))		} 					}}