package com.apps.sm.gae.travelify.beta;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.apps.sm.gae.travelify.beta.beans.Succsbean;
import com.apps.sm.gae.travelify.beta.cmn.TravelifyCmnUtil;
import com.apps.sm.gae.travelify.beta.dbstore.Board;
import com.apps.sm.gae.travelify.beta.dbstore.ClippedPlace;
import com.apps.sm.gae.travelify.beta.dbstore.OfyService;
import com.apps.sm.gae.travelify.beta.dbstore.Travelifier;
import com.apps.sm.gae.travelify.beta.dbstore.Trip;
import com.apps.sm.gae.travelify.beta.models.Place;
import com.apps.sm.gae.travelify.beta.models.PlaceDetailResult;
import com.apps.sm.gae.travelify.beta.models.PlacesQueryOptions;
import com.apps.sm.gae.travelify.beta.models.PlacesResult;
import com.apps.sm.gae.travelify.beta.models.PlacesSuggestResult;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.gson.Gson;

@Controller
public class PlaceController {

	@Autowired
	com.apps.sm.gae.travelify.beta.svcs.TravelifyPlcsSvc placeSvc;

	@Autowired
	private UserService userSvc;
	
	private static final Logger logger = Logger.getLogger(PlaceController.class.getCanonicalName());

	@RequestMapping(value = "/travelinearby", method = RequestMethod.GET)
	public String showgrid(HttpServletRequest req, Model uiModel) {
		boolean flagLoginReqd = false;

		User user = TravelifyCmnUtil.checkAuthorization(userSvc);
		String hrefscr = "";

		if (user != null) {
			hrefscr = userSvc.createLogoutURL(req.getRequestURI());
			flagLoginReqd = false;
		} else {
			hrefscr = userSvc.createLoginURL(req.getRequestURI());
			flagLoginReqd = true;
		}

		uiModel.addAttribute("hrefscr", hrefscr);
		uiModel.addAttribute("user", user);

		if (flagLoginReqd) {
			return TravelifyCmnUtil._VIEW_LOGIN_PAGE;
		} else {
			return TravelifyCmnUtil._VIEW_NEARBY_GRID;
		}
	}
	
	
	
	@RequestMapping(value = "/traveliclips", method = RequestMethod.GET)
	public String showAllClips(HttpServletRequest req, Model uiModel) {
		//boolean flagLoginReqd = false;
		Map<String, List<ClippedPlace>> clipplacemap = new TreeMap<String, List<ClippedPlace>>();
		//List<ClippedPlace> tempcliplist	= new ArrayList<ClippedPlace>();
		String clipcatstr	= "";

		User user = TravelifyCmnUtil.checkAuthorization(userSvc);
		String hrefscr = "";
		if (user != null) {
			hrefscr = userSvc.createLogoutURL(req.getRequestURI());
			//flagLoginReqd = false;
		} else {
			hrefscr = userSvc.createLoginURL(req.getRequestURI());
			//flagLoginReqd = true;
		}

		uiModel.addAttribute("hrefscr", hrefscr);
		uiModel.addAttribute("user", user);
		
		/*if (flagLoginReqd) {
			return TravelifyCmnUtil._VIEW_LOGIN_PAGE;
		} else {
		 */
			List<ClippedPlace> cliplist = OfyService.ofy().load()
														   .type(ClippedPlace.class)
														   .list();
			//System.out.println("cliplist size-" + cliplist.size());
			if (cliplist != null) {
				//System.out.println("clipplist size-"+cliplist.size());
				
				for(ClippedPlace clip : cliplist) {
					// update the clip user data
					Travelifier tmpuser = TravelifyCmnUtil.checkAndLoadUsrdata(clip.getUid());
					
					if(tmpuser!=null && StringUtils.isNotBlank(tmpuser.getUgplusid())) {
						clip.setUprofilestr(TravelifyCmnUtil.getProfilePicLnk("", tmpuser.getUgplusid()));
					}else {
						clip.setUprofilestr(TravelifyCmnUtil.defaultPic);
					}
					
					// check if the map has any key correspond to this clip's category
					clipcatstr = clip.getPlccategory();
					
					if(StringUtils.isBlank(clipcatstr)) {
						clipcatstr = "Not Available...";
					}
					//System.out.println("clipcatstr-" + clipcatstr);
					
					if(clipplacemap.containsKey(StringUtils.capitalize(clipcatstr))) {
						// category found so pull the clip list and add this clip to it
						//System.out.println("clipcatstr found in map");
						List<ClippedPlace> tempcliplist1 = clipplacemap.get(StringUtils.capitalize(clipcatstr));
						if(tempcliplist1!=null){
							tempcliplist1.add(clip);
						}
					}else {
						//System.out.println("clipcatstris not found in map");
						// this category is not found so add to the map
						List<ClippedPlace> tempcliplist2 = new ArrayList<ClippedPlace>();
						tempcliplist2.add(clip);
						clipplacemap.put(StringUtils.capitalize(clipcatstr), tempcliplist2);
					}
				}
				
				/*System.out.println("map keys-" + Arrays.toString(clipplacemap.keySet().toArray()));
				Iterator itr = clipplacemap.keySet().iterator();
				while(itr.hasNext()) {
					List<ClippedPlace> tempcliplist = clipplacemap.get(itr.next());
					System.out.println("value list size - " + tempcliplist.size());
				}*/
				
			}
			
			
			//System.out.println("clipplacemap-" + Arrays.toString(clipplacemap.keySet().toArray()));
			
			uiModel.addAttribute("clipmap", clipplacemap);

			return TravelifyCmnUtil._VIEW_ALL_CLP_LIST;
		//}
	}
	

