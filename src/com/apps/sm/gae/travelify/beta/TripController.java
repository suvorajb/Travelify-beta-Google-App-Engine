package com.apps.sm.gae.travelify.beta;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.apps.sm.gae.travelify.beta.beans.TipsForm;
import com.apps.sm.gae.travelify.beta.beans.TripForm;
import com.apps.sm.gae.travelify.beta.beans.TripPlanForm;
import com.apps.sm.gae.travelify.beta.cmn.TravelifyCmnUtil;
import com.apps.sm.gae.travelify.beta.dbstore.OfyService;
import com.apps.sm.gae.travelify.beta.dbstore.Tips;
import com.apps.sm.gae.travelify.beta.dbstore.Travelifier;
import com.apps.sm.gae.travelify.beta.dbstore.Trip;
import com.apps.sm.gae.travelify.beta.dbstore.TripPlan;
import com.apps.sm.gae.travelify.beta.models.Place;
import com.apps.sm.gae.travelify.beta.models.PlacesSuggestResult;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.gson.Gson;

@Controller
public class TripController {

	@Autowired
	private com.apps.sm.gae.travelify.beta.svcs.TravelifyPlcsSvc placeSvc;

	@Autowired
	private UserService userSvc;
	
	
	@RequestMapping(value = "/travelitrips", method = RequestMethod.GET)
	public String showTripList(HttpServletRequest req, Model uiModel) {
		//boolean flagLoginReqd = false;

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
		} else {*/

			List<Trip> triplist = OfyService.ofy().load().type(Trip.class).filter("status", "Public").list();
			// List<Trip> triplist =
			// OfyService.ofy().load().type(Trip.class).list();
			String staticmap = "";
	
			for (Trip trip : triplist) {
				staticmap = "http://maps.googleapis.com/maps/api/staticmap?center=" 
						+ StringUtils.replace(trip.getTripplace(), " ", "+") 
						+ "&zoom=11&size=600x220&key=" 
						+ TravelifyCmnUtil.mapsapikey + "&sensor=false";
				
				trip.setTripstaticmap(staticmap);
				
				trip.setPublshddatestr(TravelifyCmnUtil.printDtttmStr(trip.getCreateddt().toString()));

				trip.setTripnote(StringUtils.abbreviate(trip.getTripnote(), 35));
				
				Travelifier tmpuser = TravelifyCmnUtil.checkAndLoadUsrdata(trip.getUid());
				//System.out.println("trip tmpuser-" + tmpuser);
				
				if(tmpuser!=null && StringUtils.isNotBlank(tmpuser.getUgplusid())) {
					trip.setUprofilestr(TravelifyCmnUtil.getProfilePicLnk("", tmpuser.getUgplusid()));
				}else {
					trip.setUprofilestr(TravelifyCmnUtil.defaultPic);
				}
			
				//List<TripPlan> tripplanlist = OfyService.ofy().load().type(TripPlan.class).filter("tripid", trip.getTripid()).list();
	
				List<Tips> tipslist = OfyService.ofy().load().type(Tips.class).filter("tripid", trip.getTripid()).list();
				System.out.println("tipslist-" + tipslist);

				/*if (tripplanlist != null && tripplanlist.size() > 0) {
					trip.setTripplancount(tripplanlist.size());
				} else {
					trip.setTripplancount(0);
				}*/
	
				if (tipslist != null && tipslist.size() > 0) {
					trip.setTipscount(tipslist.size());
					trip.setTips(tipslist);
					for(Tips tips : tipslist) {
						Travelifier tipsuser = TravelifyCmnUtil.checkAndLoadUsrdata(tips.getUid());
						if(tipsuser!=null && StringUtils.isNotBlank(tipsuser.getUgplusid())) {
							tips.setUprofilestr(TravelifyCmnUtil.getProfilePicLnk("", tipsuser.getUgplusid()) + "?sz=28");
						}else {
							tips.setUprofilestr(TravelifyCmnUtil.defaultPic);
						}
					}
				} else {
					trip.setTipscount(0);
				}
			}
	
			uiModel.addAttribute("triplist", triplist);

		return TravelifyCmnUtil._VIEW_SHW_TRIP_LIST;
		//}
	}

