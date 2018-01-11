<%@page import="com.tp.utils.Constants"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp" %>
<!DOCTYPE HTML>
<html>
	<head>
		<base href="<%=Constants.TOMCAT_SHOW %>" />
		<title>客户端通过内容安装日报</title>
		<link href="css/global.css" type="text/css" rel="stylesheet" ></link>
		<script src="js/table2.js"></script>
		<script>
			$(function(){
				$("#report-client-install-wc-tab").addClass("active");
                $("#report-client-install-wc-tab a").append("<i class='icon-remove-circle'></i>");
                $("#sdate").datepicker();
			})
            function exportExcel(){
                if($("#sdate").val()==""){
                    alert('请选择日期');
                    return;
                }
                window.location="report/report-client-install-from-content!export.action?logDate="+$("#sdate").val();
            }
			
			function sendAjax(pageNo) {
				$.ajax({
					url : "report/report-client-install-from-content!page.action?page.pageNo=" + pageNo,
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
		<form id="mainForm" action="report/report-client-install-from-content!list.action" method="post" class="form-horizontal">
			<h1>客户端通过内容安装日报</h1>
			<div id="filter" style="margin-bottom: 5px;">
				解锁名称: <input class="input-medium search-query" type="text" id="theme" name="filter_LIKES_appName" value="${param['filter_LIKES_appName']}" />
                市场: <input class="input-medium search-query" type="text"  name="filter_LIKES_fm" value="${param['filter_LIKES_fm']}" />
				&nbsp;日期: <input class="input-medium" type="text" data-date-format="yyyy-mm-dd" id="sdate" autocomplete="on" name="filter_EQS_logDate" value="${param['filter_EQS_logDate']}" />
				<input class="btn" type="button" value="查询" onclick="search();"/>&nbsp;
                <div class="pull-right"><a href="javascript:void(0)" class="icon-download-alt" onclick="exportExcel();">导出</a></div>
			</div>
			<div id="data">
				<jsp:include page="./report-client-install-from-content-page.jsp"></jsp:include>
			</div>				
		</form>
		
	</body>
</html>