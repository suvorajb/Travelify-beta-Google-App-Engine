<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Travelify - View and update my TraveliBoard...</title>
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

.bluebox {
 	background: #1f8dd6; /* same color as selected state on site menu */
    padding: 0.3em 1em;
    border-radius: 3px;
    color: #fff;
}

.paperclip{
			position:relative;
			margin:20px auto;
			line-height:30px;
			-webkit-box-shadow:1px 1px 3px rgba(0,0,0,.3);
			-moz-box-shadow:1px 1px 3px rgba(0,0,0,.3);
			-o-box-shadow:1px 1px 3px rgba(0,0,0,.3);
			-ms-box-shadow:1px 1px 3px rgba(0,0,0,.3);
		}
		.paperclip:before{
			background:url('/resources/img/clip.png');
			content:' ';
			width:45px;
			height:84px;
			position:absolute;
			top:-20px;
			left:20px;
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
		<div class="container-fluid">
			<h1>My TraveliBoard with favourite places...</h1>
		</div>
	</header>


	<div class="container-fluid">

		<div class="row-fluid">

			<div class="span12">
			
			
						
	<!-- basic board ================================================== -->
	<form:form modelAttribute="boardform" method="post" action="${upldurl}" enctype="multipart/form-data" class="form-horizontal">

					<form:hidden path="boardid" />
					<section id="basic-board-info">
						<div class="card">
							<div class="card-body">
								
								<p>	<label><h3>Title of your place board</h3></label>
									<form:input type="text" path="boardtitle" class="span8" />
								</p>
								<p>	<label class="inline"><h3>Board Type?</label>	
									<label class="radio inline">
										<form:radiobutton path="boardtype" value="Food & Drink" /> Food & Drink
									</label>	
									<label class="radio inline">
										<form:radiobutton path="boardtype" value="Architecture" /> Architecture
									</label>
									<label class="radio inline">	
										<form:radiobutton path="boardtype" value="Adult Entertainment" /> Adult Entertainment
									</label>
									<label class="radio inline">	
										<form:radiobutton path="boardtype" value="Theater" /> Theater
									</label>
									<label class="radio inline">	
										<form:radiobutton path="boardtype" value="Point of Interests" /> Point of Interests
									</label>
									<label class="radio inline">	
										<form:radiobutton path="boardtype" value="Shopping" /> Shopping</h3>
									</label>
								</p>
								<p>	<label><h3>Location? (City or Area Name)
										<form:input type="text" path="location" onFocus="javascript: geolocate();" />
										<img src="/resources/img/powered-by-google1.png" />
									</h3></label>
								</p>
								<p>	<label><h3>Brief Description:</h3></label>
									<form:textarea rows="5" class="field span5" path="boardnote" />
								</p>
								<p><label><h3>Upload Featured Photo of TraveliBoard </h3></label> <input type="file" name="featuredPhoto"> 
									[Got no photo... no problem use http://search.creativecommons.org to search royalty free photo for your board]
								</p>
								<p><c:if test="${not empty ftrdphotourl}"><img alt="" src="${ftrdphotourl}"> </c:if></p>
								<p> &nbsp; &nbsp;</p>
							</div>
						</div>
				    </section>
				    
				    <div class="row-fluid">
							<div class="span12">
									<div class="card">
										<div class="card-heading"><p><h2>Select Google Map style to show the locations of the clipped places</h2></p></div>
										<div class="card-body">
											<div class="row-fluid">
											 <ul class="thumbnails">
											 	
												<li class="span2">
													<div class="thumbnail"><p><form:radiobutton path="mapstyles" value="" /> No Style</p> <p><img src="/resources/img/maps_no.png"></p></div>
												</li>
												<li class="span2">
													<div class="thumbnail"><p><form:radiobutton path="mapstyles" value="styles_mc_dark" /> Midnight Dark</p> <p><img src="/resources/img/maps_mc.png"></p></div>
												</li>
												<li class="span2">
													<div class="thumbnail"><p><form:radiobutton path="mapstyles" value="styles_retro" /> Retro</p> <p><img src="/resources/img/maps_retro.png"></p></div>
												</li>
												<li class="span2">
													<div class="thumbnail"><p><form:radiobutton path="mapstyles" value="styles_grey" /> Sharp Grey</p> <p><img src="/resources/img/maps_grey.png"></p></div>
												</li>
												<li class="span2">
													<div class="thumbnail"><p><form:radiobutton path="mapstyles" value="styles_cobalt_dark" /> Cobalt Blue</p> <p><img src="/resources/img/maps_cobalt.png"></p></div>
												</li>
												<li class="span2">
													<div class="thumbnail"><p><form:radiobutton path="mapstyles" value="styles_blue_dark" /> Dark Blue</p> <p><img src="/resources/img/maps_dark_blue.png"></p></div>
												</li>
											</ul>
											</div>
											
											<div class="row-fluid">
											 <ul class="thumbnails">
												<li class="span2">
													<div class="thumbnail"><p><form:radiobutton path="mapstyles" value="styles_nb" /> Neutral Blue</p> <p><img src="/resources/img/maps_nb.png"></p></div>
												</li>
												<li class="span2">
													<div class="thumbnail"><p><form:radiobutton path="mapstyles" value="styles_bluish" /> Bluish</p> <p><img src="/resources/img/maps_bluish.png"></p></div>
												</li>
												<li class="span2">
													<div class="thumbnail"><p><form:radiobutton path="mapstyles" value="styles_icy_blue" /> Icy Blue</p> <p><img src="/resources/img/maps_icy_blue.png"></p></div>
												</li>
												<li class="span2">
													<div class="thumbnail"><p><form:radiobutton path="mapstyles" value="styles_red_hues" /> Red Hue</p> <p><img src="/resources/img/maps_red_hues.png"></p></div>
												</li>
												<li class="span2">
													<div class="thumbnail"><p><form:radiobutton path="mapstyles" value="styles_green" /> Green</p> <p><img src="/resources/img/maps_green.png"></p></div>
												</li>
												<li class="span2">
													<div class="thumbnail"><p><form:radiobutton path="mapstyles" value="styles_neon" /> Neon</p> <p><img src="/resources/img/maps_neon.png"></p></div>
												</li>
											</ul>
											</div>
											
											<div class="row-fluid">
											 <ul class="thumbnails">
												<li class="span2">
													<div class="thumbnail"><p><form:radiobutton path="mapstyles" value="styles_candy" /> Candy</p> <p><img src="/resources/img/maps_candy.png"></p></div>
												</li>
												<li class="span2">
													<div class="thumbnail"><p><form:radiobutton path="mapstyles" value="styles_orange" /> Orange</p> <p><img src="/resources/img/maps_orange.png"></p></div>
												</li>
												<li class="span2">
													<div class="thumbnail"><p><form:radiobutton path="mapstyles" value="styles_purple" /> Purple</p> <p><img src="/resources/img/maps_purple.png"></p></div>
												</li>
												<li class="span2">
													<div class="thumbnail"><p><form:radiobutton path="mapstyles" value="styles_pink" /> Pink</p> <p><img src="/resources/img/maps_pink.png"></p></div>
												</li>
											</ul>
											</div>
										</div>
									</div>
							</div>
						</div>
					
					<!-- Clip places ================================================== -->
					<div class="row-fluid">
						<div class="bluebox">
							<p><h2>Clipped Places in my TraveliBoard... </h2></p>
						</div>
					</div>
					
			        <section id="place-clips">
							<c:if test="${not empty board}">
						<%
							int i = 0;
							int j = 0;
							boolean flgendrow = false;
						%>
			
						<c:forEach items="${board.boardplaces}" var="boardplc">
						<c:set var="boardplcstr" scope="request" value="${boardplc}"></c:set>
						<%
									String boardplcstr = (String) request.getAttribute("boardplcstr");
									String plsstrarr[] = boardplcstr.split("\\;");
									//out.print(plsstrarr);
									j++;
						%>
							<%
								if (i == 0) {
								   flgendrow = false;
							%>
							<div class="row-fluid">
								<%
									}
								%>
							<div class="span4">
							
								<div class="card paperclip">
									<h4 class="card-heading-header"><%=plsstrarr[0]%></h4>
									<div class="card-body">
										<p><img class="img-polaroid"
											src="http://maps.googleapis.com/maps/api/streetview?size=450x150&sensor=false&location=<%=plsstrarr[2]%>&key=AIzaSyCXasoa_-_S00WnsdIDBfV4eX9G7Rhnz0U" />
										<h4><%=plsstrarr[1]%></h4>
										</p>
										<p><input type="checkbox" name="clippedplaces" id="clippedplaces<%=j%>" value="<%=plsstrarr[0]%>;<%=plsstrarr[1]%>;<%=plsstrarr[2]%>" checked="checked" /> Select</p>
									</div>
								</div><!-- card -->
								
							</div>	
							<%
								i++;
								if (i == 3) {
									flgendrow = true;
									i = 0;
							%>
						</div>	<!-- end row -->
							<%
								}
							%>
						</c:forEach>
						<%
							if (flgendrow == false) 
							{
						%>
					</div>
					<!-- end row -->
					<%
						}
					%>
					</c:if>
			
			
					<c:if test="${empty board}">
			
						<div class="row-fluid">
							<div class="span12">
								
									<div class="card">
										<div class="card-body">
											<p>
											<center>
												<h3>You don't have any places in your TraveliBoard</h3>
											</center>
										</div>
									</div>
							</div>
						</div>
					</c:if>
			        </section>
					
					
					<div class="row-fluid">
						<div class="bluebox">
							<p><h2>Looking for more places? Searh here <input type="text" name="searchtxt" id="searchtxt" placeholder="e.g. popular spa in birmingham, uk " /> &nbsp;&nbsp;
								<button class="btn btn-info" type="button" onclick="javascript:  searchPlaces(); return false;">Search &raquo;</button> </h2>
							</p>
						</div>
					</div>
					
					
					<div class="row-fluid">
						<div id="suggestPlace">
							<% 
									int i=1;
								    int j=1;
								   
								for(int n=1;n<6;n++){
							%>
								<div class="row-fluid">
								<% 
									for(int m=1;m<=4;m++) {
								%>
									<div class="span3 thumbnail card" id="placecell<%=i%>" style="display:none;">
										<img src="" id="placeimg<%=i%>"/>
										<span id="placedtls<%=i%>"></span>
										<p><label class="checkbox inline">
										<input type="checkbox" name="searchedplaces" value="" id="searchedplaces<%=i%>" /> Select </label>
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
					</div>
					
					
					
					<!-- TraveliBoard save ================================================== -->
			        <section id="trip-plan-save">
						<div class="card">
							<div class="card-body">
								<p><h3>Finish updating your board... Click the button to update your TraveliBoard ....</h3>
								<p align="center"><button class="btn btn-primary btn-large" type="submit">Update My TraveliBoard <i class="icon-save"></i></button></p>
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
	
	<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=places"></script>
    <script>
		// This example displays an address form, using the autocomplete feature
		// of the Google Places API to help users fill in the information.
		
		var placeSearch, autocomplete;
	
		function initialize() {
		  // Create the autocomplete object, restricting the search
		  // to geographical location types.
		  autocomplete = new google.maps.places.Autocomplete((document.getElementById('location')), { types: ['geocode'] });
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
	function searchPlaces() {
		//alert('hi');
		var query = $("#searchtxt").val();
		
		if($.trim(query)=="") {
			alert('Pls let us know your query...');
			return false;
		}
		
		var place_query_url = "/searchquery/" + "?query=" + query + "&resultcnt=0";
		
		$.getJSON(place_query_url, function(data) {
			//alert(data); //uncomment this for debug
			//alert (data.places[0].name); //further debug
			var txtappnd = "";
			var i=1;
			var j=1;
			var img_src = "";
			
			$.each( data.results, function( key, place ) {
				img_src = 'http://maps.googleapis.com/maps/api/streetview?size=225x200&fov=110&sensor=false&location=' + place.geometry.location.lat 
						  + ',' + place.geometry.location.lng + '&key=AIzaSyCXasoa_-_S00WnsdIDBfV4eX9G7Rhnz0U';

				  $('#placeimg'+i).attr({ src: img_src,  title: place.name,  alt: place.name  });
				  $('#placedtls'+i).html('<p><address><strong>' + place.name + '</strong> <br/>' + place.formattedAddress + '</address> </p>'); 
				  $('#searchedplaces'+i).val(place.name + ';' + place.formattedAddress + ';' + place.geometry.location.lat + ',' +place.geometry.location.lng);
				  $('#placecell'+i).show();
				  
				  i++;
			});

			$('#suggestPlace').append(txtappnd);
		});
		
		return false;
	}
	</script>
</body>
</html>
