package com.apps.sm.gae.travelify.beta.cmn;

import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.lang3.StringUtils;
import org.joda.time.DateTime;
import org.joda.time.Days;
import org.joda.time.Months;
import org.joda.time.Years;

import com.apps.sm.gae.travelify.beta.dbstore.OfyService;
import com.apps.sm.gae.travelify.beta.dbstore.Travelifier;
import com.apps.sm.gae.travelify.beta.models.AutocompleteResult;
import com.apps.sm.gae.travelify.beta.models.PlaceDetailResult;
import com.apps.sm.gae.travelify.beta.models.PlacesResult;
import com.claygregory.common.net.URLBuilder;
import com.google.api.client.extensions.appengine.http.UrlFetchTransport;
import com.google.api.client.http.GenericUrl;
import com.google.api.client.http.HttpRequest;
import com.google.api.client.http.HttpRequestFactory;
import com.google.api.client.http.HttpResponse;
import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.images.ImagesService;
import com.google.appengine.api.images.ImagesServiceFactory;
import com.google.appengine.api.images.ServingUrlOptions;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.gson.Gson;

public class TravelifyCmnUtil {

	public final static String _VIEW_NEARBY_GRID 		= "nrbygrid";
	public final static String _VIEW_NEARBY_LIST 		= "nrbylist";
	public final static String _VIEW_RECOMMND_LIST 		= "nrbyrecommnd";
	public final static String _VIEW_PLACE_DTLS 		= "nrbydtls";

	public final static String _VIEW_SRCH_PLACE_FRM 	= "searchplace";

	public final static String _VIEW_CRT_TRIP 			= "createtrip";
	public final static String _VIEW_NXT_TRIP_STEP 		= "nexttripstep";
	public final static String _VIEW_ADD_TRIP_PLAN 		= "addtripplan";
	public final static String _VIEW_VW_TRIP 			= "viewtrip";
	public final static String _VIEW_VW_TRIPPLAN		= "viewtripplan";
	public final static String _VIEW_SHW_TRIP_LIST 		= "showtriplist";
	public final static String _VIEW_MY_TRIP_LIST 		= "mytriplist";
	
	public final static String _VIEW_MY_CLP_LIST 		= "myclipplist";
	public final static String _VIEW_CRT_CLPBRD			= "createboard";
	public final static String _VIEW_MY_BRD_LIST		= "myboardlist";
	public final static String _VIEW_UPDT_MY_TRVL_BRD	= "updtmyboard";
	
	public final static String _VIEW_ALL_CLP_LIST 		= "showcliplist";	
	public final static String _VIEW_TRVL_BRD			= "showboard";
	public final static String _VIEW_SHW_BRD_LIST		= "showboardlist";
	
	public final static String _VIEW_SHW_HOME			= "showhome";

	public final static String _VIEW_CITY_GRID 			= "citygrid";
	public final static String _VIEW_CITY_LIST 			= "citylist";
	public final static String _VIEW_CITY_DTLS 			= "citydetails";
	
	public final static String _VIEW_LOGIN_PAGE 		= "login";
	public final static String _VIEW_MY_PAGE 			= "showmypage";
	public final static String _VIEW_HELP_PAGE 			= "help";
	
	public final static String mapsapikey 				= "AIzaSyCXasoa_-_S00WnsdIDBfV4eX9G7Rhnz0U";
	
	private final static String gplusStr				= "";
	public final static String defaultPic				= "/resources/img/default_avatar.jpg";

	
	public static HttpResponse invokeUrl(URLBuilder builder)
			throws IOException, MalformedURLException, Exception {
		String url_to_invk = builder.buildURL().toString();
		//System.out.println("URL invoked - " + url_to_invk);
		UrlFetchTransport urlTrnsprt = new UrlFetchTransport();
		HttpRequestFactory httpRqstFctry = urlTrnsprt.createRequestFactory();
		HttpRequest httpRqst = httpRqstFctry.buildGetRequest(new GenericUrl(
				url_to_invk));
		HttpResponse httpRspnse = httpRqst.execute();
		return httpRspnse;
	}
	
	public static HttpResponse invokeUrl(URL url)
			throws IOException, MalformedURLException, Exception {
		String url_to_invk = url.toString();
		//System.out.println("URL invoked - " + url_to_invk);
		UrlFetchTransport urlTrnsprt = new UrlFetchTransport();
		HttpRequestFactory httpRqstFctry = urlTrnsprt.createRequestFactory();
		HttpRequest httpRqst = httpRqstFctry.buildGetRequest(new GenericUrl(
				url_to_invk));
		HttpResponse httpRspnse = httpRqst.execute();
		return httpRspnse;
	}

