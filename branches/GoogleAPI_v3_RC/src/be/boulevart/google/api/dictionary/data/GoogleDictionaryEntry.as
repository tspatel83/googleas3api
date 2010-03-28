package be.boulevart.google.api.dictionary.data {

	public class GoogleDictionaryEntry {
		private var _terms:Array = [];
		private var _type:String;

		/**
		 * Entry terms
		 */
		public function get terms():Array {
			return _terms;
		}

		public function set terms(value:Array):void {
			_terms = value;
		}

		/**
		 * Entry type
		 */
		public function get type():String {
			return _type;
		}

		public function set type(value:String):void {
			_type = value;
		}


	}
}