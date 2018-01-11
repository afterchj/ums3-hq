<%@page import="com.tp.utils.Constants"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<base href="<%=Constants.TOMCAT_SHOW%>" />
<title>订单处理配置列表</title>
<link href="css/global.css" type="text/css" rel="stylesheet"></link>
<script src="js/table2.js"></script>
<script>
	$(function() {
		$("#orderConfig-tab").addClass("active");
		$("#orderConfig-tab a").append("<i class='icon-remove-circle'></i>");
		$("#sdate").datepicker();
		$("#edate").datepicker();
	});

	function sendAjax(pageNo) {
		$.ajax({
			url : "trade/order-config!page.action?page.pageNo=" + pageNo,
			data : $("#mainForm").serialize(),
			cache : false,
			success : function(html) {
				$("#data").empty();
				$("#data").html(html);
			}
		});
	}
	
	function changeStock(orderConfig, balance){
		var result = prompt("请输入需要调整的余额数.",balance);
		if(result != null && result > 0){
			window.location="trade/order-config!adjust.action?id="+ orderConfig + "&balance=" + result;
		}else {
			$("#message").html("输入余额数格式不正确。");
		}
	}
	
	function deleteThis(id) {
		if(confirm("确定要删除吗?")){
			window.location="trade/order-config!delete.action?id="+id;
		}
	}
</script>
</head>
<body>
	<form id="mainForm" action="trade/order-config!list.action" method="post"
		class="form-horizontal">
		<h1>订单处理配置列表</h1>
		<c:if test="${not empty actionMessages}">
			<div id="message" class="alert alert-success">${actionMessages}</div>
		</c:if>
		<c:if test="${not empty actionErrors}">
			<div id="message" class="alert alert-fail">${actionErrors}</div>
		</c:if>
		 <div class="pull-right">
            <shiro:hasPermission name="user:edit">
                <a class="icon-plus" href="trade/order-config!input.action">新增</a>
            </shiro:hasPermission>
        </div>
		<div id="filter" style="margin-bottom: 5px;">
			名称: <input class="input-medium" type="text" id="theme" name="filter_LIKES_name" value="${param['filter_LIKES_name']}" />
			&nbsp;货架: 
			<select name="filter_EQS_shelf" value="${param['filter_EQS_shelf']}" class="input-medium">
				<option value="">全部</option>
				<c:forEach items="${shelfForms }" var="sf">
					<option value="${sf.value }">${sf.name }</option>
				</c:forEach>	
			</select>
			
			<input class="btn" type="button" value="搜索" onclick="search();" />&nbsp;
		</div>
		<div id="data">
			<jsp:include page="./order-config-page.jsp"></jsp:include>
		</div>
	</form>

</body>
</html>