	@RequestMapping(value = "/travelinearby/search1", method = RequestMethod.GET)
	public String showlistbytype(
			@RequestParam("cat") final String cat,
			@RequestParam("types") final String types,
			@RequestParam("lat") final String _LAT,
			@RequestParam("lon") final String _LON, HttpServletRequest req,
			Model uiModel) {
		boolean flagLoginReqd = false;

		User user = TravelifyCmnUtil.checkAuthorization(userSvc);
		String hrefscr = "";

		if (user != null) {
			hrefscr = userSvc.createLogoutURL(req.getRequestURI());
			flagLoginReqd = false;
		} else {
			hrefscr = userSvc.createLoginURL(req.getRequestURI());
			flagLoginReqd = true;
		}

		uiModel.addAttribute("hrefscr", hrefscr);
		uiModel.addAttribute("user", user);

		if (flagLoginReqd) {
			return TravelifyCmnUtil._VIEW_LOGIN_PAGE;
		} else {

			PlacesResult result = null;

			if (types != null && types != "") {
				result = placeSvc.search(Float.valueOf(_LAT).floatValue(),
						Float.valueOf(_LON).floatValue(), PlacesQueryOptions
								.create().types(types), false);
			}

			List<ClippedPlace> clipplist = OfyService.ofy().load()
					.type(ClippedPlace.class).filter("uid", user.getUserId())
					.list();
			Map<String, String> clipmap = new HashMap<String, String>();
			if (clipplist != null) {
				for (ClippedPlace clp : clipplist) {
					clipmap.put(clp.getPlcname(), clp.getPlcname());
				}
			}

			if (result.isOkay()) {
				List<Place> places = result.asList();

				for (Place place : places) {
					if (clipmap != null && clipmap.containsKey(place.getName())) {
						// System.out.println("setting true"+place.getName());
						place.setClipped(true);
					} else {
						// System.out.println("setting false"+place.getName());
						place.setClipped(false);
					}
				}

				uiModel.addAttribute("places", places);
			} else {
				uiModel.addAttribute("message", "no result");
			}

			uiModel.addAttribute("types", types);
			uiModel.addAttribute("lat", _LAT);
			uiModel.addAttribute("lon", _LON);
			uiModel.addAttribute("cat", cat);

			return TravelifyCmnUtil._VIEW_NEARBY_LIST;
		}
	}

