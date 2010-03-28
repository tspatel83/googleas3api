package be.boulevart.google.api.dictionary.data {

	public class GoogleDictionaryTerm {
		private var _language:String;
		private var _text:String;
		private var _type:String;

		/**
		 * Term language
		 */
		public function get language():String {
			return _language;
		}

		public function set language(value:String):void {
			_language = value;
		}

		/**
		 * Term description
		 */
		public function get text():String {
			return _text;
		}

		public function set text(value:String):void {
			_text = value;
		}

		/**
		 * Description type
		 */
		public function get type():String {
			return _type;
		}

		public function set type(value:String):void {
			_type = value;
		}


	}
}