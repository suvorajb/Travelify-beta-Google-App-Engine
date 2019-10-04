 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Travelify - View Trip...</title>
<!-- Always force latest IE rendering engine (even in intranet) & Chrome Frame -->
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<link href='http://fonts.googleapis.com/css?family=Roboto:400,300,700'
	rel='stylesheet' type='text/css'>
<link href="<c:url value="/resources/css/bootplus.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/font-awesome.min.css" />" rel="stylesheet">
<style type="text/css">
body {
	padding-top: 60px;
	padding-bottom: 40px;
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

.highlightblue {
	padding: 9px 14px;
	margin-bottom: 14px;
	background-color: #f7f7f9;
	border: 1px solid #e1e1e8;
	border-radius: 4px;
}

/*
 * Callouts
 *
 * Not quite alerts, but custom and helpful notes for folks reading the docs.
 * Requires a base and modifier class.
 */

/* Common styles for all types */
.bs-callout {
	margin: 20px 0;
	padding: 20px;
	border-left: 3px solid #eee;
}

.bs-callout h2 {
	margin-top: 0;
	margin-bottom: 5px;
}

.bs-callout p:last-child {
	margin-bottom: 0;
}

.bs-callout-warning {
	background-color: #faf8f0;
	border-color: #faebcc;
}

.bs-callout-warning h2 {
	color: #c09853;
}

.bs-callout-info {
	background-color: #f4f8fa;
	border-color: #bce8f1;
}

.bs-callout-info h2 {
	color: #3a87ad;
}

blockquote {
	border-left: none;
	background: url(/resources/img/close-quote.gif) no-repeat right bottom;
	padding-left: 18px;
	text-indent: -18px;
}
blockquote:first-letter {
	background: url(/resources/img/open-quote.gif) no-repeat left top;
	padding-left: 18px;
	font: italic 1.4em Georgia, "Times New Roman", Times, serif;
}

#share-buttons img {
width: 35px;
padding: 5px;
border: 0;
box-shadow: 0;
display: inline;
}

.featuredphoto {
    background: transparent url('${ftrdphotourl}') 0 0 no-repeat fixed;
    text-align: center;
    background-size: cover;
    height: 475px;
    width: 100%;
    margin-bottom: 3em;
    display: table;
}

    .featuredphoto-head {
        display: table-cell;
        vertical-align: middle;
        margin-bottom: 0;
        font-size: 4em;
        color: white;
        font-weight: 500;
        text-shadow: 0 1px 1px black;
    }
    
@media ( max-width : 980px) {
	/* Enable use of floated navbar text */
	.navbar-text.pull-right {
		float: none;
		padding-left: 5px;
		padding-right: 5px;
	}
}
</style>
<link href="<c:url value="/resources/css/bootplus-responsive.css" />"
	rel="stylesheet">

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
				              	<li role="presentation"><a role="menuitem" tabindex="-1" href="/myprofile/">My Profile (Connect G+)</a></li>
				                <li role="presentation" class="divider"></li>	
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


	<div class="container-fluid">
