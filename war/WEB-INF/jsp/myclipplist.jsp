<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Travelify - My Clipped place List...</title>
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
			margin:50px auto;
			padding:20px;
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
		<div class="container-fluid"><h1>My Favourite Clipped Places...</h1></div>
	</header>

	<div class="container-fluid">
		<div class="row-fluid">
			<div class="card">
				<div class="card-body">
					<p><h1>Create a board with your clipped places and help others discover new places <a class="btn btn-large btn-danger" href="/traveliboards/createboard">Create A Board</a> </h1></p>
				</div>
			</div>
		</div>

		<c:if test="${not empty clipplist}">
			<%
				int i = 0;
				boolean flgendrow = false;
			%>

			<c:forEach items="${clipplist}" var="clip">
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
						<div class="card-body">
							<h2>${clip.plcname}</h2>
							Clipped On ${clip.clippeddate }
							<p>
								<img class="img-polaroid"
									src="http://maps.googleapis.com/maps/api/streetview?size=400x100&sensor=false&location=${clip.plcaddrss}&key=AIzaSyCXasoa_-_S00WnsdIDBfV4eX9G7Rhnz0U" />
							<address>
								<h3>${clip.plcaddrss}</h3>
							</address>
							</p>
							<p><a class="btn btn-danger" href="#"  onclick="javascript: deleteclippedplace('${clip.clippedid}', this); return false;">Delete or Unclip</a></p>
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


		<c:if test="${empty clipplist}">

			<div class="row-fluid">
				<div class="span12">
					<!-- Trip plan save ================================================== -->
					<section id="no-clip">
						<div class="card">
							<div class="card-body">
								<p>
								<center>
									<h3>You don't have any clipped places... Borwse
										Travelicity and Travelinearby and clip the place you want to
										access later</h3>
								</center>
							</div>
						</div>
					</section>
				</div>
			</div>
		</c:if>





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

	<div id="clipmodal" class="modal hide fade" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"></div>

 	</div><!--/.fluid-container-->

	<script src="<c:url value="/resources/js/jquery.min.js" />"></script>
	<script src="<c:url value="/resources/js/bootstrap.js" />"></script>
	
	 <script>
		function deleteclippedplace(clipid, bttn) {
			var clipdel_url = "/deleteclip?clipid="+clipid;
			//alert(clipdel_url);
			$.getJSON(clipdel_url, function(data) {
			})
			.done(function() {
				$('#clipmodal').html('<h3>This clipped place is deleted successfully... pls refresh this page</h3><button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>');
				$('#clipmodal').modal('show');
				bttn.className ="btn btn-danger disabled";
			})
			.fail(function() {
				$('#clipmodal').html('<h3>Something went wrong... pls try again later...</h3><button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>');
				$('#clipmodal').modal('show');
			});
			
		}
    </script>
</body>
</html>
