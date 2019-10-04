<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="org.apache.commons.lang3.StringEscapeUtils" %>
<%@ page import="org.apache.commons.lang3.StringUtils" %>
<!DOCTYPE html>
<html lang="en">
   <head>
      <meta charset="utf-8">
      <title>Travelify - Quick Nearby search...</title>
      <!-- Always force latest IE rendering engine (even in intranet) & Chrome Frame -->
      <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <meta name="description" content="">
      <meta name="author" content="">

    <link href='http://fonts.googleapis.com/css?family=Roboto:400,300,700' rel='stylesheet' type='text/css'>
	<link href="<c:url value="/resources/css/bootplus.css" />" rel="stylesheet">      
	<link href="<c:url value="/resources/css/font-awesome.min.css" />" rel="stylesheet">
	<style type="text/css">
      body {
        padding-top: 60px;
        padding-bottom: 40px;
      }
      .hero-unit {
          padding: 60px;
      }
      
      /* Footer -------------------------------------------------- */
.footer {
	text-align: center;
	padding: 30px 0;
	margin-top: 70px;
	border-top: 1px solid #e5e5e5;
	background-color: #f5f5f5;
}

.footer p {
	margin-bottom: 0;
	color: #777;
}

.footer-links {
	margin: 10px 0;
}

.footer-links li {
	display: inline;
	padding: 0 2px;
}

