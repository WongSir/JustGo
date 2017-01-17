<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>模板列表</title>
<%@include file="header.jsp"%>
</head>
<body>
<%@include file="head.jsp"%>
<div class="container" style="font-size:15px;">
    <table class="table table-hover">
        <thead class="thead-inverse">
        <tr>
            <th>#</th>
            <th>网站域名</th>
            <th>网站名称</th>
            <%--<th>查看数据</th>--%>
            <th>编辑</th>
            <th>删除</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${templateList}" var="template" varStatus="index">
            <tr>
                <th scope="row">${index.count}</th>
                <td>${template.domain}</td>
                <td>${template.siteName}</td>
                    <%--<td></td>--%>
                <td>
                    <a class="btn btn-outline btn-primary"
                       href="${pageContext.request.contextPath}/panel/commons/editConfigById?spiderInfoId=${template.id}">编辑</a>
                </td>
                <td>
                    <button onclick="rpcAndShowData('${pageContext.request.contextPath}/commons/spiderinfo/deleteById',{id:'${template.id}'})"
                            class="btn btn-outline btn-danger">
                        删除
                    </button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>

<!-- 引入新的样式元素 js3 css3-->
<link href="${pageContext.request.contextPath}/pages/mypages/css3/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
<link href="${pageContext.request.contextPath}/pages/mypages/css3/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
<link href="${pageContext.request.contextPath}/pages/mypages/css3/animate.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/pages/mypages/css3/style.min862f.css?v=4.1.0" rel="stylesheet">

<script src="${pageContext.request.contextPath}/pages/mypages/js3/jquery.min.js?v=2.1.4"></script>
<script src="${pageContext.request.contextPath}/pages/mypages/js3/bootstrap.min.js?v=3.3.6"></script>
<script src="${pageContext.request.contextPath}/pages/mypages/js3/content.min.js?v=1.0.0"></script>

</html>