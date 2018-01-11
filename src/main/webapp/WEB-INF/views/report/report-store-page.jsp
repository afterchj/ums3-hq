<%@page import="com.tp.utils.Constants"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<table class="table table-hover">
	<thead>
		<tr>
			<th><a href="javascript:sort('createTime','desc')">日期</a></th>
			<th><a href="javascript:sort('themeName','desc')">内容</a></th>
			<th><a href="javascript:sort('totalVisit','desc')">访问总量</a></th>
			<th><a href="javascript:sort('totalDown','desc')">下载总量</a></th>
		</tr>
	</thead>
	<tbody>
		<s:iterator value="logCountStoreForms">
			<tr>
				<td>${logDate}</td>
				<td>${themeName}</td>
				<td>${totalVisit}</td>
				<td>${totalDown}</td>
			</tr>
		</s:iterator>
	</tbody>
</table>
<%@include file="/common/pageSimplifier.jsp"%>