	public static HttpResponse invokeUrl(String url_to_invk)
			throws IOException, MalformedURLException, Exception {
		//System.out.println("URL invoked - " + url_to_invk);
		UrlFetchTransport urlTrnsprt = new UrlFetchTransport();
		HttpRequestFactory httpRqstFctry = urlTrnsprt.createRequestFactory();
		HttpRequest httpRqst = httpRqstFctry.buildGetRequest(new GenericUrl(
				url_to_invk));
		HttpResponse httpRspnse = httpRqst.execute();
		return httpRspnse;
	}
	
	
	public static AutocompleteResult parseAutocompleteResponse(
			HttpResponse response, Gson gson) throws IOException {

		return gson.fromJson(new InputStreamReader(response.getContent()),
				AutocompleteResult.class);
	}

	public static PlaceDetailResult parseDetailResponse(HttpResponse response,
			Gson gson) throws IOException {
		return gson.fromJson(new InputStreamReader(response.getContent()),
				PlaceDetailResult.class);
	}

	public static PlacesResult parseSearchResponse(HttpResponse response,
			Gson gson) throws IOException {
		return gson.fromJson(new InputStreamReader(response.getContent()),
				PlacesResult.class);
	}

	public static User checkAuthorization(UserService userSvc) {
		User user = userSvc.getCurrentUser();
		return user;
	}
	
	public static Travelifier checkAndLoadUsrdata(UserService userSvc) {
		User user = userSvc.getCurrentUser();
		Travelifier travelifier = null;
		String uid = user.getUserId();
		
		try {
			travelifier = OfyService.ofy().load().type(Travelifier.class).id(uid).get();
		}catch(Exception e) {}
		
		if(travelifier == null) {
			travelifier = new Travelifier();
			travelifier.setUid(user.getUserId());
			//travelifier.setUgplusid("");
			travelifier.setUphoto(defaultPic);
			travelifier.setUgplus(gplusStr);
		}
		
		return travelifier;
	}
	
	public static Travelifier checkAndLoadUsrdata(String uid) {
		Travelifier travelifier = null;
		
		try {
			travelifier = OfyService.ofy().load().type(Travelifier.class).id(uid).get();
		}catch(Exception e) {}
		
		if(travelifier == null) {
			travelifier = new Travelifier();
			travelifier.setUid(uid);
			//travelifier.setUgplusid("");
			travelifier.setUphoto(defaultPic);
			travelifier.setUgplus(gplusStr);
		}
		
		return travelifier;
	}	
	
	public static String getBoardFeaturedPhoto(String photoKey) {
		String ftrdPhotoUrl = "";
		
		if(photoKey!=null) {
			BlobKey blobKey = new BlobKey(photoKey);
			ServingUrlOptions servingUrlOptions = ServingUrlOptions.Builder.withBlobKey(blobKey);
			ImagesService imagesService = ImagesServiceFactory.getImagesService();
			ftrdPhotoUrl = imagesService.getServingUrl(servingUrlOptions);
		}
		//System.out.println("ftrdPhotoUrl-" + ftrdPhotoUrl);
		return ftrdPhotoUrl;
	}
	
	
	public static String printDtttmStr(String nxtDateStr) {
		StringBuilder dtdiffStr = new StringBuilder("Published ");
		boolean flagDtFormatted = false;
		int daysDiff = 0;
		int monthDiff = 0;
		int yearDiff = 0;
		Date nxtDate = new Date();
		
		try{
			SimpleDateFormat format = new SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy");
			nxtDate = format.parse(nxtDateStr);
		
		
			DateTime todayDttm = new DateTime();// current date
			DateTime nextDttm = new DateTime(nxtDate); // next date to find the difference
	
			daysDiff = Days.daysBetween(nextDttm, todayDttm).getDays();
			monthDiff = Months.monthsBetween(nextDttm, todayDttm).getMonths();
			yearDiff = Years.yearsBetween(nextDttm, todayDttm).getYears();
	
			if (yearDiff > 0) {
				dtdiffStr.append(yearDiff).append(
						yearDiff == 1 ? " Year " : " Years ");
				flagDtFormatted = true;
			}
	
			if (!flagDtFormatted) {
				if (monthDiff > 0) {
					dtdiffStr.append(monthDiff).append(
							monthDiff == 1 ? " Month " : " Months ");
					flagDtFormatted = true;
				}
			}
	
			if (!flagDtFormatted) {
				if (daysDiff > 0) {
					dtdiffStr.append(daysDiff).append(
							daysDiff == 1 ? " Day " : " Days ");
					flagDtFormatted = true;
				}
			}
	
			if (!flagDtFormatted && daysDiff == 0) {
				dtdiffStr.append("Today ");
			} else {
				dtdiffStr.append("Ago ");
			}
		}catch(ParseException pe) {
			dtdiffStr.append(nxtDateStr);
		}
		
		return dtdiffStr.toString();
	}
	
	
	
	public static String getProfilePicLnk(String gplusLnk, String uid) {
		StringBuilder picLnkStr = new StringBuilder("https://plus.google.com/s2/photos/profile/");
		//https://plus.google.com/103291556674373289857
		if(StringUtils.isNotBlank(gplusLnk)){
			uid = StringUtils.substring(gplusLnk, StringUtils.indexOf(gplusLnk, "https://plus.google.com/"));
		}
		picLnkStr.append(uid);
		
		return picLnkStr.toString();
	}
}
