package com.apps.sm.gae.travelify.beta;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringEscapeUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.apps.sm.gae.travelify.beta.beans.BoardForm;
import com.apps.sm.gae.travelify.beta.beans.CommentsForm;
import com.apps.sm.gae.travelify.beta.cmn.TravelifyCmnUtil;
import com.apps.sm.gae.travelify.beta.dbstore.Board;
import com.apps.sm.gae.travelify.beta.dbstore.BoardComment;
import com.apps.sm.gae.travelify.beta.dbstore.ClippedPlace;
import com.apps.sm.gae.travelify.beta.dbstore.OfyService;
import com.apps.sm.gae.travelify.beta.dbstore.Travelifier;
import com.google.appengine.api.blobstore.BlobInfo;
import com.google.appengine.api.blobstore.BlobInfoFactory;
import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.blobstore.BlobstoreService;
import com.google.appengine.api.blobstore.BlobstoreServiceFactory;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;

@Controller
public class BoardController {

	@Autowired
	private UserService userSvc;
	
	private static final Logger logger = Logger.getLogger(BoardController.class.getCanonicalName());
	
	
	@RequestMapping(value = "/traveliboards", method = RequestMethod.GET)
	public String traveliBoards(HttpServletRequest req, Model uiModel) {
		//boolean flagLoginReqd = false;
		String ftrdPhotoUrl = "";
		List<Board> boardlist = null;
		
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
			String cat = req.getParameter("cat");
			String catstr = "";
			
			if(StringUtils.equals(cat, "FD")) catstr = "Food & Drink";
			else if(StringUtils.equals(cat, "AR")) catstr = "Architecture";
			else if(StringUtils.equals(cat, "AE")) catstr = "Adult Entertainment";
			else if(StringUtils.equals(cat, "TH")) catstr = "Theater";
			else if(StringUtils.equals(cat, "PO")) catstr = "Point of Interests";
			else if(StringUtils.equals(cat, "SH")) catstr = "Shopping";
			
			if(StringUtils.isBlank(catstr)) {
				boardlist = OfyService.ofy().load().type(Board.class).order("boardid").list();
			}else {
				boardlist = OfyService.ofy().load().type(Board.class).filter("boardtype", catstr).order("boardid").list();
			}
			//System.out.println("boardlist-"+boardlist);
			for(Board board : boardlist) {
				
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
				
				List<BoardComment> commentslist = OfyService.ofy().load().type(BoardComment.class).filter("boardid", board.getBoardid()).list();
				
				if(commentslist!=null && commentslist.size()>0) {
					board.setCommentscount(commentslist.size());
					board.setCommentslist(commentslist);
					for(BoardComment cmnt : commentslist) {
						Travelifier cmntuser = TravelifyCmnUtil.checkAndLoadUsrdata(cmnt.getUid());
						
						if(cmntuser!=null && StringUtils.isNotBlank(cmntuser.getUgplusid())) {
							cmnt.setUprofilestr(TravelifyCmnUtil.getProfilePicLnk("", cmntuser.getUgplusid()) + "?sz=28");
						}else {
							cmnt.setUprofilestr(TravelifyCmnUtil.defaultPic);
						}
					}
				}
			}
			
			//System.out.println("boardlist-" + boardlist);
			uiModel.addAttribute("boardlist", boardlist);

			return TravelifyCmnUtil._VIEW_SHW_BRD_LIST;
		//}
	}
	

	
	@RequestMapping(value = "/traveliboards/createboard", method = RequestMethod.GET)
	public String createBoard(HttpServletRequest req, Model uiModel) {
		BoardForm boardform = new BoardForm();
		boolean flagLoginReqd = false;
		String upldUrl = "";

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
			BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
		    upldUrl = blobstoreService.createUploadUrl("/traveliboards/createboard");
		    
			List<ClippedPlace> clipplist = OfyService.ofy().load()
					.type(ClippedPlace.class).filter("uid", user.getUserId())
					.list();
			// System.out.println("clipplist-"+clipplist);
			if (clipplist != null) {
				// System.out.println("clipplist size-"+clipplist.size());
			}
			boardform.setMapstyles("");
			boardform.setBoardtype("Food & Drink");
			
			uiModel.addAttribute("clipplist", clipplist);
			uiModel.addAttribute("boardform", boardform);
			uiModel.addAttribute("upldurl", upldUrl);
			
			return TravelifyCmnUtil._VIEW_CRT_CLPBRD;
		}
	}

	

	@RequestMapping(value = "/traveliboards/createboard", method = RequestMethod.POST)
	public String saveBoard(@ModelAttribute BoardForm boardform,
			BindingResult result, Model uiModel, HttpServletRequest req) {
		User user = TravelifyCmnUtil.checkAuthorization(userSvc);
		String boardplaces[];
		String hrefscr = "";
		List<BlobKey> photoKey = null;
		BlobKey blobKey = null;
		boolean flagLoginReqd = false;
		BlobstoreService blobstoreService = null;
		
		
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
			//System.out.println("boardform-" + boardform);
			Board board = new Board();
			
			board.setUid(user.getUserId());
			board.setUnickname(user.getNickname());
			
			board.setBoardtitle(boardform.getBoardtitle());
			board.setBoardtype(boardform.getBoardtype());
			board.setLocation(boardform.getLocation());
			board.setBoardnote(boardform.getBoardnote());
			board.setMapstyles(boardform.getMapstyles());
			
			boardplaces = ArrayUtils.addAll(boardform.getClippedplaces(), boardform.getSearchedplaces());
			board.setBoardplaces(boardplaces);
			board.setCreateddt(new Date());
			
			blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
			Map<String, List<BlobKey>> blobs = blobstoreService.getUploads(req);
			photoKey = blobs.get("featuredPhoto");
			
			try{
				if (photoKey != null && photoKey.size() > 0) {
					blobKey = photoKey.get(0);
					
					//check if a zero size file is uploaded or no file is uploaded
					final BlobInfo blobInfo = new BlobInfoFactory().loadBlobInfo(blobKey);
					long upldsize = blobInfo.getSize();
					//System.out.println("upldsize-"+upldsize);
					// if size is greater than zero then a file is uploaded
					if(upldsize == 0) {
						// no file is uploaded or zero size file is uploaded so immediately delete it
						blobstoreService.delete(blobKey);
					}else {
						// now set the newly uploaded photo key
						board.setPhotoKey(blobKey.getKeyString());
					}
				}
			}catch(Exception ex) {}
			 
			//System.out.println("Saving the board-");
			OfyService.ofy().save().entity(board).now();
			//System.out.println("***** board id " + board.getBoardid());

			return "redirect:/traveliboards";
		}
	}
	
	

	@RequestMapping(value = "/traveliboards/myboardlist", method = RequestMethod.GET)
	public String myboardList(HttpServletRequest req, Model uiModel) {
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
			List<Board> boardlist = OfyService.ofy().load().type(Board.class).filter("uid", user.getUserId()).list();
			//System.out.println("boardlist-" + boardlist);
			uiModel.addAttribute("boardlist", boardlist);

			return TravelifyCmnUtil._VIEW_MY_BRD_LIST;
		}
	}
	
	
	
	@RequestMapping(value = "/traveliboards/updateboard", method = RequestMethod.GET)
	public String viewMyBoard(@RequestParam long boardid, HttpServletRequest req, Model uiModel) {

		User user = TravelifyCmnUtil.checkAuthorization(userSvc);
		String hrefscr = "";
		boolean flagLoginReqd = false;
		BoardForm boardform = new BoardForm();
		String upldUrl = "";
		String ftrdPhotoUrl = "";
		
	    BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
	    upldUrl = blobstoreService.createUploadUrl("/traveliboards/updateboard");
		
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

			Board board = OfyService.ofy().load().type(Board.class).id(boardid).get();
			
			if(board!=null) {
				boardform.setBoardtitle(board.getBoardtitle());
				boardform.setBoardtype(board.getBoardtype());
				boardform.setLocation(board.getLocation());
				boardform.setBoardnote(board.getBoardnote());
				boardform.setMapstyles(board.getMapstyles());
				boardform.setClippedplaces(board.getBoardplaces());
				boardform.setBoardid(board.getBoardid());
				
				ftrdPhotoUrl = TravelifyCmnUtil.getBoardFeaturedPhoto(board.getPhotoKey());
			}

			uiModel.addAttribute("board", board);
			uiModel.addAttribute("boardform", boardform);
			uiModel.addAttribute("upldurl", upldUrl);
			uiModel.addAttribute("ftrdphotourl", ftrdPhotoUrl);
	
			return TravelifyCmnUtil._VIEW_UPDT_MY_TRVL_BRD;
		}
	}
	
	
	
	
	@RequestMapping(value = "/traveliboards/updateboard", method = RequestMethod.POST)
	public String updateMyBoard(@ModelAttribute BoardForm boardform,
			BindingResult result, Model uiModel, HttpServletRequest req) {
		

		User user = TravelifyCmnUtil.checkAuthorization(userSvc);
		String boardplaces[];
		String hrefscr = "";
		List<BlobKey> photoKey = null;
		BlobKey blobKey = null;
		boolean flagLoginReqd = false;
		BlobstoreService blobstoreService = null;
	    
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

			blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
			Map<String, List<BlobKey>> blobs = blobstoreService.getUploads(req);
			photoKey = blobs.get("featuredPhoto");
			//System.out.println("photoKey-" + photoKey);
			
			
			Board board = OfyService.ofy().load().type(Board.class).id(boardform.getBoardid()).get();
			try{
				if (photoKey != null && photoKey.size() > 0) {
					blobKey = photoKey.get(0);
					
					//check if a zero size file is uploaded or no file is uploaded
					final BlobInfo blobInfo = new BlobInfoFactory().loadBlobInfo(blobKey);
					long upldsize = blobInfo.getSize();
					//System.out.println("upldsize-"+upldsize);
					// if size is greater than zero then a file is uploaded
					if(upldsize > 0) {
						// check if previously any photo was uploaded then delete it from BlobStore and store the new uploaded photo key
						if(StringUtils.isNotEmpty(board.getPhotoKey())) {
							// a previous file was there so delete it
							BlobKey delblobKey = new BlobKey(board.getPhotoKey());
							blobstoreService.delete(delblobKey);
						}
						
						// now set the newly uploaded photo key
						board.setPhotoKey(blobKey.getKeyString());
					}else {
						// no file is uploaded or zero size file is uploaded so immediately delete it
						blobstoreService.delete(blobKey);					
					}
				}
			}catch(Exception ex) {
				if(blobKey!=null) {
					board.setPhotoKey(blobKey.getKeyString());
				}
			}
			if(!StringUtils.equals(board.getBoardtitle(), boardform.getBoardtitle())) {
				board.setBoardtitle(boardform.getBoardtitle());
			}
			
			board.setBoardtype(boardform.getBoardtype());
			board.setLocation(boardform.getLocation());
			board.setBoardnote(boardform.getBoardnote());
			board.setMapstyles(boardform.getMapstyles());
			
			boardplaces = ArrayUtils.addAll(boardform.getClippedplaces(), boardform.getSearchedplaces());
			
			board.setBoardplaces(boardplaces);
			board.setCreateddt(new Date());
			
			//System.out.println("Saving the board-");
			OfyService.ofy().save().entity(board).now();
			//System.out.println("***** board id " + board.getBoardid());

			return "redirect:/traveliboards/myboardlist/";
		}
	
	}
	

	
	@RequestMapping(value = "/traveliboards/showboard", method = RequestMethod.GET)
	public String showBoard(@RequestParam long boardid, HttpServletRequest req, Model uiModel) {

		User user = TravelifyCmnUtil.checkAuthorization(userSvc);
		
		String hrefscr = "";
		boolean flagLoginReqd = false;
		String ftrdPhotoUrl = "";
		String plcmarkers = "";
		String[] placesArr;
		//List<Board> samecatboardlist=null;
		//List<Board> samelocnboardlist=null;
				
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
			
			int commentscount = 0;
			String plsstrarr[];
			CommentsForm commentsform = new CommentsForm();

			List<BoardComment> commentslist = OfyService.ofy().load().type(BoardComment.class).filter("boardid", boardid).order("commentid").list();
			
			Board board = OfyService.ofy().load().type(Board.class).id(boardid).get();
			
			if(board!=null) {
				
				if(board.getPhotoKey()!=null) {
					ftrdPhotoUrl = TravelifyCmnUtil.getBoardFeaturedPhoto(board.getPhotoKey());
				}else {
					ftrdPhotoUrl = "http://maps.googleapis.com/maps/api/staticmap?center=" 
									+ StringUtils.replace(board.getLocation(), " ", "+") 
									+ "&zoom=11&size=600x500&key=" 
									+ TravelifyCmnUtil.mapsapikey + "&sensor=false";
				}
				
				Travelifier tmpuser = TravelifyCmnUtil.checkAndLoadUsrdata(board.getUid());
				
				//System.out.println("board tmpuser-" + tmpuser);
				
				if(tmpuser!=null && StringUtils.isNotBlank(tmpuser.getUgplusid())) {
					board.setUprofilestr(TravelifyCmnUtil.getProfilePicLnk("", tmpuser.getUgplusid()) + "?sz=200");
				}else {
					board.setUprofilestr(TravelifyCmnUtil.defaultPic);
				}

				
				if(board.getBoardplaces()!=null) {
					placesArr = board.getBoardplaces();
					//logger.severe("placesArr value- " + Arrays.toString(placesArr));
					
					try {
						for(String plc : placesArr) {
							//logger.severe("plc value- " + plc);
							//plsstrarr = plc.split("\\;");
							plsstrarr = StringUtils.split(plc, ";");
							//logger.severe(" : array values-" + Arrays.toString(plsstrarr));
							if(plsstrarr!=null && plsstrarr.length > 2) {
								plcmarkers = plcmarkers + "['" + StringEscapeUtils.escapeEcmaScript(plsstrarr[0]) + "',"+ plsstrarr[2] + "],";
							}
						}
					} catch(Exception e) {
						logger.severe(" ****** Error occurred while splitting the string array debug values are - " + e.getMessage());
					}
					
					plcmarkers = plcmarkers.substring(0, plcmarkers.length()-1);
					
					//System.out.println("plcmarkers-" + plcmarkers);
				}
				
				if(commentslist!=null && commentslist.size()>0) {
					commentscount = commentslist.size();
				}
				
				board.setCommentscount(commentscount);
				board.setCommentslist(commentslist);
				
				for(BoardComment cmnt : commentslist) {
					Travelifier cmntuser = TravelifyCmnUtil.checkAndLoadUsrdata(cmnt.getUid());
					
					if(cmntuser!=null && StringUtils.isNotBlank(cmntuser.getUgplusid())) {
						cmnt.setUprofilestr(TravelifyCmnUtil.getProfilePicLnk("", cmntuser.getUgplusid()) + "?sz=35");
					}else {
						cmnt.setUprofilestr(TravelifyCmnUtil.defaultPic);
					}
				}
				
				/*// find similar boards from same category
				samecatboardlist = OfyService.ofy().load().type(Board.class).filter("boardtype", board.getBoardtype()).order("boardid").limit(3).list();
				if(samecatboardlist!=null) {
					for(Board brd : samecatboardlist) {
						
						brd.setShortboardtitle(StringUtils.abbreviate(brd.getBoardtitle(), 25));
						
						if(brd.getPhotoKey()!=null) {
							ftrdPhotoUrl = TravelifyCmnUtil.getBoardFeaturedPhoto(brd.getPhotoKey());
						}else {
							ftrdPhotoUrl = "http://maps.googleapis.com/maps/api/staticmap?center=" 
									+ StringUtils.replace(brd.getLocation(), " ", "+") 
									+ "&zoom=11&size=480x300&key=" 
									+ TravelifyCmnUtil.mapsapikey + "&sensor=false";					
						}
						
						brd.setBoardphotourl(ftrdPhotoUrl);
						
						brd.setPublshddatestr(TravelifyCmnUtil.printDtttmStr(brd.getCreateddt().toString()));
					}
				}
				
				//find similar boards from same location
				samelocnboardlist = OfyService.ofy().load().type(Board.class).filter("location", board.getLocation()).order("boardid").limit(3).list();
				if(samelocnboardlist!=null) {
					for(Board bd : samelocnboardlist) {
						
						bd.setShortboardtitle(StringUtils.abbreviate(bd.getBoardtitle(), 25));
						
						if(bd.getPhotoKey()!=null) {
							ftrdPhotoUrl = TravelifyCmnUtil.getBoardFeaturedPhoto(bd.getPhotoKey());
						}else {
							ftrdPhotoUrl = "http://maps.googleapis.com/maps/api/staticmap?center=" 
									+ StringUtils.replace(bd.getLocation(), " ", "+") 
									+ "&zoom=11&size=480x300&key=" 
									+ TravelifyCmnUtil.mapsapikey + "&sensor=false";					
						}
						
						bd.setBoardphotourl(ftrdPhotoUrl);
						
						bd.setPublshddatestr(TravelifyCmnUtil.printDtttmStr(bd.getCreateddt().toString()));
					}
				}*/
			}
			
			uiModel.addAttribute("board", board);
			uiModel.addAttribute("ftrdphotourl", ftrdPhotoUrl);
			uiModel.addAttribute("plcmarkers", plcmarkers);
			uiModel.addAttribute("commentsform", commentsform);
			
			//uiModel.addAttribute("samecat", samecatboardlist);
			//uiModel.addAttribute("sameloc", samelocnboardlist);
	
			return TravelifyCmnUtil._VIEW_TRVL_BRD;
		}
			
	}
	
	
	
	// save trip plan form
		@RequestMapping(value = "/traveliboards/addcomments", method = RequestMethod.POST)
		public String addComments(@ModelAttribute CommentsForm commentsform,
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
				
				if(commentsform.getComment()!=null && commentsform.getComment().trim()!=""){
					BoardComment comments = new BoardComment();
					comments.setBoardid(commentsform.getBoardid());
					comments.setCommentdata(commentsform.getComment());
					comments.setCommentdt(new Date());
					comments.setUid(user.getUserId());
					comments.setUnickname(user.getNickname());
					
					//System.out.println("Saving the trip plan-");
					OfyService.ofy().save().entity(comments).now();
					//System.out.println("***** tripplan id " + tips.getTipsid());
				}
				return "redirect:/traveliboards/showboard?boardid=" + commentsform.getBoardid();
			}
		}
	
}
