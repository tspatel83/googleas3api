package be.boulevart.google.api.dictionary.data {

	public class GoogleDictionaryResult {
		private var _query:String;
		private var _sourceLanguage:String;
		private var _targetLanguage:String;
		private var _webDefinitions:Array = [];

		/**
		 * Your search query
		 */
		public function get query():String {
			return _query;
		}

		public function set query(value:String):void {
			_query = value;
		}

		/**
		 * Query source language
		 */
		public function get sourceLanguage():String {
			return _sourceLanguage;
		}

		public function set sourceLanguage(value:String):void {
			_sourceLanguage = value;
		}

		/**
		 * Result target language
		 */
		public function get targetLanguage():String {
			return _targetLanguage;
		}

		public function set targetLanguage(value:String):void {
			_targetLanguage = value;
		}

		/**
		 * Webdefinitions for the query
		 */
		public function get webDefinitions():Array {
			return _webDefinitions;
		}

		public function set webDefinitions(value:Array):void {
			_webDefinitions = value;
		}


	}
}