<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>高级搜索</title>
<%@include file="header.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/my.css" type="text/css" />
</head>
<body>

<div class="header">
		<div class="header-top">
			<div class="wrap " id="head">
				<div class="top-menu">
					<ul>
						<li><a href="${pageContext.request.contextPath}/views/newsList">首页</a></li>
						<li><a href="${pageContext.request.contextPath}/views/siteList">网站列表</a></li>
						<li><a href="${pageContext.request.contextPath}/views/templateList">模板列表</a></li>
						<li><a href="${pageContext.request.contextPath}/views/crawlingEntry">快速入口</a></li>
						<li><a href="${pageContext.request.contextPath}/views/advanceConfig">高级配置</a></li>
						<li><a href="${pageContext.request.contextPath}/views/advanceSearch">高级搜索</a></li>
					</ul>
				</div>
				<div class="num">
					<p> Call us : 032 2352 782</p>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
			<!-- 信息分类 -->
		<div class="category">
			
		</div>
</div>

<div class="group">
	<div class="input-group col-xs-8">
		<input type="text" name="keyword" id="keyword" class="form-control" placeholder="请您输入关键词">
		<span class="input-group-btn">
		 	<%-- <button class="btn btn-success" id="search_submit"  style="width: 80px;"><a href="${pageContext.request.contextPath}/commons/spider/crawl">Gosd</a></button> --%>
			<a id="search_submit" class="btn btn-outline btn-primary " style="width: 80px;" href="${pageContext.request.contextPath}/views/advanceSearch/searchAndCraweling">Go</a>
		</span>
	</div>
</div>

</body>
</html>