.footer-links li:first-child {
	padding-left: 0;
}
      
      @media (max-width: 980px) {
        /* Enable use of floated navbar text */
        .navbar-text.pull-right {
          float: none;
          padding-left: 5px;
          padding-right: 5px;
        }
      }
      </style>
      <link href="<c:url value="/resources/css/bootplus-responsive.css" />" rel="stylesheet">

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

   </head>

   <body>

    <!-- Navbar ================================================== -->
	<div class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container-fluid">

				<a class="brand" href="/home/">Travelify</a>
				<div class="nav-collapse collapse">
					<ul class="nav">
						<li><a href="/travelinearby/">TraveliNearby</a></li>
						<li><a href="/travelicity/">TraveliCity</a></li>
						 <li class="dropdown">
				              <a id="drop1" href="/travelitrips/" role="button" class="dropdown-toggle" data-toggle="dropdown">TraveliTrips <b class="caret"></b></a>
				              <ul class="dropdown-menu" role="menu" aria-labelledby="drop1">
				                <li role="presentation"><a role="menuitem" tabindex="-1" href="/travelitrips/">All TraveliTrips</a></li>
				                <li role="presentation" class="divider"></li>			                
				                <li role="presentation"><a role="menuitem" tabindex="-1" href="/travelitrips/createtrip/">Create A New Trip</a></li>
				              </ul>
			            </li>
			            <li class="dropdown">
				              <a id="drop1" href="/traveliboards/" role="button" class="dropdown-toggle" data-toggle="dropdown">TraveliBoard <b class="caret"></b></a>
				              <ul class="dropdown-menu" role="menu" aria-labelledby="drop1">
				                <li role="presentation"><a role="menuitem" tabindex="-1" href="/traveliboards/">All TraveliBoards</a></li>
				                <li role="presentation" class="divider"></li>			                
				                <li role="presentation"><a role="menuitem" tabindex="-1" href="/traveliboards/createboard/">Create A New Board</a></li>
				                <li role="presentation" class="divider"></li>			                
				                <li role="presentation"><a role="menuitem" tabindex="-1" href="/traveliclips/">All Clipped Places</a></li>				                
				              </ul>
			            </li>
			            <li class="dropdown">
				              <a id="drop1" href="/myprofile/" role="button" class="dropdown-toggle" data-toggle="dropdown">My Stuffs <b class="caret"></b></a>
				              <ul class="dropdown-menu" role="menu" aria-labelledby="drop1">
				                <li role="presentation"><a role="menuitem" tabindex="-1" href="/travelitrips/mytriplist/">My Saved Trips</a></li>
				                <li role="presentation" class="divider"></li>			                
				                <li role="presentation"><a role="menuitem" tabindex="-1" href="/myclippedlist/">My Clipped Places</a></li>
				                <li role="presentation" class="divider"></li>			                
				                <li role="presentation"><a role="menuitem" tabindex="-1" href="/traveliboards/myboardlist">My Boards</a></li>
				              </ul>
			            </li>												
						<li><a href="/help/"><b>[ Help? ]</b></a></li>												
					</ul>
				</div>
				<span class="brand" align="right"> <c:choose>
						<c:when test="${!empty user}">
								Hello, ${user.nickname}! (<a href="${hrefscr}">sign out</a>.)
							</c:when>
						<c:otherwise>
							<a href="${hrefscr}" class="btn btn-danger"><i class="icon-google-plus"></i> | Sign in with Google</a>
							</c:otherwise>
					</c:choose>
				</span>
			</div>

		</div>
	</div>

	<!-- Subhead ================================================= -->
	<header class="jumbotron subhead" id="overview">
		<div class="container">
			<h1>Travelify Quick Nearby... 
			<% 
				String hdng = request.getParameter("type");
				String hdng2 = request.getParameter("keyword");

				if(hdng != null && "".equalsIgnoreCase(hdng)) {
					String hdng11 = hdng.replace("_", " ");
					String hdng3 = hdng11.substring(0, 1).toUpperCase() + hdng11.substring(1);
					out.print(hdng3);
				}else if(hdng2 != null && "".equalsIgnoreCase(hdng2)) {
					String hdng4 = hdng2.substring(0, 1).toUpperCase() + hdng2.substring(1);
					out.print(hdng4);
				}
			%></h1>
			<p class="lead">Click to explore popular category of the city from side menu...</p>
		</div>
	</header>	

    <div class="container-fluid">
      <div class="row-fluid">
        <div class="span3">
          <div class="sidebar-nav">
            <ul class="nav nav-list">
			  <li class="nav-header">Nearby Foods</li>
              <li><a href="/travelinearby/search1?cat=restaurant&types=restaurant&lat=${lat}&lon=${lon}">Restaurants</a></li>
              <li><a href="/travelinearby/search1?cat=cafe&types=cafe&lat=${lat}&lon=${lon}">Cafe</a></li>
              <li><a href="/travelinearby/search2?cat=fastfoods&keyword=fast%20food&lat=${lat}&lon=${lon}">Fast Food</a></li>
              <li><a href="/travelinearby/search2?cat=pizza&keyword=pizza&lat=${lat}&lon=${lon}">Pizza</a></li>
              <li><a href="/travelinearby/search2?cat=burger&keyword=burgers&lat=${lat}&lon=${lon}">Burgers</a></li>
              
			  <li class="nav-header">Nearby Entertainment</li>
              <li><a href="/travelinearby/search1?cat=bar&types=bar&lat=${lat}&lon=${lon}">Bar</a></li>
              <li><a href="/travelinearby/search1?cat=nightclub&types=night_club&lat=${lat}&lon=${lon}">Night Club</a></li>
              <li><a href="/travelinearby/search1?cat=bowling&types=bowling_alley&lat=${lat}&lon=${lon}">Bowling</a></li>
              <li><a href="/travelinearby/search1?cat=casino&types=casino&lat=${lat}&lon=${lon}">Casino</a></li>
              <li><a href="/travelinearby/search1?cat=spa&types=spa&lat=${lat}&lon=${lon}">Wellness & Spa</a></li>

			  <li class="nav-header">Nearby Doctors</li>
              <li><a href="/travelinearby/search1?cat=doctors&types=doctor&lat=${lat}&lon=${lon}">Doctors/Physician</a></li>
              <li><a href="/travelinearby/search1?cat=hospitals&types=hospital&lat=${lat}&lon=${lon}">Hospitals/Clinics</a></li>
              <li><a href="/travelinearby/search1?cat=pharmacy&types=pharmacy&lat=${lat}&lon=${lon}">Pharmacy</a></li>
              <li><a href="/travelinearby/search1?cat=veterinary&types=veterinary_care&lat=${lat}&lon=${lon}">Pet Care</a></li>
              
			  <li class="nav-header">Nearby Automotive</li>  
              <li><a href="/travelinearby/search1?cat=car%20repair&types=car_repair&lat=${lat}&lon=${lon}">Car Repair</a></li>
              <li><a href="/travelinearby/search1?cat=car%20wash&types=car_wash&lat=${lat}&lon=${lon}">Car Wash</a></li>
              <li><a href="/travelinearby/search1?cat=car%20rental&types=car_rental&lat=${lat}&lon=${lon}">Car Rentals</a></li>
              <li><a href="/travelinearby/search1?cat=gas&types=gas_station&lat=${lat}&lon=${lon}">Gas Station</a></li>

			  <li class="nav-header">Nearby Travel Help</li>
              <li><a href="/travelinearby/search1?cat=airports&types=airport&lat=${lat}&lon=${lon}">Airports</a></li>
              <li><a href="/travelinearby/search1?cat=bus%20station&types=bus_station&lat=${lat}&lon=${lon}">Bus Stations</a></li>
              <li><a href="/travelinearby/search1?cat=lodging&types=lodging&lat=${lat}&lon=${lon}">Hotel/Lodging</a></li>
              <li><a href="/travelinearby/search1?cat=tours&types=travel_agency&lat=${lat}&lon=${lon}">Travel Agency</a></li>
              <li><a href="/travelinearby/search1?cat=subway&types=subway_station&lat=${lat}&lon=${lon}">Subway Station</a></li>
              
			  <li class="nav-header">Nearby Important POI</li>              
              <li><a href="/travelinearby/search1?cat=finance&types=bank|atm&lat=${lat}&lon=${lon}">Bank/Atm</a></li>
              <li><a href="/travelinearby/search1?cat=cops&types=police&lat=${lat}&lon=${lon}">Police Station</a></li>
              <li><a href="/travelinearby/search1?cat=fire&types=fire_station&lat=${lat}&lon=${lon}">Fire Station</a></li>
              
            </ul>
          </div><!--/.well -->
        </div><!--/span-->

        <div class="span9">
        
	<c:if test="${not empty places}">
        <c:forEach items="${places}" var="place">
        
          <div class="row-fluid">
            <div class="span12">
               <div class="card">
                 <h2 class="card-heading">${place.name}</h2>
                  <div class="card-body">
                  	 <div class="row-fluid">
                  	 	<div class="span6">
			                    <p>
		                    		<img  class="img-polaroid" src="http://maps.googleapis.com/maps/api/streetview?size=640x200&fov=110&sensor=false&location=${place.geometry}&key=AIzaSyCXasoa_-_S00WnsdIDBfV4eX9G7Rhnz0U" />
								</p>
						</div>
						<div class="span4">
								<p><h4>Address:</h4> 
								<address>
								<c:choose>
							        <c:when test="${not empty place.vicinity}">
							              ${place.vicinity}
							        </c:when>
							        <c:when test="${not empty place.formattedAddress}">
							             ${place.formattedAddress}
							        </c:when>
								</c:choose>
								</address></p>
								<c:if test="${not empty place.rating}">
									<p><abbr title="Rating">Rating:</abbr> <span class="badge badge-important">${place.rating}</span></p>
								</c:if>
									<c:if test="${not empty place.openingHours}">
										<p> 
											<h4>Business Hours: 
												<c:choose>
											        <c:when test="${empty place.openingHours.openNow}">
											             <b><font color="blue">Not Available</font></b>
											        </c:when>
											        <c:when test="${place.openingHours.openNow eq true}">
											             <b><font color="green">Open Now</font></b>
											        </c:when>
											        <c:when test="${place.openingHours.openNow eq false}">
											             <b><font color="red">Closed</font></b>
											        </c:when>
											    </c:choose>
											</h4>
										</p>
									</c:if>
								<p> <a class="btn btn-info" href="/travelinearby/showdtls?ref=${place.reference}&lat=${lat}&lon=${lon}">View Details &raquo;</a> &nbsp;&nbsp;
								    <a class="btn btn-success" href="http://maps.google.com/maps?q=${place.geometry}" target="_blank">Show on Google Maps <i class="icon-map-marker"></i></a>
									<c:if test="${place.clipped==false }">
										<c:choose>
									        <c:when test="${not empty place.vicinity}">
									        	<c:set var="placename" scope="request" value="${place.name}"></c:set>
									        	<c:set var="placeaddrss" scope="request" value="${place.vicinity}"></c:set>
									        	<% 
									        		String plcname = StringUtils.replace(((String) request.getAttribute("placename")), "&", "And");
									        		String plcaddr =  StringUtils.replace(((String) request.getAttribute("placeaddrss")), "&", "And");
									        		String clipplcstr = StringEscapeUtils.escapeEcmaScript(plcname) + ";" +StringEscapeUtils.escapeEcmaScript(plcaddr);
									        	%>
										   		<a class="btn btn-danger" href="#"  onclick="javascript: clipthisplace('<%=clipplcstr %>;${place.reference};${place.geometry};${cat}', this); return false;">Clip It <i class="icon-paperclip"></i></a>
									        </c:when>
									        <c:when test="${not empty place.formattedAddress}">
									        	<c:set var="placename" scope="request" value="${place.name}"></c:set>
									        	<c:set var="placeaddrss" scope="request" value="${place.formattedAddress}"></c:set>
									        	<% 
								        			String plcname = StringUtils.replace(((String) request.getAttribute("placename")), "&", "And");
								        			String plcaddr =  StringUtils.replace(((String) request.getAttribute("placeaddrss")), "&", "And");
									        		String clipplcstr = StringEscapeUtils.escapeEcmaScript(plcname) + ";" +StringEscapeUtils.escapeEcmaScript(plcaddr);
									        	%>
										   		<a class="btn btn-danger" href="#"  onclick="javascript: clipthisplace('<%=clipplcstr %>;${place.reference};${place.geometry};${cat}', this); return false;">Clip It <i class="icon-paperclip"></i></a>
									        </c:when>
										</c:choose>
									</c:if>
									<c:if test="${place.clipped==true }">
										   		<a class="btn btn-danger" href="#">Clip It <i class="icon-paperclip"></i></a>									
									</c:if>
								</p>
								<p>&nbsp;</p>
			                    <p>Tags: 
			                    	<c:forEach items="${place.types}" var="type">
			                    		<span class="label label-warning">${type}</span> 
			                    	</c:forEach>
			                    </p>
		                </div>
		               
                     </div>
                  </div>
               </div>
            </div><!--/span-->
          </div><!--/row-->
          
		</c:forEach>
   </c:if>

		
		  
        </div><!--/span-->
      </div><!--/row-->


