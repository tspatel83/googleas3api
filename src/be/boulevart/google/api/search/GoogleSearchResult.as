package be.boulevart.google.api.search {

	/**
	 * Result object containing the result object of a search query (Google Search)
	 */	public class GoogleSearchResult {
		private var _results:Array = [];
		private var _estimatedNumResults:int = 0;
		private var _currentPageIndex:int = 0;
		private var _pages:Array = [];
		private var _moreResultsUrl:String;

		/**
		 * Array of result objects, see the classes where you queried for more information
		 */		public function get results():Array {
			return _results;
		}
		public function set results(results:Array):void {
			_results = results;
		}

		/**
		 * Number of estimated results
		 */		public function get estimatedNumResults():int {
			return _estimatedNumResults;
		}
		public function set estimatedNumResults(nor:int):void {
			_estimatedNumResults = nor;
		}

		/**
		 * Current page index of result
		 */		public function get currentPageIndex():int {
			return _currentPageIndex;
		}
		public function set currentPageIndex(index:int):void {
			_currentPageIndex = index;
		}

		/**
		 * Number of pages available
		 */		public function get numPages():int {
			return pages.length;
		}
		/**
		 * All pages available, containing GoogleSearchResultPage objects
		 */
		public function get pages():Array {
			return _pages;
		}

		public function set pages(value:Array):void {
			_pages = value;
		}

		/**
		 * More results URL
		 */
		public function get moreResultsUrl():String {
			return _moreResultsUrl;
		}

		public function set moreResultsUrl(value:String):void {
			_moreResultsUrl = value;
		}


	}
}