<%@page import="com.tp.utils.Constants"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<base href="<%=Constants.TOMCAT_SHOW %>" />
<title>文件分类</title>
<script>
			$(document).ready(function(){
				$("#message").fadeOut(3000);	
				$("#category-tab").addClass("active");
                $("#category-tab a").append("<i class='icon-remove-circle'></i>");
               	$("#standard").addClass("active");
			});
			function deleteThis(id){
				if(confirm("确定要删除吗?")){
					window.location="category/category!delete.action?id="+id;
				}
			}
		</script>
</head>
<body>
	<form action="category/category.action" method="get" class="form-horizontal">
		<h1>解锁文件分类</h1>
		<c:if test="${not empty actionMessages}">
			<div id="message" class="alert alert-success">${actionMessages}</div>
		</c:if>
		<ul class="nav nav-pills" style="margin-bottom: 2px; float: left;">
			<li id="standard"><a href="category/category.action">标准解锁</a>
			</li>
			<li id="diy"><a href="category/diy.action">DIY解锁</a>
			</li>
		</ul>
        <div class="pull-right">
            <shiro:hasPermission name="category:edit">
                <a class="icon-plus" href="category/category!input.action">新增</a>
            </shiro:hasPermission>
        </div>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>序号</th>
					<th>预览图</th>
					<th>分类名称</th>
					<th>分类描述</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="categories">
					<tr>
						<td>${value}</td>
						<td><img alt="${name}" src="${ctx}/files/${icon}" style="height: 30px;width: 50px;"></td>
						<td>${name}</td>
						<td>${description}</td>
						<td><shiro:hasPermission name="category:edit">
								<a href="category/category!input.action?id=${id}"><i class="icon-edit"></i></a>
								<a href="category/category-info.action?cid=${id}"><i class="icon-font" title="language"></i></a>
								<a href="javascript:void(0)" onclick="deleteThis(${id})"><i class="icon-trash"></i></a>
							</shiro:hasPermission></td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
	</form>
</body>
</html>