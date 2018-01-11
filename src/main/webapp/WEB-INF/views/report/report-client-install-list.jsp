<%@page import="com.tp.utils.Constants"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp" %>
<!DOCTYPE HTML>
<html>
	<head>
		<base href="<%=Constants.TOMCAT_SHOW %>" />
		<title>客户端安装日报</title>
		<link href="css/global.css" type="text/css" rel="stylesheet" ></link>
		<script src="js/table2.js"></script>
		<script>
			$(function(){
				$("#report-client-install-tab").addClass("active");
                $("#report-client-install-tab a").append("<i class='icon-remove-circle'></i>");
                $("#sdate").datepicker();
                $("#edate").datepicker();
			});
			
			function exportExcel(){
				window.location="report/report-client-install!export.action?" + $("#mainForm").serialize();
			}
			
			function sendAjax(pageNo) {
				$.ajax({
					url : "report/report-client-install!page.action?page.pageNo=" + pageNo,
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
		<form id="mainForm" action="report/report-client-install!list.action" method="post" class="form-horizontal">
			<h1>客户端安装日报</h1>
			<div id="filter" style="margin-bottom: 5px;">
				市场FM: <input class="input-medium" type="text" id="theme" name="filter_LIKES_fm" value="${param['filter_LIKES_fm']}" />
				&nbsp;开始日期: <input class="input-medium" type="text" data-date-format="yyyy-mm-dd" id="sdate" autocomplete="on" name="filter_GES_logDate" value="${param['filter_GES_logDate']}" />
				&nbsp;结束日期: <input class="input-medium" type="text" data-date-format="yyyy-mm-dd" id="edate" autocomplete="on" name="filter_LES_logDate" value="${param['filter_LES_logDate']}" />
				<input class="btn" type="button" value="搜索" onclick="search();"/>&nbsp;
				<div class="pull-right"><a href="javascript:void(0)" class="icon-download-alt" onclick="exportExcel();">导出</a></div>
			</div>
			<div id="data">
				<jsp:include page="./report-client-install-page.jsp"></jsp:include>
			</div>		
		</form>
		
	</body>
</html>