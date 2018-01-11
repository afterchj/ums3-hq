<%@page import="com.tp.utils.Constants"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<base href="<%=Constants.TOMCAT_SHOW %>" />
<title>日志查看</title>
<script>
	$(document).ready(function() {

		$("#viewsource-tab").addClass("active");
        $("#viewsource-tab a").append("<i class='icon-remove-circle'></i>");
	});
</script>
</head>
<body>
	<form action="report/view-source!view.action" method="get">
		<h1>管理员工具</h1>
		<div class="tabbable" style="margin-top: 10px;">
			<ul class="nav nav-tabs">
				<li class="active"><a href="#status" data-toggle="tab">Memcached Status</a></li>
				<li><a href="#logcat" data-toggle="tab">Log Cat</a></li>
                <li><a href="#logclient" data-toggle="tab">同步客户端数据</a></li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane active" id="status">
					<table class="table table-hover">
						<s:iterator value="status">
							Server: [${address}]															
							<s:iterator value="status">
								<tr>
									<td>${key}</td>
									<td>${value}</td>
								</tr>
							</s:iterator>						
						</s:iterator>
					</table>
				</div>
				<div class="tab-pane" id="logcat">
					<p>
					/***下载参数:download=true, <br />
					当天日志文件名为mopita.log,其他按mopita.yyyy-MM-dd.log命名。<br>
					默认情况下只需输入文件名，当默认路径发生改变，可手动输入绝对路径查询。***/<br>
					 userDir: ${userDir}
					</p>
					<div class="control-group">
							<label for="path" class="control-label">abs-path:</label>
							<div class="controls">
								<input type="text" id="path" name="path" size="100" />
							</div>
					</div>
					<div class="control-group">
							<label for="fname" class="control-label">文件名:</label>
							<div class="controls">
								<input type="text" id="fname" name="fname" size="100" required/>
							</div>
					</div>
					<div class="form-actions">
						<input id="submit" class="btn btn-primary" type="submit" value="提交" />&nbsp;
						
					</div>
				</div>
                <div class="tab-pane" id="logclient">
                    <i class="icon-plane"></i>
                </div>
			</div>
		</div>
		
	</form>
</body>
</html>