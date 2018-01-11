<%@page import="com.tp.utils.Constants"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<base href="<%=Constants.TOMCAT_SHOW%>" />
<title>交易商品管理</title>
<link href="${ctx}/static/jquery-validation/1.10.0/validate.css"
	rel="stylesheet">
<script
	src="${ctx}/static/jquery-validation/1.10.0/jquery.validate.min.js"></script>
<script src="${ctx}/static/jquery-validation/1.10.0/messages_bs_zh.js"></script>
<script>
	$(document).ready(function() {
		$("#inputForm").validate({
			submitHandler : function(form) {
				$(form).attr("action", $("#inputForm").attr("action") + location.search);
				form.submit();
			}
		});
		$("#order-tab").addClass("active");
		$("#order-tab a").append("<i class='icon-remove-circle'></i>");
		$("#expiryDate").datepicker();
	});

	function back() {
		window.location = "trade/order!list.action" + location.search;
	}
</script>
</head>

<body>
	<form id="inputForm" action="trade/order!save.action" method="post"
		class="form-horizontal">
		<fieldset>
			<legend>
				<small>订单信息</small>
			</legend>
			<c:if test="${not empty actionMessages}">
				<div id="message" class="alert alert-success">${actionMessages}</div>
			</c:if>
			<c:if test="${not empty actionErrors}">
				<div id="message" class="alert alert-fail">${actionErrors}</div>
			</c:if>

			<div class="control-group">
				<label for="serialno" class="control-label">订单号:<font
					class="red">*</font></label>
				<div class="controls">
					<input type="text" id="serialno" name="serialno"
						value="${serialno}" maxlength="32" readonly="readonly" />
				</div>
			</div>

			<div class="control-group">
				<label for="title" class="control-label">名称:<font
					class="red">*</font></label>
				<div class="controls">
					<input type="text" name="name" class="required" value="${name}"
						maxlength="50">
				</div>
			</div>

			<div class="control-group">
				<label for="status" class="control-label">状态:<font
					class="red">*</font></label>
				<div class="controls">
					<select name="status" class="required" id="status">
						<option value="0" <c:if test="${status ==0 }">selected</c:if>>未处理</option>
						<option value="1" <c:if test="${status ==1 }">selected</c:if>>处理成功</option>
						<option value="2" <c:if test="${status ==2 }">selected</c:if>>处理失败</option>
					</select>
				</div>
			</div>

			<div class="control-group">
				<label for="price" class="control-label">价格:<font
					class="red">*</font></label>
				<div class="controls">
					<div class="input-prepend input-append">
						<input type="text" id="price" name="price" value="${price}"
							maxlength="10" class="number" /> <span class="add-on">里</span>
					</div>
				</div>
			</div>

			<div class="control-group">
				<label for="fullName" class="control-label">收货人:<font
					class="red">*</font></label>
				<div class="controls">
					<input type="text" id="fullName" name="fullName"
						value="${fullName}" maxlength="10" />
				</div>
			</div>

			<div class="control-group">
				<label for="uid" class="control-label">UID:<font class="red">*</font></label>
				<div class="controls">
					<input type="text" id="uid" name="uid" value="${uid}"
						maxlength="32" readonly="readonly" />
				</div>
			</div>

			<div class="control-group">
				<label for="qq" class="control-label">QQ:<font class="red">*</font></label>
				<div class="controls">
					<input type="text" id="qq" name="qq" value="${qq}" maxlength="20"
						readonly="readonly" />
				</div>
			</div>

			<div class="control-group">
				<label for="mobile" class="control-label">电话号码:<font
					class="red">*</font></label>
				<div class="controls">
					<input type="text" id="mobile" name="mobile" value="${mobile}"
						maxlength="20" readonly="readonly" />
				</div>
			</div>

			<div class="control-group">
				<label for="address" class="control-label">简要描述:</label>
				<div class="controls">
					<textarea rows="6" id="address" name="address" maxlength="500">${address}</textarea>
				</div>
			</div>
		</fieldset>
		<div class="form-actions">
			<input class="btn btn-primary" type="submit" value="保存">
			&nbsp; <input class="btn" type="button" value="返回" onclick="back()" />
		</div>

	</form>

</body>

</html>