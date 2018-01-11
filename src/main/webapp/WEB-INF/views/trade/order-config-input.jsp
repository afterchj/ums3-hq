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
				$("#orderConfig-tab").addClass("active");
                $("#orderConfig-tab a").append("<i class='icon-remove-circle'></i>");
                
			});
			
			function changeShelf(){
				var sid = $("#shelf").val();
				if(sid != null){
					$.ajax({
						url : "trade/goods!getByShelf.action?shelf=" + sid,
						cache : false,
						success : function(html) {
							$("#goods").empty();
							$("#goods").append("<option value=''>全部</option>");
							var goodses = $(html.goodses);
							goodses.each(function(i){
								$("#goods").append($("<option value=" + goodses[i].id +">" + goodses[i].name + "</option>"))
							});
						}
					});
				}
			}
			
			
		</script>
	</head>
	
	<body>
		<form id="inputForm" action="trade/order-config!save.action" method="post" class="form-horizontal">	
		<input type="hidden" value="${id}" name="id"/>
		<input type="hidden" value="${status}" name="status"/>
		<fieldset>
			<legend><small>订单处理配置</small></legend>
			<c:if test="${not empty actionMessages}">
				<div id="message" class="alert alert-success">${actionMessages}</div>
			</c:if>
			<c:if test="${not empty actionErrors}">
				<div id="message" class="alert alert-fail">${actionErrors}</div>
			</c:if>
			
			<div class="control-group">
				<label for="name" class="control-label">名称:<font class="red">*</font></label>
				<div class="controls">
					<input type="text" name="name" class="required" value="${name}" maxlength="50">
				</div>	
			</div>
			
			<div class="control-group">
				<label for="shelf" class="control-label">货架:</label>
				<div class="controls">
					<s:select onchange="changeShelf()" list="shelfForms" name="shelf" listKey="value" listValue="name" headerKey="" headerValue="请选择" cssClass="required" />
				</div>
			</div>
			
			<div class="control-group">
				<label for="goods" class="control-label">商品:</label>
				<div class="controls">
					<s:select name="goodsId" list="goodsForms" listKey="id" listValue="name" headerKey="" headerValue="全部" id="goods"></s:select>
				</div>
			</div>
			
			<div class="control-group">
				<label for="userRestriction" class="control-label">用户限制:<font class="red">*</font></label>
				<div class="controls">
					<input type="text" id="userRestriction" name="userRestriction" class="required" value="${userRestriction}" maxlength="50">
				</div>	
			</div>
			
			<div class="control-group">
				<label for="beanName" class="control-label">处理程序:<font class="red">*</font></label>
				<div class="controls">
					<s:select list="orderDealers" id="beanName" name="beanName" listKey="value" listValue="name" cssClass="required" />
				</div>	
			</div>		
			
			<div class="control-group">
				<label for="batchInterval" class="control-label">处理间隔(秒):<font class="red">*</font></label>
				<div class="controls">
					<input type="text" id="price" name="batchInterval" value="${batchInterval}" maxlength="10" class="number" />
				</div>	
			</div>
			
			<div class="control-group">
				<label for="batchSize" class="control-label">单次处理量(秒):<font class="red">*</font></label>
				<div class="controls">
					<input type="text" id="price" name="batchSize" value="${batchSize}" maxlength="10" class="number" />
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