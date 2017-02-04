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
<%@include file="head.jsp"%>


<div class="group">
	<form class="form-inline" method="GET" action="${pageContext.request.contextPath}/views/advanceSearch/searchAndCraweling">
		<div class="input-group col-xs-8">
			<input type="text" name="key" id="key" class="form-control" placeholder="请您输入关键词">
			<span class="input-group-btn">
			 	<button type="submit" class="btn btn-success"  style="width: 80px;" onclick="showLoading()">Go</button>
				<!-- <a  class="btn btn-outline btn-primary " style="width: 80px;" href="#" onclick="showLoading()">Go</a> -->  <!-- onclick="showLoading()"  id="search_submit"触发jQuery-->
			</span>
		</div>
	</form>
</div>
<div class="spinner">
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
	
	$("#search_submit").on('click',function(e){
		e.preventDefault(); //取消默认事件。
		var key = $("#keyword").val();
		search(key);
		
		var flag = true;
		if (flag) {
		loadStyles('${pageContext.request.contextPath}/css/other.css');
		}
	});
	function search(key){
		var url = "/newsSpider/views/advanceSearch/searchAndCraweling";
		
		$.post(url,{key:key},function(data){
			
			if(data!=null){
				/* if(key==null || key==""){
					var url = "/newsSpider/views/advanceSearch/searchAndCraweling";
					window.location.href = url;
				}else{
					var url ="${pageContext.request.contextPath}/views/searchList.jsp";
					window.location.href = url; 
				} */
				
			}else{
				var url ="/newsSpider/views/error.jsp";
				window.location.href = url;
			}
		});
	}
	
</script>

<script type="text/javascript">     
    //显示遮罩层    
    function showLoading(){     
        $("#loading").css({ display: "block"});     
        $("#loading").show();     
    }  
    //隐藏遮罩层  
    function hideLoading(){     
          
        $("#loading").hide();     
    }  
     
</script>  

</html>