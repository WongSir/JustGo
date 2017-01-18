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
                       href="${pageContext.request.contextPath}/views/editConfigById?spiderInfoId=${template.id}">编辑</a>
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

</html>