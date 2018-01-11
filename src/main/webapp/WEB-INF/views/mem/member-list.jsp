<%@page import="com.tp.utils.Constants"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<base href="<%=Constants.TOMCAT_SHOW%>" />
<link href="css/global.css" type="text/css" rel="stylesheet" ></link>
<title>会员列表</title>
<script src="js/table2.js"></script>
<script>
	$(document).ready(function() {
		$("#message").fadeOut(3000);
		$("#member-tab").addClass("active");
		$("#member-tab a").append("<i class='icon-remove-circle'></i>");
	});

	function sort2(orderBy, defaultOrder) {
		if ($("#orderKey").val() == orderBy) {
			if ($("#orderValue").val() == "") {
				$("#orderValue").val(defaultOrder);
			} else if ($("#orderValue").val() == "desc") {
				$("#orderValue").val("asc");
			} else if ($("#orderValue").val() == "asc") {
				$("#orderValue").val("desc");
			}
		} else {
			$("#orderKey").val(orderBy);
			$("#orderValue").val(defaultOrder);
		}

		$("#mainForm").submit();
	}

	function deleteThis(id) {
		if (confirm("确定要删除吗?")) {
			window.location = "mem/member!delete.action?id=" + id
					+ "&page.pageNo=" + $("#pageNo").val();
		}
	}

	function adjustComment(id, obj) {
		var check = null;
		if ($(obj).hasClass("allowClass")) {
			check = confirm("确定要禁止该用户发言么?");
		} else {
			check = confirm("确定要允许该用户发言么?");
		}

		if (check) {
			$.ajax({
				type : "POST",
				dataType : "text",
				url : "mem/member!adjustComment.action",
				data : {
					"id" : id
				},
				success : function(msg) {
					if (msg == 'succ') {
						if ($(obj).hasClass("allowClass")) {
							$(obj).removeClass("allowClass");
							$(obj).addClass("forbidClass");
						} else {
							$(obj).removeClass("forbidClass");
							$(obj).addClass("allowClass");
						}
					}
				}
			});
		}
	}

	function sendAjax(pageNo) {
		$.ajax({
			url : "mem/member!page.action?page.pageNo=" + pageNo,
			data : $("#mainForm").serialize(),
			cache : false,
			success : function(html) {
				$("#data").empty();
				$("#data").html(html);
			}
		});
	}

	function adjustPost(id, obj) {
		var check = null;
		if ($(obj).hasClass("allowClass")) {
			check = confirm("确定要禁止该用户发帖么?");
		} else {
			check = confirm("确定要允许该用户发帖么?");
		}

		if (check) {
			$.ajax({
				type : "POST",
				dataType : "text",
				url : "mem/member!adjustPost.action",
				data : {
					"id" : id
				},
				success : function(msg) {
					if (msg == 'succ') {
						if ($(obj).hasClass("allowClass")) {
							$(obj).removeClass("allowClass");
							$(obj).addClass("forbidClass");
						} else {
							$(obj).removeClass("forbidClass");
							$(obj).addClass("allowClass");
						}
					}
				}
			});
		}
	}
</script>
</head>
<body>
	<h1>会员列表</h1>
	<form id="mainForm" method="post" class="form-horizontal">
		<input type="hidden" name="filter_EQS_dtype"
			value="${param['filter_EQS_dtype']}">

		<c:if test="${not empty actionMessages}">
			<div id="message" class="alert alert-success">
				<button data-dismiss="alert" class="close">×</button>${actionMessages}</div>
		</c:if>
		<div id="filter" style="display: inline; margin-left: 20px;">
			<input type="text" class="search-query input-medium"
				name="filter_LIKES_loginName"
				value="${param['filter_LIKES_loginName']}" size="20"
				placeholder="登陆名" /> <input type="text"
				class="search-query input-medium" name="filter_LIKES_nickname"
				value="${param['filter_LIKES_nickname']}" size="20" placeholder="昵称" />
			<input type="text" class="search-query input-medium"
				name="filter_LIKES_type" value="${param['filter_LIKES_type']}"
				size="20" placeholder="类型" /> <input type="button" id="submit_btn"
				class="btn" value="查询" onclick="search();" />
		</div>

		<div id="data">
			<jsp:include page="./member-page.jsp"></jsp:include>
		</div>

	</form>
</body>
</html>