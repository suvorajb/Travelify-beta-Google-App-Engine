<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Travelify - My Trip List...</title>
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

.greybox {
	background-color: #E5E5E5;
	position: relative;
	margin: 15px 0;
	padding: 39px 19px 14px;
	*padding-top: 19px;
	border: 1px solid #ebebeb;
	-webkit-border-radius: 2px;
	-moz-border-radius: 2px;
	border-radius: 2px;
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

	<!-- Subhead ================================================== -->
	<header class="jumbotron subhead" id="overview">
		<div class="container-fluid">
			<h1>My Trips...</h1>
			<p class="lead">Your Trip Listing...</p>
		</div>
	</header>

	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12">

				<c:if test="${not empty triplist}">

					<!-- trips ================================================== -->
					<section id="most-viewed-trips">
						<div class="card">
							<div class="card-body">
								<div class="row-fluid">
									<p>
									<h1>My recently saved Trips</h1>
									</p>
								</div>
								<div class="row-fluid">
									<div class="span12 greybox">

										<c:forEach items="${triplist}" var="trip">
											<div class="row-fluid">

												<div class="span12">
													<div class="card">
														<div class="card-body">
															<div class="row-fluid">
																<div class="span8">
																	<h2>${trip.triptitle}</h2>
																	<span>Published on ${trip.createddt} </span>
																	<p>
																		Trip Destination: ${trip.tripplace } Days:
																		${trip.tripduration }
																	</p>
																	<p>
																		<c:if test="${trip.tripplancount>0}"><a class="btn btn-success" href="/travelitrips/viewtripplan?tripid=${trip.tripid}">View Places on my Trip Plan</a> </c:if>
																		<c:if test="${trip.tripplancount==0}"> NO Trip Plan Posted 
																		<a href="/travelitrips/tripplan?action=add&tripid=${trip.tripid}" class="btn btn-primary">Add Places to Your Trip <i class="icon-plus-sign"></i></a>
																		&nbsp;&nbsp; &nbsp; &nbsp; 
																		</c:if>
																		<a href="/travelitrips/viewtrip?tripid=${trip.tripid}" class="btn btn-danger">View Trip</a>
																	</p>
																</div>
																<div class="span4">
																	<p>
																		<div id="fb-root"></div>
																			<script>(function(d, s, id) {
																			  var js, fjs = d.getElementsByTagName(s)[0];
																			  if (d.getElementById(id)) return;
																			  js = d.createElement(s); js.id = id;
																			  js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId=616758735053201";
																			  fjs.parentNode.insertBefore(js, fjs);
																			}(document, 'script', 'facebook-jssdk'));</script>
																			
																			<div class="fb-like" data-href='<c:url value="https://gcdc2013-travelify.appspot.com/travelitrips/viewtrip?tripid=${trip.tripid}&triptitle=${trip.triptitle}"></c:url>' data-width="80" data-layout="standard" data-action="like" data-show-faces="true" data-share="true"></div>
																		</p>
																		<p>
																			<!-- Place this tag where you want the +1 button to render. -->
																			<div class="g-plusone" data-annotation="inline" data-width="300" data-href="<c:url value="https://gcdc2013-travelify.appspot.com/travelitrips/viewtrip?tripid=${trip.tripid}&triptitle=${trip.triptitle}"></c:url>"></div>
																			
																			<!-- Place this tag after the last +1 button tag. -->
																			<script type="text/javascript">
																			  (function() {
																			    var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
																			    po.src = 'https://apis.google.com/js/plusone.js';
																			    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
																			  })();
																			</script>
																		</p>
																		<p> <h4>${trip.tipscount} Tips Posted</h4></p>
																		
																</div>
															</div>
														</div>
													</div>
												</div>
												
											</div>

										</c:forEach>


									</div>
								</div>
							</div>
						</div>
					</section>

				</c:if>




				<c:if test="${empty triplist}">


					<!-- Trip plan save ================================================== -->
					<section id="no-trip">
						<div class="card">
							<div class="card-body">
								<p>
								<center>
									<h3>
										You don't have any Trip yet... <a class="btn btn-large btn-primary" href="/travelitrips/createtrip">Create A Trip</a>
									</h3>
								</center>
							</div>
						</div>
					</section>

				</c:if>



			</div>
		</div>

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
</body>
</html>
