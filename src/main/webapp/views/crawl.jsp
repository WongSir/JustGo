<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>入口</title>
<%@include file="header.jsp"%>

<link href="${pageContext.request.contextPath}/css/my.css" rel="stylesheet" type='text/css' />


</head>

<body>
<%@include file="head.jsp"%>
<div class="">
	<div class="main_crawl">
		<div class="form-group">
			<div class="input-group col-xs-10">
			<input type="text" name="num" id="num" class="form-control" placeholder="输入抓取数量（默认抓取30条）">
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
				 	<%-- <button class="btn btn-success" id="search_submit"  style="width: 80px;"><a href="${pageContext.request.contextPath}/commons/spider/crawl">Gosd</a></button> --%>
					<a id="search_submit" class="btn btn-outline btn-primary " style="width: 80px;" href="${pageContext.request.contextPath}/commons/spider/crawl">Go</a>
				</span>
			</div>
		</div>
	</div>
	<%-- <div class="">
		<button id="fat-btn" class="btn btn-primary homepage" type="button"> <a href="${pageContext.request.contextPath}/panel/commons/newsList?page=1">返回首页</a>
	</div> --%>
</div>

	<%-- <div class="gohome">
		<a class="animated bounceInUp" href="${pageContext.request.contextPath}/panel/commons/newsList?page=1" title="返回首页"><i
			class="fa fa-home"></i></a>
	</div> --%>

</body>

<script type="text/javascript">
	
	$("#search_submit").on('click',function(e){
		e.preventDefault(); //取消默认事件。
		var code=$("#selector").val();
		var count = $("#num").val();
		if(count==""){
			count=30;
		}
		crawl(code,count);
	});
	function crawl(code,count){
		var url = "/newsSpider/commons/spider/crawl";
		
		 $("#confirmModalTitle").text("正在抓取");
         $("#confirmModalBody").html("正在抓取,请稍后");
         $('#confirmModal').modal({
             keyboard: false,
             backdrop: "static"
         });
		$.post(url,{code:code,count:count},function(data){
			/* var url ="/spider/pages/mypages/my/list.jsp"; */
			
			$("#webpageTableBody").html("");
             var modalBody = $("#confirmModalBody");
             var modalTitle = $("#confirmModalTitle");
             if (data.count <= 0) {
                 modalTitle.text("错误!");
                 modalBody.html("无法获取数据,请检查模板参数");
                 return;
             }
             modalTitle.text("成功!");
             modalBody.html("已抓取数据,正在渲染,请稍后");
             setTimeout("$('#confirmModal').modal('hide')", 2000);
             
			var url ="${pageContext.request.contextPath}/views/newsList?page=1";
			window.location.href = url;
		});
	}
	
</script>

</html>