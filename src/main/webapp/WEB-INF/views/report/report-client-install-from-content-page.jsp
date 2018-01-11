<%@page import="com.tp.utils.Constants"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<table class="table table-hover">
	<thead>
		<tr>
			<th><a href="javascript:sort('logDate','desc')">日期</a></th>
			<th><a href="javascript:sort('appName','desc')">解锁名称</a></th>
			<th><a href="javascript:sort('fm','desc')">市场名称</a></th>
			<th><a href="javascript:sort('installed','desc')">安装量</a></th>
		</tr>
	</thead>
	<tbody>
		<s:iterator value="logCountCIFCForms">
			<tr>
				<td>${logDate}</td>
				<td>${appName}</td>
				<td>${fm}</td>
				<td>${installed}</td>
			</tr>
		</s:iterator>
	</tbody>
</table>

<%@include file="/common/pageSimplifier.jsp"%>

