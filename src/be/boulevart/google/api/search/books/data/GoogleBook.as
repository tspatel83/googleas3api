package be.boulevart.google.api.search.books.data {	/**	 * @author joris	 */	public class GoogleBook {		private var __title:String;		private var __titleNF:String;		private var __unEscURL:String;		private var __url:String;		private var __authors:String;		private var __bookId:String;		private var __publishedYear:String;		private var __pageCount:int;		private var __thumbnailHTML:String;		/**		 * Book title		 */		public function get title():String {			return __title;		}		public function set title(_title:String):void {			__title = _title;		}		/**		 * Book title without formatting  (in HTML)		 */		public function get titleNoFormatting():String {			return __titleNF;		}		public function set titleNoFormatting(_titleNF:String):void {			__titleNF = _titleNF;		}		/**		 * unescaped URL to book		 */		public function get unEscapedURL():String {			return __unEscURL;		}		public function set unEscapedURL(_unEscURL:String):void {			__unEscURL = _unEscURL;		}		/**		 * URL to book		 */		public function get url():String {			return __url;		}		public function set url(_url:String):void {			__url = _url;		}		/**		 * Book auhors		 */		public function get authors():String {			return __authors;		}		public function set authors(_authors:String):void {			__authors = _authors;		}		/**		 * Book ID		 */		public function get bookId():String {			return __bookId;		}		public function set bookId(_bookId:String):void {			__bookId = _bookId;		}		/**		 * Book publish year		 */		public function get publishedYear():String {			return __publishedYear;		}		public function set publishedYear(_publishedYear:String):void {			__publishedYear = _publishedYear;		}		/**		 * Book page count		 */		public function get pageCount():int {			return __pageCount;		}		public function set pageCount(_pageCount:int):void {			__pageCount = _pageCount;		}		/**		 * Book thumbnail (HTML content)		 */		public function get thumbnailHTML():String {			return __thumbnailHTML;		}		public function set thumbnailHTML(_thumbnailHTML:String):void {			__thumbnailHTML = _thumbnailHTML;		}	}}