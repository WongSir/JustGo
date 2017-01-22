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
<%@include file="head.jsp"%>


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

<script type="text/javascript">
	
	$("#search_submit").on('click',function(e){
		e.preventDefault(); //取消默认事件。
		var key = $("#keyword").val();
		search(key);
	});
	function search(key){
		var url = "/newsSpider/views/advanceSearch/searchAndCraweling";
		
		$.post(url,{key:key},function(data){
			
			if(data!=null){
				if(key==null || key==""){
					var url = "/newsSpider/views/advanceSearch/searchAndCraweling";
					window.location.href = url;
				}else{
					var url ="${pageContext.request.contextPath}/views/searchList.jsp";
					window.location.href = url; 
				}
				
			}else{
				var url ="/newsSpider/views/error.jsp";
				window.location.href = url;
			}
		});
	}
	
</script>


</html>