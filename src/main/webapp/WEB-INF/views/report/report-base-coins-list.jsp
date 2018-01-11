<%@page import="com.tp.utils.Constants"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp" %>
<!DOCTYPE HTML>
<html>
	<head>
		<base href="<%=Constants.TOMCAT_SHOW %>" />
		<title>总体积分日报</title>
		<link href="css/global.css" type="text/css" rel="stylesheet" ></link>
		<script src="js/table2.js"></script>
		<script>
			$(function(){
				$("#report-base-coins-tab").addClass("active");
                $("#report-base-coins-tab a").append("<i class='icon-remove-circle'></i>");
                $("#sdate").datepicker();
                $("#edate").datepicker();
			});
			
			function sendAjax(pageNo) {
				$.ajax({
					url : "report/report-base-coins!page.action?page.pageNo=" + pageNo,
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
		<form id="mainForm" action="report/report-base-coins!list.action" method="post" class="form-horizontal">
			<h1>总体积分日报</h1>
			<div id="filter" style="margin-bottom: 5px;">
				&nbsp;开始日期: <input class="input-medium" type="text" data-date-format="yyyy-mm-dd" id="sdate" autocomplete="on" name="filter_GES_logDate" value="${param['filter_GES_logDate']}" />
				&nbsp;结束日期: <input class="input-medium" type="text" data-date-format="yyyy-mm-dd" id="edate" autocomplete="on" name="filter_LES_logDate" value="${param['filter_LES_logDate']}" />
				<input class="btn" type="button" value="搜索" onclick="search();"/>&nbsp;
			</div>
			<div id="data">
				<jsp:include page="./report-base-coins-page.jsp"></jsp:include>
			</div>		
		</form>
		
	</body>
</html>