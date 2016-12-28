<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>资讯列表</title>
<%@include file="header.jsp"%>

<script
	src="${pageContext.request.contextPath}/pages/mypages/js/responsiveslides.min.js"></script>
<script>
	$(function() {
		$("#slider").responsiveSlides({
			auto : true,
			nav : true,
			speed : 500,
			namespace : "callbacks",
			pager : true,
		});
	});
</script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/pages/mypages/js/move-top.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/pages/mypages/js/easing.js"></script>
<!--/script-->
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event) {
			event.preventDefault();
			$('html,body').animate({
				scrollTop : $(this.hash).offset().top
			}, 900);
		});
	});
</script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/pages/mypages/css2/fancybox.css" type="text/css" media="screen" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/pages/mypages/css2/style.css" type="text/css" media="screen" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/pages/mypages/css2/reset.css" type="text/css" media="screen" />

</head>
<body>
	<%@include file="head.jsp"%>
<div id="content">

	<div class="container">

		<div id="main">

			<div class="entry collapsible">

				<div class="entry-header">

					<img src="${pageContext.request.contextPath}/pages/mypages/imgs/75x40.jpg" width="75" height="40" alt="" class="entry-title-image">

					<h2 class="title">Founded new Animal type...</h2>

					<p class="meta">Published on <a href="#">March 29, 2010</a> by <a href="#">John Doe</a></p>

					<a class="button news-trigger" href="#">Read More...</a>

				</div><!-- end .entry-header -->

				<div class="collapsible-content">

					<div class="entry-content">

						<div class="zoom align-right">
							<a class="single_image" href="${pageContext.request.contextPath}/pages/mypages/imgs/800x600.jpg">
								<img src="${pageContext.request.contextPath}/pages/mypages/imgs/650x210.jpg" width="210" height="210" alt="Texas Trip 2010: Abandoned ranch" class="entry-image" />
							</a>
						</div>

						<p>Proin ornare, ante vitae tristique mattis, massa neque mattis justo, vel dapibus lectus urna quis orci. In imperdiet sapien eleifend turpis auctor imperdiet. Duis elementum consequat ante non accumsan. Aliquam mattis aliquam bibendum. Vivamus lobortis est ac lorem feugiat ac vestibulum velit viverra. Nullam dapibus elementum risus, volutpat fringilla libero aliquet vel. Integer in dui sed quam feugiat lobortis et non est. Sed aliquam, diam sed convallis laoreet, augue libero fermentum libero, eu pulvinar quam sem ac eros. In ac adipiscing mauris. Nulla sollicitudin ultricies nisi. </p>

						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc imperdiet enim hendrerit neque pharetra venenatis. Pellentesque a orci nisi, eu ultricies augue. Mauris feugiat sapien ac tellus facilisis bibendum. Duis sit amet ante sit amet lorem hendrerit gravida a nec mauris. Phasellus iaculis interdum ligula, ut ultricies risus porttitor sit amet. Praesent id felis ut mauris malesuada bibendum. Curabitur felis odio, adipiscing et blandit pellentesque, pretium et libero. Cras tincidunt tortor justo, in congue lectus. Etiam sagittis ligula a mauris laoreet ac consequat turpis sagittis. Suspendisse potenti. Ut nec sollicitudin felis. In hac habitasse platea dictumst. Quisque ut consequat enim. Curabitur sed ipsum nunc, non dignissim nibh. Cras sit amet molestie ante. Phasellus ipsum nulla, lacinia vel vestibulum eu, auctor id eros. Nunc faucibus felis vitae lacus cursus ut pretium massa mollis. Mauris neque diam, tincidunt hendrerit pellentesque sed, bibendum in sem. Curabitur elementum est a turpis hendrerit vel laoreet ante semper. Nam metus velit, sollicitudin ac feugiat at, viverra fermentum nibh. </p>

						<dl>
							<dt>Web:</dt>
								<dd>www.yourdomain.com</dd>
							<dt>Email:</dt>
								<dd>yourmail@yourdomain.com</dd>
							<dt>Phone:</dt>
								<dd>+88 44 777 99</dd>
						</dl>

					</div><!-- end .entry-content -->

					<div class="box-footer">

						<div class="align-left">

							<strong class="align-left">Share this via:</strong>

							<ul class="social-links align-left">
								<li><a href="#"><img alt="Digg" src="img/icons/social-icons/digg.png"></a></li>
								<li><a href="#"><img alt="Facebook" src="img/icons/social-icons/facebook.png"></a></li>
								<li><a href="#"><img alt="Flickr" src="img/icons/social-icons/flickr.png"></a></li>
								<li><a href="#"><img alt="Twittew" src="img/icons/social-icons/twitter.png"></a></li>
								<li><a href="#"><img alt="Delicious" src="img/icons/social-icons/delicious.png"></a></li>
								<li><a href="#"><img alt="Tumblr" src="img/icons/social-icons/tumblr.png"></a></li>
							</ul>

						</div><!-- end .align-left -->

					</div><!-- end .box-footer -->

				</div><!-- end .collapsible-content -->

			</div><!-- end .entry -->

			<div class="entry collapsible">

				<div class="entry-header">

					<img src="img/sample-images/75x40.jpg" width="75" height="40" alt="" class="entry-title-image">

					<h2 class="title">Each month Gift a new umbrellas</h2>

					<p class="meta">Published on <a href="#">March 29, 2010</a> by <a href="#">John Doe</a></p>

					<a class="button news-trigger" href="#">Read More...</a>

				</div><!-- end .entry-header -->

				<div class="collapsible-content">

					<div class="entry-content">

						<div class="zoom align-right">
							<a class="single_image" href="img/sample-images/800x600.jpg">
								<img src="img/sample-images/650x210.jpg" width="210" height="210" alt="Texas Trip 2010: Abandoned ranch" class="entry-image" />
							</a>
						</div>

						<p>Proin ornare, ante vitae tristique mattis, massa neque mattis justo, vel dapibus lectus urna quis orci. In imperdiet sapien eleifend turpis auctor imperdiet. Duis elementum consequat ante non accumsan. Aliquam mattis aliquam bibendum. Vivamus lobortis est ac lorem feugiat ac vestibulum velit viverra. Nullam dapibus elementum risus, volutpat fringilla libero aliquet vel. Integer in dui sed quam feugiat lobortis et non est. Sed aliquam, diam sed convallis laoreet, augue libero fermentum libero, eu pulvinar quam sem ac eros. In ac adipiscing mauris. Nulla sollicitudin ultricies nisi. </p>

						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc imperdiet enim hendrerit neque pharetra venenatis. Pellentesque a orci nisi, eu ultricies augue. Mauris feugiat sapien ac tellus facilisis bibendum. Duis sit amet ante sit amet lorem hendrerit gravida a nec mauris. Phasellus iaculis interdum ligula, ut ultricies risus porttitor sit amet. Praesent id felis ut mauris malesuada bibendum. Curabitur felis odio, adipiscing et blandit pellentesque, pretium et libero. Cras tincidunt tortor justo, in congue lectus. Etiam sagittis ligula a mauris laoreet ac consequat turpis sagittis. Suspendisse potenti. Ut nec sollicitudin felis. In hac habitasse platea dictumst. Quisque ut consequat enim. Curabitur sed ipsum nunc, non dignissim nibh. Cras sit amet molestie ante. Phasellus ipsum nulla, lacinia vel vestibulum eu, auctor id eros. Nunc faucibus felis vitae lacus cursus ut pretium massa mollis. Mauris neque diam, tincidunt hendrerit pellentesque sed, bibendum in sem. Curabitur elementum est a turpis hendrerit vel laoreet ante semper. Nam metus velit, sollicitudin ac feugiat at, viverra fermentum nibh. </p>

						<dl>
							<dt>Web:</dt>
								<dd>www.yourdomain.com</dd>
							<dt>Email:</dt>
								<dd>yourmail@yourdomain.com</dd>
							<dt>Phone:</dt>
								<dd>+88 44 777 99</dd>
						</dl>

					</div><!-- end .entry-content -->

					<div class="box-footer">

						<div class="align-left">

							<strong class="align-left">Share this via:</strong>

							<ul class="social-links align-left">
								<li><a href="#"><img alt="Digg" src="img/icons/social-icons/digg.png"></a></li>
								<li><a href="#"><img alt="Facebook" src="img/icons/social-icons/facebook.png"></a></li>
								<li><a href="#"><img alt="Flickr" src="img/icons/social-icons/flickr.png"></a></li>
								<li><a href="#"><img alt="Twittew" src="img/icons/social-icons/twitter.png"></a></li>
								<li><a href="#"><img alt="Delicious" src="img/icons/social-icons/delicious.png"></a></li>
								<li><a href="#"><img alt="Tumblr" src="img/icons/social-icons/tumblr.png"></a></li>
							</ul>

						</div><!-- end .align-left -->

					</div><!-- end .box-footer -->

				</div><!-- end .collapsible-content -->

			</div><!-- end .entry -->

			<div class="entry collapsible">

				<div class="entry-header">

					<img src="img/sample-images/75x40.jpg" width="75" height="40" alt="" class="entry-title-image">

					<h2 class="title">Discovered new orchid varities</h2>

					<p class="meta">Published on <a href="#">March 29, 2010</a> by <a href="#">John Doe</a></p>

					<a class="button news-trigger" href="#">Read More...</a>

				</div><!-- end .entry-header -->

				<div class="collapsible-content">

					<div class="entry-content">

						<div class="zoom align-right">
							<a class="single_image" href="img/sample-images/800x600.jpg">
								<img src="img/sample-images/650x210.jpg" width="210" height="210" alt="Texas Trip 2010: Abandoned ranch" class="entry-image" />
							</a>
						</div>

						<p>Proin ornare, ante vitae tristique mattis, massa neque mattis justo, vel dapibus lectus urna quis orci. In imperdiet sapien eleifend turpis auctor imperdiet. Duis elementum consequat ante non accumsan. Aliquam mattis aliquam bibendum. Vivamus lobortis est ac lorem feugiat ac vestibulum velit viverra. Nullam dapibus elementum risus, volutpat fringilla libero aliquet vel. Integer in dui sed quam feugiat lobortis et non est. Sed aliquam, diam sed convallis laoreet, augue libero fermentum libero, eu pulvinar quam sem ac eros. In ac adipiscing mauris. Nulla sollicitudin ultricies nisi. </p>

						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc imperdiet enim hendrerit neque pharetra venenatis. Pellentesque a orci nisi, eu ultricies augue. Mauris feugiat sapien ac tellus facilisis bibendum. Duis sit amet ante sit amet lorem hendrerit gravida a nec mauris. Phasellus iaculis interdum ligula, ut ultricies risus porttitor sit amet. Praesent id felis ut mauris malesuada bibendum. Curabitur felis odio, adipiscing et blandit pellentesque, pretium et libero. Cras tincidunt tortor justo, in congue lectus. Etiam sagittis ligula a mauris laoreet ac consequat turpis sagittis. Suspendisse potenti. Ut nec sollicitudin felis. In hac habitasse platea dictumst. Quisque ut consequat enim. Curabitur sed ipsum nunc, non dignissim nibh. Cras sit amet molestie ante. Phasellus ipsum nulla, lacinia vel vestibulum eu, auctor id eros. Nunc faucibus felis vitae lacus cursus ut pretium massa mollis. Mauris neque diam, tincidunt hendrerit pellentesque sed, bibendum in sem. Curabitur elementum est a turpis hendrerit vel laoreet ante semper. Nam metus velit, sollicitudin ac feugiat at, viverra fermentum nibh. </p>

						<dl>
							<dt>Web:</dt>
								<dd>www.yourdomain.com</dd>
							<dt>Email:</dt>
								<dd>yourmail@yourdomain.com</dd>
							<dt>Phone:</dt>
								<dd>+88 44 777 99</dd>
						</dl>

					</div><!-- end .entry-content -->

					<div class="box-footer">

						<div class="align-left">

							<strong class="align-left">Share this via:</strong>

							<ul class="social-links align-left">
								<li><a href="#"><img alt="Digg" src="img/icons/social-icons/digg.png"></a></li>
								<li><a href="#"><img alt="Facebook" src="img/icons/social-icons/facebook.png"></a></li>
								<li><a href="#"><img alt="Flickr" src="img/icons/social-icons/flickr.png"></a></li>
								<li><a href="#"><img alt="Twittew" src="img/icons/social-icons/twitter.png"></a></li>
								<li><a href="#"><img alt="Delicious" src="img/icons/social-icons/delicious.png"></a></li>
								<li><a href="#"><img alt="Tumblr" src="img/icons/social-icons/tumblr.png"></a></li>
							</ul>

						</div><!-- end .align-left -->

					</div><!-- end .box-footer -->

				</div><!-- end .collapsible-content -->

			</div><!-- end .entry -->

			<div class="entry collapsible">

				<div class="entry-header">

					<img src="img/sample-images/75x40.jpg" width="75" height="40" alt="" class="entry-title-image">

					<h2 class="title">Plane crash caught on tape</h2>

					<p class="meta">Published on <a href="#">March 29, 2010</a> by <a href="#">John Doe</a></p>

					<a class="button news-trigger" href="#">Read More...</a>

				</div><!-- end .entry-header -->

				<div class="collapsible-content">

					<div class="entry-content">

						<div class="zoom align-right">
							<a class="single_image" href="img/sample-images/800x600.jpg">
								<img src="img/sample-images/650x210.jpg" width="210" height="210" alt="Texas Trip 2010: Abandoned ranch" class="entry-image" />
							</a>
						</div>

						<p>Proin ornare, ante vitae tristique mattis, massa neque mattis justo, vel dapibus lectus urna quis orci. In imperdiet sapien eleifend turpis auctor imperdiet. Duis elementum consequat ante non accumsan. Aliquam mattis aliquam bibendum. Vivamus lobortis est ac lorem feugiat ac vestibulum velit viverra. Nullam dapibus elementum risus, volutpat fringilla libero aliquet vel. Integer in dui sed quam feugiat lobortis et non est. Sed aliquam, diam sed convallis laoreet, augue libero fermentum libero, eu pulvinar quam sem ac eros. In ac adipiscing mauris. Nulla sollicitudin ultricies nisi. </p>

						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc imperdiet enim hendrerit neque pharetra venenatis. Pellentesque a orci nisi, eu ultricies augue. Mauris feugiat sapien ac tellus facilisis bibendum. Duis sit amet ante sit amet lorem hendrerit gravida a nec mauris. Phasellus iaculis interdum ligula, ut ultricies risus porttitor sit amet. Praesent id felis ut mauris malesuada bibendum. Curabitur felis odio, adipiscing et blandit pellentesque, pretium et libero. Cras tincidunt tortor justo, in congue lectus. Etiam sagittis ligula a mauris laoreet ac consequat turpis sagittis. Suspendisse potenti. Ut nec sollicitudin felis. In hac habitasse platea dictumst. Quisque ut consequat enim. Curabitur sed ipsum nunc, non dignissim nibh. Cras sit amet molestie ante. Phasellus ipsum nulla, lacinia vel vestibulum eu, auctor id eros. Nunc faucibus felis vitae lacus cursus ut pretium massa mollis. Mauris neque diam, tincidunt hendrerit pellentesque sed, bibendum in sem. Curabitur elementum est a turpis hendrerit vel laoreet ante semper. Nam metus velit, sollicitudin ac feugiat at, viverra fermentum nibh. </p>

						<dl>
							<dt>Web:</dt>
								<dd>www.yourdomain.com</dd>
							<dt>Email:</dt>
								<dd>yourmail@yourdomain.com</dd>
							<dt>Phone:</dt>
								<dd>+88 44 777 99</dd>
						</dl>

					</div><!-- end .entry-content -->

					<div class="box-footer">

						<div class="align-left">

							<strong class="align-left">Share this via:</strong>

							<ul class="social-links align-left">
								<li><a href="#"><img alt="Digg" src="img/icons/social-icons/digg.png"></a></li>
								<li><a href="#"><img alt="Facebook" src="img/icons/social-icons/facebook.png"></a></li>
								<li><a href="#"><img alt="Flickr" src="img/icons/social-icons/flickr.png"></a></li>
								<li><a href="#"><img alt="Twittew" src="img/icons/social-icons/twitter.png"></a></li>
								<li><a href="#"><img alt="Delicious" src="img/icons/social-icons/delicious.png"></a></li>
								<li><a href="#"><img alt="Tumblr" src="img/icons/social-icons/tumblr.png"></a></li>
							</ul>

						</div><!-- end .align-left -->

					</div><!-- end .box-footer -->

				</div><!-- end .collapsible-content -->

			</div><!-- end .entry -->

			<ul class="pagination">
				<li class="prev"><a href="#">Prev</a></li>
				<li><a href="#">1</a></li>
				<li class="active"><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li class="next"><a href="#">Next</a></li>
			</ul>
			
			<a href="#"><img alt="tf_468x60_v4" src="http://envato.s3.amazonaws.com/referrer_adverts/ad_468x60_v4.gif" class="ad" /></a>

		</div><!-- end #main -->

		<div id="sidebar">

			<div class="ads box">

				<ul>
					<li>
						<a href="#?ref=smuliii"><img width="125" height="125" src="http://envato.s3.amazonaws.com/referrer_adverts/tf_125x125_v5.gif" alt="Themeforest"></a>
					</li>
					<li class="even">
						<a href="http://graphicriver.net/?ref=smuliii"><img width="125" height="125" src="http://envato.s3.amazonaws.com/referrer_adverts/gr_125x125_v4.gif" alt="Graphicriver"></a>
					</li>
					<li>
						<a href="http://activeden.net/?ref=smuliii"><img width="125" height="125" src="http://envato.s3.amazonaws.com/referrer_adverts/ad_125x125_v4.gif" alt="Activeden"></a>
					</li>
					<li class="even">
						<a href="http://codecanyon.net/?ref=smuliii"><img width="125" height="125" src="http://envato.s3.amazonaws.com/referrer_adverts/cc_125x125_v1.gif" alt="CodeCanyon"></a>
					</li>
				</ul>

				<p class="align-center"><a href="#">Advertise With Us</a></p>

			</div><!-- end .ads -->

			<div id="recent-tabs" class="box">

				<div class="box-header">

					<ul class="nav">
						<li><a class="current" href="#recent-tabs-posts">Recent Post</a></li>
						<li><a href="#recent-tabs-comments">Recent Comments</a></li>
					</ul>

				</div><!-- end .box-header -->

				<div class="list-wrap">

					<ul id="recent-tabs-posts">

						<li>
							<a href="single-post.html" class="title">
								<img src="img/sample-images/40x40.jpg" width="40" height="40" alt="" />
								Palmtree Wind Photo from Miami ...
							</a>
							<p class="meta">Published on <a href="#">March 29, 2010</a> by <a href="#">John Doe</a></p>
						</li>

						<li>
							<a href="single-post.html" class="title">
								<img src="img/sample-images/40x40.jpg" width="40" height="40" alt="" />
								Keep Off: Beach Attention Table
							</a>
							<p class="meta">Published on <a href="#">March 29, 2010</a> by <a href="#">John Doe</a></p>
						</li>

						<li>
							<a href="single-post.html" class="title">
								<img src="img/sample-images/40x40.jpg" width="40" height="40" alt="" />
								Museum: Native American Style Box
							</a>
							<p class="meta">Published on <a href="#">March 29, 2010</a> by <a href="#">John Doe</a></p>
						</li>

						<li>
							<a href="single-post.html" class="title">
								<img src="img/sample-images/40x40.jpg" width="40" height="40" alt="" />
								Abroad Trip: Australian Rocks
							</a>
							<p class="meta">Published on <a href="#">March 29, 2010</a> by <a href="#">John Doe</a></p>
						</li>

						<li>
							<a href="single-post.html" class="title">
								<img src="img/sample-images/40x40.jpg" width="40" height="40" alt="" />
								Texas Trip 2010: Abandoned ranch
							</a>
							<p class="meta">Published on <a href="#">March 29, 2010</a> by <a href="#">John Doe</a></p>
						</li>

					</ul><!-- end #recent-tabs-posts-->

					<ul id="recent-tabs-comments" class="hide">

						<li>
							<a href="single-post.html" class="title">
								<img src="http://1.gravatar.com/avatar/ad516503a11cd5ca435acc9bb6523536?s=40" width="40" height="40" alt="" />
								Lorem ipsum dolor sit amet...
							</a>
							<p class="meta">Commented on <a href="#">March 29, 2010</a> by <a href="#">John Doe</a></p>
						</li>

						<li>
							<a href="single-post.html" class="title">
								<img src="http://1.gravatar.com/avatar/ad516503a11cd5ca435acc9bb6523536?s=40" width="40" height="40" alt="" />
								Lorem Ipsum is simply dummy text...
							</a>
							<p class="meta">Commented on <a href="#">March 17, 2010</a> by <a href="#">John Doe</a></p>
						</li>

						<li>
							<a href="single-post.html" class="title">
								<img src="http://1.gravatar.com/avatar/ad516503a11cd5ca435acc9bb6523536?s=40" width="40" height="40" alt="" />
								Lorem ipsum dolor sit amet...
							</a>
							<p class="meta">Commented on <a href="#">March 3, 2010</a> by <a href="#">John Doe</a></p>
						</li>

					</ul><!-- end #recent-tabs-comments -->

				</div><!-- end .list-wrap -->

			</div><!-- end #recent-tabs -->

			<div class="flickr-feed box">

				<div class="box-header">

					<h6 class="align-left"><img src="img/icon-flickr-feed.png" alt="icon-flickr-feed" class="flickr-icon" /> Our Flickr Group</h6>

					<a href="#" class="align-right">Sign In</a>

				</div><!-- end .box-header -->

				<ul>
					<li>
						<a href="http://www.flickr.com/photos/kwl/2432868269/">
							<img src="img/sample-images/75x75.jpg" width="75" height="75" alt="" class="flickr-image" />
						</a>
					</li>
					<li>
						<a href="http://www.flickr.com/photos/dexxus/4338578468/">
							<img src="img/sample-images/75x75.jpg" width="75" height="75" alt="" class="flickr-image" />
						</a>
					</li>
					<li>
						<a href="http://www.flickr.com/photos/extranoise/158135547/">
							<img src="img/sample-images/75x75.jpg" width="75" height="75" alt="" class="flickr-image" />
						</a>
					</li>
					<li>
						<a href="http://www.flickr.com/photos/18614695@N00/3472778601/">
							<img src="img/sample-images/75x75.jpg" width="75" height="75" alt="" class="flickr-image" />
						</a>
					</li>
					<li>
						<a href="http://www.flickr.com/photos/notsogoodphotography/466107969/">
							<img src="img/sample-images/75x75.jpg" width="75" height="75" alt="" class="flickr-image" />
						</a>
					</li>
					<li>
						<a href="http://www.flickr.com/photos/brunociampi/2487769238/">
							<img src="img/sample-images/75x75.jpg" width="75" height="75" alt="" class="flickr-image" />
						</a>
					</li>
				</ul>

			</div><!-- end .flickr-feed -->

			<div class="tags box">

				<div class="box-header">

					<h6>TravelGuide Tags</h6>

				</div><!-- end .box-header -->

				<ul>
					<li><a href="#">New York City</a></li>
					<li><a href="#">Australia</a></li>
					<li><a href="#">Woods</a></li>
					<li><a href="#">Beach</a></li>
					<li><a href="#">Brooklyn</a></li>
					<li><a href="#">Bridge</a></li>
					<li><a href="#">Texas</a></li>
					<li><a href="#">2010</a></li>
					<li><a href="#">Palmtree</a></li>
					<li><a href="#">Miami</a></li>
					<li><a href="#">Museum</a></li>
					<li><a href="#">Native</a></li>
					<li><a href="#">American</a></li>
					<li><a href="#">Trips</a></li>
					<li><a href="#">Private</a></li>
					<li><a href="#">Family</a></li>
					<li><a href="#">Photo</a></li>
				</ul>

			</div><!-- end .tags -->

			<img src="img/ad.gif" alt="ad" class="ad-bar" />
			<a href="#?ref=smuliii"><img src="http://envato.s3.amazonaws.com/referrer_adverts/tf_300x250_v5.gif" alt="tf_300x250_v5" class="ad" /></a>

		</div><!-- end #sidebar -->

		<div class="clear"></div>

	</div><!-- end .container -->

</div><!-- end #content -->

<script src="${pageContext.request.contextPath}/pages/mypages/js2/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/pages/mypages/js2/jquery.cycle.all.min.js"></script>
<script src="${pageContext.request.contextPath}/pages/mypages/js2/jquery.easing.1.3.js"></script>
<script src="${pageContext.request.contextPath}/pages/mypages/js2/organictabs.jquery.js"></script>
<script src="${pageContext.request.contextPath}/pages/mypages/js2/jquery.fancybox-1.3.4.pack.js"></script>
<script src="${pageContext.request.contextPath}/pages/mypages/js2/css3-mediaqueries.js"></script>
<script src="${pageContext.request.contextPath}/pages/mypages/js2/custom.js"></script>

</body>
</html>