package be.boulevart.google.api.feeds.data.types {

	public class GoogleFeedEntry {
		private var _author:String;
		private var _categories:Array = [];
		private var _content:String;
		private var _contentSnippet:String;
		private var _link:String;
		private var _publishedDate:Date;
		private var _title:String;
		private var _url:String;

		/**
		 * Feed entry author
		 */
		public function get author():String {
			return _author;
		}

		public function set author(value:String):void {
			_author = value;
		}

		/**
		 * Feed entry content
		 */
		public function get content():String {
			return _content;
		}

		public function set content(value:String):void {
			_content = value;
		}

		/**
		 * Content snippet (short version of content as preview)
		 */
		public function get contentSnippet():String {
			return _contentSnippet;
		}

		public function set contentSnippet(value:String):void {
			_contentSnippet = value;
		}

		/**
		 * Link to Feed entry
		 */
		public function get link():String {
			return _link;
		}

		public function set link(value:String):void {
			_link = value;
		}

		/**
		 * Feed entry title
		 */
		public function get title():String {
			return _title;
		}

		public function set title(value:String):void {
			_title = value;
		}

		/**
		 * Feed entry URL
		 */
		public function get url():String {
			return _url;
		}

		public function set url(value:String):void {
			_url = value;
		}

		/**
		 * Feed entry categories
		 */
		public function get categories():Array {
			return _categories;
		}

		public function set categories(value:Array):void {
			_categories = value;
		}

		/**
		 * Feed entry publish date
		 */
		public function get publishedDate():Date {
			return _publishedDate;
		}

		public function set publishedDate(value:Date):void {
			_publishedDate = value;
		}
	}
}