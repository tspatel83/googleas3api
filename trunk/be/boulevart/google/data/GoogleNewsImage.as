package be.boulevart.google.data {	/**	 * @author joris	 */	public class GoogleNewsImage {		/**		 * 			.title - supplies the title of the article associated with the image.			.titleNoFormatting - same as above but stripped of HTML formatting.			.url - supplies the URL of the article that contains this image. The image, when displayed, should normally link through this URL.			.publisher - supplies the publisher of the news article containing the image. The suggested user interface is to display this under or in close proximity to the image, hyper linked through the .url property from above.			.tbUrl - supplies the URL of the image.			.tbWidth - supplies the width of the image referenced above. The standard size of this image is 80 pixels wide and 50 pixels tall.			.tbHeight - supplies the height of the image referenced above. The standard size of this image is 80 pixels wide and 50 pixels tall.		 * 		 */		 		private var __title : String = ""		private var __titleNoFormatting : String = ""		private var __tbUrl : String = ""		private var __url : String = ""		private var __publisher : String = ""		private var __thumbWidth : String = ""		private var __thumbHeight : String = ""				public function get title() : String {			return __title;		}				public function set title(_title : String) : void {			__title = _title;		}				public function get titleNoFormatting() : String {			return __titleNoFormatting;		}				public function set titleNoFormatting(_titleNoFormatting : String) : void {			__titleNoFormatting = _titleNoFormatting;		}				public function get thumbUrl() : String {			return __tbUrl;		}				public function set thumbUrl(_url : String) : void {			__tbUrl = _url;		}				public function get url() : String {			return __url;		}				public function set url(_url : String) : void {			__url = _url;		}				public function get publisher() : String {			return __publisher;		}				public function set publisher(url : String) : void {			__publisher = url;		}				public function get thumbWidth() : String {			return __thumbWidth;		}				public function set thumbWidth(_thumbWidth : String) : void {			__thumbWidth = _thumbWidth;		}				public function get thumbHeight() : String {			return __thumbHeight;		}				public function set thumbHeight(_thumbHeight : String) : void {			__thumbHeight = _thumbHeight;		}				}}