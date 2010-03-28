package be.boulevart.google.utils {
	import flash.errors.IllegalOperationError;

	/**
	 * Contains full set of available language codes (based upon set of available languages as documented by Google on March 1st, 2010).
	 * @author Joris Timmerman
	 */
	public class LanguageCodes {

		public static const AFRICAN:String = "af";
		public static const ALBANIAN:String = "sq";
		public static const ARABIC:String = "ar";

		public static const BELARUSIAN:String = "be";
		public static const BULGARIAN:String = "bg";

		public static const CATALAN:String = "ca";
		public static const CHINESE_SIMPLIFIED:String = "zh-CN";
		public static const CHINESE_TRADITIONAL:String = "zh-TW";
		public static const CROATIAN:String = "hr";
		public static const CZECH:String = "cs";

		public static const DANISH:String = "da";
		public static const DUTCH:String = "nl";

		public static const ENGLISH:String = "en";
		public static const ESTONIAN:String = "et";

		public static const FILIPINO:String = "tl";
		public static const FINNISH:String = "fi";
		public static const FRENCH:String = "fr";

		public static const GALICIAN:String = "gl";
		public static const GERMAN:String = "de";
		public static const GREEK:String = "el";

		public static const HAITIAN_CREOLE:String = "ht";
		public static const HEBREW:String = "iw";
		public static const HINDI:String = "hi";
		public static const HUNGARIAN:String = "hu";

		public static const ICELANDIC:String = "is";
		public static const INDONESIAN:String = "id";
		public static const ITALIAN:String = "it";
		public static const IRISH:String = "ga";

		public static const JAPANESE:String = "ja";

		public static const KOREAN:String = "ko";

		public static const LATVIAN:String = "lv";
		public static const LITHUANIAN:String = "lt";

		public static const MACEDONIAN:String = "mk";
		public static const MALAY:String = "ms";
		public static const MALTESE:String = "mt";

		public static const NORWEGIAN:String = "no";

		public static const PERSIAN:String = "fa";
		public static const POLISH:String = "pl";
		public static const PORTUGUESE:String = "pt";

		public static const ROMANIAN:String = "ro";
		public static const RUSSIAN:String = "ru";

		public static const SERBIAN:String = "sr";
		public static const SLOVAK:String = "sk";
		public static const SLOVENIAN:String = "sl";
		public static const SPANISH:String = "es";
		public static const SWAHILI:String = "sw";
		public static const SWEDISH:String = "sv";

		public static const THAI:String = "th";
		public static const TURKISH:String = "tr";

		public static const UKRAINIAN:String = "uk";

		public static const VIETNAMESE:String = "vi";

		public static const WELSH:String = "cy";

		public static const YIDDISH:String = "yi";


		public function LanguageCodes() {
			throw new IllegalOperationError("CurrencyCodes cannot be instantiated.\n All properties and methods are static, use LanguageCodes.<property>");
		}

		/**
		 * Get all language codes listed in this class
		 * @return Returns an Array with all language codes
		 */
		public static function getAvailableLanguageCodes():Array {
			var result:Array = ["af", "sq", "ar", "be", "bg", "ca", "zh-CN", "zh-TW", "hr", "cs", "da", "nl", "en", "et", "tl", "fi", "fr", "gl", "de", "el", "ht", "iw", "hi", "hu", "is", "id", "it", "ga", "ja", "ko", "lv", "lt", "mk", "ms", "mt", "no", "fa", "pl", "pt", "ro", "ru", "sr", "sk", "sl", "es", "sw", "sv", "th", "tr", "uk", "vi", "cy", "yi"];
			result.sort(Array.CASEINSENSITIVE);
			return result;
		}

	}
}