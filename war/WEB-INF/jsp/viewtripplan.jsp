<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Travelify - View Trip...</title>
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

.highlightblue {
	padding: 9px 14px;
	margin-bottom: 14px;
	background-color: #f7f7f9;
	border: 1px solid #e1e1e8;
	border-radius: 4px;
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

@media ( max-width : 980px) {
	/* Enable use of floated navbar text */
	.navbar-text.pull-right {
		float: none;
		padding-left: 5px;
		padding-right: 5px;
	}
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

.bs-callout-info {
	background-color: #f4f8fa;
	border-color: #bce8f1;
}

.bs-callout-info h2 {
	color: #3a87ad;
}

.bs-callout-warning {
	background-color: #faf8f0;
	border-color: #faebcc;
}

.bs-callout-warning h2 {
	color: #c09853;
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


	<!-- Subhead ===================================================== -->
	<header class="jumbotron subhead" id="overview">
		<div class="container-fluid">
			<h1>View Trip Plan ...</h1>
		</div>
	</header>


	<div class="container-fluid">

		<div class="row-fluid">

			<div class="span12">

				<section id="trip">
					<div class="card">
						<div class="card-body">
							<div class="row-fluid">
								<div class="span8">
									<h1>${tripplan.triptitle }</h1>
								</div>
								<div class="span4">
									<a href="/travelitrips/viewtrip?tripid=${tripplan.tripid}"
										class="btn btn-info btn-large">Back to Trip</a>
								</div>
							</div>
						</div>
					</div>
				</section>

				<c:if test="${not empty tripplan}">
				

				<c:if test="${not empty tripplan.brkfstplaces}">

						<section id="breakfast-info">
							<div class="card">
								<div class="card-body">
									<div class="row-fluid">
										<div class="span12">
											<h2>Breakfast/Cafe on my Trip</h2>
										</div>
									</div>
									<%
										int i = 0;
										boolean flgendrow = false;
									%>
									<c:forEach items="${tripplan.brkfstplaces }" var="brkplc">
										<c:set var="brkplcstr" scope="request" value="${brkplc}"></c:set>
										<%
											String brkplcstr = (String) request.getAttribute("brkplcstr");
											String plsstrarr[] = brkplcstr.split("\\;");
											if (i == 0) {
												flgendrow = false;
										%>
										<div class="row-fluid">
											<%
												}
											%>
											<div class="span4">
												<p>
													<img class="img-polaroid"
														src="http://maps.googleapis.com/maps/api/streetview?size=400x200&sensor=false&location=<%=plsstrarr[2]%>&key=AIzaSyCXasoa_-_S00WnsdIDBfV4eX9G7Rhnz0U" />
												<address>
													<h3><%=plsstrarr[0]%></h3>
													<%=plsstrarr[1]%>
												</address>
												</p>
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
										if (flgendrow == false) {
									%>
								</div>
								<!-- end row -->
								<%
									}
								%>
								
							</div>
			</div>
			</section>

			</c:if>


			<c:if test="${not empty tripplan.lunchplaces}">

				<section id="lunch-info">
					<div class="card">
						<div class="card-body">
							<div class="row-fluid">
								<div class="span12">
									<h2>Lunch Places on my Trip</h2>
								</div>
							</div>
							<%
								int i = 0;
								boolean flgendrow = false;
							%>
							<c:forEach items="${tripplan.lunchplaces }" var="lnchplc">
								<c:set var="lnchplcstr" scope="request" value="${lnchplc}"></c:set>
								<%
									String lnchplcstr = (String) request.getAttribute("lnchplcstr");
									String plsstrarr[] = lnchplcstr.split("\\;");
									if (i == 0) {
										flgendrow = false;
								%>
								<div class="row-fluid">
									<%
										}
									%>
									<div class="span4">
										<p>
											<img class="img-polaroid"
												src="http://maps.googleapis.com/maps/api/streetview?size=400x200&sensor=false&location=<%=plsstrarr[2]%>&key=AIzaSyCXasoa_-_S00WnsdIDBfV4eX9G7Rhnz0U" />
										<address>
											<h3><%=plsstrarr[0]%></h3>
											<%=plsstrarr[1]%>
										</address>
										</p>
									</div>
									<%
										i++;
										if (i == 3) {
											flgendrow = true;
											i = 0;
									%>
								</div>
								<!-- end row -->
								<%
									}
								%>
							</c:forEach>
							<%
								if (flgendrow == false) {
							%>
						</div>
						<!-- end row -->
						<%
							}
						%>
						
					</div>
		</div>
		</section>

		</c:if>


		<c:if test="${not empty tripplan.dinnrplaces}">

				<section id="dinnr-info">
					<div class="card">
						<div class="card-body">
							<div class="row-fluid">
								<div class="span12">
									<h2>Dinner Restaurants on my Trip</h2>
								</div>
							</div>
							<%
								int i = 0;
								boolean flgendrow = false;
							%>
							<c:forEach items="${tripplan.dinnrplaces }" var="dnnrplc">
								<c:set var="dnnrplcstr" scope="request" value="${dnnrplc}"></c:set>
								<%
									String dnnrplcstr = (String) request.getAttribute("dnnrplcstr");
									String plsstrarr[] = dnnrplcstr.split("\\;");
									if (i == 0) {
										flgendrow = false;
								%>
								<div class="row-fluid">
									<%
										}
									%>
									<div class="span4">
										<p>
											<img class="img-polaroid"
												src="http://maps.googleapis.com/maps/api/streetview?size=400x200&sensor=false&location=<%=plsstrarr[2]%>&key=AIzaSyCXasoa_-_S00WnsdIDBfV4eX9G7Rhnz0U" />
										<address>
											<h3><%=plsstrarr[0]%></h3>
											<%=plsstrarr[1]%>
										</address>
										</p>
									</div>
									<%
										i++;
										if (i == 3) {
											flgendrow = true;
											i = 0;
									%>
								</div>
								<!-- end row -->
								<%
									}
								%>
							</c:forEach>
							<%
								if (flgendrow == false) {
							%>
						</div>
						<!-- end row -->
						<%
							}
						%>
											
					</div>
		</div>
		</section>

		</c:if>

		<c:if test="${not empty tripplan.sightseeingtours}">

				<section id="sightseeing-info">
					<div class="card">
						<div class="card-body">
							<div class="row-fluid">
								<div class="span12">
									<h2>Sightseeing Tours on my Trip</h2>
								</div>
							</div>
							<%
								int i = 0;
								boolean flgendrow = false;
							%>
							<c:forEach items="${tripplan.sightseeingtours }" var="sghtplc">
								<c:set var="sghtplcstr" scope="request" value="${sghtplc}"></c:set>
								<%
									String sghtplcstr = (String) request.getAttribute("sghtplcstr");
									String plsstrarr[] = sghtplcstr.split("\\;");
									if (i == 0) {
										flgendrow = false;
								%>
								<div class="row-fluid">
									<%
										}
									%>
									<div class="span4">
										<p>
											<img class="img-polaroid"
												src="http://maps.googleapis.com/maps/api/streetview?size=400x200&sensor=false&location=<%=plsstrarr[2]%>&key=AIzaSyCXasoa_-_S00WnsdIDBfV4eX9G7Rhnz0U" />
										<address>
											<h3><%=plsstrarr[0]%></h3>
											<%=plsstrarr[1]%>
										</address>
										</p>
									</div>
									<%
										i++;
										if (i == 3) {
											flgendrow = true;
											i = 0;
									%>
								</div>
								<!-- end row -->
								<%
									}
								%>
							</c:forEach>
							<%
								if (flgendrow == false) {
							%>
						</div>
						<!-- end row -->
						<%
							}
						%>
					</div>
		</div>
		</section>

		</c:if>


		<c:if test="${not empty tripplan.artgalleries}">

				<section id="artgallry-info">
					<div class="card">
						<div class="card-body">
							<div class="row-fluid">
								<div class="span12">
									<h2>Art Gallery and Museum on my Trip</h2>
								</div>
							</div>
							<%
								int i = 0;
								boolean flgendrow = false;
							%>
							<c:forEach items="${tripplan.artgalleries }" var="artplc">
								<c:set var="artplcstr" scope="request" value="${artplc}"></c:set>
								<%
									String artplcstr = (String) request.getAttribute("artplcstr");
									String plsstrarr[] = artplcstr.split("\\;");
									if (i == 0) {
										flgendrow = false;
								%>
								<div class="row-fluid">
									<%
										}
									%>
									<div class="span4">
										<p>
											<img class="img-polaroid"
												src="http://maps.googleapis.com/maps/api/streetview?size=400x200&sensor=false&location=<%=plsstrarr[2]%>&key=AIzaSyCXasoa_-_S00WnsdIDBfV4eX9G7Rhnz0U" />
										<address>
											<h3><%=plsstrarr[0]%></h3>
											<%=plsstrarr[1]%>
										</address>
										</p>
										
									</div>
									<%
										i++;
										if (i == 3) {
											flgendrow = true;
											i = 0;
									%>
								</div>
								<!-- end row -->
								<%
									}
								%>
							</c:forEach>
							<%
								if (flgendrow == false) {
							%>
						</div>
						<!-- end row -->
						<%
							}
						%>
					</div>
		</div>
		</section>

		</c:if>


		<c:if test="${not empty tripplan.zoo_aquariums}">

				<section id="zaq-info">
					<div class="card">
						<div class="card-body">
							<div class="row-fluid">
								<div class="span12">
									<h2>Zoo Acquirium on my Trip</h2>
								</div>
							</div>
							<%
								int i = 0;
								boolean flgendrow = false;
							%>
							<c:forEach items="${tripplan.zoo_aquariums }" var="zaqplc">
								<c:set var="zaqplcstr" scope="request" value="${zaqplc}"></c:set>
								<%
									String zaqplcstr = (String) request.getAttribute("zaqplcstr");
									String plsstrarr[] = zaqplcstr.split("\\;");
									if (i == 0) {
										flgendrow = false;
								%>
								<div class="row-fluid">
									<%
										}
									%>
									<div class="span4">
										<p>
											<img class="img-polaroid"
												src="http://maps.googleapis.com/maps/api/streetview?size=400x200&sensor=false&location=<%=plsstrarr[2]%>&key=AIzaSyCXasoa_-_S00WnsdIDBfV4eX9G7Rhnz0U" />
										<address>
											<h3><%=plsstrarr[0]%></h3>
											<%=plsstrarr[1]%>
										</address>
										</p>
										
									</div>
									<%
										i++;
										if (i == 3) {
											flgendrow = true;
											i = 0;
									%>
								</div>
								<!-- end row -->
								<%
									}
								%>
							</c:forEach>
							<%
								if (flgendrow == false) {
							%>
						</div>
						<!-- end row -->
						<%
							}
						%>
					</div>
		</div>
		</section>

		</c:if>
				
		
		<c:if test="${not empty tripplan.nghtlifeplaces}">

				<section id="ncb-info">
					<div class="card">
						<div class="card-body">
							<div class="row-fluid">
								<div class="span12">
									<h2>Night Club/Bar/Casino on my Trip</h2>
								</div>
							</div>
							<%
								int i = 0;
								boolean flgendrow = false;
							%>
							<c:forEach items="${tripplan.nghtlifeplaces }" var="ncbplc">
								<c:set var="ncbplcstr" scope="request" value="${ncbplc}"></c:set>
								<%
									String ncbplcstr = (String) request.getAttribute("ncbplcstr");
									String plsstrarr[] = ncbplcstr.split("\\;");
									if (i == 0) {
										flgendrow = false;
								%>
								<div class="row-fluid">
									<%
										}
									%>
									<div class="span4">
										<p>
											<img class="img-polaroid"
												src="http://maps.googleapis.com/maps/api/streetview?size=400x200&sensor=false&location=<%=plsstrarr[2]%>&key=AIzaSyCXasoa_-_S00WnsdIDBfV4eX9G7Rhnz0U" />
										<address>
											<h3><%=plsstrarr[0]%></h3>
											<%=plsstrarr[1]%>
										</address>
										</p>
										
									</div>
									<%
										i++;
										if (i == 3) {
											flgendrow = true;
											i = 0;
									%>
								</div>
								<!-- end row -->
								<%
									}
								%>
							</c:forEach>
							<%
								if (flgendrow == false) {
							%>
						</div>
						<!-- end row -->
						<%
							}
						%>
					</div>
		</div>
		</section>

		</c:if>
				
		<c:if test="${not empty tripplan.temples}">

				<section id="tml-info">
					<div class="card">
						<div class="card-body">
							<div class="row-fluid">
								<div class="span12">
									<h2>Popular temples to see</h2>
								</div>
							</div>
							<%
								int i = 0;
								boolean flgendrow = false;
							%>
							<c:forEach items="${tripplan.temples }" var="tmlplc">
								<c:set var="tmlplcstr" scope="request" value="${tmlplc}"></c:set>
								<%
									String tmlplcstr = (String) request.getAttribute("tmlplcstr");
									String plsstrarr[] = tmlplcstr.split("\\;");
									if (i == 0) {
										flgendrow = false;
								%>
								<div class="row-fluid">
									<%
										}
									%>
									<div class="span4">
										<p>
											<img class="img-polaroid"
												src="http://maps.googleapis.com/maps/api/streetview?size=400x200&sensor=false&location=<%=plsstrarr[2]%>&key=AIzaSyCXasoa_-_S00WnsdIDBfV4eX9G7Rhnz0U" />
										<address>
											<h3><%=plsstrarr[0]%></h3>
											<%=plsstrarr[1]%>
										</address>
										</p>
										
									</div>
									<%
										i++;
										if (i == 3) {
											flgendrow = true;
											i = 0;
									%>
								</div>
								<!-- end row -->
								<%
									}
								%>
							</c:forEach>
							<%
								if (flgendrow == false) {
							%>
						</div>
						<!-- end row -->
						<%
							}
						%>
					</div>
		</div>
		</section>

		</c:if>				


		<c:if test="${not empty tripplan.mosques}">

				<section id="msq-info">
					<div class="card">
						<div class="card-body">
							<div class="row-fluid">
								<div class="span12">
									<h2>Popular Mosques to see</h2>
								</div>
							</div>
							<%
								int i = 0;
								boolean flgendrow = false;
							%>
							<c:forEach items="${tripplan.mosques }" var="msqplc">
								<c:set var="msqplcstr" scope="request" value="${msqplc}"></c:set>
								<%
									String msqplcstr = (String) request.getAttribute("msqplcstr");
									String plsstrarr[] = msqplcstr.split("\\;");
									if (i == 0) {
										flgendrow = false;
								%>
								<div class="row-fluid">
									<%
										}
									%>
									<div class="span4">
										<p>
											<img class="img-polaroid"
												src="http://maps.googleapis.com/maps/api/streetview?size=400x200&sensor=false&location=<%=plsstrarr[2]%>&key=AIzaSyCXasoa_-_S00WnsdIDBfV4eX9G7Rhnz0U" />
										<address>
											<h3><%=plsstrarr[0]%></h3>
											<%=plsstrarr[1]%>
										</address>
										</p>
										
									</div>
									<%
										i++;
										if (i == 3) {
											flgendrow = true;
											i = 0;
									%>
								</div>
								<!-- end row -->
								<%
									}
								%>
							</c:forEach>
							<%
								if (flgendrow == false) {
							%>
						</div>
						<!-- end row -->
						<%
							}
						%>
					</div>
		</div>
		</section>

		</c:if>				



		<c:if test="${not empty tripplan.churches}">

				<section id="chc-info">
					<div class="card">
						<div class="card-body">
							<div class="row-fluid">
								<div class="span12">
									<h2>Popular Churches to see</h2>
								</div>
							</div>
							<%
								int i = 0;
								boolean flgendrow = false;
							%>
							<c:forEach items="${tripplan.churches }" var="chcplc">
								<c:set var="chcplcstr" scope="request" value="${chcplc}"></c:set>
								<%
									String chcplcstr = (String) request.getAttribute("chcplcstr");
									String plsstrarr[] = chcplcstr.split("\\;");
									if (i == 0) {
										flgendrow = false;
								%>
								<div class="row-fluid">
									<%
										}
									%>
									<div class="span4">
										<p>
											<img class="img-polaroid"
												src="http://maps.googleapis.com/maps/api/streetview?size=400x200&sensor=false&location=<%=plsstrarr[2]%>&key=AIzaSyCXasoa_-_S00WnsdIDBfV4eX9G7Rhnz0U" />
										<address>
											<h3><%=plsstrarr[0]%></h3>
											<%=plsstrarr[1]%>
										</address>
										</p>
										
									</div>
									<%
										i++;
										if (i == 3) {
											flgendrow = true;
											i = 0;
									%>
								</div>
								<!-- end row -->
								<%
									}
								%>
							</c:forEach>
							<%
								if (flgendrow == false) {
							%>
						</div>
						<!-- end row -->
						<%
							}
						%>
					</div>
		</div>
		</section>

		</c:if>				

							<c:if test="${not empty tripplan.tripplannote}">
		
								<section id="tripplannote">
									<div class="card">
										<div class="card-body">
											<div class="row-fluid">
												<div class="span12  bs-callout bs-callout-warning">
													<h2>Trip Plan Note:</h2>
													<h4>${tripplan.tripplannote}</h4>
												</div>
											</div>
											<div class="row-fluid">
												<p><a href="/travelitrips/viewtrip?tripid=${tripplan.tripid}" class="btn btn-info">Back to Trip</a>	</p>
											</div>
										</div>
									</div>
								</section>
							</c:if>



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
	<script src="<c:url value="/resources/js/createtrip.js" />"></script>

</body>
</html>
