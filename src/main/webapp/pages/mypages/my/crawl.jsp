<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>入口</title>
<%@include file="header.jsp"%>

<link href="${pageContext.request.contextPath}/pages/mypages/css2/my.css" rel="stylesheet" type='text/css' />
</head>

<body>
<div class="">
	<div class="main_crawl">
		<div class="form-group">
			<div class="input-group col-xs-6">
				<div class="input-group-btn">
					<select name="type" class="form-control" id="selector" style="width: 500px;">
						<option value="">请选择要crawl的网站</option>
						<option value="1">腾讯网</option>
						<option value="2">中国新闻网</option>
						<option value="3">开源中国网</option>
						<option value="4">诗词名句网</option>
					</select>
				</div>
				<!-- <input type="text" name="keyword" id="keyword" class="form-control" placeholder="请您输入关键词"> -->
				<span class="input-group-btn">
					<button class="btn btn-success" id="search_submit" type="submit" style="width: 80px;"><a href="${pageContext.request.contextPath}/commons/spider/crawl">Go</a></button>
				</span>
			</div>
		</div>
	</div>
	<div class="">
		<button id="fat-btn" class="btn btn-primary homepage" type="button"> <a href="${pageContext.request.contextPath}/panel/commons/listTest?page=1">返回首页</a>
	</div>
</div>
</body>

<script type="text/javascript">
	
	$("#search_submit").on('click',function(e){
		e.preventDefault(); //取消默认事件。
		var code=$("#selector").val();
		alert("取得的code为：" +code);
		crawl(code);
	});
	function crawl(code){
		var url = "/spider/commons/spider/crawl";
		$.post(url,{code:code},function(){
			/* var url ="/spider/pages/mypages/my/list.jsp"; */
			var url ="${pageContext.request.contextPath}/panel/commons/listTest";
			window.location.href = url;
		});
	}
	
</script>

</html>