	@RequestMapping(value = "/travelitrips/createtrip", method = RequestMethod.GET)
	public String createTrip(HttpServletRequest req, Model uiModel) {
		TripForm tripform = new TripForm();
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
		
		tripform.setStatus("Public");
		
		uiModel.addAttribute("hrefscr", hrefscr);
		uiModel.addAttribute("user", user);
		uiModel.addAttribute("tripform", tripform);
		if (flagLoginReqd) {
			return TravelifyCmnUtil._VIEW_LOGIN_PAGE;
		} else {
			return TravelifyCmnUtil._VIEW_CRT_TRIP;
		}
	}

	@RequestMapping(value = "/travelitrips/createtrip", method = RequestMethod.POST)
	public String saveTrip(@ModelAttribute TripForm tripform,
			BindingResult result, Model uiModel, HttpServletRequest req) {

		User user = TravelifyCmnUtil.checkAuthorization(userSvc);
		String hrefscr = "";
		String[] hinfoarr = null;

		if (user != null) {
			hrefscr = userSvc.createLogoutURL(req.getRequestURI());
		} else {
			hrefscr = userSvc.createLoginURL(req.getRequestURI());
		}

		uiModel.addAttribute("hrefscr", hrefscr);
		uiModel.addAttribute("user", user);
		uiModel.addAttribute("tripform", tripform);

		//System.out.println("tripform -" + tripform);

		// saving trip
		Trip trip = new Trip();
		trip.setTriptitle(tripform.getTriptitle());
		trip.setTripplace(tripform.getTripplace());
		trip.setTripduration(tripform.getTripduration());
		trip.setTripseason(tripform.getTripseason());
		trip.setTriptype(tripform.getTriptype());
		trip.setFavcuisines(tripform.getFavcuisines());
		trip.setRecommendneeded(tripform.getRecommendneeded());

		String hotelrdo = tripform.getHotelrdo();

		if (tripform.getHotelnm().trim() == "" && hotelrdo != null) {
			hinfoarr = hotelrdo.split("\\;");

			if (hinfoarr != null) {
				trip.setLat(Float.valueOf(hinfoarr[0]).floatValue());
				trip.setLng(Float.valueOf(hinfoarr[1]).floatValue());
				trip.setHname(hinfoarr[2]);
				trip.setHaddress(hinfoarr[3]);
			}

		} else if (tripform.getHotelnm().trim() != ""
				&& tripform.getHoteladdr().trim() != "") {
			trip.setLat(0);
			trip.setLng(0);
			trip.setHname(tripform.getHotelnm());
			trip.setHaddress(tripform.getHoteladdr());
		}

		trip.setCreateddt(new Date());
		trip.setStatus(tripform.getStatus());
		trip.setTripnote(tripform.getTripnote());

		trip.setUid(user.getUserId());
		trip.setUemailid(user.getEmail());
		trip.setUnickname(user.getNickname());

		//System.out.println("Saving the trip-" + trip);
		OfyService.ofy().save().entity(trip).now();

		//System.out.println("***** tripid " + trip.getTripid());

		return "redirect:/travelitrips/nextstep1?tripid=" + trip.getTripid();
	}
	
	
	@RequestMapping(value = "/travelitrips/nextstep1", method = RequestMethod.GET)
	public String nextTripSaveStep(HttpServletRequest req, Model uiModel) {
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
		
		String tripid = req.getParameter("tripid");
		
		uiModel.addAttribute("hrefscr", hrefscr);
		uiModel.addAttribute("user", user);
		uiModel.addAttribute("tripid", tripid);
		
		if (flagLoginReqd) {
			return TravelifyCmnUtil._VIEW_LOGIN_PAGE;
		} else {
			return TravelifyCmnUtil._VIEW_NXT_TRIP_STEP;
		}
	}
	

