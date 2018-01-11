<%@page import="com.tp.utils.Constants"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<base href="<%=Constants.TOMCAT_SHOW%>" />
<title>兑换商品列表</title>
<link href="css/global.css" type="text/css" rel="stylesheet"></link>
<script src="js/table2.js"></script>
<script>
	$(function() {
		$("#order-tab").addClass("active");
		$("#order-tab a").append("<i class='icon-remove-circle'></i>");
		$("#sdate").datepicker();
		$("#edate").datepicker();
	});

	function sendAjax(pageNo) {
		$.ajax({
			url : "trade/order!page.action?page.pageNo=" + pageNo,
			data : $("#mainForm").serialize(),
			cache : false,
			success : function(html) {
				$("#data").empty();
				$("#data").html(html);
			}
		});
	}
	
	function deleteThis(id) {
		if(confirm("确定要删除吗?")){
			window.location="trade/order!delete.action?id="+id;
		}
	}
	
	function edit(id){
		window.location = "trade/order!input.action?id=" + id + "&page.pageNo=" + $("#pageNo").val() + "&" + $("#mainForm").serialize();
	}
	
</script>
</head>
<body>
	<form id="mainForm" action="trade/order!list.action" method="post"
		class="form-horizontal">
		<h1>兑换商品列表</h1>
		<c:if test="${not empty actionMessages}">
			<div id="message" class="alert alert-success">${actionMessages}</div>
		</c:if>
		<c:if test="${not empty actionErrors}">
			<div id="message" class="alert alert-fail">${actionErrors}</div>
		</c:if>
		<div id="filter" style="margin-bottom: 5px;">
			商品名称: <input class="input-medium" type="text" id="name" name="filter_LIKES_name" value="${param['filter_LIKES_name']}" />
			&nbsp;UID: <input class="input-medium" type="text" id="uid" name="filter_LIKES_uid" value="${param['filter_LIKES_uid']}" />
			&nbsp;订单号: <input class="input-medium" type="text" id="serialno" name="filter_LIKES_serialno" value="${param['filter_LIKES_serialno']}" />
			&nbsp;状态:<select class="input-medium" id="status" name="filter_EQI_status">
							<option value="">全部</option>
							<option value="0" <c:if test="${param['filter_EQI_status'] == 0}">selected</c:if>  >待处理</option>
							<option value="1" <c:if test="${param['filter_EQI_status'] == 1}">selected</c:if> >处理成功</option>
							<option value="2" <c:if test="${param['filter_EQI_status'] == 2}">selected</c:if> >处理失败</option>
						</select>
			<input class="btn" type="button" value="搜索" onclick="search();" />&nbsp;
		</div>
		<div id="data">
			<jsp:include page="./order-page.jsp"></jsp:include>
		</div>
	</form>

</body>
</html>