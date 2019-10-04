<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Travelify -City Guide...</title>
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
						<li><a href="/travelicity/" class="active">TraveliCity</a></li>
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

	<!-- Subhead ================================================= -->
	<header class="jumbotron subhead" id="overview">
		<div class="container">
			<h1>Travelify City Guide...</h1>
			<p class="lead">Click to explore popular city below or select from the drop down...</p>
		</div>
	</header>


	<div class="container">
		<div class="row">
			<div class="span12">


				<!-- city-drop down  ================================================== -->
				<section id="city-drop-down">
					<div class="card">
						<div class="card-body">
							<p align="center">
								<form:form modelAttribute="citysearchform" action="/travelicity/guide/" method="post"> 
								<h4><b>Enter City name or Place: <form:input type="text" path="citynm" placeholder="e.g. Union Square, San Francisco" /> &nbsp;&nbsp;
								<button class="btn btn-info" type="submit">View &raquo;</button> 
								</h4>
								</form:form>
								<b>Or Click the Popular City below to explore more...</b>
							</p>
						</div>
					</div>
				</section>
				
				
				
		<!-- City Grid ================================================== -->
		<section id="city-grid">
		  <div class="row">
			 <div class="span12"><div class="bluebox"><p><h2>Some Popular Tourist Destinations in the World</h2></p></div></div>
		  </div>
          
          <div class="row">
			<div class="span12">
					<div class="card">
						<div class="card-body">
							
							<div class="tabbable">
				              <ul class="nav nav-tabs">
				                <li class="active"><a href="#tab1" data-toggle="tab">Africa</a></li>
				                <li><a href="#tab2" data-toggle="tab">Asia</a></li>
				                <li><a href="#tab3" data-toggle="tab">Australia & the Pacific Islands</a></li>
				                <li><a href="#tab4" data-toggle="tab">Caribbean</a></li>
				                <li><a href="#tab5" data-toggle="tab">Europe</a></li>
				                <li><a href="#tab6" data-toggle="tab">Mexico</a></li>
				                <li><a href="#tab7" data-toggle="tab">Middle East</a></li>
				                <li><a href="#tab8" data-toggle="tab">Canada</a></li>
				                <li><a href="#tab9" data-toggle="tab">South America</a></li>
				              </ul>
				              <div class="tab-content">
				                <div class="tab-pane active" id="tab1">
				                  <p>
				                  	<ul class="thumbnails">
				                  		<li><a href="/travelicity/guide/Cairo"  class="thumbnail">Cairo</a></li>
				                  		<li><a href="/travelicity/guide/Marrakech"  class="thumbnail">Marrakech</a></li>
				                  		<li><a href="/travelicity/guide/Luxor"  class="thumbnail">Luxor</a></li>
				                  		<li><a href="/travelicity/guide/Casablanca"  class="thumbnail">Casablanca</a></li>
				                  		<li><a href="/travelicity/guide/Tunis"  class="thumbnail">Tunis</a></li>
				                  		<li><a href="/travelicity/guide/Cape Town"  class="thumbnail">Cape Town</a></li>
				                  		<li><a href="/travelicity/guide/Nairobi"  class="thumbnail">Nairobi</a></li>
				                  		<li><a href="/travelicity/guide/Sharm El Sheikh"  class="thumbnail">Sharm El Sheikh</a></li>
				                  		<li><a href="/travelicity/guide/Johannesburg"  class="thumbnail">Johannesburg</a></li>
				                  		<li><a href="/travelicity/guide/Alexandria"  class="thumbnail">Alexandria</a></li>
				                  	</ul>
				                  </p>
				                </div>
				                <div class="tab-pane" id="tab2">
				                  <p>
				                  	<ul class="thumbnails">
				                  		<li><a href="/travelicity/guide/Singapore"  class="thumbnail">Singapore</a></li>
				                  		<li><a href="/travelicity/guide/Bangkok"  class="thumbnail">Bangkok</a></li>
				                  		<li><a href="/travelicity/guide/Tokyo"  class="thumbnail">Tokyo</a></li>
				                  		<li><a href="/travelicity/guide/Shanghai"  class="thumbnail">Shanghai</a></li>
				                  		<li><a href="/travelicity/guide/Taipei"  class="thumbnail">Taipei</a></li>
				                  		<li><a href="/travelicity/guide/Hong Kong"  class="thumbnail">Hong Kong</a></li>
				                  		<li><a href="/travelicity/guide/Beijing"  class="thumbnail">Beijing</a></li>
				                  		<li><a href="/travelicity/guide/Seoul"  class="thumbnail">Seoul</a></li>
				                  		<li><a href="/travelicity/guide/Kuala Lumpur"  class="thumbnail">Kuala Lumpur</a></li>
				                  		<li><a href="/travelicity/guide/Jakarta"  class="thumbnail">Jakarta</a></li>
				                  		<li><a href="/travelicity/guide/Mumbai"  class="thumbnail">Mumbai</a></li>
				                  		<li><a href="/travelicity/guide/Delhi"  class="thumbnail">Delhi</a></li>
				                  		<li><a href="/travelicity/guide/Kolkata"  class="thumbnail">Kolkata</a></li>
				                  		<li><a href="/travelicity/guide/Chennai"  class="thumbnail">Chennai</a></li>
				                  		<li><a href="/travelicity/guide/Bangalore"  class="thumbnail">Bangalore</a></li>
				                  	</ul>
				                  </p>
				                </div>
				                <div class="tab-pane" id="tab3">
				                   <p>
				                  	<ul class="thumbnails">
				                  		<li><a href="/travelicity/guide/Sydney"  class="thumbnail">Sydney</a></li>
				                  		<li><a href="/travelicity/guide/Auckland"  class="thumbnail">Auckland</a></li>
				                  		<li><a href="/travelicity/guide/Perth"  class="thumbnail">Perth</a></li>
				                  		<li><a href="/travelicity/guide/Wellington"  class="thumbnail">Wellington</a></li>
				                  		<li><a href="/travelicity/guide/Adelaide"  class="thumbnail">Adelaide</a></li>
				                  		<li><a href="/travelicity/guide/Melbourne"  class="thumbnail">Melbourne</a></li>
				                  		<li><a href="/travelicity/guide/Queenstown"  class="thumbnail">Queenstown</a></li>
				                  		<li><a href="/travelicity/guide/Brisbane"  class="thumbnail">Brisbane</a></li>
				                  		<li><a href="/travelicity/guide/Kuala Lumpur"  class="thumbnail">Kuala Lumpur</a></li>
				                  	</ul>
				                  </p>
				                </div>
				                 <div class="tab-pane" id="tab4">
				                 <p>
				                  	<ul class="thumbnails">
				                  		<li><a href="/travelicity/guide/San Juan"  class="thumbnail">San Juan</a></li>
				                  		<li><a href="/travelicity/guide/Nassau"  class="thumbnail">Nassau</a></li>
				                  		<li><a href="/travelicity/guide/Havana"  class="thumbnail">Havana</a></li>
				                  		<li><a href="/travelicity/guide/Charlotte Amalie"  class="thumbnail">Charlotte Amalie</a></li>
				                  		<li><a href="/travelicity/guide/Punta Cana"  class="thumbnail">Punta Cana</a></li>
				                  		<li><a href="/travelicity/guide/Cruz Bay"  class="thumbnail">Cruz Bay</a></li>
				                  		<li><a href="/travelicity/guide/Santo Domingo"  class="thumbnail">Santo Domingo</a></li>
				                  		<li><a href="/travelicity/guide/Montego Bay"  class="thumbnail">Montego Bay</a></li>
				                  	</ul>
				                  </p>
				                </div>
				                 <div class="tab-pane" id="tab5">
				                  <p><ul class="thumbnails">
				                  		<li><a href="/travelicity/guide/London"  class="thumbnail">London</a></li>
				                  		<li><a href="/travelicity/guide/Rome"  class="thumbnail">Rome</a></li>
				                  		<li><a href="/travelicity/guide/Istanbul"  class="thumbnail">Istanbul</a></li>
				                  		<li><a href="/travelicity/guide/Berlin"  class="thumbnail">Berlin</a></li>
				                  		<li><a href="/travelicity/guide/Venice"  class="thumbnail">Venice</a></li>
				                  		<li><a href="/travelicity/guide/Paris"  class="thumbnail">Paris</a></li>
				                  		<li><a href="/travelicity/guide/Barcelona"  class="thumbnail">Barcelona</a></li>
				                  		<li><a href="/travelicity/guide/Madrid"  class="thumbnail">Madrid</a></li>
				                  		<li><a href="/travelicity/guide/Florence"  class="thumbnail">Florence</a></li>
				                  	</ul>
				                  </p>
				                </div>
				                 <div class="tab-pane" id="tab6">
				                  <p>
				                  	<ul class="thumbnails">
				                  		<li><a href="/travelicity/guide/cancun"  class="thumbnail">Cancun</a></li>
				                  		<li><a href="/travelicity/guide/Puerto Morelos"  class="thumbnail">Puerto Morelos</a></li>
				                  		<li><a href="/travelicity/guide/Tijuana"  class="thumbnail">Tijuana</a></li>
				                  		<li><a href="/travelicity/guide/Chapala"  class="thumbnail">Chapala</a></li>
				                  		<li><a href="/travelicity/guide/Merida"  class="thumbnail">Merida</a></li>
				                  		<li><a href="/travelicity/guide/Acapulco"  class="thumbnail">Acapulco</a></li>
				                  		<li><a href="/travelicity/guide/Puerto Vallarta"  class="thumbnail">Puerto Vallarta</a></li>
				                  		<li><a href="/travelicity/guide/San Jose del Cabo"  class="thumbnail">San Jose del Cabo</a></li>
				                  	</ul>				                  
				                  </p>
				                </div>
				                 <div class="tab-pane" id="tab7">
				                  <p><ul class="thumbnails">
				                  		<li><a href="/travelicity/guide/Dubai"  class="thumbnail">Dubai</a></li>
				                  		<li><a href="/travelicity/guide/Jerusalem"  class="thumbnail">Jerusalem</a></li>
				                  		<li><a href="/travelicity/guide/Tel Aviv"  class="thumbnail">Tel Aviv</a></li>
				                  		<li><a href="/travelicity/guide/Abu Dhabi"  class="thumbnail">Abu Dhabi</a></li>
				                  		<li><a href="/travelicity/guide/Beirut"  class="thumbnail">Beirut</a></li>
				                  		<li><a href="/travelicity/guide/Doha"  class="thumbnail">Doha</a></li>
				                  		<li><a href="/travelicity/guide/Tehran"  class="thumbnail">Tehran</a></li>
				                  		<li><a href="/travelicity/guide/United Arab Emirates"  class="thumbnail">United Arab Emirates</a></li>
				                  		<li><a href="/travelicity/guide/Israel"  class="thumbnail">Israel</a></li>
				                  	</ul>
				                  </p>
				                </div>
				                 <div class="tab-pane" id="tab8">
				                  <p>
				                  	<ul class="thumbnails">
				                  		<li><a href="/travelicity/guide/Toronto"  class="thumbnail">Toronto</a></li>
				                  		<li><a href="/travelicity/guide/Vancouver"  class="thumbnail">Vancouver</a></li>
				                  		<li><a href="/travelicity/guide/Montreal"  class="thumbnail">Montreal</a></li>
				                  		<li><a href="/travelicity/guide/Niagara Falls City"  class="thumbnail">Niagara Falls City</a></li>
				                  		<li><a href="/travelicity/guide/Quebec City"  class="thumbnail">Quebec City</a></li>
				                  		<li><a href="/travelicity/guide/Ottawa"  class="thumbnail">Ottawa</a></li>
				                  		<li><a href="/travelicity/guide/Calgary"  class="thumbnail">Calgary</a></li>
				                  		<li><a href="/travelicity/guide/Victoria"  class="thumbnail">Victoria</a></li>
				                  	</ul>
				                  </p>
				                </div>
				                 <div class="tab-pane" id="tab9">
				                  <p>
				                  	<ul class="thumbnails">
				                  		<li><a href="/travelicity/guide/Buenos Aires"  class="thumbnail">Buenos Aires</a></li>
				                  		<li><a href="/travelicity/guide/Rio de Janeiro"  class="thumbnail">Rio de Janeiro</a></li>
				                  		<li><a href="/travelicity/guide/Sao Paulo"  class="thumbnail">Sao Paulo</a></li>
				                  		<li><a href="/travelicity/guide/Argentina"  class="thumbnail">Argentina</a></li>
				                  		<li><a href="/travelicity/guide/Chile"  class="thumbnail">Chile</a></li>
				                  		<li><a href="/travelicity/guide/Bolivia"  class="thumbnail">Bolivia</a></li>
				                  		<li><a href="/travelicity/guide/Venezuela"  class="thumbnail">Venezuela</a></li>
				                  		<li><a href="/travelicity/guide/Lima"  class="thumbnail">Lima</a></li>
				                  	</ul>
				                  </p>
				                </div>
				              </div>
				            </div> <!-- /tabbable -->
				            
						</div>
					</div>

			</div>
		</div>
		
		<div class="row">
			<div class="span12"><div class="bluebox"><p><h2>Popular Travel Destinations in USA</h2></p></div></div>
		</div>
		
		<div class="row">
            
			<div class="span3">
               <div class="card">
                 <h2 class="card-heading">New York</h2>
                  <div class="card-body">
                    <p>
						<a href="/travelicity/guide/New York">
							<img alt="New York, New York"
							 src="http://upload.wikimedia.org/wikipedia/commons/thumb/9/94/Top_of_Rock_Cropped.jpg/240px-Top_of_Rock_Cropped.jpg" width="300">
						</a>
					</p>
                    <p><a class="btn btn-info" href="/travelicity/guide/New York">View details &raquo;</a></p>
                  </div>
               </div>
            </div><!--/span-->
            <div class="span3">
               <div class="card">
                 <h2 class="card-heading">Los Angeles, CA</h2>
                  <div class="card-body">
                    <p>
						<a href="/travelicity/guide/Los Angeles,California">
							<img alt="Los Angeles,California"
							 src="http://upload.wikimedia.org/wikipedia/commons/thumb/5/57/LA_Skyline_Mountains2.jpg/240px-LA_Skyline_Mountains2.jpg" width="300">
						</a>
					</p>
                    <p><a class="btn btn-info" href="/travelicity/guide/Los Angeles,California">View details &raquo;</a></p>
                  </div>
               </div>
            </div><!--/span-->
            <div class="span3">
               <div class="card">
                 <h2 class="card-heading">Chicago, Illinois</h2>
                  <div class="card-body">
                    <p>
						<a href="/travelicity/guide/Chicago, Illinois">
							<img alt="Chicago, Illinois"
							 src="http://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/ChicagovanafSearsTower.jpg/230px-ChicagovanafSearsTower.jpg" width="300">
						</a>
					</p>
                    <p><a class="btn btn-info" href="/travelicity/guide/Chicago, Illinois">View details &raquo;</a></p>
                  </div>
               </div>
            </div><!--/span-->
			<div class="span3">
               <div class="card">
                 <h2 class="card-heading">San Diego, CA</h2>
                  <div class="card-body">
                    <p>
						<a href="/travelicity/guide/San Diego, California">
							<img alt="San Diego, California"
							 src="http://upload.wikimedia.org/wikipedia/commons/thumb/7/7c/SanDiegoSkylineBay.jpg/240px-SanDiegoSkylineBay.jpg" width="300">
						</a>
					</p>
                    <p><a class="btn btn-info" href="/travelicity/guide/San Diego, California">View details &raquo;</a></p>
                  </div>
               </div>
            </div><!--/span-->
			
          </div><!--/row-->
		 
		  
		  
          <div class="row-fluid">
            <div class="span3">
               <div class="card">
                 <h2 class="card-heading">Houston, Texas</h2>
                  <div class="card-body">
                    <p>
						<a href="/travelicity/guide/Houston, Texas">
							<img alt="Houston, Texas"
							 src="http://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Panoramic_Houston_skyline.jpg/640px-Panoramic_Houston_skyline.jpg" width="300">
						</a>
					</p>
                    <p><a class="btn btn-info" href="/travelicity/guide/Houston, Texas">View details &raquo;</a></p>
                  </div>
               </div>
            </div><!--/span-->
            <div class="span3">
               <div class="card">
                 <h2 class="card-heading">Philadelphia, PA</h2>
                  <div class="card-body">
                    <p>
						<a href="/travelicity/guide/Philadelphia, Pennsylvania">
							<img alt="Philadelphia, Pennsylvania"
							 src="http://upload.wikimedia.org/wikipedia/commons/thumb/4/4d/Philly_skyline.jpg/240px-Philly_skyline.jpg" width="300">
						</a>
					</p>
                    <p><a class="btn btn-info" href="/travelicity/guide/Philadelphia, Pennsylvania">View details &raquo;</a></p>
                  </div>
               </div>
            </div><!--/span-->
            <div class="span3">
               <div class="card">
                 <h2 class="card-heading">Phoenix, Arizona</h2>
                  <div class="card-body">
                    <p>
						<a href="/travelicity/guide/Phoenix, Arizona">
							<img alt="Phoenix, Arizona"
							 src="http://upload.wikimedia.org/wikipedia/commons/thumb/b/b9/Downtown_Phoenix_Aerial_Looking_Northeast.jpg/207px-Downtown_Phoenix_Aerial_Looking_Northeast.jpg" width="300">
						</a>
					</p>
                    <p><a class="btn btn-info" href="/travelicity/guide/Phoenix, Arizona">View details &raquo;</a></p>
                  </div>
               </div>
            </div><!--/span-->
			<div class="span3">
               <div class="card">
                 <h2 class="card-heading">San Antonio, Texas</h2>
                  <div class="card-body">
                    <p>
						<a href="/travelicity/guide/San Antonio, Texas">
							<img alt="San Antonio, Texas"
							 src="http://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Downtown_San_Antonio_View.JPG/240px-Downtown_San_Antonio_View.JPG" width="300">
						</a>
					</p>
                    <p><a class="btn btn-info" href="/travelicity/guide/San Antonio, Texas">View details &raquo;</a></p>
                  </div>
               </div>
            </div><!--/span-->
			
          </div><!--/row-->
		 
		  
		  <div class="row-fluid">
            <div class="span3">
               <div class="card">
                 <h2 class="card-heading">Dallas, Texas</h2>
                  <div class="card-body">
                    <p>
						<a href="/travelicity/guide/Dallas, Texas">
							<img alt="Dallas, Texas"
							 src="http://upload.wikimedia.org/wikipedia/commons/thumb/f/f7/Xvisionx_Dallas_Stemmons.jpg/240px-Xvisionx_Dallas_Stemmons.jpg" width="300">
						</a>
					</p>
                    <p><a class="btn btn-info" href="/travelicity/guide/Dallas, Texas">View details &raquo;</a></p>
                  </div>
               </div>
            </div><!--/span-->
            <div class="span3">
               <div class="card">
                 <h2 class="card-heading">San Jose, CA</h2>
                  <div class="card-body">
                    <p>
						<a href="/travelicity/guide/Philadelphia, Pennsylvania">
							<img alt="San Jose, California"
							 src="http://upload.wikimedia.org/wikipedia/en/thumb/1/1c/Downtown_San_Jose.PNG/240px-Downtown_San_Jose.PNG" width="300">
						</a>
					</p>
                    <p><a class="btn btn-info" href="/travelicity/guide/San Jose, California">View details &raquo;</a></p>
                  </div>
               </div>
            </div><!--/span-->
            <div class="span3">
               <div class="card">
                 <h2 class="card-heading">Austin, Texas</h2>
                  <div class="card-body">
                    <p>
						<a href="/travelicity/guide/Austin, Texas">
							<img alt="Austin, Texas"
							 src="http://upload.wikimedia.org/wikipedia/commons/thumb/0/06/AustinSkylineLouNeffPoint-2010-03-29-b.JPG/240px-AustinSkylineLouNeffPoint-2010-03-29-b.JPG" width="300">
						</a>
					</p>
                    <p><a class="btn btn-info" href="/travelicity/guide/Austin, Texas">View details &raquo;</a></p>
                  </div>
               </div>
            </div><!--/span-->
			<div class="span3">
               <div class="card">
                 <h2 class="card-heading">Jacksonville, Florida</h2>
                  <div class="card-body">
                    <p>
						<a href="/travelicity/guide/Jacksonville, Florida">
							<img alt="Jacksonville, Florida"
							 src="http://upload.wikimedia.org/wikipedia/commons/thumb/a/a2/NightJXFL11.jpg/240px-NightJXFL11.jpg" width="300">
						</a>
					</p>
                    <p><a class="btn btn-info" href="/travelicity/guide/Jacksonville, Florida">View details &raquo;</a></p>
                  </div>
               </div>
            </div><!--/span-->
			
          </div><!--/row-->
		 
		  
		  <div class="row-fluid">
            <div class="span3">
               <div class="card">
                 <h2 class="card-heading">Indianapolis, Indiana</h2>
                  <div class="card-body">
                    <p>
						<a href="/travelicity/guide/Indianapolis, Indiana">
							<img alt="Indianapolis, Indiana"
							 src="http://upload.wikimedia.org/wikipedia/commons/thumb/1/16/Downtown_indy_from_parking_garage_zoom.JPG/213px-Downtown_indy_from_parking_garage_zoom.JPG" width="300">
						</a>
					</p>
                    <p><a class="btn btn-info" href="/travelicity/guide/Indianapolis, Indiana">View details &raquo;</a></p>
                  </div>
               </div>
            </div><!--/span-->
            <div class="span3">
               <div class="card">
                 <h2 class="card-heading">San Francisco, CA</h2>
                  <div class="card-body">
                    <p>
						<a href="/travelicity/guide/San Francisco, California">
							<img alt="San Francisco, California"
							 src="http://upload.wikimedia.org/wikipedia/commons/thumb/0/07/FinancialNorth.jpg/240px-FinancialNorth.jpg" width="300">
						</a>
					</p>
                    <p><a class="btn btn-info" href="/travelicity/guide/San Francisco, California">View details &raquo;</a></p>
                  </div>
               </div>
            </div><!--/span-->
            <div class="span3">
               <div class="card">
                 <h2 class="card-heading">Columbus, Ohio</h2>
                  <div class="card-body">
                    <p>
						<a href="/travelicity/guide/Columbus, Ohio">
							<img alt="Columbus, Ohio"
							 src="http://upload.wikimedia.org/wikipedia/commons/thumb/d/db/ColumbusNightSkyline2.jpg/240px-ColumbusNightSkyline2.jpg" width="300">
						</a>
					</p>
                    <p><a class="btn btn-info" href="/travelicity/guide/Columbus, Ohio">View details &raquo;</a></p>
                  </div>
               </div>
            </div><!--/span-->
			<div class="span3">
               <div class="card">
                 <h2 class="card-heading">Charlotte, NC</h2>
                  <div class="card-body">
                    <p>
						<a href="/travelicity/guide/Charlotte, North Carolina">
							<img alt="Charlotte, North Carolina"
							 src="http://upload.wikimedia.org/wikipedia/commons/thumb/e/e3/Skyline_of_Charlotte%2C_North_Carolina_%282008%29.jpg/213px-Skyline_of_Charlotte%2C_North_Carolina_%282008%29.jpg" width="300">
						</a>
					</p>
                    <p><a class="btn btn-info" href="/travelicity/guide/Charlotte, North Carolina">View details &raquo;</a></p>
                  </div>
               </div>
            </div><!--/span-->
			
          </div><!--/row-->
		  
		 
		  
		  <div class="row-fluid">
            <div class="span3">
               <div class="card">
                 <h2 class="card-heading">Boston, MA</h2>
                  <div class="card-body">
                    <p>
						<a href="/travelicity/guide/Boston, Massachusetts">
							<img alt="Boston, Massachusetts"
							 src="http://upload.wikimedia.org/wikipedia/commons/thumb/6/63/DowntownBoston.jpg/204px-DowntownBoston.jpg" width="300">
						</a>
					</p>
                    <p><a class="btn btn-info" href="/travelicity/guide/Boston, Massachusetts">View details &raquo;</a></p>
                  </div>
               </div>
            </div><!--/span-->
            <div class="span3">
               <div class="card">
                 <h2 class="card-heading">Seattle, Washington</h2>
                  <div class="card-body">
                    <p>
						<a href="/travelicity/guide/Seattle, Washington">
							<img alt="Seattle, Washington"
							 src="http://upload.wikimedia.org/wikipedia/commons/thumb/1/17/Seattle_skyline_night.jpg/216px-Seattle_skyline_night.jpg" width="300">
						</a>
					</p>
                    <p><a class="btn btn-info" href="/travelicity/guide/Seattle, Washington">View details &raquo;</a></p>
                  </div>
               </div>
            </div><!--/span-->
            <div class="span3">
               <div class="card">
                 <h2 class="card-heading">Denver, Colorado</h2>
                  <div class="card-body">
                    <p>
						<a href="/travelicity/guide/Denver, Colorado">
							<img alt="Denver, Colorado"
							 src="http://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/DenverCP.JPG/240px-DenverCP.JPG" width="300">
						</a>
					</p>
                    <p><a class="btn btn-info" href="/travelicity/guide/Denver, Colorado">View details &raquo;</a></p>
                  </div>
               </div>
            </div><!--/span-->
			<div class="span3">
               <div class="card">
                 <h2 class="card-heading">Washington, DC</h2>
                  <div class="card-body">
                    <p>
						<a href="/travelicity/guide/Washington,DC">
							<img alt="Washington, District of Columbia"
							 src="http://upload.wikimedia.org/wikipedia/commons/thumb/1/13/WashMonument_WhiteHouse.jpg/240px-WashMonument_WhiteHouse.jpg" width="300">
						</a>
					</p>
                    <p><a class="btn btn-info" href="/travelicity/guide/Washington,DC">View details &raquo;</a></p>
                  </div>
               </div>
            </div><!--/span-->
			
          </div><!--/row-->
		  
		 
		  
		  <div class="row-fluid">
            <div class="span3">
               <div class="card">
                 <h2 class="card-heading">Nashville, TN</h2>
                  <div class="card-body">
                    <p>
						<a href="/travelicity/guide/Nashville, Tennessee">
							<img alt="Nashville, Tennessee"
							 src="http://upload.wikimedia.org/wikipedia/commons/thumb/b/bf/Nashvilleskyline23.jpg/240px-Nashvilleskyline23.jpg" width="300">
						</a>
					</p>
                    <p><a class="btn btn-info" href="/travelicity/guide/Nashville, Tennessee">View details &raquo;</a></p>
                  </div>
               </div>
            </div><!--/span-->
            <div class="span3">
               <div class="card">
                 <h2 class="card-heading">Baltimore, Maryland</h2>
                  <div class="card-body">
                    <p>
						<a href="/travelicity/guide/Baltimore, Maryland">
							<img alt="Baltimore, Maryland"
							 src="http://upload.wikimedia.org/wikipedia/commons/thumb/1/17/Seattle_skyline_night.jpg/216px-Seattle_skyline_night.jpg" width="300">
						</a>
					</p>
                    <p><a class="btn btn-info" href="/travelicity/guide/Baltimore, Maryland">View details &raquo;</a></p>
                  </div>
               </div>
            </div><!--/span-->
            <div class="span3">
               <div class="card">
                 <h2 class="card-heading">Louisville, Kentucky</h2>
                  <div class="card-body">
                    <p>
						<a href="/travelicity/guide/Denver, Colorado">
							<img alt="Louisville, Kentucky"
							 src="http://upload.wikimedia.org/wikipedia/commons/thumb/e/e6/Louisville_skyline_night.jpg/240px-Louisville_skyline_night.jpg" width="300">
						</a>
					</p>
                    <p><a class="btn btn-info" href="/travelicity/guide/Louisville, Kentucky">View details &raquo;</a></p>
                  </div>
               </div>
            </div><!--/span-->
			<div class="span3">
               <div class="card">
                 <h2 class="card-heading">Portland, Oregon</h2>
                  <div class="card-body">
                    <p>
						<a href="/travelicity/guide/Portland, Oregon">
							<img alt="Portland, Oregon"
							 src="http://upload.wikimedia.org/wikipedia/commons/thumb/3/30/The_Willamette.jpg/213px-The_Willamette.jpg" width="300">
						</a>
					</p>
                    <p><a class="btn btn-info" href="/travelicity/guide/Portland, Oregon">View details &raquo;</a></p>
                  </div>
               </div>
            </div><!--/span-->
			
          </div><!--/row-->
		  
		 
		  
		  <div class="row-fluid">
            <div class="span3">
               <div class="card">
                 <h2 class="card-heading">Milwaukee, WI</h2>
                  <div class="card-body">
                    <p>
						<a href="/travelicity/guide/Milwaukee, Wisconsin">
							<img alt="Milwaukee, Wisconsin"
							 src="http://upload.wikimedia.org/wikipedia/commons/thumb/c/cc/Milwaukee_skyline.jpg/213px-Milwaukee_skyline.jpg" width="300">
						</a>
					</p>
                    <p><a class="btn btn-info" href="/travelicity/guide/Milwaukee, Wisconsin">View details &raquo;</a></p>
                  </div>
               </div>
            </div><!--/span-->
            <div class="span3">
               <div class="card">
                 <h2 class="card-heading">Las Vegas, Nevada</h2>
                  <div class="card-body">
                    <p>
						<a href="/travelicity/guide/Las Vegas, Nevada">
							<img alt="Las Vegas, Nevada"
							 src="http://upload.wikimedia.org/wikipedia/commons/thumb/2/28/Fremont_Street_1986.jpg/240px-Fremont_Street_1986.jpg" width="300">
						</a>
					</p>
                    <p><a class="btn btn-info" href="/travelicity/guide/Las Vegas, Nevada">View details &raquo;</a></p>
                  </div>
               </div>
            </div><!--/span-->
            <div class="span3">
               <div class="card">
                 <h2 class="card-heading">Long Beach, CA</h2>
                  <div class="card-body">
                    <p>
						<a href="/travelicity/guide/Long Beach, California">
							<img alt="Long Beach, California"
							 src="http://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/Long_Beach%2C_CA_at_night.jpg/240px-Long_Beach%2C_CA_at_night.jpg" width="300">
						</a>
					</p>
                    <p><a class="btn btn-info" href="/travelicity/guide/Long Beach, California">View details &raquo;</a></p>
                  </div>
               </div>
            </div><!--/span-->
			<div class="span3">
               <div class="card">
                 <h2 class="card-heading">Tucson, Arizona</h2>
                  <div class="card-body">
                    <p>
						<a href="/travelicity/guide/Tucson, Arizona">
							<img alt="Portland, Oregon"
							 src="http://upload.wikimedia.org/wikipedia/commons/thumb/0/0c/Downtown_Mesa_Arizona.jpg/240px-Downtown_Mesa_Arizona.jpg" width="300">
						</a>
					</p>
                    <p><a class="btn btn-info" href="/travelicity/guide/Tucson, Arizona">View details &raquo;</a></p>
                  </div>
               </div>
            </div><!--/span-->
			
          </div><!--/row-->
		  
		 
		  
		  <div class="row-fluid">
            <div class="span3">
               <div class="card">
                 <h2 class="card-heading">Atlanta, Georgia</h2>
                  <div class="card-body">
                    <p>
						<a href="/travelicity/guide/Atlanta, Georgia">
							<img alt="Atlanta, Georgia"
							 src="http://upload.wikimedia.org/wikipedia/commons/thumb/a/a7/Atlanta_Skyline_from_Buckhead.jpg/240px-Atlanta_Skyline_from_Buckhead.jpg" width="300">
						</a>
					</p>
                    <p><a class="btn btn-info" href="/travelicity/guide/Atlanta, Georgia">View details &raquo;</a></p>
                  </div>
               </div>
            </div><!--/span-->
            <div class="span3">
               <div class="card">
                 <h2 class="card-heading">Raleigh, NC</h2>
                  <div class="card-body">
                    <p>
						<a href="/travelicity/guide/Raleigh, North Carolina">
							<img alt="Raleigh, North Carolina"
							 src="http://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Downtown-Raleigh-from-Western-Boulevard-Overpass-20081012.jpeg/240px-Downtown-Raleigh-from-Western-Boulevard-Overpass-20081012.jpeg" width="300">
						</a>
					</p>
                    <p><a class="btn btn-info" href="/travelicity/guide/Raleigh, North Carolina">View details &raquo;</a></p>
                  </div>
               </div>
            </div><!--/span-->
            <div class="span3">
               <div class="card">
                 <h2 class="card-heading">Omaha, Nebraska</h2>
                  <div class="card-body">
                    <p>
						<a href="/travelicity/guide/Omaha, Nebraska">
							<img alt="Omaha, Nebraska"
							 src="http://upload.wikimedia.org/wikipedia/commons/thumb/2/24/Omaha%2C_Nebraska%2C_USA_2008.jpg/213px-Omaha%2C_Nebraska%2C_USA_2008.jpg" width="300">
						</a>
					</p>
                    <p><a class="btn btn-info" href="/travelicity/guide/Omaha, Nebraska">View details &raquo;</a></p>
                  </div>
               </div>
            </div><!--/span-->
			<div class="span3">
               <div class="card">
                 <h2 class="card-heading">Detroit, Michigan</h2>
                  <div class="card-body">
                    <p>
						<a href="/travelicity/guide/Detroit, Michigan">
							<img alt="Detroit, Michigan"
							 src="http://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/DetroitSkyline.jpg/213px-DetroitSkyline.jpg" width="300">
						</a>
					</p>
                    <p><a class="btn btn-info" href="/travelicity/guide/Detroit, Michigan">View details &raquo;</a></p>
                  </div>
               </div>
            </div><!--/span-->
			
          </div><!--/row-->
		  
		 
		  
		  <div class="row-fluid">
            <div class="span3">
               <div class="card">
                 <h2 class="card-heading">Miami, Florida</h2>
                  <div class="card-body">
                    <p>
						<a href="/travelicity/guide/Atlanta, Georgia">
							<img alt="Miami, Florida"
							 src="http://upload.wikimedia.org/wikipedia/commons/thumb/d/d8/Downtown_Miami_skyline_May_2011.jpg/240px-Downtown_Miami_skyline_May_2011.jpg" width="300">
						</a>
					</p>
                    <p><a class="btn btn-info" href="/travelicity/guide/Miami, Florida">View details &raquo;</a></p>
                  </div>
               </div>
            </div><!--/span-->
            <div class="span3">
               <div class="card">
                 <h2 class="card-heading">Minneapolis, MN</h2>
                  <div class="card-body">
                    <p>
						<a href="/travelicity/guide/Minneapolis, Minnesota">
							<img alt="Minneapolis, Minnesota"
							 src="http://upload.wikimedia.org/wikipedia/commons/thumb/d/d7/Minneapolis_skyline_51.JPG/240px-Minneapolis_skyline_51.JPG" width="300">
						</a>
					</p>
                    <p><a class="btn btn-info" href="/travelicity/guide/Minneapolis, Minnesota">View details &raquo;</a></p>
                  </div>
               </div>
            </div><!--/span-->
            <div class="span3">
               <div class="card">
                 <h2 class="card-heading">Cleveland, Ohio</h2>
                  <div class="card-body">
                    <p>
						<a href="/travelicity/guide/Omaha, Nebraska">
							<img alt="Omaha, Nebraska"
							 src="http://upload.wikimedia.org/wikipedia/commons/thumb/f/f1/Downtown_Cleveland.JPG/240px-Downtown_Cleveland.JPG" width="300">
						</a>
					</p>
                    <p><a class="btn btn-info" href="/travelicity/guide/Omaha, Nebraska">View details &raquo;</a></p>
                  </div>
               </div>
            </div><!--/span-->
			<div class="span3">
               <div class="card">
                 <h2 class="card-heading">San Juan, PR</h2>
                  <div class="card-body">
                    <p>
						<a href="/travelicity/guide/San Juan, Puerto Rico">
							<img alt="San Juan, Puerto Rico"
							 src="http://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/Skyline_of_San_Juan%2C_Puerto_Rico.jpg/240px-Skyline_of_San_Juan%2C_Puerto_Rico.jpg" width="300">
						</a>
					</p>
                    <p><a class="btn btn-info" href="/travelicity/guide/San Juan, Puerto Rico">View details &raquo;</a></p>
                  </div>
               </div>
            </div><!--/span-->
			
          </div><!--/row-->
         
         
         </section>
				
				
				
				

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

	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="<c:url value="/resources/js/bootstrap.js" />"></script>
	<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=places"></script>
    <script>
		// This example displays an address form, using the autocomplete feature
		// of the Google Places API to help users fill in the information.
		
		var placeSearch, autocomplete;
	
		function initialize() {
		  // Create the autocomplete object, restricting the search
		  // to geographical location types.
		  autocomplete = new google.maps.places.Autocomplete((document.getElementById('citynm')), { types: ['geocode'] });
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
</body>
</html>
