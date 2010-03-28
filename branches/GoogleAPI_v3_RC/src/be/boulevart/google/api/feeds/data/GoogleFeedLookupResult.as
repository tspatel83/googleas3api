package be.boulevart.google.api.feeds.data {

	public class GoogleFeedLookupResult {
		private var _url:String;
		private var _query:String;

		/**
		 * Used query
		 */
		public function get query():String {
			return _url;
		}

		public function set query(value:String):void {
			_url = value;
		}

		/**
		 * Look up feed URL
		 */
		public function get url():String {
			return _query;
		}

		public function set url(value:String):void {
			_query = value;
		}

		/**
		 * Found the feed?
		 */
		public function get feedFound():Boolean {
			return url != "";
		}
	}
}