<!-- Footer ================================================== -->
	<footer class="footer">
		<div class="container">
			<p>
				<b>Nearby, City and Location place data is powered by <a href="https://developers.google.com/places/">Google Places API</a></b>
			</p>
			<p>
				<b>Location Map by <a href="https://developers.google.com/maps/">Google Maps API V3</a>, 
				Street View is powered by <a href="https://developers.google.com/maps/documentation/javascript/streetview">Google Street View API</a>,
				Static Map image is powered by <a href="https://developers.google.com/maps/documentation/staticmaps/">Google Static Maps API</a>
				Data store by <a href="https://developers.google.com/appengine/docs/java/datastore/">Google App Engine Datastore API</a></b>
			</p>
			<p>
				<b>Technology Stack: <a href="https://developers.google.com/appengine/">Google App Engine</a>, 
				<a href="https://code.google.com/p/google-gson/">Google GSON Parsing library</a>, 
				<a href="http://projects.spring.io/spring-framework/">Spring 3 MVC Framework</a></b>
			</p>
		</div>
	</footer>

    </div><!--/.fluid-container-->
    
    	<div id="clipmodal" class="modal hide fade" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"></div>
    

    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="<c:url value="/resources/js/bootstrap.js" />"></script>
     <script>
		function clipthisplace(clippdata, bttn) {
			
			var clipthis_url = "/clippit?clippdata="+clippdata;
			
			$.getJSON(clipthis_url, function(data) {
				
			})
			.done(function() {
				$('#clipmodal').html('<h3>This place is successfully clipped to your clipp list... It is available in My Clips</h3><button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>');
				$('#clipmodal').modal('show');
				bttn.className ="btn btn-danger disabled";
			})
			.fail(function() {
				$('#clipmodal').html('<h3>Something went wrong... pls try again later...</h3><button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>');
				$('#clipmodal').modal('show');
			});
			
		}
    </script>
   </body>
</html>