	@RequestMapping(value = "/travelitrips/tripplan", method = RequestMethod.GET)
	public String addTripPlan(HttpServletRequest req, Model uiModel) {
		boolean flagLoginReqd = false;

		User user = TravelifyCmnUtil.checkAuthorization(userSvc);
		String hrefscr = "";
		
		if (user != null) {
			hrefscr = userSvc.createLogoutURL(req.getRequestURI() + (req.getQueryString() != null ? ("?" + req.getQueryString()) : ""));
			flagLoginReqd = false;
		} else {
			hrefscr = userSvc.createLoginURL(req.getRequestURI() + (req.getQueryString() != null ? ("?" + req.getQueryString()) : ""));
			flagLoginReqd = true;
		}

		uiModel.addAttribute("hrefscr", hrefscr);
		uiModel.addAttribute("user", user);


		if (flagLoginReqd) {
			return TravelifyCmnUtil._VIEW_LOGIN_PAGE;
		} else {
			
			String actntype = (String) req.getParameter("actn");
			String plctypes = (String) req.getParameter("plctypes");
			
			//System.out.println("****** actntype"+actntype);
			//System.out.println("****** plctypes"+plctypes);
			
			if("SRCH".equalsIgnoreCase(actntype)) {
				
				String plctypesarr[] = plctypes.split("\\;");
				
				//System.out.println("****** plctypesarr" + Arrays.toString(plctypesarr));

				if(plctypesarr!=null && plctypesarr.length>0) {
					
					TripPlanForm tripplanform = new TripPlanForm();			
					String tripid = req.getParameter("tripid");
					tripplanform.setTripid(Long.valueOf(tripid));
		
					Trip trip = OfyService.ofy().load().type(Trip.class).id(Long.valueOf(tripid).longValue()).get();
					// System.out.println("*** trip-" + trip);
		
					tripplanform.setTriptitle(trip.getTriptitle());
					tripplanform.setTripplace(trip.getTripplace());
		
					Map<String, List<Place>> rsltmap = placeSvc.getTripPlanPlaces(trip.getTripplace(), plctypesarr);
					//System.out.println("*** rsltmap-" + rsltmap);
		
					uiModel.addAttribute("tripplanform", tripplanform);
					uiModel.addAttribute("rsltmap", rsltmap);
		
					uiModel.addAttribute("tripid", tripid);
					uiModel.addAttribute("triptitle", trip.getTriptitle());
					uiModel.addAttribute("tripplace", trip.getTripplace());
					
				}
			}
			return TravelifyCmnUtil._VIEW_ADD_TRIP_PLAN;
		}
	}
	
	
	

