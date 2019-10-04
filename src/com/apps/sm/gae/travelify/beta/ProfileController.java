package com.apps.sm.gae.travelify.beta;

import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.gson.Gson;

@Controller
public class ProfileController {

	@Autowired
	private UserService userSvc;

	private static final Logger logger = Logger.getLogger(PlaceController.class
			.getCanonicalName());

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(HttpServletRequest req, Model uiModel) {

		User user = TravelifyCmnUtil.checkAuthorization(userSvc);
		String hrefscr = "";
		if (user != null) {
			hrefscr = userSvc.createLogoutURL(req.getRequestURI());
		} else {
			hrefscr = userSvc.createLoginURL(req.getRequestURI());
		}

		uiModel.addAttribute("hrefscr", hrefscr);
		uiModel.addAttribute("user", user);

		return TravelifyCmnUtil._VIEW_LOGIN_PAGE;
	}

	@RequestMapping(value = "/myprofile", method = RequestMethod.GET)
	public String showProfile(HttpServletRequest req, Model uiModel) {

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
			Travelifier tuser = TravelifyCmnUtil.checkAndLoadUsrdata(userSvc);
			
			int myboardscnt = OfyService.ofy().load().type(Board.class).filter("uid", user.getUserId()).count();
			int mytripsscnt = OfyService.ofy().load().type(Trip.class).filter("uid", user.getUserId()).count();
			int myclipsscnt = OfyService.ofy().load().type(ClippedPlace.class).filter("uid", user.getUserId()).count();
			
			tuser.setMyboardscount(myboardscnt);
			tuser.setMytripscount(mytripsscnt);
			tuser.setMyclipscount(myclipsscnt);
			
			uiModel.addAttribute("tuser", tuser);
			
			return TravelifyCmnUtil._VIEW_MY_PAGE;
		}
	}

	@RequestMapping(value = "/saveprofile", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody
	String saveProfile(@RequestParam("profiledata") final String profiledata) {
		String jsonstr = "";
		boolean svsccs = false;
		String[] profilearr;
		Travelifier travelifier = null;

		Gson gson = new Gson();
		Succsbean succsbn = new Succsbean();

		User user = TravelifyCmnUtil.checkAuthorization(userSvc);
		logger.info("profiledata-" + profiledata);

		if (user != null) {

			if (profiledata != "") {

				travelifier = OfyService.ofy().load().type(Travelifier.class)
						.id(user.getUserId()).get();

				if (travelifier == null) {
					travelifier = new Travelifier();
				}

				if (travelifier != null && StringUtils.isBlank(travelifier.getUgplusid())) {
					profilearr = StringUtils.split(profiledata, ";");

					if (profilearr != null) {
						travelifier.setUid(user.getUserId());
						travelifier.setUgplusid(profilearr[0]);
						travelifier.setUphoto(profilearr[1]);
						travelifier.setUgplus(profilearr[2]);
					}

					// save profile information
					OfyService.ofy().save().entity(travelifier).now();
					svsccs = true;
				}
			}

			if (svsccs) {
				succsbn.setMssgstr("Your profile has been updated... pls refresh this page");
			} else {
				succsbn.setMssgstr("Something went wrong... please try again later...");
			}
		} else {
			succsbn.setMssgstr("You are not authorized to update profile information... pls login");
		}

		jsonstr = gson.toJson(succsbn);

		return jsonstr;
	}

	@RequestMapping(value = "/help", method = RequestMethod.GET)
	public String help(HttpServletRequest req, Model uiModel) {

		User user = TravelifyCmnUtil.checkAuthorization(userSvc);
		String hrefscr = "";
		if (user != null) {
			hrefscr = userSvc.createLogoutURL(req.getRequestURI());
		} else {
			hrefscr = userSvc.createLoginURL(req.getRequestURI());
		}

		uiModel.addAttribute("hrefscr", hrefscr);
		uiModel.addAttribute("user", user);

		return TravelifyCmnUtil._VIEW_HELP_PAGE;
	}

}
