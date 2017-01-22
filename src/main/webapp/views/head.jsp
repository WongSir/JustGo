<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- header-section-starts-here -->
	<div class="header" id="fixed_header">
		<div class="header-top">
			<div class="wrap " id="head">
				<div class="top-menu">
					<ul>
						<li><a href="${pageContext.request.contextPath}/views/newsList">首页</a></li>
						<li><a href="${pageContext.request.contextPath}/views/siteList">网站列表</a></li>
						<li><a href="${pageContext.request.contextPath}/views/templateList">模板列表</a></li>
						<li><a href="${pageContext.request.contextPath}/views/crawlingEntry">快速入口</a></li>
						<li><a href="${pageContext.request.contextPath}/views/advanceConfig">高级配置</a></li>
						<li><a href="${pageContext.request.contextPath}/views/advanceSearch">高级搜索</a></li>
					</ul>
				</div>
				<div class="num">
					<p> Call us : 032 2352 782</p>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		<div class="header-bottom">
			<div class="logo text-center">
				<a href="/spider/pages/mypages/my/crawl.jsp"><img src="${pageContext.request.contextPath}/pages/mypages/imgs/logo.jpg" alt="" /></a>
			</div>
		</div>	
			<!-- 信息分类 -->
		<div class="category">
			
		</div>

		<%-- <div class="navigation">
				<nav class="navbar navbar-default" role="navigation">
				
		   <div class="myform" >
			<form class="form-inline" id="webpageForm"
				action="${pageContext.request.contextPath}/panel/commons/newsList">
				<div class="form-group">
					<label for="query">关键词:</label> <input class="form-control"
						id="query" name="query" value="${query}"> <input
						class="form-control" type="number" style="display: none" id="page"
						name="page" value="${page}">
					<button type="submit" class="btn btn-outline btn-primary" id="priceSubmit">搜索</button>
					<button class="btn btn-outline btn-primary" id="priceSubmit1"
						onclick="changePage1()">上一页</button>
					<button class="btn btn-outline btn-primary" id="priceSubmit2"
						onclick="changePage2()">下一页</button>
				</div>
			</form>
		</div>
			</div>
		</nav>
		</div> --%>
	</div>
	<!-- header-section-ends-here -->
	
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" style="overflow:scroll">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    <span class="sr-only">Close</span>
                </button>
                <h4 class="modal-title" id="modalTitle"></h4>
            </div>
            <div class="modal-body" id="modalBody">

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-outline btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>
<div class="modal fade" id="confirmModal" tabindex="-1" role="dialog" style="overflow:scroll">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    <span class="sr-only">Close</span>
                </button>
                <h4 class="modal-title" id="confirmModalTitle"></h4>
            </div>
            <div class="modal-body" id="confirmModalBody">

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-outline btn-secondary" data-dismiss="modal" id="cancelButton">取消</button>
                <button type="button" class="btn btn-outline btn-primary" id="confirmButton">确定</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>
<div class="modal fade" id="inputModal" tabindex="-1" role="dialog" style="overflow:scroll">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    <span class="sr-only">Close</span>
                </button>
                <h4 class="modal-title" id="inputModalTitle"></h4>
            </div>
            <div class="modal-body" id="inputModalBody">
                <div class="form-group">
                    <label for="data"></label>
                    <input type="text" class="form-control" id="data" name="data" placeholder="data">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-outline btn-secondary" data-dismiss="modal" id="cancelInputButton">取消</button>
                <button type="button" class="btn btn-outline btn-primary" id="confirmInputButton">确定</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>

<div class="modal fade" id="tableModal" tabindex="-1" role="dialog" style="overflow:scroll">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    <span class="sr-only">Close</span>
                </button>
                <h4 class="modal-title" id="tableModalTitle"></h4>
            </div>
            <div class="modal-body">
                <table class="table table-hover">
                    <tbody id="tableModalBody">
                    <thead>
                    <tr>
                        <th>字段名称</th>
                        <th>字段值</th>
                    </tr>
                    </thead>
                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-outline btn-secondary" data-dismiss="modal">取消</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>
	
	
	
	