	// save trip plan form
	@RequestMapping(value = "/travelitrips/tripplan", method = RequestMethod.POST)
	public String saveTripPlan(@ModelAttribute TripPlanForm tripplanform,
			BindingResult result, Model uiModel, HttpServletRequest req) {
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

			TripPlan tripplan = new TripPlan();
	
			tripplan.setTripid(Long.valueOf(tripplanform.getTripid()));
			tripplan.setTriptitle(tripplanform.getTriptitle());
			tripplan.setTripplace(tripplanform.getTripplace());
			tripplan.setPlancrtddt(new Date());
	
			tripplan.setBrkfstplaces(tripplanform.getBrkfstplaces());
			/*if(tripplanform.getBrkfstnote()!=null && "".equalsIgnoreCase(tripplanform.getBrkfstnote())) {
				tripplan.setBrkfstnote(tripplanform.getBrkfstnote());
			}*/
	
			tripplan.setLunchplaces(tripplanform.getLunchplaces());
			/*if(tripplanform.getLunchnote()!=null && "".equalsIgnoreCase(tripplanform.getLunchnote())) {
				tripplan.setLunchnote(tripplanform.getLunchnote());
			}*/
			
			tripplan.setDinnrplaces(tripplanform.getDinnrplaces());
			/*if(tripplanform.getDinnrnote()!=null && "".equalsIgnoreCase(tripplanform.getDinnrnote())) {
				tripplan.setDinnrnote(tripplanform.getDinnrnote());
			}*/
	
			tripplan.setSightseeingtours(tripplanform.getSightseeingtours());
			tripplan.setArtgalleries(tripplanform.getArtgalleries());
			tripplan.setZoo_aquariums(tripplanform.getZoo_aquariums());
			tripplan.setNghtlifeplaces(tripplanform.getNghtlifeplaces());
			tripplan.setTemples(tripplanform.getTemples());
			tripplan.setMosques(tripplanform.getMosques());
			tripplan.setChurches(tripplanform.getChurches());
	
			tripplan.setTripplannote(tripplanform.getTripplannote());
	
			//System.out.println("Saving the trip plan-");
			OfyService.ofy().save().entity(tripplan).now();
			//System.out.println("***** tripplan id " + tripplan.getTripplanid());
	
			return "redirect:/travelitrips/mytriplist";
		}
	}

	
	
	
	@RequestMapping(value = "/travelitrips/mytriplist", method = RequestMethod.GET)
	public String showMyTripList(HttpServletRequest req, Model uiModel) {
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
			List<Trip> triplist = OfyService.ofy().load().type(Trip.class)
					.filter("uid", user.getUserId()).list();

			for (Trip trip : triplist) {
				List<TripPlan> tripplanlist = OfyService.ofy().load().type(TripPlan.class).filter("tripid", trip.getTripid()).list();

				List<Tips> tipslist = OfyService.ofy().load().type(Tips.class).filter("tripid", trip.getTripid()).list();

				if (tripplanlist != null && tripplanlist.size() > 0) {
					trip.setTripplancount(tripplanlist.size());
				} else {
					trip.setTripplancount(0);
				}

				if (tipslist != null && tipslist.size() > 0) {
					trip.setTipscount(tipslist.size());
				} else {
					trip.setTipscount(0);
				}
			}
			uiModel.addAttribute("triplist", triplist);

			return TravelifyCmnUtil._VIEW_MY_TRIP_LIST;
		}

	}

	@RequestMapping(value = "/travelitrips/viewtrip", method = RequestMethod.GET)
	public String viewTrip(@RequestParam long tripid, HttpServletRequest req,
			Model uiModel) {
		User user = TravelifyCmnUtil.checkAuthorization(userSvc);
		String hrefscr = "";
		boolean flagLoginReqd = false;

		if (user != null) {
			hrefscr = userSvc.createLogoutURL(req.getRequestURI() + (req.getQueryString() != null ? ("?" + req.getQueryString()) : ""));
			flagLoginReqd = false;
		} else {
			hrefscr = userSvc.createLoginURL(req.getRequestURI() + (req.getQueryString() != null ? ("?" + req.getQueryString()) : ""));
			flagLoginReqd = true;
		}

		uiModel.addAttribute("hrefscr", hrefscr);
		uiModel.addAttribute("user", user);

		if (flagLoginReqd) {
			return TravelifyCmnUtil._VIEW_LOGIN_PAGE;
		} else {
			int tripplansize = 0;
			TripPlan tripplan = null;
			TipsForm tipsform = new TipsForm();

			Trip trip = OfyService.ofy().load().type(Trip.class).id(tripid).get();
			
			List<TripPlan> tripplanlist = OfyService.ofy().load().type(TripPlan.class).filter("tripid", trip.getTripid()).list();
			
			List<Tips> tipslist = OfyService.ofy().load().type(Tips.class).filter("tripid", trip.getTripid()).list();
			//System.out.println("tipslist-" + tipslist);
			if (tripplanlist != null) {
				tripplansize = tripplanlist.size();
				if (tripplansize > 0) {
					tripplan = tripplanlist.get(0);
				}
			}
	
			trip.setTips(tipslist);
			
			String ftrdPhotoUrl = "http://maps.googleapis.com/maps/api/staticmap?center=" 
					+ StringUtils.replace(trip.getTripplace(), " ", "+") 
					+ "&zoom=11&size=600x500&key=" 
					+ TravelifyCmnUtil.mapsapikey + "&sensor=false";
			
			trip.setTripstaticmap(ftrdPhotoUrl);
			
			trip.setPublshddatestr(TravelifyCmnUtil.printDtttmStr(trip.getCreateddt().toString()));
			
			Travelifier tripuser = TravelifyCmnUtil.checkAndLoadUsrdata(trip.getUid());
			//System.out.println("trip tmpuser-" + tmpuser);
			
			if(tripuser!=null && StringUtils.isNotBlank(tripuser.getUgplusid())) {
				trip.setUprofilestr(TravelifyCmnUtil.getProfilePicLnk("", tripuser.getUgplusid()));
			}else {
				trip.setUprofilestr(TravelifyCmnUtil.defaultPic);
			}
	
			uiModel.addAttribute("trip", trip);
			uiModel.addAttribute("tripplansize", tripplansize);
			uiModel.addAttribute("tripplan", tripplan);
			uiModel.addAttribute("tipsform", tipsform);
			uiModel.addAttribute("ftrdphotourl", ftrdPhotoUrl);

			return TravelifyCmnUtil._VIEW_VW_TRIP;
		}
	}
	
	

	@RequestMapping(value = "/travelitrips/viewtripplan", method = RequestMethod.GET)
	public String viewTripPlan(@RequestParam long tripid, HttpServletRequest req, Model uiModel) {
		TripPlan tripplan = null;
		User user = TravelifyCmnUtil.checkAuthorization(userSvc);
		String hrefscr = "";
		boolean flagLoginReqd = false;

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
			List<TripPlan> tripplanlst = OfyService.ofy().load().type(TripPlan.class).filter("tripid", tripid).list();
	
			if (tripplanlst != null) {
				tripplan = tripplanlst.get(0);
			}
	
			uiModel.addAttribute("hrefscr", hrefscr);
			uiModel.addAttribute("user", user);
			uiModel.addAttribute("tripid", tripid);
			uiModel.addAttribute("tripplan", tripplan);
	
			return TravelifyCmnUtil._VIEW_VW_TRIPPLAN;
		}
	}

	// save trip plan form
	@RequestMapping(value = "/travelitrips/addtips", method = RequestMethod.POST)
	public String addTips(@ModelAttribute TipsForm tipsform,
			BindingResult result, Model uiModel, HttpServletRequest req) {
		User user = TravelifyCmnUtil.checkAuthorization(userSvc);
		String hrefscr = "";
		boolean flagLoginReqd = false;

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
			
			if(tipsform.getTips()!=null && tipsform.getTips().trim()!=""){
				Tips tips = new Tips();
				tips.setTripid(tipsform.getTripid());
				tips.setUid(user.getUserId());
				tips.setUnickname(user.getNickname());
				tips.setTipsdata(tipsform.getTips());
				tips.setRecommendplace(tipsform.getRecommendplace());
		
				//System.out.println("Saving the trip plan-");
				OfyService.ofy().save().entity(tips).now();
				//System.out.println("***** tripplan id " + tips.getTipsid());
			}
			return "redirect:/travelitrips/viewtrip?tripid=" + tipsform.getTripid();
		}
	}
	
	
	

	@RequestMapping(value = "/searchplace", method = RequestMethod.GET)
	public String showPlaceForm() {

		return TravelifyCmnUtil._VIEW_SRCH_PLACE_FRM;
	}

	@RequestMapping(value = "/searchplace", method = RequestMethod.POST)
	public String searchPlace(@RequestParam("query") final String query,
			@RequestParam("type") final String type) {

		Gson gson = new Gson();
		String jsonstr = "";

		PlacesSuggestResult rslt = placeSvc.suggest(query, 5000, type, 10, false);

		jsonstr = gson.toJson(rslt);

		// System.out.println("jsonstr-" + jsonstr);

		return jsonstr;
	}

}
