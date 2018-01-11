<%@page import="com.tp.utils.Constants"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp" %>
<!DOCTYPE HTML>
<html>
	<head>
		<base href="<%=Constants.TOMCAT_SHOW %>" />
		<title>内容安装统计</title>
		<link href="css/global.css" type="text/css" rel="stylesheet" ></link>
		<script src="js/table2.js"></script>
		<script>
			$(function(){
				$("#report-contentUnzip-tab").addClass("active");
                $("#report-contentUnzip-tab a").append("<i class='icon-remove-circle'></i>");
                $("#sdate").datepicker();
			})
			
			function sendAjax(pageNo) {
				$.ajax({
					url : "report/report-unzip!page.action?page.pageNo=" + pageNo,
					data : $("#mainForm").serialize(),
					cache : false,
					success : function(html) {
						$("#data").empty();
						$("#data").html(html);
					}
				});
			}
		</script>
	</head>
	<body>
		<form id="mainForm" action="report/report-unzip!list.action" method="post" class="form-horizontal">
			<h1>内容安装日报</h1>
			<div id="filter" style="margin-bottom: 5px;">
				内容: <input class="input-medium" type="text" id="theme" name="filter_LIKES_appName" value="${param['filter_LIKES_appName']}" />
				&nbsp;市场FM: <input class="input-medium" type="text" id="theme" name="filter_LIKES_fm" value="${param['filter_LIKES_fm']}" />
				&nbsp;日期: <input class="input-medium" type="text" data-date-format="yyyy-mm-dd" id="sdate" autocomplete="on" name="filter_EQS_logDate" value="${param['filter_EQS_logDate']}" />
				<input class="btn" type="button" value="搜索" onclick="search();"/>&nbsp;
			</div>
			<div id="data">
				<jsp:include page="./report-unzip-page.jsp"></jsp:include>
			</div>
		</form>
		
	</body>
</html>