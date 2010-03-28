package be.boulevart.google.utils {
	import be.boulevart.google.api.core.GoogleAPISettings;
	
	import flash.errors.IllegalOperationError;
	import flash.utils.escapeMultiByte;

	public class APIUtil {
		public function APIUtil() {
			throw new IllegalOperationError("");
		}

		public static function formatInputString(value:String):String {
			var result:String = GoogleAPISettings.useMultiByteEscaping ? escapeMultiByte(value) : value;
			return result;
		}
	}
}