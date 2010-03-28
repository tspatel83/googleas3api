/**
 * GOOGLE API - AS3 LIBRARY
 *
 * @author Joris Timmerman
 * @version 3.0
 *
 * GoogleCurrencyConverter - use the Google Currency service (exchange rates)
 * Build by Joris Timmerman, this class uses an unofficial Google API.
 * You are solely responsible for its use, and I urge you not to abuse the Google Calculator Currency API or use it for commercial projects.
 *
 * SPECIAL THANKS TO GOOGLE FOR PROVIDING THE WEBSERVICES
 * THIS IS AN OPEN SOURCE PROJECT DELIVERED BY BOULEVART NV (www.boulevart.be)
 */
package be.boulevart.google.api.calculator {
	import be.boulevart.google.api.calculator.data.GoogleCalculation;
	import be.boulevart.google.api.core.GoogleAPIServiceURL;
	import be.boulevart.google.api.core.GoogleAPISettings;
	import be.boulevart.google.events.GoogleAPIErrorEvent;
	import be.boulevart.google.events.GoogleAPIEvent;
	import be.boulevart.google.utils.APIUtil;
	
	import com.adobe.serialization.json.JSON;
	import com.adobe.utils.StringUtil;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLVariables;
	import flash.utils.escapeMultiByte;

	/**
	 * Currency converter - convert currencies using the Google Calculator Currency<br/>
	 * Based upon an unofficial API, you are solely responsible for its use, and I urge you not to abuse the Google Calculator Currency API or use it for commercial projects.
	 */
	public class GoogleCurrencyConverter extends EventDispatcher {

		/**
		 * Currency converter - convert currencies - returns a GoogleCalculation object<br/>
		 * @param inputValue Amount in input currency to convert
		 * @param inputCurrencyCode Currency code of input (see CurrencyCodes class)
		 * @param outputCurrencyCode Output (target) currency code (see CurrencyCodes class)
		 * @param langCode Languagecode for outputlanguage
		 */
		public function convertCurrency(inputValue:Number, inputCurrencyCode:String, outputCurrencyCode:String, langCode:String = ""):void {
			var serviceURL:String = GoogleAPIServiceURL.GOOGLE_CALCULATOR_SERVICE;
			var loader:URLLoader = new URLLoader();
			var request:URLRequest = new URLRequest(serviceURL);

			langCode = APIUtil.formatInputString(langCode);

			var vars:URLVariables = new URLVariables();
			var query:String = inputValue + StringUtil.trim(inputCurrencyCode) + "=?" + StringUtil.trim(outputCurrencyCode);
			vars.q = query;

			if (StringUtil.trim(langCode).length > 0) {
				vars.hl = langCode;
			} else if (GoogleAPISettings.useMainLanguageAsDefaultLanguage) {
				vars.hl = GoogleAPISettings.MAIN_LANGUAGE;
			}

			request.data = vars;

			loader.addEventListener(Event.COMPLETE, onCurrResponse);
			loader.addEventListener(IOErrorEvent.IO_ERROR, onIOError);
			loader.load(request);
		}

		//-----Handlers-------------------------------------

		private function onCurrResponse(event:Event):void {
			var json:Object = JSON.decode("" + event.target.data);

			if (json.error == "" && Boolean(json.icc)) {
				var resultCC:GoogleCalculation = new GoogleCalculation();
				resultCC.input = json.lhs as String;
				resultCC.result = json.rhs as String;
				resultCC.isCurrencyConversion = true;

				dispatchEvent(new GoogleAPIEvent(GoogleAPIEvent.CALCULATOR_RESULT, resultCC));
			} else {
				var error:String = json.error as String;
				dispatchEvent(new GoogleAPIErrorEvent(GoogleAPIErrorEvent.API_ERROR, "Calculator error: " + error));
			}
		}

		private function onIOError(event:IOErrorEvent):void {
			dispatchEvent(new GoogleAPIEvent(GoogleAPIEvent.ON_ERROR, "IOERROR: " + event.text));
		}
	}
}