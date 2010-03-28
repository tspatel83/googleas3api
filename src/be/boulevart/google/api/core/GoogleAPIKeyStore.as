/**
 * GOOGLE API - AS3 LIBRARY
 *
 * @author Joris Timmerman
 * @version 3.0
 *
 * GoogleAPIKeyStore - If you have a Google API key, filled it in here
 * Build by Joris Timmerman, these classes uses the Google API
 *
 * These classes are using methods and classes from the Adobe Core Libary, downloadable @ http://code.google.com/p/as3corelib/
 *
 * SPECIAL THANKS TO GOOGLE FOR PROVIDING THE API
 * THIS IS AN OPEN SOURCE PROJECT DELIVERED BY BOULEVART NV (www.boulevart.be)
 * */

package be.boulevart.google.api.core {
	import com.adobe.utils.StringUtil;

	public class GoogleAPIKeyStore {

		//- PUBLIC & INTERNAL VARIABLES ---------------------------------------------------------------------------
		/**
		 * Sign up for you API key at: http://code.google.com/intl/us-en/apis/ajaxsearch/signup.html
		 */
		public static var API_KEY:String = "<insert API key here>";


		//- PUBLIC & INTERNAL METHODS -----------------------------------------------------------------------------
		/**
		 * Set the API key for the AJAX searches here.<br/>
		 * You must have a Google Account to obtain a Google API key, and your API key is tied directly to your Google Account.<br/>
		 * You can generate multiple API keys for your account if you have multiple web sites.<br/>
		 * Sign up for you API key at: http://code.google.com/intl/us-en/apis/ajaxsearch/signup.html
		 */
		public static function setAPIKey(apiKey:String):void {
			API_KEY = apiKey;
		}


		//- GETTERS & SETTERS -------------------------------------------------------------------------------------
		/**
		 * Is the API key set?
		 * @return Boolean is API key set?
		 */
		public static function get keyIsSet():Boolean {
			return (StringUtil.trim(API_KEY) != "" && StringUtil.trim(API_KEY) != "<insert API key here>");
		}

	}
}