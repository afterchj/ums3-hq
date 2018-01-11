<%@page import="com.tp.utils.Constants"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<base href="<%=Constants.TOMCAT_SHOW%>" />
<link href="css/global.css" type="text/css" rel="stylesheet" ></link>
<title>作品列表</title>
<script src="js/table2.js"></script>
<script>
			$(document).ready(function(){
				$("#message").fadeOut(3000);
				$("#work-tab").addClass("active");
                $("#work-tab a").append("<i class='icon-remove-circle'></i>");
			});
			
			function sort2(orderBy, defaultOrder) {
				if ($("#orderKey").val() == orderBy) {
					if ($("#orderValue").val() == "") {
						$("#orderValue").val(defaultOrder);
					}
					else if ($("#orderValue").val() == "desc") {
						$("#orderValue").val("asc");
					}
					else if ($("#orderValue").val() == "asc") {
						$("#orderValue").val("desc");
					}
				}
				else {
					$("#orderKey").val(orderBy);
					$("#orderValue").val(defaultOrder);
				}

				$("#mainForm").submit();
			}
			
			function deleteThis(id){
				if(confirm("确定要删除吗?")){
					window.location="mem/work!delete.action?id="+id+"&page.pageNo=" + $("#pageNo").val();
				}
			}
			
			function sendAjax(pageNo) {
				$.ajax({
							url : "mem/work!page.action?page.pageNo=" + pageNo,
							data: $("#mainForm").serialize(),
							cache : false,
							success : function(html) {
								$("#data").empty();
								$("#data").html(html);
							}
						});
			}
			
			function show(obj){
				$($(obj).next('div')).show();
			}
			
			function hide(obj){
				$($(obj).next('div')).hide();
			}
			
			function adjustStatus(id, obj) {
				var check = null;
				if ($(obj).hasClass("allowClass")) {
					check = confirm("确定要停用该作品么?");
				}else {
					check = confirm("确定要启用该作品么?");
				}

				if (check) {
					$.ajax({
						type : "POST",
						dataType : "text",
						url : "mem/work!adjustStatus.action",
						data : {
							"id" : id
						},
						success : function(msg) {
							if (msg == 'succ') {
								if ($(obj).hasClass("allowClass")) {
									$(obj).removeClass();
									$(obj).addClass("forbidClass");
									$(obj).addClass("icon-remove-sign");
								} else {
									$(obj).removeClass();
									$(obj).addClass("allowClass");
									$(obj).addClass("icon-ok-circle");
								}
							}
						}
					});
				}
			}
			
		</script>
</head>
<body>
	<h1>作品列表</h1>
	<form id="mainForm"  method="post"
		class="form-horizontal">
		<input type="hidden" name="filter_EQS_dtype"
			value="${param['filter_EQS_dtype']}">

		<c:if test="${not empty actionMessages}">
			<div id="message" class="alert alert-success">
				<button data-dismiss="alert" class="close">×</button>${actionMessages}</div>
		</c:if>
		<div id="filter" style="display: inline; margin-left: 20px;">
			<input type="text" class="search-query input-medium" name="filter_LIKES_nickname" value="${param['filter_LIKES_nickname']}"
				size="20" placeholder="作品人昵称" />
			<input type="text" class="search-query input-medium" name="filter_LIKES_memberId" value="${param['filter_LIKES_memberId']}"
				size="20" placeholder="作品人ID" /> 
			<input type="button" id="submit_btn" class="btn" value="查询" onclick="search();" />
		</div>
		
		<div id="data">
			<jsp:include page="./work-page.jsp"></jsp:include>
		</div>

	</form>
</body>
</html>