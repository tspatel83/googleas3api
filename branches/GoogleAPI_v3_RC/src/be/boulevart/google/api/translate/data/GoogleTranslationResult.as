package be.boulevart.google.api.translate.data {

	/**
	 * @author joris
	 */
	public class GoogleTranslationResult {
		private var _result:String;
		private var _orig:String;
		private var _from:String;
		private var _to:String;


		/**
		 * Translation result
		 */
		public function get result():String {
			return _result;
		}

		public function set result(_result:String):void {
			_result = _result;
		}

		/**
		 * Original input
		 */
		public function get originalInput():String {
			return _orig;
		}

		public function set originalInput(_orig:String):void {
			_orig = _orig;
		}

		/**
		 * Original input language
		 */
		public function get from():String {
			return _from;
		}

		public function set from(_from:String):void {
			_from = _from;
		}

		/**
		 * Target language
		 */
		public function get to():String {
			return _to;
		}

		public function set to(_to:String):void {
			_to = _to;
		}
	}
}
