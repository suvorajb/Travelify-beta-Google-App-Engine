<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Travelify - Create New Trip...</title>
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

.loadimg {
	background:url(/resources/img/ajax-loader.gif) no-repeat; center;
	height: 100px; width: 100px;
	position: fixed; left: 50%; top: 50%; z-index: 1000;
	margin: -25px 0 0 -25px;
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
	
	
	<!-- Subhead =================================================== -->
	<header class="jumbotron subhead" id="overview">
		<div class="container">
			<h1>Let's create a quick Trip for your next Travel...</h1>
			<p class="lead">Just fill up basic information and let Travelify find the best places to dine in or visit for you...</p>
		</div>
	</header>


	<div class="container">

		<div class="row">

			<div class="span12">
			
			
			
			
			 <!-- basic ================================================== -->
        <section id="basic-trip-info">
<form:form modelAttribute="tripform" method="post" action="/travelitrips/createtrip"  class="form-horizontal">
			<div class="card">
				<div class="card-body">
					<p>
						<h1>1. First answer some simple questions </h1>
					</p>
					<p>	<label><h3>Trip name or title (A good title helps to remember trip)</h3></label>
						<form:input type="text" path="triptitle" placeholder="e.g. My Family vacation to San Francisco" />
					</p>
					<p>	<label><h3>Where are you going?</h3></label>
						<form:input type="text" path="tripplace" placeholder="e.g. Minneapolis, MN" onFocus="javascript: geolocate();" />
						<img src="/resources/img/powered-by-google1.png" />
					</p>
					<p>	<label><h3>For how long?</h3></label>
						<form:input type="text" path="tripduration" />
					</p>
					<p>	<label class="inline"><h3>What season you are planning to travel?</h3></label>	
						<label class="radio inline">
							<form:radiobutton path="tripseason" value="Spring" /> Spring
						</label>	
						<label class="radio inline">
							<form:radiobutton path="tripseason" value="Summer" /> Summer
						</label>
						<label class="radio inline">	
							<form:radiobutton path="tripseason" value="Fall" /> Fall
						</label>
						<label class="radio inline">	
							<form:radiobutton path="tripseason" value="Winter" /> Winter
						</label>
					</p>
					<p>
						<h3>What is your Trip Type?</h3>
						<label class="checkbox inline">
							<form:checkbox path="triptype" value="F" /> Family Vacation with Kids
						</label>
						<label class="checkbox inline">	
						  	<form:checkbox path="triptype" value="R" /> Just we two, a romantic date, honeymoon...  
						</label>
						<label class="checkbox inline">	
						  	<form:checkbox path="triptype" value="B" /> With friends, buddies, backpackers
						</label>
						<label class="checkbox inline">	
						  	<form:checkbox path="triptype" value="A" /> Travelling alone, Ameteur  
						</label>
						<label class="checkbox inline">	
						  	<form:checkbox path="triptype" value="C" /> Business, Corporate Trip  
						</label>
					</p>
					<p>
						<h3>Your favourite cuisine? </h3>
						<label class="checkbox inline">	
						  <form:checkbox path="favcuisines" value="American" /> American
						</label>
						<label class="checkbox inline">	
						  <form:checkbox path="favcuisines" value="Italian" /> Italian  
						</label>
						<label class="checkbox inline">	
						  <form:checkbox path="favcuisines" value="Indian" /> Indian
						</label>
						<label class="checkbox inline">	
						  <form:checkbox path="favcuisines" value="Chinese" /> Chinese  
						</label>
						<label class="checkbox inline">	
						  <form:checkbox path="favcuisines" value="Thai" /> Thai
						</label>
						<label class="checkbox inline">	
						  <form:checkbox path="favcuisines" value="Mexican" /> Mexican  
						</label>
						<label class="checkbox inline">	
						  <form:checkbox path="favcuisines" value="Japanese" /> Japanese  
						</label>
						<label class="checkbox inline">	
						  <form:checkbox path="favcuisines" value="Greek/Mediterranean" /> Greek / Mediterranean  
						</label>
						<label>(Help us suggest you some best restaurants nearby)</label>
					</p>
					<p>
						<h3>Type of recommendation you are looking for?</h3>
						<label class="checkbox inline">
							<form:checkbox path="recommendneeded" value="Hotels and Lodging" /> Hotels and Lodging
						</label>
						<label class="checkbox inline">	
						  	<form:checkbox path="recommendneeded" value="Points of Attraction" /> Points of Attraction  
						</label>
						<label class="checkbox inline">	
						  	<form:checkbox path="recommendneeded" value="Sight seeing Tours" /> Sight seeing Tours
						</label>
						<label class="checkbox inline">	
						  	<form:checkbox path="recommendneeded" value="Restaurants" /> Restaurants  
						</label>
						<label class="checkbox inline">	
						  	<form:checkbox path="recommendneeded" value="Nightlife" /> Nightlife  
						</label>
						<label class="checkbox inline">	
						  	<form:checkbox path="recommendneeded" value="Shopping" /> Shopping  
						</label>
						<label class="checkbox inline">	
						  	<form:checkbox path="recommendneeded" value="Wellness, Beauty and Spa" /> Wellness, Beauty and Spa  
						</label>
					</p>
					<p> <a class="btn btn-primary" href="#hotel-trip-info">Next &raquo;</a></p>
					<p> &nbsp; &nbsp;</p>
				</div>
			</div>
        </section>
		
		<!-- hotel ================================================== -->
        <section id="hotel-trip-info">
			<div class="card">
				<div class="card-body">
					<p>
						<h1>2. Do you know the Hotel/Lodge you'll be staying? </h1>
						<small> <span class="label label-important">Important</span> It is always recommended to add a hotel in your trip you are planning to stay. However if you have not decided
						then use hotel finder below to search and select a hotel. Other Travelifiers can provide feedback of the hotel. However this is completely optional to add.</small>
					</p>
					<p>
						  <div class="control-group">
						    <label class="control-label" for="hotelnm">Hotel/Lodge Name</label>
						    <div class="controls"><form:input type="text" path="hotelnm" placeholder="Hotel Name" /></div>
						  </div>
						  <div class="control-group">
						    <label class="control-label" for="hoteladdr">Hotel/Lodge address</label>
						    <div class="controls"><form:input type="text" path="hoteladdr" placeholder="Hotel Address" /></div>
						  </div>
					</p>
					<p><h3>Not Sure ? Let Travelify recommend nearby Hotels/Lodge?  
					   <button class="btn btn-warning  btn-large" onclick="javascript: recommendHotels(); return false;">Click for Nearby Hotels <i class="icon-hand-right"></i></button> </h3>
					</p>
					<!--p>
					   <h3>Or Search and Add Manually</h3>
						<form class="form-search">
						  <input type="text" class="input-medium search-query">
						  <button type="submit" class="btn">
							 <i class="icon-search"></i>
						  </button>
						</form>
					</p -->
					<hr/>
					<p>
						<div id="loading" class="loadimg"></div>
						<div id="suggestHotel">
						<% 
								int i=1;
							    int j=1;
							   
							for(int n=1;n<6;n++){
						%>
							<div class="row-fluid">
							<% 
								for(int m=1;m<=4;m++) {
							%>
								<div class="span3 thumbnail" id="hotelcell<%=i%>" style="display:none;">
									<img src="" id="hotelimg<%=i%>"/>
									<span id="hdtls<%=i%>"></span>
									<p><label class="radio inline">
									<input type="radio" name="hotelrdo" value="" id="hotelrdo<%=i%>" /> Select </label>
									</p>
								</div>
								<%
									i++;
									}
								%>
							</div>
						<% 
							} 
						
						%>
							
						</div>
					</p>
				</div>
			</div>
        </section>
		
		
		
		
		
		<!-- Trip plan save ================================================== -->
        <section id="trip-plan-save">
			<div class="card">
				<div class="card-body">
					<p>
						<h1>3. Any Question you have for your upcoming Trip? Good to get helpful tips from others... </h1>
						<small> <span class="label label-important">Important</span> If you have any question or looking for something different write your question here for other Travelifiers to 
						answers and share their feedback and tips...</small>
					</p>
					<p><h3><form:checkbox path="status" value="Public" /> Publish your dream trip for tips and recommendation from others</h3></p>
						<small> <span class="label label-important">Important</span> Uncheck if you don't want to share your trip with others and want to keep it as private...</small>
						<form:textarea rows="10" class="field span11" path="tripnote" /></p>
					<p><h3>
						Okay, we have got all your Trip details. We are going to save it to Google Cloud so it is completely secure and available any time. 
						Next you can add your Trip Plan to you upcoming trip...
						</h3>
					</p>
					<p align="center"><button class="btn btn-primary btn-large" type="submit">Create My Trip <i class="icon-save"></i></button></p>
				</div>
			</div>
		</section>
			
			
</form:form>
			
			
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

	<script src="<c:url value="/resources/js/jquery.min.js" />"></script>
	<script src="<c:url value="/resources/js/bootstrap.js" />"></script>
	<script src="<c:url value="/resources/js/createtrip.js" />"></script>	
	
	<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=places"></script>
	<script>$("#loading").hide();</script>
    <script>
		// This example displays an address form, using the autocomplete feature
		// of the Google Places API to help users fill in the information.
		
		var placeSearch, autocomplete;
	
		function initialize() {
		  // Create the autocomplete object, restricting the search
		  // to geographical location types.
		  autocomplete = new google.maps.places.Autocomplete((document.getElementById('tripplace')), { types: ['geocode'] });
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
	</script>
	<script>
      $(function() {
        $('a[href*=#]:not([href=#])').click(function() {
          if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') 
            || location.hostname == this.hostname) {

            var target = $(this.hash);
            target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
            if (target.length) {
              $('html,body').animate({
                scrollTop: target.offset().top
              }, 2000);
              return false;
            }
          }
        });
      });
    </script>
</body>
</html>
