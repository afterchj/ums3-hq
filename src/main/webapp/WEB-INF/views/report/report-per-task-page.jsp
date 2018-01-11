<%@page import="com.tp.utils.Constants"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<table class="table table-hover">
	<thead>
		<tr>
			<th><a href="javascript:sort('logDate','desc')">日期</a></th>
			<th>任务ID</th>
			<th>任务名称</th>
			<th>任务创建时间</th>
			<th><a href="javascript:sort('income','desc')">任务收入</a></th>
			<th><a href="javascript:sort('accomplishUser','desc')">完成用户数</a></th>
			<th><a href="javascript:sort('accomplishTimes','desc')">完成次数</a></th>
		</tr>
	</thead>
	<tbody>
		<s:iterator value="logPerTaskForms">
			<tr>
				<td>${logDate}</td>
				<td>${taskId }</td>
				<td>
					<c:choose>
						<c:when test="${fn:length(taskName)>6}">
							<span onmouseover="show(this)" onmouseout="hide(this)">${fn:substring(taskName,0,6)}....</span>
							<div style="display: none; position: relative;">${taskName}</div>
						</c:when>
							<c:otherwise>
							${taskName}
						</c:otherwise>
					</c:choose>
				</td>
				<td>${taskDate }</td>
				<td>${income}</td>
				<td>${accomplishUser}</td>
				<td>${accomplishTimes}</td>
			</tr>
		</s:iterator>
	</tbody>
</table>

<%@include file="/common/pageSimplifier.jsp"%>

