package be.boulevart.google.api.feeds.data {

	public class GoogleFeedFindResult {
		private var _entries:Array = [];
		private var _query:String;

		/**
		 * Used query
		 */
		public function get query():String {
			return _query;
		}

		public function set query(value:String):void {
			_query = value;
		}

		/**
		 * Feed entries (array of GoogleFeedEntry)
		 */
		public function get entries():Array {
			return _entries;
		}

		public function set entries(value:Array):void {
			_entries = value;
		}
	}
}