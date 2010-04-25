package be.boulevart.google.api.search {

	/**
	 * GoogleSearchResultPage contains current index of a result page and the new start index to use in you queries
	 *
	 */
	public class GoogleSearchResultPage {

		private var _index:uint;
		private var _nextStartValue:uint;

		/**
		 * Current page index
		 */
		public function get pageIndex():uint {
			return _index;
		}

		public function set pageIndex(value:uint):void {
			if (value !== _index) {
				_index = value;
			}
		}

		/**
		 * Start value of the next page
		 */
		public function get nextStartValue():uint {
			return _nextStartValue;
		}

		public function set nextStartValue(value:uint):void {
			if (value !== _nextStartValue) {
				_nextStartValue = value;
			}
		}

	}
}