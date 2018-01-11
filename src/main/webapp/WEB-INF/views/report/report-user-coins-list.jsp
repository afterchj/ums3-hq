<%@page import="com.tp.utils.Constants"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp" %>
<!DOCTYPE HTML>
<html>
	<head>
		<base href="<%=Constants.TOMCAT_SHOW %>" />
		<title>用户积分日报</title>
		<link href="css/global.css" type="text/css" rel="stylesheet" ></link>
		<script src="js/table2.js"></script>
		<script>
			$(function(){
				$("#report-user-coins-tab").addClass("active");
                $("#report-user-coins-tab a").append("<i class='icon-remove-circle'></i>");
                $("#sdate").datepicker();
                $("#edate").datepicker();
			});
			
			function sendAjax(pageNo) {
				$.ajax({
					url : "report/report-user-coins!page.action?page.pageNo=" + pageNo,
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
		<form id="mainForm" action="report/report-user-coins!list.action" method="post" class="form-horizontal">
			<h1>用户积分日报</h1>
			<div id="filter" style="margin-bottom: 5px;">
				&nbsp;类型:<select name="filter_LIKES_type" id="theme" class="input-small">
						<option value="">所有</option>
						<option value="unusual">停用用户</option>
					</select> 
				&nbsp;天号: <input class="input-small" type="text" id="theme" name="filter_EQS_sno" value="${param['filter_EQS_sno']}" />
				&nbsp;开始日期: <input class="input-medium" type="text" data-date-format="yyyy-mm-dd" id="sdate" autocomplete="on" name="filter_GES_logDate" value="${param['filter_GES_logDate']}" />
				&nbsp;结束日期: <input class="input-medium" type="text" data-date-format="yyyy-mm-dd" id="edate" autocomplete="on" name="filter_LES_logDate" value="${param['filter_LES_logDate']}" />
				<input class="btn" type="button" value="搜索" onclick="search();"/>&nbsp;
			</div>
			<div id="data">
				<jsp:include page="./report-user-coins-page.jsp"></jsp:include>
			</div>		
		</form>
		
	</body>
</html>