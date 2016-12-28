<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- header-section-starts-here -->
	<div class="header">
		<div class="header-top">
			<div class="wrap">
				<div class="top-menu">
					<ul>
						<li><a href="index.html">Home</a></li>
						<li><a href="about.html">About Us</a></li>
						<li><a href="privacy-policy.html">Privacy Policy</a></li>
						<li><a href="contact.html">Contact Us</a></li>
					</ul>
				</div>
				<div class="num">
					<p> Call us : 032 2352 782</p>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		<div class="header-bottom">
			<div class="logo text-center">
				<a href="index.html"><img src="${pageContext.request.contextPath}/pages/mypages/imgs/logo.jpg" alt="" /></a>
			</div>
			<div class="navigation">
				<nav class="navbar navbar-default" role="navigation">
		   <div class="wrap">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				
			</div>
			<!--/.navbar-header-->
		
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					 <li class="active"><a href="index.html">Home</a></li>
						<li><a href="sports.html">Sports</a></li>
				    <li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">Entertainment<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="entertainment.html">Movies</a></li>
							<li class="divider"></li>
							<li><a href="entertainment.html">Another action</a></li>
							<li class="divider"></li>
							<li><a href="entertainment.html">Articles</a></li>
							<li class="divider"></li>
							<li><a href="entertainment.html">celebrity</a></li>
							<li class="divider"></li>
							<li><a href="entertainment.html">One more separated link</a></li>
						</ul>
					  </li>
					<li><a href="shortcodes.html">Health</a></li>
					<li><a href="fashion.html">Fashion</a></li>
					  <li class="dropdown">
						<a href="business.html" class="dropdown-toggle" data-toggle="dropdown">Business<b class="caret"></b></a>
						<ul class="dropdown-menu multi-column columns-2">
							<div class="row">
								<div class="col-sm-6">
									<ul class="multi-column-dropdown">
										<li><a href="business.html">Action</a></li>
										<li class="divider"></li>
										<li><a href="business.html">bulls</a></li>
									    <li class="divider"></li>
										<li><a href="business.html">markets</a></li>
										<li class="divider"></li>
										<li><a href="business.html">Reviews</a></li>
										<li class="divider"></li>
										<li><a href="shortcodes.html">Short codes</a></li>
									</ul>
								</div>
								<div class="col-sm-6">
									<ul class="multi-column-dropdown">
									   <li><a href="business.html">features</a></li>	
										<li class="divider"></li>
										<li><a href="entertainment.html">Movies</a></li>
									    <li class="divider"></li>
										<li><a href="sports.html">sports</a></li>
										<li class="divider"></li>
										<li><a href="business.html">Reviews</a></li>
										<li class="divider"></li>
										<li><a href="business.html">Stock</a></li>
									</ul>
								</div>
							</div>
						</ul>
					</li>
					<li><a href="technology.html">Technology</a></li>
					<div class="clearfix"></div>
				</ul>
				<div class="search">
					<!-- start search-->
				    <div class="search-box">
					    <div id="sb-search" class="sb-search">
							<form>
								<input class="sb-search-input" placeholder="Enter your search term..." type="search" name="search" id="search">
								<input class="sb-search-submit" type="submit" value="">
								<span class="sb-icon-search"> </span>
							</form>
						</div>
				    </div>
					<!-- search-scripts -->
					<script src="${pageContext.request.contextPath}/pages/mypages/js/classie.js"></script>
					<script src="${pageContext.request.contextPath}/pages/mypages/js/uisearch.js"></script>
						<script>
							new UISearch( document.getElementById( 'sb-search' ) );
						</script>
					<!-- //search-scripts -->
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
			<!--/.navbar-collapse-->
	 <!--/.navbar-->
			</div>
		</nav>
		</div>
	</div>
	<!-- header-section-ends-here -->