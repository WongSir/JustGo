<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>相关资讯</title>
<%@include file="header.jsp"%>

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

<div class="container">
    <div class="row">
        <h1 class="display-1">
            ${title}
        </h1>
    </div>
    <div class="row">
        <div class="col-sm-6">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>人物名称</th>
                    <th>提及次数</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${relatedPeople}" var="bucket">
                    <tr>
                        <td>${bucket.key} </td>
                        <td> ${bucket.docCount}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="col-sm-6">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>地点名称</th>
                    <th>提及次数</th>
                </tr>
                </thead>
                <tbody>

                <c:forEach items="${relatedLocation}" var="bucket">
                    <tr>
                        <td>${bucket.key} </td>
                        <td> ${bucket.docCount}</td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-6">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>机构名称</th>
                    <th>提及次数</th>
                </tr>
                </thead>
                <tbody>

                <c:forEach items="${relatedInstitution}" var="bucket">
                    <tr>
                        <td>${bucket.key} </td>
                        <td> ${bucket.docCount}</td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
        </div>
        <div class="col-sm-6">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>关键词</th>
                    <th>提及次数</th>
                </tr>
                </thead>
                <tbody>

                <c:forEach items="${relatedKeywords}" var="bucket">
                    <tr>
                        <td>${bucket.key} </td>
                        <td> ${bucket.docCount}</td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
        </div>
    </div>
</div>

</body>
</html>