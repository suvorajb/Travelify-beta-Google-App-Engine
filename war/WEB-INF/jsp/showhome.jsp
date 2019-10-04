<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Travelify - All Published and Shared Trips...</title>
<!-- Always force latest IE rendering engine (even in intranet) & Chrome Frame -->
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<meta name="robots" content="noindex, nofollow">
<meta name="googlebot" content="noindex, nofollow">

<link href='http://fonts.googleapis.com/css?family=Roboto:400,300,700' rel='stylesheet' type='text/css'>
<link href="<c:url value="/resources/css/bootplus.css" />" 	rel="stylesheet">
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

.paperclip{
			position:relative;
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


.bluebox {
 	background: #1f8dd6; /* same color as selected state on site menu */
    padding: 0.3em 1em;
    border-radius: 3px;
    color: #fff;
}

.menu_img_style {
	width: 320px;
	height: 200px;
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

<link type="text/css" href="<c:url value="/resources/css/bootplus-responsive.css" />" rel="stylesheet" />

<script src="<c:url value="/resources/js/jquery.min.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap.js" />"></script>


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
	<div class="container">
		<div class="row">
			<div class="bluebox"><p><h2>Quick Menu... </h2></p></div>
		</div>
		<div class="row">
		
			<div class="span4">
				<div class="card">
					   <div class="card-body">
					   	  <p><img src="/resources/img/travelinearby-img.jpg" class="img-polaroid menu_img_style"/></p>
					      <p><h2>Don't get lost while travelling</h2>
				      		Find the perfect restaurants, cafe, bar, night club around you to hangout or dine in. Quickly find essential stores, doctors, medicines and even spa, saloon 
				      		using TraveliNearby</p>
				      	  <p><a class="btn btn-primary" href="/travelinearby/">Click for Travelify Quick Nearby &raquo;</a></p>
					   </div>
				</div>
			</div>	<!-- end span -->
			
			<div class="span4">
				<div class="card">
					   <div class="card-body">
					   	   <p><img src="/resources/img/travelicity-img.jpg" class="img-polaroid menu_img_style"/></p>
					       <p><h2>Explore the city before you travel</h2>
				      		Travelicity shows the popular restaurants, hotels, museums, point of interests. So explore the places around before you actually visit the city and add to your 
				      		travel plan</p>
				      		<p><a class="btn btn-danger" href="/travelicity/">Click for Travelify City Guide &raquo;</a></p>
					   </div>
				</div>
			</div>	<!-- end span -->
			
			<div class="span4">
				<div class="card">
					   <div class="card-body">
					   	   <p><img src="/resources/img/travelitrips-img.jpg" class="img-polaroid menu_img_style"/></p>
					       <p><h2>Create Trip & Get Travel tips from others</h2>
				      		Going with family and kids? Just married and going for a romantic trip for two? No problem, use Travelify Trip planner to create a quick Trip plan and 
				      		get travel tips, recommendation from others.</p>
				      		<p> <a class="btn btn-warning" href="/travelitrips/">Click for Travelify Trip Planner &raquo;</a></p>
					   </div>
				</div>
			</div>	<!-- end span -->
						
		</div>
	</div>
</header>
	
<div class="container">
		<div class="row">
			<div class="bluebox"><p><h2>See what others are doing now... </h2></p></div>
		</div>
		
		<div class="row">
			<div class="span4">
					<h3>Recent Boards from <a class="btn btn-primary btn-large" href="/traveliboards/">TraveliBoards &raquo;</a></h3>
					<c:if test="${not empty boards}">
						<c:forEach items="${boards}" var="board">
								
							<div class="row-fluid">
								<div class="span12">
									<div class="card">
										   <div class="card-heading image">
										   		<img src="${board.uprofilestr}" />
										      <div class="card-heading-header">
										         <h4>${board.shortboardtitle}</h4>
										         <span>${board.publshddatestr} By ${board.unickname}</span>
										      </div>
										   </div>
										   <div class="card-body">
										      <p><span class="label label-success">${board.boardtype }</span> | <span class="label label-warning">${board.location }</span></p>												   
										      <p><img src="${board.boardphotourl }" class="img-polaroid menu_img_style"/></a></p>
										   </div>
									</div>
								</div>	
							</div>	<!-- end row -->
							
						</c:forEach>			
					</c:if>
			</div> <!--  end span -->
			
			<div class="span4">
					<h3>Recent Trips from <a class="btn btn-danger btn-large" href="/travelitrips/">TraveliTrips &raquo;</a></h3>
					<c:if test="${not empty trips}">
						<c:forEach items="${trips}" var="trip">
								
							<div class="row-fluid">
								<div class="span12">
									<div class="card">
										   <div class="card-heading image">
										   		<img src="${trip.uprofilestr}" />
										   	  <div class="card-heading-header">
										         <h4>${trip.shorttitle}</h4>
										         <span>${trip.publshddatestr} By ${trip.unickname}</span>
										      </div>
										   </div>
										   <div class="card-body">
												<p><span class="label label-success">${trip.tripplace}</span></p>										   
										      	<p><img src="${trip.tripstaticmap}"  class="img-polaroid menu_img_style"/></a></p>
												<p><c:if test="${not empty trip.tripnote}">${trip.tripnote}</c:if></p>
										   </div>
									</div>
								</div>	
							</div>	<!-- end row -->
							
						</c:forEach>			
					</c:if>
			</div> <!--  end span -->


			<div class="span4">
					<h3>Recently Clipped places <a class="btn btn-warning btn-large" href="/traveliclips/">View All &raquo;</a></h3>
					<c:if test="${not empty clips}">
						<c:forEach items="${clips}" var="clip">
								
							<div class="row-fluid">
								<div class="span12">
									<div class="card paperclip">
										<div class="card-heading image">
											<img src="${clip.uprofilestr}" />
									      	<div class="card-heading-header">
									         	<h4>${clip.shorttitle}</h4>
									         	<span>${clip.publshddatestr} By ${clip.unickname}</span>
									      	</div>
									   	</div>
										<div class="card-body">
											<p>
												<img  class="img-polaroid menu_img_style" 
													src="http://maps.googleapis.com/maps/api/streetview?size=320x200&sensor=false&location=${clip.plcaddrss}&key=AIzaSyCXasoa_-_S00WnsdIDBfV4eX9G7Rhnz0U" />
											<h4>${clip.plcaddrss}</h4>
											</p>
										</div>
									</div><!-- card -->
								</div>	
							</div>	<!-- end row -->
							
						</c:forEach>			
					</c:if>
			</div> <!--  end span -->			
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
	
	
</body>
</html>
