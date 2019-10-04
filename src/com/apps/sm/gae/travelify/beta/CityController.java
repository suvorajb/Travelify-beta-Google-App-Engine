package com.apps.sm.gae.travelify.beta;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.apps.sm.gae.travelify.beta.beans.CitySearchForm;
import com.apps.sm.gae.travelify.beta.cmn.TravelifyCmnUtil;
import com.apps.sm.gae.travelify.beta.dbstore.ClippedPlace;
import com.apps.sm.gae.travelify.beta.dbstore.OfyService;
import com.apps.sm.gae.travelify.beta.models.Place;
import com.apps.sm.gae.travelify.beta.models.PlaceDetailResult;
import com.apps.sm.gae.travelify.beta.models.PlacesResult;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;

@Controller
public class CityController {
	
	@Autowired
	private com.apps.sm.gae.travelify.beta.svcs.TravelifyPlcsSvc placeSvc;

	@Autowired
	private UserService userSvc;
	
	@RequestMapping(value = "/travelicity", method = RequestMethod.GET)
	public String travelicity(HttpServletRequest req, Model uiModel) {
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
			
			CitySearchForm citysearchform = new CitySearchForm();
			
			uiModel.addAttribute("citysearchform", citysearchform);
	
			return TravelifyCmnUtil._VIEW_CITY_GRID;
		}

	}
	
	
	
	@RequestMapping(value = "/travelicity/guide/{citynm}", method = RequestMethod.GET)
	public String cityguidelist(
			@PathVariable("citynm") final String citynm, Model uiModel, HttpServletRequest req) {
		boolean flagLoginReqd = false;
		PlacesResult result = null;
		
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
			String types = req.getParameter("types");
			String query = req.getParameter("query");
			String cat 	 = req.getParameter("cat");

			if(types!=null && types!=""){
				result = placeSvc.search(query, 10000, types, false);
			}else if(query!=null && query!=""){
				result = placeSvc.search(query, 10000, false);
			}else {
				result = placeSvc.search("popular+lodging+in" + citynm, 20000, false);
			}
			
			List<ClippedPlace> clipplist = OfyService.ofy().load().type(ClippedPlace.class).filter("uid", user.getUserId()).list();
			Map<String, String> clipmap = new HashMap<String, String>();
			if(clipplist!=null) {
				for(ClippedPlace clp : clipplist) {
					clipmap.put(clp.getPlcname(), clp.getPlcname());
				}
			}
			
			//System.out.println("clipmap-"+clipmap);
			
			if(result.isOkay()) {
				List<Place> places = result.asList();
				//System.out.println("plces-"+places);
				
				for(Place place : places) {
					if(clipmap!=null && clipmap.containsKey(place.getName())) {
						//System.out.println("setting true"+place.getName());
						place.setClipped(true);
					}else {
						//System.out.println("setting false"+place.getName());						
						place.setClipped(false);
					}
				}
				
				uiModel.addAttribute("places", places);
			}else {
				uiModel.addAttribute("message", "no result");
			}
			
			if(StringUtils.isBlank(query)) {
				query = "popular+lodging+in+" + citynm;
			}
			
			uiModel.addAttribute("hdng", StringUtils.capitalize(StringUtils.replace(query, "+", " ")));
		
			uiModel.addAttribute("citynm", citynm);
			
			if(cat!=null && cat!="") {
				uiModel.addAttribute("cat", cat);
			}else {
				uiModel.addAttribute("cat", "lodging");
			}
			
			return TravelifyCmnUtil._VIEW_CITY_LIST;
		}
	}
	
	
	
	@RequestMapping(value = "/travelicity/guide/", method = RequestMethod.POST)
	public String searchcityguidelist(@ModelAttribute CitySearchForm citysearchform, BindingResult rslt, Model uiModel, HttpServletRequest req) {
		boolean flagLoginReqd = false;
		PlacesResult result = null;
		
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
			String citynm = citysearchform.getCitynm();
			
			result = placeSvc.search("top+rated+lodging+in" + citynm, 20000, false);	
			
			List<ClippedPlace> clipplist = OfyService.ofy().load().type(ClippedPlace.class).filter("uid", user.getUserId()).list();
			
			Map<String, String> clipmap = new HashMap<String, String>();
			if(clipplist!=null) {
				for(ClippedPlace clp : clipplist) {
					clipmap.put(clp.getPlcname(), clp.getPlcname());
				}
			}
			
			
			if(result.isOkay()) {
				List<Place> places = result.asList();
				for(Place place : places) {
					if(clipmap!=null && clipmap.containsKey(place.getName())) {
						//System.out.println("setting true"+place.getName());
						place.setClipped(true);
					}else {
						//System.out.println("setting false"+place.getName());						
						place.setClipped(false);
					}
				}
				
				uiModel.addAttribute("places", places);
			}else {
				uiModel.addAttribute("message", "no result");
			}
	
			uiModel.addAttribute("citysearchform", citysearchform);
			uiModel.addAttribute("citynm", citynm);
			
			return TravelifyCmnUtil._VIEW_CITY_LIST;
		}
	}
	
	
	
	
	@RequestMapping(value = "/travelicity/showdtls", method = RequestMethod.GET)
	public String showCityDtls(
								@RequestParam("ref") final String reference,
								@RequestParam("citynm") final String citynm,
								Model uiModel, 
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
			uiModel.addAttribute("citynm", citynm);
			
			PlaceDetailResult result = placeSvc.detail(reference, false);
			
			if(result.isOkay()) {
				uiModel.addAttribute("placedls", result.getResult());
			}else {
				uiModel.addAttribute("message", "no result");
			}
			
			return TravelifyCmnUtil._VIEW_CITY_DTLS;
		}
	}
	
}
