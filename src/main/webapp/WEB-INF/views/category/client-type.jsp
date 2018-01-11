<%@page import="com.tp.utils.Constants"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<base href="<%=Constants.TOMCAT_SHOW %>" />
<title>客户端分类</title>
<script>
			$(document).ready(function(){
				$("#message").fadeOut(3000);	
				$("#ccategory-tab").addClass("active");
                $("#ccategory-tab a").append("<i class='icon-remove-circle'></i>");
			});
			function deleteThis(id){
				if(confirm("确定要删除吗?")){
					window.location="category/client-type!delete.action?id="+id;
				}
			}
		</script>
</head>
<body>
	<form action="category/category.action" method="get">
		<h1>客户端分类</h1>
		<c:if test="${not empty actionMessages}">
			<div id="message" class="alert alert-success">${actionMessages}</div>
		</c:if>
        <div class="pull-right">
            <shiro:hasPermission name="category:edit">
                <a class="icon-plus" href="category/client-type!input.action">新增</a>
            </shiro:hasPermission>
        </div>
		<table class="table table-bordered table-striped">
			<thead>
				<tr>
					<th>分类名称</th>
					<th>分类键值</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="cts">
					<tr>
						<td>${name}</td>
						<td>${value}</td>
						<td>
							<shiro:hasPermission name="category:edit">
								<a href="category/client-type!input.action?id=${id}"><i class="icon-edit"></i></a>
                                &nbsp;
								<a href="javascript:void(0)" onclick="deleteThis(${id})"><i class="icon-trash"></i></a>
							</shiro:hasPermission>	
						</td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
	</form>

</body>
</html>