<%@page import="com.tp.utils.Constants"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<table class="table table-hover">
	<thead>
		<tr>
			<th><a href="javascript:sort('logDate','desc')">日期</a></th>
			<th>应用ID</th>
			<th>应用名称</th>
			<th><a href="javascript:sort('visitor','desc')">访问数</a></th>
			<th><a href="javascript:sort('download','desc')">下载数</a></th>
			<th><a href="javascript:sort('success','desc')">成功数</a></th>
		</tr>
	</thead>
	<tbody>
		<s:iterator value="logBaseCpaForms">
			<tr>
				<td>${logDate}</td>
				<td>${appId }</td>
				<td>${appName}</td>
				<td>${visitor}</td>
				<td>${download}</td>
				<td>${success}</td>
			</tr>
		</s:iterator>
	</tbody>
</table>

<%@include file="/common/pageSimplifier.jsp"%>

