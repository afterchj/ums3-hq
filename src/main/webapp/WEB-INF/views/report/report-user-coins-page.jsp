<%@page import="com.tp.utils.Constants"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<table class="table table-hover">
	<thead>
		<tr>
			<th><a href="javascript:sort('logDate','desc')">日期</a></th>
			<th>UID</th>
			<th>天号</th>
			<th><a href="javascript:sort('coinsHistory','desc')">总积分</a></th>
			<th><a href="javascript:sort('coinsAvail','desc')">可用积分</a></th>
			<th><a href="javascript:sort('coinsAdd','desc')">当日累加积分</a></th>
			<th><a href="javascript:sort('coinsDeduct','desc')">当日消费积分</a></th>
			<th><a href="javascript:sort('rank','desc')">排名</a></th>
			<th><a href="javascript:sort('type','desc')">类型</a></th>
		</tr>
	</thead>
	<tbody>
		<s:iterator value="logUserCoinsForms">
			<tr>
				<td>${logDate}</td>
				<td>${uid }</td>
				<td>${uno}</td>
				<td>${coinsHistory}</td>
				<td>${coinsAvail}</td>
				<td>${coinsAdd}</td>
				<td>${coinsDeduct}</td>
				<td>${rank}</td>
				<td>${type}</td>
			</tr>
		</s:iterator>
	</tbody>
</table>

<%@include file="/common/pageSimplifier.jsp"%>

