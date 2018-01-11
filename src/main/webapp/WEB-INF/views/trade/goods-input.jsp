<%@page import="com.tp.utils.Constants"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp" %>
<!DOCTYPE HTML>
<html>
	<head>
		<base href="<%=Constants.TOMCAT_SHOW %>" />
		<title>交易商品管理</title>
		<link href="${ctx}/static/jquery-validation/1.10.0/validate.css" rel="stylesheet">
		<script src="${ctx}/static/jquery-validation/1.10.0/jquery.validate.min.js"></script>
		<script src="${ctx}/static/jquery-validation/1.10.0/messages_bs_zh.js"></script>
		<script>
			$(document).ready(function(){
				$("#inputForm").validate();
				$("#goods-tab").addClass("active");
                $("#goods-tab a").append("<i class='icon-remove-circle'></i>");
                $("#expiryDate").datepicker();
			});
		</script>
	</head>
	
	<body>
		<form id="inputForm" action="trade/goods!save.action" method="post" class="form-horizontal">	
		<input type="hidden" value="${id}" name="id"/>
		<fieldset>
			<legend><small>商品信息</small></legend>
			<c:if test="${not empty actionMessages}">
				<div id="message" class="alert alert-success">${actionMessages}</div>
			</c:if>
			<c:if test="${not empty actionErrors}">
				<div id="message" class="alert alert-fail">${actionErrors}</div>
			</c:if>
			<div class="control-group">
				<label for="language" class="control-label">货架:</label>
				<div class="controls">
					<s:select list="shelfForms" name="shelf" listKey="value" listValue="name" />
				</div>
			</div>
			
			<div class="control-group">
				<label for="title" class="control-label">名称:<font class="red">*</font></label>
				<div class="controls">
					<input type="text" name="name" class="required" value="${name}" maxlength="50">
				</div>	
			</div>
			
			<div class="control-group">
				<label for="price" class="control-label">价格:<font class="red">*</font></label>
				<div class="controls">
					<div class="input-prepend input-append">
						<input type="text" id="price" name="price" value="${price}" maxlength="10" class="number" />
						<span class="add-on">里</span>
					</div>
				</div>	
			</div>
			
			<div class="control-group">
				<label for="value" class="control-label">实际价格:<font class="red">*</font></label>
				<div class="controls">
					<div class="input-prepend input-append">
						<input type="text" id="value" name="value" value="${value}" maxlength="10" class="number" />
						<span class="add-on">里</span>
					</div>
				</div>	
			</div>
			
			<div class="control-group">
				<label for="payback" class="control-label">偿付:<font class="red">*</font></label>
				<div class="controls">
					<div class="input-prepend input-append">
						<input type="text" id="payback" name="payback" value="${payback}" maxlength="10" class="number" />
						<span class="add-on">里</span>
					</div>
				</div>	
			</div>
			
			<div class="control-group">
				<label for="sort" class="control-label">排序:<font class="red">*</font></label>
				<div class="controls">
					<input type="text" id="sort" name="sort" value="${sort}" maxlength="10" class="number" />
				</div>	
			</div>
			
			<div class="control-group">
				<label for="expiryDate" class="control-label">过期时间:</label>
				<div class="controls">
					<input type="text" id="expiryDate" name="expiryDate" value="${expiryDate}" maxlength="10" data-date-format="yyyy-mm-dd" autocomplete="on" />
				</div>	
			</div>
			
			<div class="control-group">
				<label for="remarks" class="control-label">简要描述:</label>
				<div class="controls">
					<textarea rows="6"  id="remarks" name="remarks" class="required" maxlength="500">${remarks}</textarea>
				</div>	
			</div>
			<div class="control-group">
				<label for="descr" class="control-label">详细描述:</label>
				<div class="controls">
					<textarea rows="6"  id="descr" name="descr" class="required" maxlength="500">${descr}</textarea>
				</div>	
			</div>
			<div class="control-group">
				<label for="instructions" class="control-label">使用说明:</label>
				<div class="controls">
					<textarea rows="6"  id="instructions" name="instructions" class="required" maxlength="500">${instructions}</textarea>
				</div>	
			</div>
		</fieldset>
		<div class="form-actions">
			<input  class="btn btn-primary" type="submit" value="保存"> &nbsp;
			<input class="btn" type="button" value="返回" onclick="history.back()"/>
		</div>
			
		</form>

	</body>
	
</html>