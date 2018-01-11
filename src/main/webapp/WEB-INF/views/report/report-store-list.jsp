<%@page import="com.tp.utils.Constants"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp" %>
<!DOCTYPE HTML>
<html>
	<head>
		<base href="<%=Constants.TOMCAT_SHOW %>" />
		<title>内容统计</title>
		<link href="css/global.css" type="text/css" rel="stylesheet" ></link>
		<script src="js/table2.js"></script>
		<script>

			$(function(){
				$("#reportcn-tab").addClass("active");
                $("#reportcn-tab a").append("<i class='icon-remove-circle'></i>");
                $("#sdate").datepicker();
			})

			function exportExcel(){
				window.location="report/report-store!export.action?theme="+encodeURIComponent($("#theme").val())+"&date="+$("#sdate").val();
			}
			
			function sendAjax(pageNo) {
				$.ajax({
					url : "report/report-store!page.action?page.pageNo=" + pageNo,
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
		<form id="mainForm" action="report/report-store!list.action" method="post" class="form-horizontal">
		
			<h1>内容日报</h1>
			<div id="filter" style="margin-bottom: 5px;">
				内容: <input class="input-medium" type="text" id="theme" name="filter_LIKES_themeName" value="${param['filter_LIKES_themeName']}" />
				&nbsp;日期: <input class="input-medium" type="text" data-date-format="yyyy-mm-dd" id="sdate" autocomplete="on" name="filter_EQS_logDate" value="${param['filter_EQS_logDate']}" />
				<input class="btn" type="button" value="搜索" onclick="search();"/>&nbsp;
				<div class="pull-right"><a href="javascript:void(0)" class="icon-download-alt" onclick="exportExcel();">导出</a></div>
			</div>
			<div id="data">
				<jsp:include page="./report-store-page.jsp"></jsp:include>
			</div>
		</form>
		
	</body>
</html>