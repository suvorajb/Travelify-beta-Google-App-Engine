<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page import="org.apache.commons.lang3.StringUtils" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Travelify - Show TraveliBoard...</title>
<!-- Always force latest IE rendering engine (even in intranet) & Chrome Frame -->
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<meta name="robots" content="noindex, nofollow">
<meta name="googlebot" content="noindex, nofollow">

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

.popin{
  background:#fff;
  padding:15px;
  margin:20px auto;
  box-shadow: 0 0 20px #999;
  border-radius:2px;
}

.featuredphoto {
    background: transparent url('${ftrdphotourl}') 0 0 no-repeat fixed;
    text-align: center;
    background-size: cover;
    height: 475px;
    width: 100%;
    margin-bottom: 3em;
    display: table;
}

    .featuredphoto-head {
        display: table-cell;
        vertical-align: middle;
        margin-bottom: 0;
        font-size: 4em;
        color: white;
        font-weight: 500;
        text-shadow: 0 1px 1px black;
    }

#map_canvas {
	width: 100%; 
	height:1000px;
}

#share-buttons img {
width: 35px;
padding: 5px;
border: 0;
box-shadow: 0;
display: inline;
}

.menu_img_style {
	width: 320px;
	height: 200px;
}
</style>
<link href="<c:url value="/resources/css/bootplus-responsive.css" />" rel="stylesheet">

<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false&key=AIzaSyCmUrF7Fhn6l7oEuRI0U9FPOO3rNUsW29M"></script>    
<script src="<c:url value="/resources/js/jquery.min.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap.js" />"></script>
<script src="<c:url value="/resources/js/styledmaps.js" />"></script>

<script type="text/javascript">
			var markers = [${plcmarkers}];
		
			function initializeMaps() {
				var myOptions = 
				{
					mapTypeId: google.maps.MapTypeId.ROADMAP,
					mapTypeControl: false,
					<c:if test="${not empty board.mapstyles}">styles: ${board.mapstyles}</c:if>
				};
				var map = new google.maps.Map(document.getElementById("map_canvas"),myOptions);
				var infowindow = new google.maps.InfoWindow();
				var marker, i;
				var bounds = new google.maps.LatLngBounds();
			
				for (i = 0; i < markers.length; i++) { 
					var pos = new google.maps.LatLng(markers[i][1], markers[i][2]);
					bounds.extend(pos);
					marker = new google.maps.Marker({
						position: pos,
						map: map
					});
					google.maps.event.addListener(marker, 'click', (function(marker, i) {
						return function() {
							infowindow.setContent(markers[i][0]);
							infowindow.open(map, marker);
						}
					})(marker, i));
				}
				map.fitBounds(bounds);
			}
