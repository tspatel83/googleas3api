package be.boulevart.google.api.search {

	/**
	 * Result object containing the result object of a search query (Google Search)
	 */
		private var _results:Array = [];
		private var _estimatedNumResults:int = 0;
		private var _currentPageIndex:int = 0;
		private var _pages:Array = [];

		/**
		 * Array of result objects, see the classes where you queried for more information
		 */
			return _results;
		}

			_results = results;
		}

		/**
		 * Number of estimated results
		 */
			return _estimatedNumResults;
		}

			_estimatedNumResults = nor;
		}

		/**
		 * Current page index of result
		 */
			return _currentPageIndex;
		}

			_currentPageIndex = index;
		}

		/**
		 * Number of pages available
		 */
			return pages.length;
		}

		 * All pages available, containing GoogleSearchResultPage objects
		 */
		public function get pages():Array {
			return _pages;
		}

		public function set pages(value:Array):void {
			_pages = value;
		}

	}
}