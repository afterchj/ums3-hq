<%@page import="com.tp.utils.Constants"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp" %>
<!DOCTYPE HTML>
<html>
	<head>
		<base href="<%=Constants.TOMCAT_SHOW %>" />
		<title>客户端统计</title>
		<link href="css/global.css" type="text/css" rel="stylesheet" ></link>
		<script src="js/table2.js"></script>
		<script>
			$(function(){
				$("#reportc-tab").addClass("active");
                $("#reportc-tab a").append("<i class='icon-remove-circle'></i>");
			});
			
			function sendAjax(pageNo) {
				$.ajax({
					url : "report/report-client!page.action?page.pageNo=" + pageNo,
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
		<form id="mainForm" action="report/report-client!list.action" method="get">
			<h1>客户端日报</h1>
			<div id="data">
				<jsp:include page="./report-client-page.jsp"></jsp:include>
			</div>
		</form>
		
	</body>
</html>