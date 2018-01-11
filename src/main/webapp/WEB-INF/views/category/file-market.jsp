<%@page import="com.tp.utils.Constants"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp" %>
<!DOCTYPE HTML>
<html>
	<head>
		<base href="<%=Constants.TOMCAT_SHOW %>" />
		<title>文件市场信息</title>
		<script src="js/jquery/jquery-1.7.min.js"></script>
		<script src="js/table.js"></script>
		<script>
			$(document).ready(function(){
				$("#message").fadeOut(3000);
				$("#market-tab").addClass("active");
                $("#market-tab a").append("<i class='icon-remove-circle'></i>");
			});
			function deleteThis(id,tid,mid){
				if(confirm("确定要删除吗?")){
					window.location="category/file-market!delete.action?id="+id+"&themeId="+tid+"&marketId="+mid;
				}
			}
		</script>
	</head>
	<body>
		<div class="container">
			<form id="mainForm" action="category/file-market.action" method="post">

			<h1>文件市场信息列表</h1>
			<c:if test="${not empty actionMessages}">
				<div id="message" class="success">${actionMessages}</div>	
			</c:if>
			
		
			<table class="table table-striped table-bordered table-condensed">
				<thead>
				<tr>
											
					<th>字段名</th>		
					<th>key值</th>				
				
					<th>操作</th>
				</tr>
				</thead>
				<tbody>
				<s:iterator value="fileMarketValues">
					<tr>
					
						<td>${keyName}</td>
						<td>${keyValue}</td>
						<td>
							<shiro:hasPermission name="file:edit">
								<a href="category/file-market!input.action?id=${id}&themeId=${themeId}&marketId=${marketId}">修改</a>
								<a href="javascript:void(0)" onclick="deleteThis(${id},${themeId},${marketId})">删除</a>
							
							</shiro:hasPermission>
						</td>
					</tr>
				</s:iterator>
				</tbody>
			</table>	
			<a class="btn" href="category/file-market!input.action?themeId=${themeId}&marketId=${marketId}">新增字段</a>&nbsp;
			<a class="btn" href="javascript:void(0)" onclick="window.close();">返回</a>
		</div>
		</form>
		
	</body>
</html>