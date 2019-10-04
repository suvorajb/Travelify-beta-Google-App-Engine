<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Travelify - Help and Quick Guide</title>
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

	<!-- Subhead ================================================= -->
	<header class="jumbotron subhead" id="overview">
		<div class="container">
			<h1>Help...</h1>
			<p class="lead">Overview of Travelify and How to use Travelify...</p>
		</div>
	</header>


	<div class="container">
		<div class="row">
			<div class="span12">


				<!-- Trip plan login ================================================== -->
				<section id="trip-login">
					<div class="card">
						<div class="card-body">
							<p>
								<h2>What is Travelify?</h2>
								<h4>
									Travelify is a Google cloud based HTML5 web application developed with complex enterprise frameworks like Spring MVC, Objectify and Google Cloud Datastore. 
									This is a social web platform targetting for people who loves travelling, discovering new places and just looking for helpful travel tips, recommendation 
									from other pro travellers. With Travelify anyone can quickly create a new Trip and Trip plan before going to a new place and see what others are recommendaing 
									and sharing helpful tips. Not only tips, anyone can create beautiful place boards with the places they love to go everyday for others to discover. 
									The place information is completely powered by Google Places API which also empowering Google locals.
									Let's see what are the modules we have to explore at Travelify.
									<ul>
										<li><b>TraveliNearby:</b> Shows Nearby point of interests</li>
										<li><b>TraveliCity:</b> Shows point of interests for a City</li>
										<li><b>TraveliTrips:</b> Helps to create Trip and Trip plans and get tips/recommendations from others</li>
										<li><b>TraveliBoards:</b>Create beautiful place boards with the places you love and help others discovers new places</li>
										<li><b>TraveliClips:</b> Clip or tag the places as a bookmarking for later reference</li>
									</ul>
									Travelifi is fully tested to work best with <b>Google Chrome</b> for Desktop and <b>Google Chrome for Android</b>(tested with Nexus 4) . 
									For other browsers we haven’t tested but hopefully it will work the same.
								</h4>
							</p>
							<p>
								<h2>What is TraveliNearby ?</h2>
								<h4>TraveliNearby uses HTML5 technology to identify location (latitude and longitude ) of the user and shows nearby restaurants, cafe, car wash, car repair or gas stations, hotels/lodge. E.g. say you are traveling and in a place and you are hungry, just open TraveliNearby in you mobile and hit the restaurant link and it will show all the nearby restaurants quickly powered by Google Places API. You get the direction and street view (powered by Google) to identify the place easily.
								</h4>
							</p>
							<p>
								<h2>What is TraveliCity ?</h2>
								<h4>TraveliCity uses Google Auto complete place information so user can select a place/city and browse top rated and popular restaurants, cafes, night clubs, point of interests like parks, zoo/aquarium, art gallery before traveling and can decide what to see while visiting.</h4>
							</p>
							<p>
								<h2>What is TraveliTrips ?</h2>
								<h4>Using TraveliTrips anyone can quickly create a quick Trip plan and add various points of interests like Parks, art gallery, museum, zoo, aquarium, 
								Sightseeing tours as well as top rated restaurants and cafe for breakfasts, lunch and dinner. 
								With pre planned Trip plan Travelers can enjoy their time and never waste time looking for restaurants or sight seeing tours. 
								They can share and get helpful tips/recommendations from other Travelifiers and friends before visiting the destinations. It is integrated with Facebook commenting system.</h4>
							</p>
							<p>
								<h2>What is TraveliBoards ?</h2>
								<h4>Love your neighrborhood restaurants? Love the bars you go over the weekend with friends and thought if you could have any way to share it. Don't worry, we have 
								TraveliBoards where you can clip the places you love in a city or neighborhood and add some reviews and share with your friends. You can share in your Google+ circle.</h4>
							</p>
							<p>
								<h2>What APIs are used ?</h2>
								<h4><b>APIs Used-</b> a) Google Places API, b)Google JavaScript Map v3 API, c) Google Static Map API, d) Google Streetview API, e) Google Cloud Datastore API.<br/>
									<b>Technology Stack-</b> Java 1.6, Spring MVC 3 Framework, JQuery 1.9, Twitter Bootsrap CSS framework, Objectify 4.0 & Gson library
								</h4>
							</p>
						</div>
					</div>
				</section>

			</div>
		</div>

	</div>

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

	<!--/.fluid-container-->

	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="<c:url value="/resources/js/bootstrap.js" />"></script>
</body>
</html>
