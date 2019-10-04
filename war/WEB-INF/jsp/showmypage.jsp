<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Travelify - My profile...</title>
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

.menu_img_style {
	width: 320px;
	height: 250px;
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
							<p><a href="${hrefscr}" class="btn btn-danger"><i class="icon-google-plus"></i> | Sign in with Google</a></p>
						</c:otherwise>
					</c:choose>
				</span>
			</div>

		</div>
	</div>

	<!-- Subhead
================================================== -->

	<div class="container">
		<div class="row">
			<div class="span6">

				<!-- profile ================================================== -->
				<section id="profile">
					<div class="card">
						<div class="card-body">
								
									<div class="row-fluid">
										<div class="span4">
										<p>
											<c:if test="${not empty tuser}">
												<img src="https://plus.google.com/s2/photos/profile/${tuser.ugplusid }?sz=200" id="usrProfilePic" class="img-polaroid"/> 
											</c:if>
											<c:if test="${empty tuser}">
												<img src="/resources/img/default_avatar.jpg" id="usrProfilePic" class="img-polaroid"/> 
											</c:if>
										</p>
										</div>
										<div class="span8">
										<c:if test="${not empty user}">
											<span id="usrDisplayName"><h2>Hello, ${user.nickname}!</h2></span> 
										</c:if>
										<button style="visibility: hidden" class="btn btn-danger" id="connectgplus"><i class="icon-google-plus"></i> | Connect Your Google+ Profile</button>
										<button style="visibility: hidden" class="btn btn-danger" id="disconnectgplus"><i class="icon-google-plus"></i> | Disconnect Your Google+ Profile</button>
										<span class="btn btn-success g-interactivepost"
										  data-contenturl="http://gcdc2013-travelify.appspot.com/home" 
										  data-clientid="58996761750.apps.googleusercontent.com" 
										  data-cookiepolicy="single_host_origin" 
										  data-prefilltext="Hi friends, I've been using Travelify for a while and this is an awesome travel app for Travelers like us... #Travelify" 
										  data-calltoactionlabel="INVITE" 
										  data-calltoactionurl="http://gcdc2013-travelify.appspot.com/home"> 
										  <i class="icon-google-plus"></i> | Invite Friends in your Google+ Circle
										 </span>
										</div>
									</div>
								
								
						</div>
					</div>
				</section>
			</div>
			
			<div class="span6">
				<!-- profilestat ================================================== -->
				<section id="profile">
				
					<div class="card">
						<h3 class="card-heading simple">My Travelify Statistics</h3>
						<div class="card-body">
							<c:if test="${not empty tuser}">
								<div class="row-fluid"><div class="span6"><h4>I have [${tuser.myboardscount}] TraveliBoards Created</h4></div> <div class="span6"><a href="/traveliboards/myboardlist" class="btn btn-primary">View All Boards</a></div></div>
								<div class="row-fluid"><div class="span6"><h4>I have [${tuser.mytripscount}] Trips Shared </h4></div> <div class="span6"><a href="/travelitrips/mytriplist/" class="btn btn-success">View All Trips</a></div></div>
								<div class="row-fluid"><div class="span6"><h4>I have [${tuser.myclipscount}] Places Clipped </h4></div> <div class="span6"><a href="/myclippedlist/" class="btn btn-warning">View All Clips</a></div></div>
							</c:if>
						</div>
					</div>
				</section>
			</div>
		</div>
		
		
	<div id="frndList"></div>

	</div>
	
	<div id="mssgmodal" class="modal hide fade" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"></div>
		

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

<script type="text/javascript" src="/resources/js/gplusfetch.js"></script>
<script type="text/javascript" src="https://apis.google.com/js/client.js?onload=onloadInitialization"></script>
</body>
</html>
