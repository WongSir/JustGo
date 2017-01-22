<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>加载提示页面</title>
<%-- <%@include file="header.jsp"%> --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min93e3.css" type="text/css" />
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
<div class="loading">
	<div class="fixed-table-loading-content">
		<div><div>
			<i class="fa fa-spinner fa-spin fa-lg fa-icon-style" style="color:#090;"></i>
			正在努力地加载页面中，请稍候……
		</div></div>
	</div>
</div>
</body>
</html>