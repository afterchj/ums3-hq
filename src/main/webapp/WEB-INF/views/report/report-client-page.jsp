<%@page import="com.tp.utils.Constants"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<table class="table table-hover">
	<thead>
		<tr>
			<th>日期</th>
			<th>客户端启用次数</th>
			<th>客户端启用用户数</th>
			<th>总用户</th>
			<th>新增用户</th>
			<th>商店访问次数</th>
			<th>商店访问用户数</th>
		</tr>
	</thead>
	<tbody>
		<s:iterator value="logCountClientForms">
			<tr>
				<td>${logDate}</td>
				<td>${openCount}</td>
				<td>${openUser}</td>
				<td>${totalUser}</td>
				<td>${incrementUser}</td>
				<td>${visitStoreCount}</td>
				<td>${visitStoreUser}</td>
			</tr>
		</s:iterator>
	</tbody>
</table>
<%@include file="/common/pageSimplifier.jsp"%>
