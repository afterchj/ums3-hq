<%--
  Created by IntelliJ IDEA.
  User: hongjian.chen
  Date: 2018/1/3
  Time: 16:22
  To change this template use File | Settings | File Templates.
--%>
<%@page import="com.tp.utils.Constants" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/common/taglibs.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
    <base href="<%=Constants.TOMCAT_SHOW %>"/>
    <title>分类维护</title>
    <link href="${ctx}/static/jquery-validation/1.10.0/validate.css" rel="stylesheet">
    <script src="${ctx}/static/jquery-validation/1.10.0/jquery.validate.min.js"></script>
    <script src="${ctx}/static/jquery-validation/1.10.0/messages_bs_zh.js"></script>
    <script>
        $(document).ready(function () {
            $("#name").focus();
            $("#category-sp").addClass("active");
            $("#category-sp a").append("<i class='icon-remove-circle'></i>");
            $("#test2").addClass("acTp");
        });
    </script>
</head>
<body>
<h1>分类管理</h1>
<form id="inputForm" action="video/video-type!save.action" method="post" class="form-horizontal"
      enctype="multipart/form-data">
    <input type="hidden" name="id" value="${id}">
    <%--<input type="hidden" name="dtype" value="${dtype }">--%>
    <fieldset>
        <legend>
            <small>编辑分类</small>
        </legend>
        <%--<div id="messageBox" class="alert alert-error" style="display:none">输入有误，请先更正。</div>--%>

        <div class="control-group">
            <label for="value" class="control-label">排序:</label>
            <div class="controls">
                <input type="number" id="value" name="value" maxlength="50" value="${value}"/>
            </div>
        </div>
        <div class="control-group">
            <label for="name" class="control-label">名称:</label>
            <div class="controls">
                <input type="text" id="name" name="name" maxlength="20" value="${name}" class="required"/>
            </div>
        </div>
        <div class="control-group">
            <label for="icon" class="control-label">图片:</label>
            <div class="controls">
                <input type="file" id="icon" name="iicon"/>
            </div>
        </div>
        <div class="control-group">
            <label for="description" class="control-label">描述:</label>
            <div class="controls">
                <textarea name="description" id="description" class="input-xlarge" rows="4"
                          maxlength="255">${description}</textarea>
            </div>
        </div>
    </fieldset>

    <div class="form-actions">
        <input id="btn-submit" class="btn btn-primary" type="submit" value="保存">&nbsp;
        <input id="btn-cancel" class="btn" type="button" value="返回" onclick="history.back();">
    </div>

</form>

</body>
</html>
