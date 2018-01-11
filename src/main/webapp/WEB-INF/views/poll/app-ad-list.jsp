<%@page import="com.tp.utils.Constants"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<base href="<%=Constants.TOMCAT_SHOW%>" />
<link href="css/global.css" type="text/css" rel="stylesheet" ></link>
<title>填充广告</title>
<script src="js/table2.js"></script>
<script>
	$(document).ready(function() {
		$("#message").fadeOut(3000);
		$("#appAd-tab").addClass("active");
		$("#appAd-tab a").append("<i class='icon-remove-circle'></i>");
		var dtype='${param['filter_EQS_dtype']}';
        if(dtype=='hottest'){
            $("#hottest_ad").addClass('active');
        }else if(dtype=='sbot'){
            $("#sbot_ad").addClass('active');
        }else if(dtype=='topic'){
            $("#topic_ad").addClass('active');
        }
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
			window.location = "poll/app-ad!delete.action?id=" + id
					+ "&page.pageNo=" + $("#pageNo").val();
		}
	}

	function sendAjax(pageNo) {
		$.ajax({
			url : "poll/app-ad!page.action?page.pageNo=" + pageNo,
			data : $("#mainForm").serialize(),
			cache : false,
			success : function(html) {
				$("#data").empty();
				$("#data").html(html);
			}
		});
	}

	function adjustStatus(id, obj) {
		var check = null, status;
		if ($(obj).hasClass("allowClass")) {
			check = confirm("确定要停用该广告么?");
			status = 1;
		} else {
			check = confirm("确定要启用该广告么?");
			status = 0;
		}

		if (check) {
			$.ajax({
				type : "POST",
				dataType : "text",
				url : "poll/app-ad!adjustStatus.action",
				data : {
					"id" : id,
					"status" : status
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
				}, 
				error :function(msg){
					alert(msg.result);
				}
			});
		}
	}
</script>
</head>
<body>
	<h1>广告列表</h1>
	<form id="mainForm" method="get" class="form-horizontal" action="poll/app-ad!list.action">
		<input type="hidden" name="filter_EQS_dtype"
			value="${param['filter_EQS_dtype']}">

		<c:if test="${not empty actionMessages}">
			<div id="message" class="alert alert-success">
				<button data-dismiss="alert" class="close">×</button>${actionMessages}</div>
		</c:if>
		 <ul class="nav nav-pills" style="margin-bottom: 2px;float: left;">
	        <li id="hottest_ad">
	            <a href="poll/app-ad!list.action?filter_EQS_dtype=hottest">最热填充广告</a>
	        </li>
	    </ul>
		<div id="filter" style="display: inline; margin-left: 20px;">
			<input type="text" class="search-query input-medium"
				name="filter_GEI_offset"
				value="${param['filter_GEI_offset']}" size="20"
				placeholder="排名" /> 
			<input type="button" id="submit_btn"
				class="btn" value="查询" onclick="search();" />
			<div class="pull-right">
                <a class="icon-plus" id="addpoll" href="poll/app-ad!input.action?dtype=${param['filter_EQS_dtype']}">新增</a>
	        </div>
		</div>

		<div id="data">
			<jsp:include page="./app-ad-page.jsp"></jsp:include>
		</div>

	</form>
</body>
</html>