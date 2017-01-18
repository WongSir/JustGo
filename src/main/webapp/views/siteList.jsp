<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>网站列表</title>
<%@include file="header.jsp"%>

</head>
<body>
<%@include file="head.jsp"%>
<div class="container" style="font-size:15px;">
    <table class="table table-hover">
        <thead>
        <tr>
            <th>#</th>
            <th>网站域名</th>
            <th>资讯数</th>
            <th>查看列表</th>
            <th>删除</th>
            <th>导出数据</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${siteList}" var="site" varStatus="index">
            <tr>
                <th scope="row">${index.count}</th>
                <td>${site.key}</td>
                <td>${site.value}</td>
                <td><a class="btn btn-outline btn-primary"
                       href="${pageContext.request.contextPath}/views/newsList?domain=${site.key}">查看资讯列表</a>
                </td>
                <td><a class="btn btn-outline btn-danger"
                       onclick="rpcAndShowData('${pageContext.request.contextPath}/commons/webpage/deleteByDomain', {domain: '${site.key}'});">删除网站数据</a>
                </td>
                <td><a class="btn btn-outline btn-primary"
                       href="${pageContext.request.contextPath}/commons/webpage/exportWebpageJSONByDomain?domain=${site.key}">导出该网站数据JSON</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<div class="container" id="wordCloudBody" style="height:400px"></div>
</body>

</html>