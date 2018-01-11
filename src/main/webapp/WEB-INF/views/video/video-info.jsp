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
        function deleteThis(id, pid) {
            if (confirm("确定要删除吗?")) {
                window.location = "video/video-info!delete.action?id=" + id + "&pid=" + pid;
            }
        }

        function changeStatus(id, pid) {
            window.location = "video/video-info!change.action?id=" + id + "&pid=" + pid;
        }
    </script>
</head>
<body>

<form name="inputForm" action="video/video-type!save.action" method="post" class="form-horizontal"
      enctype="multipart/form-data">
    <input type="hidden" name="id" value="${entity.id}">
    <%--<input type="hidden" name="pid" value="${id}">--%>
    <%--<input type="hidden" name="dtype" value="${dtype }">--%>
    <fieldset>
        <legend>
            <small>编辑分类</small>
        </legend>
        <%--<div id="messageBox" class="alert alert-error" style="display:none">输入有误，请先更正。</div>--%>
        <table style="width: auto;height: 80px;border: 0;">
            <tr>
                <td width="80px"><label for="icon">图片:</label></td>
                <td><label for="name">名称:</label></td>
                <td>
                    <input type="text" id="name" name="name" maxlength="20" value="${entity.name}"/>
                </td>
                <td><label for="value">排序:</label></td>
                <td>
                    <input type="number" id="value" name="value" maxlength="50" value="${entity.value}"/>
                </td>
                <td>
                    <input style="margin-left: 28px" class="btn btn-primary" id="btn-submit" type="submit" value="保存">
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <input type="file" id="icon" name="iicon"/>
                </td>
                <td><label for="description">描述:</label></td>
                <td>
                    <input type="text" id="description" name="description" maxlength="50"
                           value="${entity.description}"/>
                </td>
                <td><input style="margin-left: 28px" class="btn" id="btn-cancel" type="button" value="返回"
                           onclick="history.back();"></td>
            </tr>
        </table>
</form>
<div class="pull-right">
    <shiro:hasPermission name="category:edit">
        <a class="icon-plus" href="video/video-info!input.action?pid=${pid}">新增</a>
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
            <td><a href="video/video-info!input.action?id=${id}&pid=${pid}">${name}</a></td>
            <td>${description}</td>
            <td><shiro:hasPermission name="category:edit">
                <s:if test="status==0">
                    <a href="javascript:void(0)" onclick="changeStatus(${id},${pid})"><i class="icon-circle"></i></a>
                </s:if>
                <s:elseif test="status==1">
                    <a href="javascript:void(0)" onclick="changeStatus(${id},${pid})"><i class="icon-circle-blank"></i></a>
                </s:elseif>
                <a href="video/video-info!input.action?id=${id}&pid=${pid}"><i class="icon-edit"></i></a>
                <%--<a href="video/video-type!input?cid=${id}"><i class="icon-font" title="language"></i></a>--%>
                <a href="javascript:void(0)" onclick="deleteThis(${id},${pid})"><i class="icon-trash"></i></a>
            </shiro:hasPermission></td>
        </tr>
    </s:iterator>
    </tbody>
</table>
</body>
</html>
