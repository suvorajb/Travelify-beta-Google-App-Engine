<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Travelify - Add a new trip plan to your Dream Trip...</title>
<!-- Always force latest IE rendering engine (even in intranet) & Chrome Frame -->
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<link href='http://fonts.googleapis.com/css?family=Roboto:400,300,700'
	rel='stylesheet' type='text/css'>
<link href="<c:url value="/resources/css/bootplus.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/font-awesome.min.css" />"
	rel="stylesheet">

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
							<a href="${hrefscr}" class="btn btn-danger"><i
								class="icon-google-plus"></i> | Sign in with Google</a>
						</c:otherwise>
					</c:choose>
				</span>
			</div>

		</div>
	</div>

	<!-- Subhead ================================================== -->
	<header class="jumbotron subhead" id="overview">
		<div class="container-fluid">
			<h1>Search and add places in your trip plan for your upcoming Trip ... [${triptitle }]</h1>
			<p class="lead">Use the note box to keep note which will come handy during your travel...</p>
		</div>
	</header>


	<div class="container-fluid">

		<div class="row-fluid">
			<section id="trip-plan-search">
				<div class="card">
					<h2 class="card-heading">Search the type places you want to see and add (maximum 6, minimum 3 categories)</h2>
					<div class="card-body">
						<form name="f1" action="/travelitrips/tripplan" method="get">
							<input type="hidden" name="tid" id="tid"
								value="<%=request.getParameter("tripid")%>" />
							<p>
								<label class="checkbox inline"> <input type=checkbox name="plctypes" id="plctypes1" value="BRK" /> Breakfast/Cafe</label> 
								<label class="checkbox inline"> <input type=checkbox name="plctypes" id="plctypes2" value="LCH" /> Popular Lunch Places	</label> 
								<label class="checkbox inline"> <input type=checkbox name="plctypes" id="plctypes3" value="DNR" /> Top Rated Fine Dinning Restaurants</label> 
								<label class="checkbox inline"> <input type=checkbox name="plctypes" id="plctypes4" value="NCB" /> Bar and Night Clubs </label> 
								<label class="checkbox inline"> <input type=checkbox name="plctypes" id="plctypes6" value="MSM" /> Museum & Art Gallery </label> 
								<label class="checkbox inline"> <input type=checkbox name="plctypes" id="plctypes7" value="ZAQ" /> Popular Zoo, Aquarium & Amusement Park </label> 
								<label class="checkbox inline"> <input type=checkbox name="plctypes" id="plctypes8" value="STR" /> Sight Seeing Tours and Travels </label>
								<label class="checkbox inline"> <input type=checkbox name="plctypes" id="plctypes5" value="CMT" /> Church	</label> 
								<label class="checkbox inline"> <input type=checkbox name="plctypes" id="plctypes9" value="MOS" /> Mosque	</label> 
								<label class="checkbox inline"> <input type=checkbox name="plctypes" id="plctypes10" value="TMP" /> Temple	</label> 
								
							</p>
							<a href="#" class="btn btn-danger" onclick="javascript: searchTripPlaces(); return false;">Search Places</a>
						</form>
					</div>
				</div>
			</section>
		</div>


<form:form modelAttribute="tripplanform" method="post" action="/travelitrips/tripplan">