<c:if test="${not empty trip}">
			<div class="row-fluid">
				<div class="featuredphoto"><h2 class="featuredphoto-head">${trip.triptitle}  </h2></div>
			</div>
			<div class="row-fluid">
				<div class="card">
					<div class="card-body">
						<div class="row-fluid">
							<div class="span3"><p><img src="${trip.uprofilestr}" class="img-circle" width="200" height="200"></p></div>
							<div class="span9">
								<h3 class="card-heading ">${trip.triptitle }</h3>
								<h4>By ${trip.unickname} ${trip.publshddatestr}</h4>
								<div>
									<h3><blockquote>${trip.tripnote }</blockquote></h3>
								</div>
							</div>
						</div>
						
					</div>
				</div><!-- card -->
			</div>
			
			<div class="row-fluid">
				<div class="span8">

					<section id="trip-info">
						<div class="card">
							<h3 class="card-heading simple">Trip summary...</h3>
							<div class="card-body">
								<p><h3>Going To ? ${trip.tripplace}</h3></p>
								<p><h3>How long? <strong>${trip.tripduration}</strong> Days , Which Season? <strong>${trip.tripseason}</strong></h3></p>
								<p><h3>Trip type:
									<c:choose>
										<c:when test="${trip.triptype=='F'}">
											Family Vacation with Kids
										</c:when>
										<c:when test="${trip.triptype=='R'}">
											Just we two, a romantic date, honeymoon... 
										</c:when>
										<c:when test="${trip.triptype=='B'}">
											With friends, buddies, backpackers
										</c:when>
										<c:when test="${trip.triptype=='A'}">
											Travelling alone, an Ameteur 
										</c:when>
										<c:otherwise>
											Business, Corporate Trip
										</c:otherwise>
									</c:choose>
								</h3></p>
								<p><h3>My Favourite cuisine?
									<c:forEach items="${trip.favcuisines}" var="favcuisn">
										<b>${favcuisn }</b> &nbsp;&nbsp;
									</c:forEach>
								</h3></p>
								<c:if test="${not empty trip.hname}">
									<p><h3>Hotel/Lodge planning to stay...</h3></p>
									<p><address><h3>${trip.hname}</h3><h4>${trip.haddress}</h4></address>
					<img class="img-polaroid" src="http://maps.googleapis.com/maps/api/streetview?size=650x250&sensor=false&location=${trip.lat},${trip.lng}&key=AIzaSyCXasoa_-_S00WnsdIDBfV4eX9G7Rhnz0U" />
									</p>
								</c:if>
								<p><h3>I am looking for Tips/recommendations on 
									<c:if test="${empty trip.recommendneeded}">
										Everything here...
									</c:if>
									<c:if test="${not empty trip.recommendneeded}">
										<c:forEach items="${trip.recommendneeded}" var="recommnd">
										<b>${recommnd}</b> &nbsp;&nbsp;
									</c:forEach>
									</c:if>
								</h3></p>
								
								<c:if test="${tripplansize>0}">
									<a href="/travelitrips/viewtripplan?tripid=${trip.tripid}"
										class="btn btn-large btn-primary">View Places I've planned to visit</a>
								</c:if>
								<c:if test="${tripplansize==0}">
									<div class="bs-callout bs-callout-warning">
										<h2>No Trip Plan Places of attraction posted yet by ${trip.unickname }</h2>
									</div>
								</c:if>
								<p>&nbsp; &nbsp;</p>
							</div>
						</div>
					</section>



				</div>

				<div class="span4">
					<div class="row-fluid">
						<div class="card">
							<h3 class="card-heading simple">Sharing is caring...</h3>
							<div class="card-body">
								<div id="share-buttons">
 
									<!-- Facebook -->
									<a href="http://www.facebook.com/sharer.php?u=http://gcdc2013-travelify.appspot.com/travelitrips/viewtrip?tripid=${trip.tripid}" target="_blank"><img src="/resources/img/facebook.png" alt="Facebook" /></a>
									 
									<!-- Twitter -->
									<a href="http://twitter.com/share?url=http://gcdc2013-travelify.appspot.com/travelitrips/viewtrip?tripid=${trip.tripid}&text=${trip.triptitle}" target="_blank"><img src="/resources/img/twitter.png" alt="Twitter" /></a>
									 											 
									<!-- Digg -->
									<a href="http://www.digg.com/submit?url=http://gcdc2013-travelify.appspot.com/travelitrips/viewtrip?tripid=${trip.tripid}" target="_blank"><img src="/resources/img/diggit.png" alt="Digg" /></a>
									 
									<!-- Reddit -->
									<a href="http://reddit.com/submit?url=http://gcdc2013-travelify.appspot.com/travelitrips/viewtrip?tripid=${trip.tripid}&title=${trip.triptitle}" target="_blank"><img src="/resources/img/reddit.png" alt="Reddit" /></a>
									 
									<!-- LinkedIn -->
									<a href="http://www.linkedin.com/shareArticle?mini=true&url=http://gcdc2013-travelify.appspot.com/travelitrips/viewtrip?tripid=${trip.tripid}" target="_blank"><img src="/resources/img/linkedin.png" alt="LinkedIn" /></a>
									 
									<!-- StumbleUpon-->
									<a href="http://www.stumbleupon.com/submit?url=http://gcdc2013-travelify.appspot.com/travelitrips/viewtrip?tripid=${trip.tripid}&title=${trip.triptitle}" target="_blank"><img src="/resources/img/stumbleupon.png" alt="StumbleUpon" /></a>
								</div>
								<p>&nbsp;</p>
								<p><span class="btn btn-danger g-interactivepost"
								  data-contenturl="http://gcdc2013-travelify.appspot.com/travelitrips/viewtrip?tripid=${trip.tripid}" 
								  data-clientid="58996761750.apps.googleusercontent.com" 
								  data-cookiepolicy="single_host_origin" 
								  data-prefilltext="${trip.triptitle} : ${trip.tripnote}" 
								  data-calltoactionlabel="VIEW" 
								  data-calltoactionurl="http://gcdc2013-travelify.appspot.com/travelitrips/viewtrip?tripid=${trip.tripid}"> 
								  Share in Your <i class="icon-google-plus"></i> Circle
								 </span>
								 </p>
							</div>
						</div>
					</div>
					
					<div class="row-fluid">
						<section id="comments">
							<div class="card">
								<div class="card-body">
									<h3 class="panel-title">Comments</h3>
									<p>
									<div class="fb-comments"
										data-href="http://gcdc2013-travelify.appspot.com/travelitrips/viewtrip?tripid=${trip.tripid}" data-numposts="20" width="400"></div>
									</p>
								</div>
							</div>
						</section>
					</div>
										
				</div>

			</div>

			<div class="row-fluid">
				<div class="card">
					<div class="card-body">
						<div class="row-fluid">
							<div class="span12">
								<form:form modelAttribute="tipsform" method="post" action="/travelitrips/addtips" class="form-horizontal">
								<div class="control-group">
								    <label class="control-label" for="recommendplace">Recommend A Place</label>
								    <div class="controls">
								       <input type="text" name="recommendplace" id="recommendplace" placeholder="e.g. Fisherman Wharf, San Francisco"  class="span5" />
								    </div>
								  </div>
								  <div class="control-group">
								    <label class="control-label" for="tips">Tips</label>
								    <div class="controls">
								      <textarea rows="4" class="span5" name="tips" id="tips" placeholder="Post your 2cents for this trip" minlength="2" required></textarea>
								      <input type="hidden" name="tripid" id="tripid" value="${trip.tripid}" />
										<button type="submit" class="btn btn-warning btn-large">Post Your Tips</button>
								    </div>
								  </div>
								</form:form>
							</div>
						</div>
						
						
						<div class="row-fluid">
								<c:if test="${not empty trip.tips}">
									<% int m=1; %>
									<ul class="thumbnails">
											<c:forEach items="${trip.tips}" var="tip">
												<div class="row-fluid">
													<div class="span12 well">
														<c:if test="${not empty tip.recommendplace}"><h3>Recommended Place: ${tip.recommendplace}</h3></c:if>
														<p><span class="badge badge-important"><%=m %></span> ${tip} <b> By ${tip.unickname} </b></p>
													</div>
												</div>
												<% m++; %>
											</c:forEach>
										</ul>
								</c:if>
						</div>
						
					</div>
				</div>
			</div>

		</c:if>

	</div>


	<!-- Footer ================================================== -->
	<footer class="footer">
		<div class="container">
			<p>
				<b>Nearby, City and Location place data is powered by <a
					href="https://developers.google.com/places/">Google Places API</a></b>
			</p>
			<p>
				<b>Location Map by <a href="https://developers.google.com/maps/">Google
						Maps API V3</a>, Street View is powered by <a
					href="https://developers.google.com/maps/documentation/javascript/streetview">Google
						Street View API</a>, Static Map image is powered by <a
					href="https://developers.google.com/maps/documentation/staticmaps/">Google
						Static Maps API</a> Data store by <a
					href="https://developers.google.com/appengine/docs/java/datastore/">Google
						App Engine Datastore API</a></b>
			</p>
			<p>
				<b>Technology Stack: <a
					href="https://developers.google.com/appengine/">Google App
						Engine</a>, <a href="https://code.google.com/p/google-gson/">Google
						GSON Parsing library</a>, <a
					href="http://projects.spring.io/spring-framework/">Spring 3 MVC
						Framework</a></b>
			</p>
		</div>
	</footer>

	<!--/.fluid-container-->

	<script src="<c:url value="/resources/js/jquery.min.js" />"></script>
	<script src="<c:url value="/resources/js/jquery.validation.min.js" />"></script>
	<script src="<c:url value="/resources/js/bootstrap.js" />"></script>
	<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=places"></script>
	
	<script>
			// This example displays an address form, using the autocomplete feature
			// of the Google Places API to help users fill in the information.
			
			var placeSearch, autocomplete;
		
			function initialize() {
			  // Create the autocomplete object, restricting the search
			  // to geographical location types.
			  autocomplete = new google.maps.places.Autocomplete((document.getElementById('recommendplace')), { types: ['geocode'] });
			  // When the user selects an address from the dropdown,
			  // populate the address fields in the form.
			  google.maps.event.addListener(autocomplete, 'place_changed', function() {
			    fillInAddress();
			  });
			}
	
			// The START and END in square brackets define a snippet for our documentation:
			// [START region_fillform]
			function fillInAddress() {
			  // Get the place details from the autocomplete object.
			  var place = autocomplete.getPlace();
			}
				
			// Bias the autocomplete object to the user's geographical location,
			// as supplied by the browser's 'navigator.geolocation' object.
			function geolocate() {
			  if (navigator.geolocation) {
			    navigator.geolocation.getCurrentPosition(function(position) {
			      var geolocation = new google.maps.LatLng(
			          position.coords.latitude, position.coords.longitude);
			      autocomplete.setBounds(new google.maps.LatLngBounds(geolocation,
			          geolocation));
			    });
			  }
			}
			
			initialize();
			$(".form-horizontal").validate();
	</script>
</body>
</html>
