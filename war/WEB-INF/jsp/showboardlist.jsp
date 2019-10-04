<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en" itemscope itemtype="http://schema.org/Blog">
<head>
<meta charset="utf-8">
<title>Travelify - Beautiful PlaceBoard to share the places you love with others</title>
<!-- Always force latest IE rendering engine (even in intranet) & Chrome Frame -->
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<meta itemprop="name" content="Travelify - Your friend while travelling...">
<meta itemprop="description" content="Travelify - A Social Travel application to your all travel needs... a true friend while travelling...">
<meta itemprop="image" content="http://gcdc2013-travelify.appspot.com/resources/img/travelify-logo.gif">
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
		<h1>Create a beautiful TraveliBoard and clip the places you love <a class="btn btn-large btn-primary" href="/traveliboards/createboard">Create TraveliBoard</a> </h1>
	</div>
</header>
	
<div class="container">
	<div class="row">
		<div class="card span12">
          <div class="card-body">
		     <p align="center"><h4>Filter Boards By Category: 
		     <a href="/traveliboards?cat=FD">Food & Drink</a> | 
		     <a href="/traveliboards?cat=AR">Architecture</a> | 
		     <a href="/traveliboards?cat=AE">Adult Entertainment</a> | 
		     <a href="/traveliboards?cat=TH">Theater</a> | 
			 <a href="/traveliboards?cat=PO">Point of Interests</a> | 
			 <a href="/traveliboards?cat=SH">Shopping</a> |
			 <a href="/traveliboards/">Show All Boards</a> 
			 </h4>
			 </p>
          </div><!--/.well -->
        </div><!--/span-->
	</div>
	<div class="row">
        
        
		<div class="span12">
			
			
					<c:if test="${not empty boardlist}">
									<%
										int i = 0;
										int j = 0;
										boolean flgendrow = false;
									%>
									<c:forEach items="${boardlist}" var="board">
										<%
											if (i == 0) {
											   flgendrow = false;
										%>
										<div class="row-fluid">
											<%
												}
											%>
										<div class="span4">
											<div class="card">
												   <div class="card-heading image">
												   	  <img src="${board.uprofilestr}" />
												      <div class="card-heading-header">
												         <h4>${board.shortboardtitle}</h4>
												         <span>${board.publshddatestr} <br/>By ${board.unickname}</span>
												      </div>
												   </div>
												   <div class="card-body">
												      <p><span class="label label-success">${board.boardtype }</span> | <span class="label label-warning">${board.location }</span></p>												   
												      <p><a class="card-media-container" href="/traveliboards/showboard?boardid=${board.boardid}">
												         <img src="${board.boardphotourl }" class="img-polaroid menu_img_style"/></a>
												      </p>
												   </div>
												   <div class="card-actions">
												      <p>
												      <a class="btn btn-primary" href="/traveliboards/showboard?boardid=${board.boardid}">View TraveliBoard</a>
												      	<span class="btn btn-danger g-interactivepost"
														  data-contenturl="http://gcdc2013-travelify.appspot.com/traveliboards/showboard?boardid=${board.boardid}" 
														  data-clientid="58996761750.apps.googleusercontent.com" 
														  data-cookiepolicy="single_host_origin" 
														  data-prefilltext="${board.boardtitle} : ${board.boardnote}" 
														  data-calltoactionlabel="VIEW" 
														  data-calltoactionurl="http://gcdc2013-travelify.appspot.com/traveliboards/showboard?boardid=${board.boardid}"> 
														  <i class="icon-google-plus"></i> | Share in Your Circle
														 </span>
												      </p>
												   </div>
												   
												   <div class="card-comments">
												      <div class="comments-collapse-toggle">
												         <a data-toggle="collapse" data-target="#c<%=j%>-comments" href="#c<%=j%>-comments">${board.commentscount} Comments <i class="icon-angle-down"></i></a>
												      </div>
												      
												      <div id="c<%=j%>-comments" class="comments collapse">
												      	<c:if test="${not empty board.commentslist }">
												      	<c:forEach items="${board.commentslist }" var="comment">
													         <div class="media">
													            <a class="pull-left card-heading image" href="#">
													               <img class="media-object" src="${comment.uprofilestr}" alt="${comment.unickname }"/>
													            </a>
													            <div class="media-body">
													               <h4 class="media-heading">By ${comment.unickname }</h4>
													               <p>${comment.commentdata }</p>
													            </div>
													         </div>
													     </c:forEach>
												         </c:if>
												      </div>
												      
												   </div>												   
											</div>
										</div>	
										<%
											i++;
											j++;
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
											if (flgendrow == false) {
										%>
											</div> <!-- end row -->
										<%
											}
										%>
					</c:if>


					<c:if test="${empty boardlist}">

						<!-- No Board ================================================== -->
						<section id="no-board">
							<div class="card">
								<div class="card-body">
									<p align="center">
										<h3>There is no TraveliBoard created by anyone... Why don't you create a TraveliBoard with places you love and help others dicovers new places to explore
										</h3>
									</p>
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
	<script type="text/javascript">
	  (function() {
	   var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
	   po.src = 'https://apis.google.com/js/client:plusone.js';
	   var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
	 })();
	</script>
	
</body>
</html>