<c:if test="${not empty rsltmap}">

			<%
				int i = 0;
				boolean flgendrow = false;
			%>
	
	<c:forEach items="${rsltmap}" var="mapitem">
	
			<%
					if (i == 0) {
					   flgendrow = false;
			%>
				<div class="row-fluid">
			<%
					}
			%>
					<c:choose>
						<c:when test="${mapitem.key=='BRK'}">
							<c:set var="hdrmssg" scope="request" value="Brekfast, Cafe & Brunch places"></c:set>		
						</c:when>
						<c:when test="${mapitem.key=='LCH'}">
							<c:set var="hdrmssg" scope="request" value="Popular Lunch Restaurants"></c:set>		
						</c:when>
						<c:when test="${mapitem.key=='DNR'}">
							<c:set var="hdrmssg" scope="request" value="Top Fine Dining Restaurants"></c:set>		
						</c:when>
						<c:when test="${mapitem.key=='NCB'}">
							<c:set var="hdrmssg" scope="request" value="Nightclub, Bolling Alley, Casino"></c:set>		
						</c:when>
						<c:when test="${mapitem.key=='CMT'}">
							<c:set var="hdrmssg" scope="request" value="Popular Church"></c:set>		
						</c:when>
						<c:when test="${mapitem.key=='MOS'}">
							<c:set var="hdrmssg" scope="request" value="Popular Mosque"></c:set>		
						</c:when>
						<c:when test="${mapitem.key=='TMP'}">
							<c:set var="hdrmssg" scope="request" value="Popular Temple"></c:set>		
						</c:when>
						<c:when test="${mapitem.key=='MSM'}">
							<c:set var="hdrmssg" scope="request" value="Museum, City Hall & Art Gallery"></c:set>		
						</c:when>
						<c:when test="${mapitem.key=='ZAQ'}">
							<c:set var="hdrmssg" scope="request" value="Zoo, Aquarium, Garden & Amusement Park"></c:set>		
						</c:when>
						<c:otherwise>
							<c:set var="hdrmssg" scope="request" value="Sigh seeing Tours & Travel Agencies"></c:set>		
						</c:otherwise>
					</c:choose>


					<div class="span4">
						<div class="card">
							<div class="card-heading">
								<h3>${hdrmssg }</h3>
							</div>
							<div class="card-body">
									<c:if test="${not empty mapitem.value}">
										<c:forEach items="${mapitem.value}" var="tripplace">
											<div class="row-fluid">
	
												<div class="span12">
													<p>
														<img class="img-polaroid"
															src="http://maps.googleapis.com/maps/api/streetview?size=400x100&sensor=false&location=${tripplace.geometry}&key=AIzaSyCXasoa_-_S00WnsdIDBfV4eX9G7Rhnz0U" />
													</p>
													<address>
														<b>${tripplace.name}</b><br />
														${tripplace.formattedAddress}
														<c:if test="${not empty tripplace.rating}">
															<abbr title="Rating">Rating:</abbr>
															<span class="badge badge-important">${tripplace.rating}</span>
														</c:if>
													</address>
													
													<c:choose>
															<c:when test="${mapitem.key=='BRK'}">
																<form:checkbox path="brkfstplaces" value="${tripplace.name};${tripplace.formattedAddress};${tripplace.geometry}" /> Select
															</c:when>
															<c:when test="${mapitem.key=='LCH'}">
																<form:checkbox path="lunchplaces" value="${tripplace.name};${tripplace.formattedAddress};${tripplace.geometry}" /> Select
															</c:when>
															<c:when test="${mapitem.key=='DNR'}">
																<form:checkbox path="dinnrplaces" value="${tripplace.name};${tripplace.formattedAddress};${tripplace.geometry}" /> Select
															</c:when>
															<c:when test="${mapitem.key=='NCB'}">
																<form:checkbox path="nghtlifeplaces" value="${tripplace.name};${tripplace.formattedAddress};${tripplace.geometry}" /> Select
															</c:when>
															<c:when test="${mapitem.key=='CMT'}">
																<form:checkbox path="churches" value="${tripplace.name};${tripplace.formattedAddress};${tripplace.geometry}" /> Select
															</c:when>
															<c:when test="${mapitem.key=='MOS'}">
																<form:checkbox path="mosques" value="${tripplace.name};${tripplace.formattedAddress};${tripplace.geometry}" /> Select
															</c:when>
															<c:when test="${mapitem.key=='TMP'}">
																<form:checkbox path="temples" value="${tripplace.name};${tripplace.formattedAddress};${tripplace.geometry}" /> Select
															</c:when>
															<c:when test="${mapitem.key=='MSM'}">
																<form:checkbox path="artgalleries" value="${tripplace.name};${tripplace.formattedAddress};${tripplace.geometry}" /> Select
															</c:when>
															<c:when test="${mapitem.key=='ZAQ'}">
																<form:checkbox path="zoo_aquariums" value="${tripplace.name};${tripplace.formattedAddress};${tripplace.geometry}" /> Select
															</c:when>
															<c:otherwise>
																<form:checkbox path="sightseeingtours" value="${tripplace.name};${tripplace.formattedAddress};${tripplace.geometry}" /> Select
															</c:otherwise>
													</c:choose>
													
													
												</div>
	
											</div>
											<hr />
										</c:forEach>
									</c:if>
									
									
							</div>
							
							
						</div> <!-- card -->
					</div> <!-- span4 -->
					
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
		</div><!-- end row -->
			<%
				}
			%>



		<div class="row-fluid">
			<!-- Trip plan save ================================================== -->
			<section id="trip-plan-save">
				<div class="card">
					<div class="card-body">
						<p>
							<h3>Keep any Note or comments in the Trip plan Note box below. Once you have added the point of interests in your Trip Plan then click the Save My Trip plan 
							button below to save the Trip Plan</h3>
						</p>
						<p>
							<b>Trip Note (if any)?:</b>
							<form:textarea rows="10" class="field span11" path="tripplannote" />
						</p>
						<p align="center">
							<input type="hidden" value="${triptitle}" id="triptitle" name="triptitle" /> 
							<input type="hidden" value="${tripplace}" id="tripplace" name="tripplace" /> 
							<input type="hidden" value="${tripid}" id="tripid" name="tripid" />

							<button class="btn btn-primary btn-large" type="submit">Save My Trip Plan<i class="icon-save"></i></button>
						</p>
					</div>
				</div>
			</section>

			</c:if>

		</div>
		</form:form>

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

	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="<c:url value="/resources/js/bootstrap.js" />"></script>
	<script src="<c:url value="/resources/js/createtrip.js" />"></script>
	<script>
		function searchTripPlaces() {
			var srch_url = "/travelitrips/tripplan?tripid=" + $("#tid").val()
					+ "&actn=SRCH&plctypes=";
			var slctcnt = 0;

			if ($("#plctypes1").is(":checked")) {
				srch_url = srch_url + $("#plctypes1").val() + ";";
				slctcnt++;
			}

			if ($("#plctypes2").is(":checked")) {
				srch_url = srch_url + $("#plctypes2").val() + ";";
				slctcnt++;
			}

			if ($("#plctypes3").is(":checked")) {
				srch_url = srch_url + $("#plctypes3").val() + ";";
				slctcnt++;
			}

			if ($("#plctypes4").is(":checked")) {
				srch_url = srch_url + $("#plctypes4").val() + ";";
				slctcnt++;
			}

			if ($("#plctypes5").is(":checked")) {
				srch_url = srch_url + $("#plctypes5").val() + ";";
				slctcnt++;
			}

			if ($("#plctypes6").is(":checked")) {
				srch_url = srch_url + $("#plctypes6").val() + ";";
				slctcnt++;
			}

			if ($("#plctypes7").is(":checked")) {
				srch_url = srch_url + $("#plctypes7").val() + ";";
				slctcnt++;
			}

			if ($("#plctypes8").is(":checked")) {
				srch_url = srch_url + $("#plctypes8").val() + ";";
				slctcnt++;
			}
			
			if ($("#plctypes9").is(":checked")) {
				srch_url = srch_url + $("#plctypes9").val() + ";";
				slctcnt++;
			}
			
			if ($("#plctypes10").is(":checked")) {
				srch_url = srch_url + $("#plctypes10").val() + ";";
				slctcnt++;
			}

			if (slctcnt > 6 || slctcnt < 3) {
				alert("You can select maximum six categories...minimum 3 categories...");
				return false;
			}

			window.location.href = srch_url;
			//alert(srch_url);
			//return false;
		}
	</script>

</body>
</html>
