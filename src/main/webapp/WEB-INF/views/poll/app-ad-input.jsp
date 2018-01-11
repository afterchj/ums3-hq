<%@page import="com.tp.utils.Constants"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/common/taglibs.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
	<base href="<%=Constants.TOMCAT_SHOW %>" />
    <title>填充广告维护</title>
    <link href="${ctx}/static/jquery-validation/1.10.0/validate.css" rel="stylesheet">
    <script src="${ctx}/static/jquery-validation/1.10.0/jquery.validate.min.js"></script>
    <script src="${ctx}/static/jquery-validation/1.10.0/messages_bs_zh.js"></script>
    <script>
        $(document).ready(function () {
            $("#sort").focus();
            $("#appAd-tab").addClass("active");
            $("#appAd-tab a").append("<i class='icon-remove-circle'></i>");
            $("#inputForm").validate();
        });
    </script>
</head>
<body>
<h1>广告管理</h1>

<form id="inputForm" action="poll/app-ad!save.action" method="post" class="form-horizontal"
      enctype="multipart/form-data">
      <s:hidden name="id" id="id"></s:hidden>
      <s:hidden name="status" id="status"></s:hidden>
    <fieldset>
        <legend>
            <small>广告维护</small>
        </legend>
        <c:if test="${not empty actionMessages}">
			<div id="message" class="alert alert-error">
				<button data-dismiss="alert" class="close">×</button>${actionMessages}</div>
		</c:if>
        <div class="control-group">
            <label for="name" class="control-label">类型:</label>

            <div class="controls">
            	<s:select list="#{'hottest':'最热页' }" name="dtype" id="dtype" cssClass="required"></s:select>
            </div>
        </div>
        <div class="control-group">
            <label for="sort" class="control-label">应用:</label>
            <div class="controls">
            	<s:select name="file.id" list="themeFiles" id="themeFile" headerKey="" headerValue="请选择App文件" cssClass="required" listKey="id" listValue="title"></s:select>
            </div>
        </div>
        <div class="control-group">
            <label for="sort" class="control-label">排名:</label>
            <div class="controls">
            	<s:textfield name="offset" id="offset" maxlength="5" cssClass="required number"></s:textfield>
            </div>
        </div>

    </fieldset>

    <div class="form-actions">
        <input class="btn btn-primary" type="submit" value="保存">&nbsp;
        <input id="btn-cancel" class="btn" type="button" value="返回" onclick="history.back();">
    </div>

</form>

</body>
</html>