</script>

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
	


	<div class="container-fluid">

		<div class="row-fluid">

			<div class="span12">
					
					<div class="row-fluid">
						<div class="featuredphoto"><h1 class="featuredphoto-head">${board.boardtitle }  </h1></div>
					</div>
					
					<div class="row-fluid">
						<div class="card">
							<div class="card-body">
								<div class="row-fluid">
									<div class="span3"><p><img src="${board.uprofilestr}" class="img-circle" width="200" height="200"></p></div>
									<div class="span6">
										<h3 class="card-heading ">${board.boardnote }</h3>
										<h4>Posted Under Category <font color="blue">${board.boardtype}</font> : Location <font color="blue">${board.location}</font>
												By ${board.unickname} ${board.publshddatestr}</h4>
									</div>
									<div class="span3">
										<div id="share-buttons">
 
											<!-- Facebook -->
											<a href="http://www.facebook.com/sharer.php?u=http://gcdc2013-travelify.appspot.com/traveliboards/showboard?boardid=${board.boardid}" target="_blank"><img src="/resources/img/facebook.png" alt="Facebook" /></a>
											 
											<!-- Twitter -->
											<a href="http://twitter.com/share?url=http://gcdc2013-travelify.appspot.com/traveliboards/showboard?boardid=${board.boardid}&text=${board.boardtitle}" target="_blank"><img src="/resources/img/twitter.png" alt="Twitter" /></a>
											 											 
											<!-- Digg -->
											<a href="http://www.digg.com/submit?url=http://gcdc2013-travelify.appspot.com/traveliboards/showboard?boardid=${board.boardid}" target="_blank"><img src="/resources/img/diggit.png" alt="Digg" /></a>
											 
											<!-- Reddit -->
											<a href="http://reddit.com/submit?url=http://gcdc2013-travelify.appspot.com/traveliboards/showboard?boardid=${board.boardid}&title=${board.boardtitle}" target="_blank"><img src="/resources/img/reddit.png" alt="Reddit" /></a>
											 
											<!-- LinkedIn -->
											<a href="http://www.linkedin.com/shareArticle?mini=true&url=http://gcdc2013-travelify.appspot.com/traveliboards/showboard?boardid=${board.boardid}" target="_blank"><img src="/resources/img/linkedin.png" alt="LinkedIn" /></a>
											 
											<!-- StumbleUpon-->
											<a href="http://www.stumbleupon.com/submit?url=http://gcdc2013-travelify.appspot.com/traveliboards/showboard?boardid=${board.boardid}&title=${board.boardtitle}" target="_blank"><img src="/resources/img/stumbleupon.png" alt="StumbleUpon" /></a>
										</div>
										<p>&nbsp;</p>
										<span class="btn btn-danger g-interactivepost"
										  data-contenturl="http://gcdc2013-travelify.appspot.com/traveliboards/showboard?boardid=${board.boardid}" 
										  data-clientid="58996761750.apps.googleusercontent.com" 
										  data-cookiepolicy="single_host_origin" 
										  data-prefilltext="${board.boardtitle} : ${board.boardnote}" 
										  data-calltoactionlabel="VIEW" 
										  data-calltoactionurl="http://gcdc2013-travelify.appspot.com/traveliboards/showboard?boardid=${board.boardid}"> 
										  Share in Your <i class="icon-google-plus"></i> Circle
										 </span>
									</div>
								</div>
								
							</div>
						</div><!-- card -->
					</div>
					
					<!-- Clip places ================================================== -->
					<div class="row-fluid">
						<div class="bluebox"><p><h2>Clipped Places ... </h2></p></div>
					</div>
					
					<div class="row-fluid">
					  <div id="placescontainer">	
						<div class="span6">
						
									<section id="place-clips">
										<%
											int i = 0;
											int j = 0;
											boolean flgendrow = false;
										%>
									
									<c:forEach items="${board.boardplaces}" var="boardplc">
									<c:set var="boardplcstr" scope="request" value="${boardplc}"></c:set>
										<%
											String boardplcstr = (String) request.getAttribute("boardplcstr");
											//out.print(boardplcstr);
											//String plsstrarr[] = boardplcstr.split("\\;");
											String plsstrarr[] = StringUtils.split(boardplcstr, ";");
											//out.print(plsstrarr);
											j++;
											if (i == 0) {
											   flgendrow = false;
										%>
										<div class="row-fluid">
										<%
												}
										%>
										<div class="span6">
										
											<div class="card paperclip">
												<h4 class="card-heading-header"><%=plsstrarr[0]%></h4>
												<div class="card-body">
													<p><img class="img-polaroid"
														src="http://maps.googleapis.com/maps/api/streetview?size=450x150&sensor=false&location=<%=plsstrarr[2]%>&key=AIzaSyCXasoa_-_S00WnsdIDBfV4eX9G7Rhnz0U" />
													<h4><%=plsstrarr[1]%></h4>
													</p>
													<p><span class="badge badge-important"><%=j %></span></p>
												</div>
											</div><!-- card -->
											
										</div>	
										<%
											i++;
											if (i == 2) {
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
								
						       </section>
									
						    </div> <!--  end of span6 -->
							<div class="span6"><div class="popin" id="mapcontainer"> <div id="map_canvas"></div></div>
						   </div><!-- end of container-fluid -->
					   </div>
					</div>
					
<%-- 					<div class="row-fluid">
						<div class="bluebox"><p><h2>View other TraveliBoards </h2></p></div>
					</div>			
										
					<c:if test="${not empty samecat }">
					<div class="row">
						<h3>From same category</h3>
						<div class="row">
							<c:forEach items="${samecat}" var="brd">
								<div class="span4">
									<div class="card">
										   <div class="card-heading image">
										   		<img src="${brd.uprofilestr}" />
										      <div class="card-heading-header">
										         <h4>${brd.shortboardtitle}</h4>
										         <span>${brd.publshddatestr} By ${brd.unickname}</span>
										      </div>
										   </div>
										   <div class="card-body">
										      <p><span class="label label-success">${brd.boardtype }</span> | <span class="label label-warning">${brd.location }</span></p>												   
										      <p><img src="${brd.boardphotourl }" class="img-polaroid menu_img_style"/></a></p>
										   </div>
										   <div class="card-actions">
										      <p><a class="btn btn-primary" href="/traveliboards/showboard?boardid=${brd.boardid}">View TraveliBoard</a></p>
											</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
					</c:if>	
					
					<c:if test="${not empty sameloc}">
					<div class="row">
						<h3>From same location</h3>
						<div class="row">
							<c:forEach items="${sameloc}" var="bd">
								<div class="span4">
									<div class="card">
										   <div class="card-heading image">
										   		<img src="${bd.uprofilestr}" />
										      <div class="card-heading-header">
										         <h4>${bd.shortboardtitle}</h4>
										         <span>${bd.publshddatestr} By ${bd.unickname}</span>
										      </div>
										   </div>
										   <div class="card-body">
										      <p><span class="label label-success">${bd.boardtype }</span> | <span class="label label-warning">${bd.location }</span></p>												   
										      <p><img src="${bd.boardphotourl }" class="img-polaroid menu_img_style"/></a></p>
										   </div>
										   <div class="card-actions">
										      <p><a class="btn btn-primary" href="/traveliboards/showboard?boardid=${bd.boardid}">View TraveliBoard</a></p>
											</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
					</c:if>
					 --%>
					<div class="row-fluid">
						<div class="bluebox"><p><h2>Comments ... </h2></p></div>
					</div>			
					
					<div class="row-fluid">
					<div class="card">
						<div class="card-body">
							<div class="row-fluid">
								<div class="span12">
									<form:form modelAttribute="commentsform" method="post" action="/traveliboards/addcomments" class="form-horizontal">
									  <div class="control-group">
									    <label class="control-label" for="comment">Post Comment</label>
									    <div class="controls">
									      <textarea rows="8" class="span8" name="comment" id="comment" placeholder="Post your 2cents for this placeboard" minlength="2" required></textarea>
									      <input type="hidden" name="boardid" id="boardid" value="${board.boardid}" />
											<button type="submit" class="btn btn-primary">Submit</button>
									    </div>
									  </div>
									</form:form>
								</div>
							</div>
							<div class="row-fluid">
								<c:if test="${not empty board.commentslist}">
									<% int m=1; %>
									<ul class="thumbnails">
											<c:forEach items="${board.commentslist}" var="comment">
												<div class="row-fluid">
													<div class="span12 well">
														<p><span class="badge badge-important"><%=m %></span><b> <img class="img-circle" width="35" height="35" src="${comment.uprofilestr}" alt="${comment.unickname }"/> 
														${comment.unickname} commented on</b> ${comment.commentdt}</p>
														<p>${comment.commentdata} </p>
													</div>
												</div>
												<% m++; %>
											</c:forEach>
										</ul>
								</c:if>
							</div>
						</div>
					</div>
				</div>
	
	
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
	
	<script>
		initializeMaps();
	</script>
	<script type="text/javascript">
	  (function() {
	   var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
	   po.src = 'https://apis.google.com/js/client:plusone.js';
	   var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
	 })();
	</script>	

</body>
</html>
