<%@page import="com.tp.utils.Constants"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<table class="table table-hover">
	<thead>
		<tr>
			<th><a href="javascript:sort('logDate','desc')">日期</a></th>
			<th>UID</th>
			<th>天号</th>
			<th><a href="javascript:sort('guest','desc')">邀请用户数</a></th>
			<th><a href="javascript:sort('dayTaskNum','desc')">当日完成任务数</a></th>
			<th><a href="javascript:sort('totalTaskNum','desc')">总共完成任务数</a></th>
		</tr>
	</thead>
	<tbody>
		<s:iterator value="logTaskInvitationForms">
			<tr>
				<td>${logDate}</td>
				<td>${invitator }</td>
				<td>${serialno }</td>
				<td>${guest}</td>
				<td>${dayTaskNum}</td>
				<td>${totalTaskNum}</td>
			</tr>
		</s:iterator>
	</tbody>
</table>

<%@include file="/common/pageSimplifier.jsp"%>

