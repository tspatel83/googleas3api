/** * GOOGLE API - AS3 LIBRARY * * @author Joris Timmerman * @version 3.0 * * GoogleBlogSearch - Search blog sites using Google Search * Build by Joris Timmerman, these classes uses the Google Ajax API * * These classes are using methods and classes from the Adobe Core Libary, downloadable @ http://code.google.com/p/as3corelib/ * * SPECIAL THANKS TO GOOGLE FOR PROVIDING THE AJAX API * THIS IS AN OPEN SOURCE PROJECT DELIVERED BY BOULEVART NV (www.boulevart.be) */package be.boulevart.google.api.search.blogs {	import be.boulevart.google.api.core.GoogleAPIKeyStore;	import be.boulevart.google.api.core.GoogleAPIServiceURL;	import be.boulevart.google.api.core.GoogleAPISettings;	import be.boulevart.google.api.search.GoogleSearchResult;	import be.boulevart.google.api.search.blogs.data.GoogleBlog;	import be.boulevart.google.events.GoogleAPIErrorEvent;	import be.boulevart.google.events.GoogleAPIEvent;	import be.boulevart.google.utils.APIUtil;		import com.adobe.serialization.json.JSON;	import com.adobe.utils.StringUtil;		import flash.events.Event;	import flash.events.EventDispatcher;	import flash.events.IOErrorEvent;	import flash.net.URLLoader;	import flash.net.URLRequest;	import flash.net.URLVariables;	import flash.utils.escapeMultiByte;
	/**	 * @author joris	 */	public class GoogleBlogSearch extends EventDispatcher {		/**		 * Start search operation, when operation is done, will dispatch an GoogleSearchEvent.BLOG_SEARCH_RESULT event with an array of GoogleBlog-objects.		 * Will deliver 8 results max, you can get more using the startValue param. (paging)		 * @param searchString search string, what do you wanna find?		 * @param scoring This optional argument tells the blog search system how to order results. Results may be ordered by relevance (which is the default) or by date. To select ordering by relevance, do not supply this argument. To select ordering by date, set scoring as scoring=d.		 * @param startValue sets a start value for paging (fe. 9; delivers search results from result 9 up to 16)		 * @param lang set main language using language code		 */		public function search(searchString:String, startValue:int = 0, scoring:String = "", lang:String = ""):void {			var serviceURL:String = GoogleAPIServiceURL.SEARCH_BLOGS_SERVICE;			var loader:URLLoader = new URLLoader();			var request:URLRequest = new URLRequest(serviceURL);			searchString = APIUtil.formatInputString(searchString);			scoring = APIUtil.formatInputString(scoring);			lang = APIUtil.formatInputString(lang);			var vars:URLVariables = new URLVariables();			vars.v = "1.0";			vars.q = searchString;			if (startValue > 0) {				vars.start = startValue;			}			vars.rsz = "large";			if (StringUtil.trim(lang).length > 0) {				vars.hl = lang;			} else if (GoogleAPISettings.useMainLanguageAsDefaultLanguage) {				vars.hl = GoogleAPISettings.MAIN_LANGUAGE;			}			if (StringUtil.trim(scoring).length > 0) {				vars.scoring = scoring;			}			if (GoogleAPIKeyStore.keyIsSet) {				vars.key = GoogleAPIKeyStore.API_KEY;			}			request.data = vars;			loader.addEventListener(Event.COMPLETE, onResponse);			loader.addEventListener(IOErrorEvent.IO_ERROR, onIOError);			loader.load(request);		}		private function onResponse(event:Event):void {			var json:Object = JSON.decode("" + event.target.data);			if (json.responseData != null) {				var results:Array = json.responseData.results as Array;				var resultaten:Array = [];				for each (var data:Object in results) {					var item:GoogleBlog = new be.boulevart.google.api.search.blogs.data.GoogleBlog();					item.title = data.title;					item.titleNoFormatting = data.titleNoFormatting;					item.postUrl = data.postUrl;					item.content = data.content;					item.author = data.author;					item.blogUrl = data.blogUrl;					item.published = data.publishedDate;					resultaten.push(item);				}				var searchItem:GoogleSearchResult = new GoogleSearchResult();				if (json.responseData.cursor.currentPageIndex != null) {					searchItem.currentPageIndex = json.responseData.cursor.currentPageIndex;				}				if (json.responseData.cursor.pages != null) {					searchItem.numPages = json.responseData.cursor.pages.length;				}				searchItem.results = resultaten;				if (json.responseData.cursor.estimatedResultCount != null) {					searchItem.estimatedNumResults = json.responseData.cursor.estimatedResultCount;				}				dispatchEvent(new GoogleAPIEvent(GoogleAPIEvent.BLOG_SEARCH_RESULT, searchItem));			} else {				dispatchEvent(new GoogleAPIErrorEvent(GoogleAPIErrorEvent.API_ERROR, json.responseDetails as String, json.responseStatus as int));			}		}		private function onIOError(event:IOErrorEvent):void {			dispatchEvent(new GoogleAPIEvent(GoogleAPIEvent.ON_ERROR, "IOERROR: " + event.text));		}	}}