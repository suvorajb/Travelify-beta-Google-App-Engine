<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Travelify - City Guide...</title>
<!-- Always force latest IE rendering engine (even in intranet) & Chrome Frame -->
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<meta name="robots" content="noindex, nofollow">
<meta name="googlebot" content="noindex, nofollow">

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
						<li class="active"><a href="/travelicity/">TraveliCity</a></li>
						 <li class="dropdown">
				              <a id="drop1" href="/travelitrips/" role="button" class="dropdown-toggle active" data-toggle="dropdown">TraveliTrips <b class="caret"></b></a>
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
			<h1>Travelify City Guide...</h1>
			<p class="lead">Click sidebar link to explore others...</p>
		</div>
	</header>

	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span3">
				<div class="sidebar-nav">
					<ul class="nav nav-list">
		              <li class="nav-header">Popular Restaurants</li>
		              <li><a href="/travelicity/guide/${citynm}?query=popular+american+restaurants+in+${citynm}">American Restaurant</a></li>
		              <li><a href="/travelicity/guide/${citynm}?query=popular+indian+restaurants+in+${citynm}">Indian Restaurant</a></li>
		              <li><a href="/travelicity/guide/${citynm}?query=popular+asian+restaurants+in+${citynm}">Asian Restaurant</a></li>
		              <li><a href="/travelicity/guide/${citynm}?query=popular+mexican+restaurants+in+${citynm}">Mexican Restaurant</a></li>
					  <li><a href="/travelicity/guide/${citynm}?query=popular+italian+restaurants+in+${citynm}">Italian Restaurant</a></li>
					  <li><a href="/travelicity/guide/${citynm}?query=top+rated+restaurants+in+${citynm}">Top Rated All Restaurants</a></li>
		              <li class="nav-header">Cafe and Nightlife</li>
		              <li><a href="/travelicity/guide/${citynm}?query=popular+cafe+in+${citynm}">Popular Cafe</a></li>			  
		              <li><a href="/travelicity/guide/${citynm}?query=popular+bar+in+${citynm}">Popular Bar</a></li>
		              <li><a href="/travelicity/guide/${citynm}?query=popular+night+club+in+${citynm}">Popular Night Club</a></li>
		              <li class="nav-header">Popular Attractions</li>
		              <li><a href="/travelicity/guide/${citynm}?query=popular+art+gallery+city+hall+in+${citynm}&types=art_gallery|city_hall">Art Gallery</a></li>			  
		              <li><a href="/travelicity/guide/${citynm}?query=popular+museum+in+${citynm}">Museum</a></li>
		              <li><a href="/travelicity/guide/${citynm}?query=top+rated+movie+theater+in+${citynm}">Movie Theater</a></li>
					  <li><a href="/travelicity/guide/${citynm}?query=top+rated+zoo+and+aquarium+in+${citynm}&types=zoo|aquarium">Zoo, Sea life & Aquarium</a></li>
					  <li><a href="/travelicity/guide/${citynm}?query=top+rated+amusement+park+in+${citynm}&types=amusement_park">Amusement Park</a></li>
					  <li><a href="/travelicity/guide/${citynm}?query=top+rated+sightseeing+tours+in+${citynm}">Sight Seeing Tours</a></li>			  
					  <li><a href="/travelicity/guide/${citynm}?query=church+in+${citynm}&types=church">Church</a></li>
					  <li><a href="/travelicity/guide/${citynm}?query=mosque+in+${citynm}&types=mosque">Mosque</a></li>
					  <li><a href="/travelicity/guide/${citynm}?query=temple+in+${citynm}&types=hindu_temple">Temple</a></li>
					  <li class="nav-header">Shopping</li>
		              <li><a href="/travelicity/guide/${citynm}?query=popular+shopping+mall+in+${citynm}&types=shopping_mall">Popular Shopping Mall</a></li>		
					  <li><a href="/travelicity/guide/${citynm}?query=top+rated+jewelry+store+in+${citynm}&types=jewelry_store">Jewellery Store</a></li>	
					  <li><a href="/travelicity/guide/${citynm}?query=nearby+grocery+supermarket+in+${citynm}&types=grocery_or_supermarket">Super Market</a></li>	
					  <li class="nav-header">Travels</li>
		              <li><a href="/travelicity/guide/${citynm}?query=top+rated+sight+seeing+tours+in+${citynm}">Sight Seeing Tours</a></li>
					  <li><a href="/travelicity/guide/${citynm}?query=top+rated+travel+agency+in+${citynm}&types=travel_agency">Travel Agency</a></li>
					  <li><a href="/travelicity/guide/${citynm}?query=top+rated+hotels+and+lodge+in+${citynm}&types=lodging">Hotels & Lodging</a></li>					  
					  <li><a href="/travelicity/guide/${citynm}?query=nearby+airport+in+${citynm}&types=airport">Airports</a></li>					  
					  <li class="nav-header">Personals</li>
		              <li><a href="/travelicity/guide/${citynm}?query=top+rated+wellness+and+spa+in+${citynm}&types=spa|beauty_salon">Wellness & Spa</a></li>
					  <li><a href="/travelicity/guide/${citynm}?query=classes+in+${citynm}">Classes</a></li>					  			  
					</ul>
				</div>
				<!--/.well -->
			</div>
			<!--/span-->

			<div class="span9">

				<c:if test="${not empty placedls}">

					<div class="row-fluid">
						<div class="span12">
							<div class="card">
								<h2 class="card-heading">${placedls.name}</h2>
								<div class="card-body">
									<div class="row-fluid">
										<div class="span12" align="center">
											<img 
												src="http://maps.googleapis.com/maps/api/streetview?size=640x400&sensor=false&location=${placedls.geometry}&key=AIzaSyCXasoa_-_S00WnsdIDBfV4eX9G7Rhnz0U" />
										</div>
									</div>
									<div class="row-fluid">
										<div class="span12">
											<address>
												<p>
													<h3>
														<b>${placedls.formattedAddress}</b>
													</h3>
												</p>
												<p>
													<h3>
														<b>Phone:${placedls.formattedPhoneNumber}</b>
													</h3>
												</p>
												<c:if test="${not empty placedls.rating}">
													<p><h3>
														<b>Rating:</b> <span class="badge badge-important">${placedls.rating}</span></h3>
													</p>
												</c:if>
												<c:if test="${not empty placedls.url}">
													<p><h3>
														<b>Social:</b> <a href="${placedls.url }" target="_blank">${placedls.url }</a></h3>
													</p>
												</c:if>
												<c:if test="${not empty placedls.website}">
													<p><h3>
														<b>Website:</b> <a href="${placedls.website }" target="_blank">${placedls.website }</a></h3>
													</p>
												</c:if>
											</address>
											
										</div>
									</div>
									<!-- row -->
									<div class="row-fluid">&nbsp;&nbsp;</div>
								</div>
								<!-- card body -->
							</div>
							<!--/caed-->
						</div>
						<!--/span-->
					</div>
					<!--/row-->


					<div class="row-fluid">
						<div class="span12">
							<div class="card">
								<h2 class="card-heading">Location on Google Map</h2>
								<div class="card-body">
									<iframe width="100%" height="278" frameborder="0"
										scrolling="no" marginheight="0" marginwidth="0"
										src="https://maps.google.com/?q=${placedls.geometry}&output=embed"></iframe>
								</div>
							</div>
						</div>
					</div>

					<c:if test="${not empty placedls.photos }">
						<div class="row-fluid">
							<div class="span12">
								<div class="card">
									<h2 class="card-heading">User Uploaded Photo</h2>
									<div class="card-body">
										<ul class="thumbnails">
											<c:forEach items="${placedls.photos}" var="photo">
												<c:url var="imgurl" value="https://maps.googleapis.com/maps/api/place/photo?maxwidth=260&maxheight=180&photoreference=${photo.photoReference}&sensor=false&key=AIzaSyCmUrF7Fhn6l7oEuRI0U9FPOO3rNUsW29M"></c:url>
												<li class="span3 thumbnail"><img src="${imgurl}" alt=""></a></li>
											</c:forEach>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</c:if>


					<c:if test="${not empty placedls.reviews }">
						<div class="row-fluid">
							<div class="span12">
								<div class="card">
									<h2 class="card-heading">Reviews</h2>
									<div class="card-body">
										<ul class="thumbnails">
											<c:forEach items="${placedls.reviews}" var="review">
												<div class="row-fluid">
													<div class="span12 well"> 
														<p>${review.text} <b> By ${review.authorName} </b></p>
														<p><b>Rating:</b> <span class="badge badge-important">${review.rating}</span></h3>
													</div>
												</div>
											</c:forEach>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</c:if>




				</c:if>

			</div>
			<!--/span-->
		</div>
		<!--/row-->

		<hr>

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

	</div>
	<!--/.fluid-container-->

	<!-- Le javascript ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="<c:url value="/resources/js/bootstrap.js" />"></script>

</body>
</html>
