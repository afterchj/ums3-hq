<%@page import="com.tp.utils.Constants"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp" %>
<!DOCTYPE HTML>
<html>
	<head>
		<base href="<%=Constants.TOMCAT_SHOW %>" />
		<title>单个任务日报</title>
		<link href="css/global.css" type="text/css" rel="stylesheet" ></link>
		<script src="js/table2.js"></script>
		<script>
			$(function(){
				$("#report-per-task-tab").addClass("active");
                $("#report-per-task-tab a").append("<i class='icon-remove-circle'></i>");
                $("#sdate").datepicker();
                $("#edate").datepicker();
			});
			
			function sendAjax(pageNo) {
				$.ajax({
					url : "report/report-per-task!page.action?page.pageNo=" + pageNo,
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
		<form id="mainForm" action="report/report-per-task!list.action" method="post" class="form-horizontal">
			<h1>单个任务日报</h1>
			<div id="filter" style="margin-bottom: 5px;">
				&nbsp;类型:<select name="filter_EQS_type" id="theme" class="input-medium">
						<option value="">所有</option>
						<option value="0">总体</option>
						<option value="001">签到</option>
						<option value="002">分享QQ</option>
						<option value="003">分享微信</option>
						<option value="004">CPA</option>
						<option value="005">CPC</option>
						<option value="006">抢红包</option>
						<option value="007">送奖品</option>
						<option value="101">邀请</option>
						<option value="102">注册</option>
					</select> 
				&nbsp;开始日期: <input class="input-medium" type="text" data-date-format="yyyy-mm-dd" id="sdate" autocomplete="on" name="filter_GES_logDate" value="${param['filter_GES_logDate']}" />
				&nbsp;结束日期: <input class="input-medium" type="text" data-date-format="yyyy-mm-dd" id="edate" autocomplete="on" name="filter_LES_logDate" value="${param['filter_LES_logDate']}" />
				<input class="btn" type="button" value="搜索" onclick="search();"/>&nbsp;
			</div>
			<div id="data">
				<jsp:include page="./report-per-task-page.jsp"></jsp:include>
			</div>		
		</form>
		
	</body>
</html>