<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Travelify - Quick Nearby Search...</title>
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
	padding: 5px;
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
	
	

	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span3">
				<div class="sidebar-nav" id="suggestcontent"></div>
				<!--/.well -->
			</div>
			<!--/span-->

			<div class="span9">
				<div class="hero-unit">
					<h3>
						<center>Your location</center>
					</h3>
					<p id="demo">
					<center>
						<div id="mapholder"></div>
					</center>
					</p>
				</div>

				<div class="row-fluid">
					<div class="span4">
						<div class="card">
							<h2 class="card-heading simple">Restaurants</h2>
							<div class="card-body">
								<p>
									<a href="" id="restaurants_link1"> <img width="300" height="200" alt="Restaurant" src="<c:url value="/resources/img/ic_restaurant.jpg" />"
										class="img-polaroid">
									</a>
								</p>
								<p>
									<a class="btn btn-info" href="#" id="restaurants_link2">View Details &raquo;</a>
								</p>
							</div>
						</div>
					</div>
					<!--/span-->
					<div class="span4">
						<div class="card">
							<h2 class="card-heading simple">Cafe</h2>
							<div class="card-body">
								<p>
									<a href="" id="cafe_link1"> <img width="300" height="200" alt="Cafe" src="<c:url value="/resources/img/ic_cafe.jpg" />"
										class="img-polaroid">
									</a>
								</p>
								<p>
									<a class="btn btn-info" href="#" id="cafe_link2">View Details &raquo;</a>
								</p>
							</div>
						</div>
					</div>
					<!--/span-->
					<div class="span4">
						<div class="card">
							<h2 class="card-heading simple">Fast Food / Burgers</h2>
							<div class="card-body">
								<p>
									<a href="#" id="fstfd_link1"> <img width="300" height="200" alt="Fast food" src="<c:url value="/resources/img/ic_fastfood.jpg" />"
										class="img-polaroid">
									</a>
								</p>
								<p>
									<a class="btn btn-info" href="#" id="fstfd_link2">View Details &raquo;</a>
								</p>
							</div>
						</div>
					</div>
					<!--/span-->
				</div>
				<!--/row-->
				<hr />

				<div class="row-fluid">
					<div class="span4">
						<div class="card">
							<h2 class="card-heading simple">Bar</h2>
							<div class="card-body">
								<p>
									<a href="" id="bar_link1"> <img width="300" height="200" alt="Bar" src="<c:url value="/resources/img/ic_bar.jpg" />"
										class="img-polaroid">
									</a>
								</p>
								<p>
									<a class="btn btn-info" href="#" id="bar_link2">View
										details &raquo;</a>
								</p>
							</div>
						</div>
					</div>
					<!--/span-->
					<div class="span4">
						<div class="card">
							<h2 class="card-heading simple">Nightclub</h2>
							<div class="card-body">
								<p>
									<a href="" id="nightclub_link1"> <img width="300" height="200" alt="Nightclub" src="<c:url value="/resources/img/ic_nightclub.jpg" />"
										class="img-polaroid">
									</a>
								</p>
								<p>
									<a class="btn btn-info" href="#" id="nightclub_link2">View
										details &raquo;</a>
								</p>
							</div>
						</div>
					</div>
					<!--/span-->
					<div class="span4">
						<div class="card">
							<h2 class="card-heading simple">Spa</h2>
							<div class="card-body">
								<p>
									<a href="" id="spa_link1"> <img width="300" height="200" alt="Spa" src="<c:url value="/resources/img/ic_spa.jpg" />"
										class="img-polaroid">
									</a>
								</p>
								<p>
									<a class="btn btn-info" href="#" id="spa_link2">View
										details &raquo;</a>
								</p>
							</div>
						</div>
					</div>
					<!--/span-->
				</div>
				<!--/row-->
				<hr />

				<div class="row-fluid">
					<div class="span4">
						<div class="card">
							<h2 class="card-heading simple">Doctors</h2>
							<div class="card-body">
								<p>
									<a href="" id="doctors_link1"> <img width="300" height="200" alt="Doctors" src="<c:url value="/resources/img/ic_doctors.jpg" />"
										class="img-polaroid">
									</a>
								</p>
								<p>
									<a class="btn btn-info" href="#" id="doctors_link2">View
										details &raquo;</a>
								</p>
							</div>
						</div>
					</div>
					<!--/span-->
					<div class="span4">
						<div class="card">
							<h2 class="card-heading simple">Medical Units/Hospitals</h2>
							<div class="card-body">
								<p>
									<a href="" id="medical_link1"> <img width="300" height="200" alt="Medical" src="<c:url value="/resources/img/ic_medical.jpg" />"
										class="img-polaroid">
									</a>
								</p>
								<p>
									<a class="btn btn-info" href="#" id="medical_link2">View
										details &raquo;</a>
								</p>
							</div>
						</div>
					</div>
					<!--/span-->
					<div class="span4">
						<div class="card">
							<h2 class="card-heading simple">Pharmacy</h2>
							<div class="card-body">
								<p>
									<a href="" id="pharmacy_link1"> <img width="300" height="200" alt="Pharmacy" src="<c:url value="/resources/img/ic_pharmacy.jpg" />"
										class="img-polaroid">
									</a>
								</p>
								<p>
									<a class="btn btn-info" href="#" id="pharmacy_link2">View
										details &raquo;</a>
								</p>
							</div>
						</div>
					</div>
					<!--/span-->
				</div>
				<!--/row-->
				<hr />

				<div class="row-fluid">
					<div class="span4">
						<div class="card">
							<h2 class="card-heading simple">Car Repair</h2>
							<div class="card-body">
								<p>
									<a href="" id="car_repair_link1"> <img width="300" height="200" alt="Car Repair" src="<c:url value="/resources/img/ic_car_repair.jpg" />"
										class="img-polaroid">
									</a>
								</p>
								<p>
									<a class="btn btn-info" href="#" id="car_repair_link2">View
										details &raquo;</a>
								</p>
							</div>
						</div>
					</div>
					<!--/span-->
					<div class="span4">
						<div class="card">
							<h2 class="card-heading simple">Car Wash</h2>
							<div class="card-body">
								<p>
									<a href="" id="car_wash_link1"> <img width="300" height="200" alt="Car Wash" src="<c:url value="/resources/img/ic_car_wash.jpg" />"
										class="img-polaroid">
									</a>
								</p>
								<p>
									<a class="btn btn-info" href="#" id="car_wash_link2">View
										details &raquo;</a>
								</p>
							</div>
						</div>
					</div>
					<!--/span-->
					<div class="span4">
						<div class="card">
							<h2 class="card-heading simple">Gas</h2>
							<div class="card-body">
								<p>
									<a href="" id="car_gas_link1"> <img width="300" height="200" alt="Gasoline" src="<c:url value="/resources/img/ic_gas.jpg" />"
										class="img-polaroid">
									</a>
								</p>
								<p>
									<a class="btn btn-info" href="#" id="car_gas_link2">View
										details &raquo;</a>
								</p>
							</div>
						</div>
					</div>
					<!--/span-->
				</div>
				<!--/row-->
				<hr />

			</div>
			<!--/span-->
		</div>
		<!--/row-->


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

	<!-- Le javascript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="<c:url value="/resources/js/bootstrap.js" />"></script>
	<script>
		var x = document.getElementById("demo");

		function getLocation() {
			if (navigator.geolocation) {
				navigator.geolocation.getCurrentPosition(showPosition,
						showError);
			} else {
				x.innerHTML = "Geolocation is not supported by this browser.";
			}
		}

		function showPosition(position) {
			var latlon = position.coords.latitude + ","	+ position.coords.longitude;

			var img_url = "http://maps.googleapis.com/maps/api/staticmap?center=" + latlon + "&zoom=14&size=850x200&sensor=false";
			document.getElementById("mapholder").innerHTML = "<img src='"+img_url+"'>";

			var suggest_url = "/travelinearby/suggest/" + getMssgTimeOfDay() + "?lat=" + position.coords.latitude + "&lon=" + position.coords.longitude;
			
			var restrnt_search_url = "/travelinearby/recommend/restaurant?lat=" + position.coords.latitude + "&lon=" + position.coords.longitude;
			var cafe_search_url = "/travelinearby/search1?cat=cafe&types=cafe&lat=" + position.coords.latitude + "&lon=" + position.coords.longitude;
			var fstfd_search_url = "/travelinearby/search2?cat=fastfoods&keyword=fast%20food&lat=" + position.coords.latitude + "&lon=" + position.coords.longitude;

			var bar_search_url = "/travelinearby/search1?cat=bar&types=bar&lat=" + position.coords.latitude + "&lon=" + position.coords.longitude;
			var night_club_search_url = "/travelinearby/search1?cat=nightclub&types=night_club&lat=" + position.coords.latitude + "&lon=" + position.coords.longitude;
			var spa_search_url = "/travelinearby/search1?cat=spa&types=spa&lat=" + position.coords.latitude + "&lon=" + position.coords.longitude;

			var doctors_search_url = "/travelinearby/search1?cat=doctors&types=doctor&lat=" + position.coords.latitude + "&lon=" + position.coords.longitude;
			var medical_search_url = "/travelinearby/search1?cat=hospitals&types=hospital&lat=" + position.coords.latitude + "&lon=" + position.coords.longitude;
			var pharmacy_search_url = "/travelinearby/search1?cat=pharmacytypes=hospital&lat=" + position.coords.latitude + "&lon=" + position.coords.longitude;
			
			var car_repair_search_url = "/travelinearby/search1?cat=car%20repair&types=car_repair&lat=" + position.coords.latitude + "&lon=" + position.coords.longitude;
			var car_wash_search_url = "/travelinearby/search1?cat=car%20wash&types=car_wash&lat=" + position.coords.latitude + "&lon=" + position.coords.longitude;
			var gas_search_url = "/travelinearby/search1?cat=gas&types=gas_station&lat=" + position.coords.latitude + "&lon=" + position.coords.longitude;

			
			
			//link1
			$('#restaurants_link1').attr('href', restrnt_search_url);
			$('#cafe_link1').attr('href', cafe_search_url);
			$('#fstfd_link1').attr('href', fstfd_search_url);
			
			$('#bar_link1').attr('href', bar_search_url);
			$('#nightclub_link1').attr('href', night_club_search_url);
			$('#spa_link1').attr('href', spa_search_url);
			
			$('#doctors_link1').attr('href', doctors_search_url);
			$('#medical_link1').attr('href', medical_search_url);
			$('#pharmacy_link1').attr('href', pharmacy_search_url);

			$('#car_repair_link1').attr('href', car_repair_search_url);
			$('#car_wash_link1').attr('href', car_wash_search_url);
			$('#car_gas_link1').attr('href', gas_search_url);

			
			
			//link2
			$('#restaurants_link2').attr('href', restrnt_search_url);
			$('#cafe_link2').attr('href', cafe_search_url);
			$('#fstfd_link2').attr('href', fstfd_search_url);
			
			$('#bar_link2').attr('href', bar_search_url);
			$('#nightclub_link2').attr('href', night_club_search_url);
			$('#spa_link2').attr('href', spa_search_url);
			
			$('#doctors_link2').attr('href', doctors_search_url);
			$('#medical_link2').attr('href', medical_search_url);
			$('#pharmacy_link2').attr('href', pharmacy_search_url);

			$('#car_repair_link2').attr('href', car_repair_search_url);
			$('#car_wash_link2').attr('href', car_wash_search_url);
			$('#car_gas_link2').attr('href', gas_search_url);
			

			
			$.getJSON(suggest_url, function(data) {
				//alert(data); //uncomment this for debug
				//alert (data.places[0].name); //further debug
				//$('#suggstcontent').append('<ul class="nav nav-list"><li class="nav-header">'+data.message+'</li>';
				//alert(txtappnd);
				var txtappnd = "<ul class='nav nav-list'><li class=nav-header>"+data.mssg+"</li>";
				
				$.each( data.places, function( key, place ) {
					 // alert( key + ": " + place );
				txtappnd = txtappnd + "<li><div class=row-fluid><div class=span6>"
					   + "<p><img  class=img-polaroid src=http://maps.googleapis.com/maps/api/streetview?size=150x150&fov=110&sensor=false&location="
					   + place.geometry.location.lat
					   + ","
					   + place.geometry.location.lng
					   + "&key=AIzaSyCXasoa_-_S00WnsdIDBfV4eX9G7Rhnz0U />"
					   + "</div><div class=span6>"
					   + "<address><strong>" + place.name + "</strong><br>" 
					   + place.formattedAddress + "</address> <br>"
					   + "<p><a class='btn btn-info' href='/travelinearby/showdtls?ref=" + place.reference +"&lat="+place.geometry.location.lat+"&lon=" + place.geometry.location.lng +"'>View Details &raquo;</a></p>" 
					   + "</div></div><hr /></li>";
					   
					});
				
				txtappnd = txtappnd + "</ul>";
			  	//alert(txtappnd);

				$('#suggestcontent').html(txtappnd);
			});
		}

		function showError(error) {
			switch (error.code) {
			case error.PERMISSION_DENIED:
				x.innerHTML = "User denied the request for Geolocation."
				break;
			case error.POSITION_UNAVAILABLE:
				x.innerHTML = "Location information is unavailable."
				break;
			case error.TIMEOUT:
				x.innerHTML = "The request to get user location timed out."
				break;
			case error.UNKNOWN_ERROR:
				x.innerHTML = "An unknown error occurred."
				break;
			}
		}
		getLocation();

		function getMssgTimeOfDay() {
			var now = new Date();
			var hours = now.getHours();
			//alert(hours);
			var msg;
			if (hours> 4 && hours < 11)
				msg = "breakfast";
			else if (hours >= 11 && hours <= 15)
				msg = "lunch";
			else if (hours > 15 && hours <= 19)
				msg = "hangout";
			else
				msg = "dinner";

			return (msg);
		}
		
	</script>

</body>
</html>
