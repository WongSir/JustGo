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
<style>
	body {
	    padding-bottom: 0;
	    min-height: 100%;
	    color: #444;
	    font-size: 13px;
	    font-family: 'Microsoft YaHei';
	}
	.loading {
		position: absolute;
		top: 0px;
		bottom: 0px;
		left: 0px;
		right: 0px; 
		overflow: hidden;
		z-index: 99999;
	}
	.fixed-table-loading-content { display: table !important; _position: relative; overflow: hidden; min-height: 136px; height: 100%; width: 100%; background-color: transparent; }
	.fixed-table-loading-content > div { vertical-align: middle; display: table-cell; _position: absolute; _top: 50%; width: 100%; }
	.fixed-table-loading-content > div > div { _position: relative; text-align: center; width: 100%; _top: -50%; font-size: 16px; }
</style>
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
						<li><a href="${pageContext.request.contextPath}/views/entry">快速入口</a></li>
						<li><a href="${pageContext.request.contextPath}/views/advanceConfig">高级配置</a></li>
						<li><a href="${pageContext.request.contextPath}/views/advanceSearch">高级搜索</a></li>
					</ul>
				</div>
				<div class="num">
					<p> 联系我们 : 020 8888888</p>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
			<!-- 信息分类 -->
		<div class="category">
			
		</div>
</div>

<div class="group">
	<form class="form-inline" method="GET" action="${pageContext.request.contextPath}/views/advanceSearch/searchAndCraweling">
		<div class="input-group col-xs-8">
			<input type="text" name="key" id="key" class="form-control" placeholder="请您输入关键词" value="${key }">
			<span class="input-group-btn">
			 	<button type="submit" class="btn btn-success"  style="width: 80px;" onclick="showLoading()">Go</button>
				<!-- <a  class="btn btn-outline btn-primary " style="width: 80px;" href="#" onclick="showLoading()">Go</a> -->  <!-- onclick="showLoading()"  id="search_submit"触发jQuery-->
			</span>
		</div>
	</form>
</div>

<div id="search-content" class="search-content" style="margin-left:200px">
	<div id="searchList" class="searchList">
		<c:forEach items="${spiderSearch}" var="search" varStatus="index">
				<h2 class="title"><a href="${search.url }" target="_blank">${search.title }</a></h2>
				<a href="${search.url }" target="_blank">${search.url }</a>
				<p class="meta">
					${search.content }
				</p>
		</c:forEach>
	</div>
</div>

<div id="loading" class="loading" style="display:none">
	<div class="fixed-table-loading-content">
		<div><div>
			<i class="fa fa-spinner fa-spin fa-lg fa-icon-style" style="color:#090;"></i>
			正在努力地加载页面中，请稍候……
		</div></div>
	</div>
</div>

</body>

<script type="text/javascript">     
    //显示遮罩层    
    function showLoading(){     
        $("#loading").css({ display: "block"});  
        $("#searchList").html(" ");
        $("#loading").show();     
    }  
    //隐藏遮罩层  
    function hideLoading(){     
        $("#loading").hide();     
    }  
     
</script> 

</html>