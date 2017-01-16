<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- header-section-starts-here -->
	<div class="header">
		<div class="header-top">
			<div class="wrap " id="head">
				<div class="top-menu">
					<ul>
						<li><a href="${pageContext.request.contextPath}/panel/commons/newsList">首页</a></li>
						<li><a href="${pageContext.request.contextPath}/panel/commons/siteList">网站列表</a></li>
						<li><a href="${pageContext.request.contextPath}/panel/commons/templateList">模板列表</a></li>
						<li><a href="${pageContext.request.contextPath}/panel/commons/crawlingEntry">快速入口</a></li>
						<li><a href="#">高级配置</a></li>
						<li><a href="#">高级搜索</a></li>
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
				<a href="/spider/pages/mypages/my/crawl.jsp"><img src="${pageContext.request.contextPath}/pages/mypages/imgs/logo.jpg" alt="" /></a>
			</div>
		</div>	
			<!-- 信息分类 -->
		<div class="category">
			
		</div>

		<%-- <div class="navigation">
				<nav class="navbar navbar-default" role="navigation">
				
		   <div class="myform" >
			<form class="form-inline" id="webpageForm"
				action="${pageContext.request.contextPath}/panel/commons/newsList">
				<div class="form-group">
					<label for="query">关键词:</label> <input class="form-control"
						id="query" name="query" value="${query}"> <input
						class="form-control" type="number" style="display: none" id="page"
						name="page" value="${page}">
					<button type="submit" class="btn btn-outline btn-primary" id="priceSubmit">搜索</button>
					<button class="btn btn-outline btn-primary" id="priceSubmit1"
						onclick="changePage1()">上一页</button>
					<button class="btn btn-outline btn-primary" id="priceSubmit2"
						onclick="changePage2()">下一页</button>
				</div>
			</form>
		</div>
			</div>
		</nav>
		</div> --%>
	</div>
	<!-- header-section-ends-here -->