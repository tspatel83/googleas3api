package be.boulevart.google.api.core {
	import be.boulevart.google.utils.LanguageCodes;

	import flash.errors.IllegalOperationError;

	public class GoogleAPISettings {
		/**
		 * Set one main language for all queries in the entire API, this means the same language will be set for every query that can use it.<br/>
		 * This may be handy if your application uses another language than English<br/>
		 * All available languages are defined in the LanguageCode class
		 * If the language (like langCode) as a parameter in a query methode like search(), it will override the main language
		 * Don't forget to set useMainLanguageAsDefaultLanguage to <listing version="3.0">true</listing version="3.0"> or the main language will be ignored.
		 * @example Example:
		 * <listing version="3.0">
		 * GoogleAPISettings.MAIN_LANGUAGE = LanguageCodes.FRENCH;
		 * GoogleAPISettings.useMainLanguageAsDefaultLanguage = true;
		 * </listing>
		 * @default LanguageCodes.ENGLISH ('en' - English)
		 */
		public static var MAIN_LANGUAGE:String = LanguageCodes.ENGLISH;
		/**
		 * Enable the use of one language over the entire API.<br/>Set GoogleAPISettings.MAIN_LANGUAGE to set a main language for the entire API
		 * @default false
		 */
		public static var useMainLanguageAsDefaultLanguage:Boolean = false;

		/**
		 * Enable the use of multibyte escaping for all custom input strings where the value could come from a user input (like searchTerms, lang, ...) over the entire API, this is recommended for non-western languages like Japanese<br/>
		 * This cannot be overriden in the query methods
		 * @default false
		 */
		public static var useMultiByteEscaping:Boolean = false;

		public function GoogleAPISettings():void {
			throw new IllegalOperationError("GoogleAPISettings cannot be instantiated.\n All properties are static, use GoogleAPISettings.<property>");
		}
	}
}