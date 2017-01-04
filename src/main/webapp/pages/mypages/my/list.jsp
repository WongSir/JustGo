<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>资讯列表</title>
<%@include file="header.jsp"%>

<%-- <script
	src="${pageContext.request.contextPath}/pages/mypages/js/responsiveslides.min.js"></script> --%>
<!-- <script>
	$(function() {
		$("#slider").responsiveSlides({
			auto : true,
			nav : true,
			speed : 500,
			namespace : "callbacks",
			pager : true,
		});
	});
</script> -->
<%-- <script type="text/javascript"
	src="${pageContext.request.contextPath}/pages/mypages/js/move-top.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/pages/mypages/js/easing.js"></script> --%>
<!--/script-->
<!-- <script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event) {
			event.preventDefault();
			$('html,body').animate({
				scrollTop : $(this.hash).offset().top
			}, 900);
		});
	});
</script> -->

<script type="text/javascript">
	var mpage = 1;
	  function UrlValue(name) { //获取页面URL地址参数方法
	        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i"); //声明正则表达式
	        var r = window.location.search.trim().substr(1).match(reg); //用正则表达式匹配URL地址参数
	        if (r != null) return decodeURI(r[2]); return null; //如果匹配到参数，返回参数结果，如果没有匹配到，返回null
	}
	function changePage1() {
		/* var currentPage = +$("#page").val(); //取得当前页 */
		var currentPage = UrlValue("page");
		mpage = currentPage - 1;
		if (mpage < 1) {
			alert("到始发站了哦！");
			$("#page").val(1);
		} else {
			$("#page").val(mpage);
		}
		$("#webpageForm").submit();
	}
	function changePage2() {
		var currentPage = UrlValue("page"); //取得当前页
		mpage = + currentPage + 1;
		$("#page").val(mpage);
		$("#webpageForm").submit();
	}
</script>

<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/pages/mypages/css2/fancybox.css" type="text/css"  /> --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/pages/mypages/css2/my.css" type="text/css" />

<!-- 引入新的样式元素 js3 css3-->
<link href="${pageContext.request.contextPath}/pages/mypages/css3/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
<link href="${pageContext.request.contextPath}/pages/mypages/css3/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
<link href="${pageContext.request.contextPath}/pages/mypages/css3/animate.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/pages/mypages/css3/style.min862f.css?v=4.1.0" rel="stylesheet">

<script src="${pageContext.request.contextPath}/pages/mypages/js3/jquery.min.js?v=2.1.4"></script>
<script src="${pageContext.request.contextPath}/pages/mypages/js3/bootstrap.min.js?v=3.3.6"></script>
<script src="${pageContext.request.contextPath}/pages/mypages/js3/content.min.js?v=1.0.0"></script>

</head>
<body>
	<%@include file="head.jsp"%>

	<div id="content">
		<div class="mycontainer">
		<!-- <div class="container"> -->
			<div id="main">
				<div class="entry collapsible">
					<c:forEach items="${resultBundle}" var="webpage" varStatus="index">
						<div class="entry-header">
							<%-- <img
								src="${pageContext.request.contextPath}/pages/mypages/imgs/75x40.jpg"
								width="75" height="40" alt="" class="entry-title-image"> --%>
							<h2 class="title">${webpage.title }</h2>
							<p class="meta">
								抓取时间： <a href="#"><fmt:formatDate
										value="${webpage.gathertime}" pattern="yyyy/MM/dd HH:mm:ss" /></a>
								信息分类： <a href="#">${webpage.category }</a>&nbsp; 来源：<a href="#"></a>
							</p>
							<!-- <a class="button news-trigger " href="#">详情</a> -->
							<a class="btn btn-outline btn-primary news-trigger detail_btn" href="#">详情</a>
							 <!-- <button type="button" class="btn btn-outline btn-primary">主要</button> -->
						</div>
						<!-- end .entry-header -->
						<div class="collapsible-content">
							<div class="entry-content">
								<dl>
									<dt>原文链接: <a class="" href="${webpage.url}">${webpage.url}</a></dt>
								</dl>
								<p class="webcontent">${webpage.title }</p>
								<p class="webcontent">${webpage.content }</p>
							</div>
							<!-- end .entry-content -->
							<div class="box-footer">
								<div class="align-left"></div>
								<!-- end .align-left -->
							</div>
							<!-- end .box-footer -->
						</div>
						<!-- end .collapsible-content -->
					</c:forEach>
					</table>
				</div>
				<!-- end .entry -->
			</div>
			<!-- end #main -->
			<div class="clear"></div>
		<!-- </div> -->
		<!-- end .container -->
	</div>
	</div>
	<!-- end #content -->

<script src="${pageContext.request.contextPath}/pages/mypages/js2/jquery.min.js"></script>
<%-- <script src="${pageContext.request.contextPath}/pages/mypages/js2/jquery.cycle.all.min.js"></script>
<script src="${pageContext.request.contextPath}/pages/mypages/js2/jquery.easing.1.3.js"></script>
<script src="${pageContext.request.contextPath}/pages/mypages/js2/organictabs.jquery.js"></script>
<script src="${pageContext.request.contextPath}/pages/mypages/js2/jquery.fancybox-1.3.4.pack.js"></script>
<script src="${pageContext.request.contextPath}/pages/mypages/js2/css3-mediaqueries.js"></script> --%>
<script src="${pageContext.request.contextPath}/pages/mypages/js2/my.js"></script>

</body>

</html>