	@RequestMapping(value = "/travelinearby/search2", method = RequestMethod.GET)
	public String showlistbykeywrd(
			@RequestParam("cat") final String cat,			
			@RequestParam("keyword") final String keyword,
			@RequestParam("lat") final String _LAT,
			@RequestParam("lon") final String _LON, HttpServletRequest req,
			Model uiModel) {
		boolean flagLoginReqd = false;
		
		User user = TravelifyCmnUtil.checkAuthorization(userSvc);
		String hrefscr = "";

		if (user != null) {
			hrefscr = userSvc.createLogoutURL(req.getRequestURI());
			flagLoginReqd = false;
		} else {
			hrefscr = userSvc.createLoginURL(req.getRequestURI());
			flagLoginReqd = true;
		}

		uiModel.addAttribute("hrefscr", hrefscr);
		uiModel.addAttribute("user", user);

		if (flagLoginReqd) {
			return TravelifyCmnUtil._VIEW_LOGIN_PAGE;
		} else {

			PlacesResult result = null;

			if (keyword != null && keyword != "") {
				result = placeSvc.search(Float.valueOf(_LAT).floatValue(),
						Float.valueOf(_LON).floatValue(), PlacesQueryOptions
								.create().keyword(keyword), false);
			}

			List<ClippedPlace> clipplist = OfyService.ofy().load()
					.type(ClippedPlace.class).filter("uid", user.getUserId())
					.list();
			Map<String, String> clipmap = new HashMap<String, String>();
			if (clipplist != null) {
				for (ClippedPlace clp : clipplist) {
					clipmap.put(clp.getPlcname(), clp.getPlcname());
				}
			}

			if (result.isOkay()) {
				List<Place> places = result.asList();

				for (Place place : places) {
					if (clipmap != null && clipmap.containsKey(place.getName())) {
						// System.out.println("setting true"+place.getName());
						place.setClipped(true);
					} else {
						// System.out.println("setting false"+place.getName());
						place.setClipped(false);
					}
				}

				uiModel.addAttribute("places", places);
			} else {
				uiModel.addAttribute("message", "no result");
			}

			uiModel.addAttribute("keyword", keyword);
			uiModel.addAttribute("lat", _LAT);
			uiModel.addAttribute("lon", _LON);
			uiModel.addAttribute("cat", cat);
			
			return TravelifyCmnUtil._VIEW_NEARBY_LIST;
		}
	}

	@RequestMapping(value = "/travelinearby/recommend/{keyword}", method = RequestMethod.GET)
	public String recommnd(@PathVariable("keyword") final String keyword,
			@RequestParam("lat") final String _LAT,
			@RequestParam("lon") final String _LON, HttpServletRequest req,
			Model uiModel) {
		boolean flagLoginReqd = false;
		String cat = keyword;

		User user = TravelifyCmnUtil.checkAuthorization(userSvc);
		String hrefscr = "";

		if (user != null) {
			hrefscr = userSvc.createLogoutURL(req.getRequestURI());
			flagLoginReqd = false;
		} else {
			hrefscr = userSvc.createLoginURL(req.getRequestURI());
			flagLoginReqd = true;
		}

		uiModel.addAttribute("hrefscr", hrefscr);
		uiModel.addAttribute("user", user);

		if (flagLoginReqd) {
			return TravelifyCmnUtil._VIEW_LOGIN_PAGE;
		} else {

			Map<String, List<Place>> rsltmap = placeSvc.recommend(Float
					.valueOf(_LAT).floatValue(), Float.valueOf(_LON)
					.floatValue(), 8000, keyword, 5, false);

			if (rsltmap != null && rsltmap.size() > 0) {
				uiModel.addAttribute("recommndmap", rsltmap);
			} else {
				uiModel.addAttribute("message", "no result");
			}

			uiModel.addAttribute("keyword", keyword);
			uiModel.addAttribute("lat", _LAT);
			uiModel.addAttribute("lon", _LON);
			uiModel.addAttribute("cat", cat);

			return TravelifyCmnUtil._VIEW_RECOMMND_LIST;
		}
	}

