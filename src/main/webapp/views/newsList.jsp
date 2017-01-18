<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>资讯列表</title>
<%@include file="header.jsp"%>

<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/pages/mypages/css2/fancybox.css" type="text/css"  /> --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/my.css" type="text/css" />
<script src="${pageContext.request.contextPath}/js/config.js"></script>


<!-- 引入新的样式元素 js-->
<script src="${pageContext.request.contextPath}/pages/mypages/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/pages/mypages/js/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/pages/mypages/js/jquery.form.js"></script>
<script src="${pageContext.request.contextPath}/pages/mypages/js/messages_zh.min.js"></script>
<script src="${pageContext.request.contextPath}/pages/mypages/js/tether.min.js"></script>
<script src="${pageContext.request.contextPath}/pages/mypages/js/bootstrap.js"></script>

</head>
<body>
<%@include file="head.jsp"%>
<div class="navigation">
		<nav class="navbar navbar-default" role="navigation">

			<div class="myform">
				<form class="form-inline" id="webpageForm"
					action="${pageContext.request.contextPath}/views/newsList">
					<div class="form-group">
						<label for="query">全文检索:</label>
						<input class="form-control" placeholder="请输入关键字" id="query" name="query" value="${query}"> 
						<input class="form-control" type="number" style="display: none" id="page" name="page" value="${page}"> 
						<!-- <label for="domain">域名:</label>  --><input type="hidden" class="form-control" id="domain" name="domain" value="${domain}">
						<button type="submit" class="btn btn-outline btn-primary"
							id="priceSubmit">搜索</button>
						<!-- <button class="btn btn-outline btn-primary" id="priceSubmit1"
							onclick="changePage1()">上一页</button>
						<button class="btn btn-outline btn-primary" id="priceSubmit2"
							onclick="changePage2()">下一页</button> -->
						<c:if test="${page == 1}">
							<li class="btn btn-outline btn-primary disabled my-a-color"><a href="#">上一页</a></li>
						</c:if>
						<c:if test="${page > 1}">
							<li class="btn btn-outline btn-primary my-a-color">
							<a class="hover-color" href="?query=${query}&page=${page-1}&domain=${domain}">上一页</a>
							</li>
						</c:if>
						<c:if test="${resultBundle.size() < 10}">
							<li class="btn btn-outline btn-primary disabled my-a-color"><a href="#">下一页</a></li>
						</c:if>
						<c:if test="${resultBundle.size() == 10}">
							<li class="btn btn-outline btn-primary my-a-color"><a href="?query=${query}&page=${page+1}&domain=${domain}">下一页</a></li>
						</c:if>
					</div>
					<%-- <div class="row">
						<nav>
							<ul class="pager">
								<c:if test="${page == 1}">
									<li class="pager-prev disabled"><a href="#">上一页</a></li>
								</c:if>
								<c:if test="${page > 1}">
									<li class="pager-prev"><a
										href="?query=${query}&page=${page-1}&domain=${domain}">上一页</a></li>
								</c:if>
								<c:if test="${resultBundle.size() < 10}">
									<li class="pager-next disabled"><a href="#">下一页</a></li>
								</c:if>
								<c:if test="${resultBundle.size() == 10}">
									<li class="pager-next"><a
										href="?query=${query}&page=${page+1}&domain=${domain}">下一页</a></li>
								</c:if>
							</ul>
						</nav>
					</div> --%>
				</form>
			</div>
			
			
		</nav> 
	</div>

<div class="container" style="font-size:15px;">
    <div class="row">
        <table class="table table-hover">
            <thead class="thead-inverse">
            <tr>
                <th>#</th>
                <th>标题</th>
                <th>网站</th>
                <th>时间</th>
                <th>查看</th>
                <th>转到</th>
                <th>删除</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${resultBundle}" var="webpage" varStatus="index">
                <tr>
                    <th scope="row">${index.count}</th>
                    <td>${webpage.title}</td>
                    <td>${webpage.domain}</td>
                    <td><fmt:formatDate value="${webpage.gathertime}" pattern="yyyy/MM/dd HH:mm:ss"/></td>
                    <td>
                        <button onclick="showDetail('${webpage.id}')" class="btn btn-outline btn-info">Show</button>
                    </td>
                    <td>
                        <a href="${pageContext.request.contextPath}/views/showWebpageById?id=${webpage.id}"
                           class="btn btn-outline btn-primary" target="_blank">&nbsp;Go&nbsp;</a>
                    </td>
                    <td>
                        <button onclick="rpcAndShowData('${pageContext.request.contextPath}/commons/webpage/deleteById',{id:'${webpage.id}'})"
                                class="btn btn-outline btn-danger">
                            删除
                        </button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    
</div>

</body>

<script type="text/javascript">
        $(function () {
            var validate = $("#webpageForm").validate({
                rules: {
                    page: {
                        required: true,
                        number: true
                    }
                },
                highlight: function (element) {
                    $(element).closest('.form-group').addClass('has-error');
                },
                success: function (label) {
                    label.closest('.form-group').removeClass('has-error');
                    label.remove();
                },
                errorPlacement: function (error, element) {
                    element.parent('div').append(error);
                }
            });

        });
        function showDetail(id) {
            rpc('${pageContext.request.contextPath}/commons/webpage/getWebpageById', {id: id}, function (data) {
                $("#modalTitle").text(data.result.title);
                var modalBody = $("#modalBody");
                modalBody.html('');
                modalBody.append("<h4>正文</h4>");
                modalBody.append('<p>' + data.result.content + '</p>');
                modalBody.append("<h4>关键词</h4>");
                if (data.result.keywords != undefined) {
                    $.each(data.result.keywords, function (i, word) {
                        modalBody.append(word + ' ,');
                    });
                }
                modalBody.append("<h4>摘要</h4>");
                if (data.result.summary != undefined) {
                    modalBody.append('<p>' + data.result.summary.join(' ,') + '</p>');
                }
                modalBody.append("<h4>发布时间</h4>");
                modalBody.append('<span>' + data.result.publishTime + '</span>');
                modalBody.append("<h4>动态字段</h4>");
                if (data.result.dynamicFields != undefined) {
                    $.each(data.result.dynamicFields, function (k, v) {
                        modalBody.append("<p>" + k + " : " + v + "</p>");
                    });
                }
                $('#myModal').modal('show');
            });
        }
    </script>


</html>