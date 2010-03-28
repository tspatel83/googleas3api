package be.boulevart.google.api.dictionary.data {

	public class GoogleDictionaryWebDefinition {
		private var _entries:Array = [];
		private var _terms:Array = [];
		private var _type:String;

		/**
		 * Entries
		 */
		public function get entries():Array {
			return _entries;
		}

		public function set entries(value:Array):void {
			_entries = value;
		}

		/**
		 * terms
		 */
		public function get terms():Array {
			return _terms;
		}

		public function set terms(value:Array):void {
			_terms = value;
		}

		/**
		 * Definition type
		 */
		public function get type():String {
			return _type;
		}

		public function set type(value:String):void {
			_type = value;
		}


	}
}