	@RequestMapping(value = "/travelinearby/suggest/{keyword}", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody
	String suggest(@PathVariable("keyword") final String keyword,
			@RequestParam("lat") final String _LAT,
			@RequestParam("lon") final String _LON, HttpServletRequest req,
			Model uiModel) {

		String query = "";
		String mssg = "";
		String jsonstr = "";

		Gson gson = new Gson();

		if ("breakfast".equalsIgnoreCase(keyword)) {
			query = keyword + "+restaurant";
			mssg = "It's Morning... time for breakfast...";
		} else if ("lunch".equalsIgnoreCase(keyword)) {
			query = "top+" + keyword + "+restaurant";
			mssg = "Lunch time... Try some new restaurant nearby";
		} else if ("hangout".equalsIgnoreCase(keyword)) {
			query = keyword + "+restaurant";
			mssg = "It's evening... Hangout time with friends";
		} else {
			query = "top+" + keyword + "+restaurant";
			mssg = "Dinner time...";
		}

		// System.out.println("query-"+query);

		PlacesSuggestResult rslt = placeSvc.suggest(Float.valueOf(_LAT)
				.floatValue(), Float.valueOf(_LON).floatValue(), 8000, query,
				15, false);
		rslt.setMssg(mssg);

		jsonstr = gson.toJson(rslt);

		// System.out.println("jsonstr-" + jsonstr);

		return jsonstr;
	}

	@RequestMapping(value = "/placequery", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody
	String placeQuery(@RequestParam("query") final String query,
			@RequestParam("type") final String type,
			@RequestParam("resultcnt") final int resultcnt) {

		String jsonstr = "";

		Gson gson = new Gson();

		// System.out.println("query-"+query);

		PlacesSuggestResult rslt = placeSvc.suggest(query, 20000, type,
				resultcnt, false);

		jsonstr = gson.toJson(rslt);

		// System.out.println("jsonstr-" + jsonstr);

		return jsonstr;
	}

	@RequestMapping(value = "/searchquery", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody
	String searchQuery(@RequestParam("query") final String query,
			@RequestParam("resultcnt") final int resultcnt) {

		String jsonstr = "";

		Gson gson = new Gson();

		//System.out.println("query-" + query);

		PlacesResult rslt = placeSvc.search(query, 20000, false);

		jsonstr = gson.toJson(rslt);

		//System.out.println("jsonstr-" + jsonstr);

		return jsonstr;
	}
	
	

	@RequestMapping(value = "/travelinearby/showdtls", method = RequestMethod.GET)
	public String showDtls(@RequestParam("ref") final String reference,
			@RequestParam("lat") final String _LAT,
			@RequestParam("lon") final String _LON, Model uiModel,
			HttpServletRequest req) {
		boolean flagLoginReqd = false;

		User user = TravelifyCmnUtil.checkAuthorization(userSvc);
		String hrefscr = "";

		if (user != null) {
			hrefscr = userSvc.createLogoutURL(req.getRequestURI());
			flagLoginReqd = false;
		} else {
			hrefscr = userSvc.createLoginURL(req.getRequestURI());
			flagLoginReqd = true;
		}

		uiModel.addAttribute("hrefscr", hrefscr);
		uiModel.addAttribute("user", user);

		if (flagLoginReqd) {
			return TravelifyCmnUtil._VIEW_LOGIN_PAGE;
		} else {

			uiModel.addAttribute("lat", _LAT);
			uiModel.addAttribute("lon", _LON);

			PlaceDetailResult result = placeSvc.detail(reference, false);

			if (result.isOkay()) {
				uiModel.addAttribute("placedls", result.getResult());
			} else {
				uiModel.addAttribute("message", "no result");
			}

			return TravelifyCmnUtil._VIEW_PLACE_DTLS;
		}
	}
	
	
	

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String showHome(HttpServletRequest req, Model uiModel) {
		List<Board> homeboardlist = new ArrayList<Board>();
		List<Trip> hometriplist = new ArrayList<Trip>();
		List<ClippedPlace> homeclipplist = new ArrayList<ClippedPlace>();
		
		String ftrdPhotoUrl;
		String staticmap;
		
		//int indxb=1;
		//int indxc=1;
		//int indxt=1;

		User user = TravelifyCmnUtil.checkAuthorization(userSvc);
		String hrefscr = "";
		if (user != null) {
			hrefscr = userSvc.createLogoutURL(req.getRequestURI());
			Travelifier tuser = TravelifyCmnUtil.checkAndLoadUsrdata(userSvc);
			uiModel.addAttribute("tuser", tuser);						
		} else {
			hrefscr = userSvc.createLoginURL(req.getRequestURI());
		}
		
		
		List<Board> boardlist 			= OfyService.ofy().load().type(Board.class).order("boardid").limit(4).list();
		List<Trip> triplist 			= OfyService.ofy().load().type(Trip.class).filter("status", "Public").order("tripid").limit(3).list();
		List<ClippedPlace> clipplist 	= OfyService.ofy().load().type(ClippedPlace.class).order("clippedid").limit(4).list();
		
		if(boardlist != null) {
			for(Board board : boardlist) {
//				ftrdPhotoUrl = TravelifyCmnUtil.getBoardFeaturedPhoto(board.getPhotoKey());
				board.setShortboardtitle(StringUtils.abbreviate(board.getBoardtitle(), 25));
				
				if(board.getPhotoKey()!=null) {
					ftrdPhotoUrl = TravelifyCmnUtil.getBoardFeaturedPhoto(board.getPhotoKey());
				}else {
					ftrdPhotoUrl = "http://maps.googleapis.com/maps/api/staticmap?center=" 
									+ StringUtils.replace(board.getLocation(), " ", "+") 
									+ "&zoom=11&size=480x300&key=" 
									+ TravelifyCmnUtil.mapsapikey + "&sensor=false";					
				}
				
				board.setBoardphotourl(ftrdPhotoUrl);
				board.setPublshddatestr(TravelifyCmnUtil.printDtttmStr(board.getCreateddt().toString()));
				
				Travelifier tmpuser = TravelifyCmnUtil.checkAndLoadUsrdata(board.getUid());
				
				//System.out.println("board tmpuser-" + tmpuser);
				
				if(tmpuser!=null && StringUtils.isNotBlank(tmpuser.getUgplusid())) {
					board.setUprofilestr(TravelifyCmnUtil.getProfilePicLnk("", tmpuser.getUgplusid()));
				}else {
					board.setUprofilestr(TravelifyCmnUtil.defaultPic);
				}
				homeboardlist.add(board);
				//indxb++;
				//if(indxb==5) break;
			}
		}
		
		if(triplist != null) {
			for(Trip trip : triplist) {
				staticmap = "http://maps.googleapis.com/maps/api/staticmap?center=" 
						+ StringUtils.replace(trip.getTripplace(), " ", "+") 
						+ "&zoom=11&size=320x200&key=" 
						+ TravelifyCmnUtil.mapsapikey + "&sensor=false";
				
				trip.setTripstaticmap(staticmap);
				
				trip.setShorttitle(StringUtils.abbreviate(trip.getTriptitle(), 25));
				
				trip.setTripnote(StringUtils.abbreviate(trip.getTripnote(), 35));
				
				trip.setPublshddatestr(TravelifyCmnUtil.printDtttmStr(trip.getCreateddt().toString()));
				
				Travelifier tmpuser = TravelifyCmnUtil.checkAndLoadUsrdata(trip.getUid());
				//System.out.println("trip tmpuser-" + tmpuser);
				
				if(tmpuser!=null && StringUtils.isNotBlank(tmpuser.getUgplusid())) {
					trip.setUprofilestr(TravelifyCmnUtil.getProfilePicLnk("", tmpuser.getUgplusid()));
				}else {
					trip.setUprofilestr(TravelifyCmnUtil.defaultPic);
				}
				
				hometriplist.add(trip);
				//indxt++;
				//if(indxt==4) break;
			}
		}
		
		//System.out.println("triplist size-" + hometriplist.size());
		
		if(clipplist != null) {
			for(ClippedPlace clip : clipplist) {
				clip.setShorttitle(StringUtils.abbreviate(clip.getPlcname(), 25));
				
				clip.setPublshddatestr(TravelifyCmnUtil.printDtttmStr(clip.getClippeddate().toString()));
				
				Travelifier tmpuser = TravelifyCmnUtil.checkAndLoadUsrdata(clip.getUid());
				//System.out.println("clip tmpuser-" + tmpuser);
				
				if(tmpuser!=null && StringUtils.isNotBlank(tmpuser.getUgplusid())) {
					clip.setUprofilestr(TravelifyCmnUtil.getProfilePicLnk("", tmpuser.getUgplusid()));
				}else {
					clip.setUprofilestr(TravelifyCmnUtil.defaultPic);
				}
				
				homeclipplist.add(clip);
				//indxc++;
				//if(indxc==5) break;
			}
		}
		
		uiModel.addAttribute("boards", homeboardlist);
		uiModel.addAttribute("trips", hometriplist);
		uiModel.addAttribute("clips", homeclipplist);
		
		uiModel.addAttribute("hrefscr", hrefscr);
		uiModel.addAttribute("user", user);

		return TravelifyCmnUtil._VIEW_SHW_HOME;
	}

	
	

	@RequestMapping(value = "/clippit", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody
	String clippIt(@RequestParam("clippdata") final String clippdata) {
		boolean svsccs = false;
		String jsonstr = "";
		String clpStr = clippdata;

		Gson gson = new Gson();
		Succsbean succsbn = new Succsbean();

		User user = TravelifyCmnUtil.checkAuthorization(userSvc);

		if (user != null) {
			 logger.info("clippdata-" + clippdata);

			String clipparr[] = StringUtils.split(clpStr, ";");
			 logger.info("clipparr-"+ Arrays.toString(clipparr));

			if (clipparr != null && clipparr.length > 0) {
				List<ClippedPlace> clipplist = OfyService.ofy().load()
						.type(ClippedPlace.class)
						.filter("uid", user.getUserId())
						.filter("plcname", clipparr[0]).list();
				// System.out.println("clipplist-"+ clipplist);

				if (clipplist != null && clipplist.size() > 0) {
					svsccs = false;
				} else {
					ClippedPlace clippplace = new ClippedPlace();

					clippplace.setClippeddate(new Date());
					clippplace.setPlcname(clipparr[0]);
					clippplace.setPlcaddrss(clipparr[1]);
					clippplace.setPlcreference(clipparr[2]);
					clippplace.setPlclatlon(clipparr[3]);
					clippplace.setPlccategory(clipparr[4]);
					clippplace.setUid(user.getUserId());
					clippplace.setUnickname(user.getNickname());

					// System.out.println("clippplace-" + clippplace);
					OfyService.ofy().save().entity(clippplace).now();
					// System.out.println("********* saved successfully - " +
					// clippplace.getClippedid());
					svsccs = true;
				}
			} else {
				svsccs = false;
			}
		} else {
			svsccs = false;
		}

		if (svsccs) {
			succsbn.setMssgstr("This place is successfully clipped to your clipp list... It is available in my clipped list");
		} else {
			succsbn.setMssgstr("Something went wrong... please try again later...");
		}

		jsonstr = gson.toJson(succsbn);

		// System.out.println("jsonstr-"+jsonstr);

		return jsonstr;
	}

	@RequestMapping(value = "/myclippedlist", method = RequestMethod.GET)
	public String myclippedList(HttpServletRequest req, Model uiModel) {
		boolean flagLoginReqd = false;

		User user = TravelifyCmnUtil.checkAuthorization(userSvc);
		String hrefscr = "";
		if (user != null) {
			hrefscr = userSvc.createLogoutURL(req.getRequestURI());
			flagLoginReqd = false;
		} else {
			hrefscr = userSvc.createLoginURL(req.getRequestURI());
			flagLoginReqd = true;
		}

		uiModel.addAttribute("hrefscr", hrefscr);
		uiModel.addAttribute("user", user);
		if (flagLoginReqd) {
			return TravelifyCmnUtil._VIEW_LOGIN_PAGE;
		} else {

			List<ClippedPlace> clipplist = OfyService.ofy().load()
														   .type(ClippedPlace.class)
														   .filter("uid", user.getUserId())
														   .list();
			// System.out.println("clipplist-"+clipplist);
			if (clipplist != null) {
				// System.out.println("clipplist size-"+clipplist.size());
			}
			uiModel.addAttribute("clipplist", clipplist);

			return TravelifyCmnUtil._VIEW_MY_CLP_LIST;
		}
	}

	
	

	@RequestMapping(value = "/deleteclip", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody String deleteClipPlace(@RequestParam("clipid") final String clipid) {
		String jsonstr = "";
		boolean svsccs = false;
		
		Gson gson = new Gson();
		Succsbean succsbn = new Succsbean();

		User user = TravelifyCmnUtil.checkAuthorization(userSvc);
		logger.info("clipid to delete-" + clipid);
		
		if (user != null) {
			
			if(clipid!="") {
				OfyService.ofy().delete().type(ClippedPlace.class).id(clipid).now();
				svsccs = true;
			}

			if (svsccs) {
				succsbn.setMssgstr("This clipped place is deleted successfully... pls refresh this page");
			} else {
				succsbn.setMssgstr("Something went wrong... please try again later...");
			}
		}else {
			succsbn.setMssgstr("You are not authorized to delete this clipped place... pls login");
		}
		
		jsonstr = gson.toJson(succsbn);
		
		logger.info("delete clip jsonstr - " + jsonstr);
		
		return jsonstr;
	}

		
		
}
