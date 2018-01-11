<%--
  Created by IntelliJ IDEA.
  User: hongjian.chen
  Date: 2018/1/3
  Time: 15:04
  To change this template use File | Settings | File Templates.
--%>
<%@page import="com.tp.utils.Constants" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/common/taglibs.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <base href="<%=Constants.TOMCAT_SHOW %>"/>
    <title>视频分类</title>
    <script>
        $(document).ready(function () {
            $("#message").fadeOut(3000);
            $("#category-sp").addClass("active");
            $("#category-sp a").append("<i class='icon-remove-circle'></i>");
            $("#standard").addClass("active");
        });
        function deleteThis(id) {
            if (confirm("确定要删除吗?")) {
                window.location = "video/video-type!delete.action?id=" + id;
            }
        }
    </script>
</head>
<body>
<form action="category/category.action" method="get" class="form-horizontal">
    <h1>视频分类</h1>
    <div class="pull-right">
        <shiro:hasPermission name="category:edit">
            <a class="icon-plus" href="video/video-type!input.action">新增</a>
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
        <s:iterator value="items">
            <tr>
                <td>${value}</td>
                <td><img alt="${name}" src="${ctx}/files/${icon}" style="height: 50px;width: 50px;"></td>
                <%--<td><img alt="${name}" src="${icon}" style="height: 30px;width: 50px;"></td>--%>
                <td>${name}</td>
                <td>${description}</td>
                <td><shiro:hasPermission name="category:edit">
                    <a href="video/video-info.action?pid=${id}"><i class="icon-edit"></i></a>
                    <%--<a href="video/video-type!input?cid=${id}"><i class="icon-font" title="language"></i></a>--%>
                    <a href="javascript:void(0)" onclick="deleteThis(${id})"><i class="icon-trash"></i></a>
                </shiro:hasPermission></td>
            </tr>
        </s:iterator>
        </tbody>
    </table>
</form>
</body>
</html>
