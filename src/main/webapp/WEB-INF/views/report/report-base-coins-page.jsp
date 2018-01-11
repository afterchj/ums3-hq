<%@page import="com.tp.utils.Constants"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<table class="table table-hover">
	<thead>
		<tr>
			<th><a href="javascript:sort('logDate','desc')">日期</a></th>
			<th><a href="javascript:sort('increUser','desc')">新增用户</a></th>
			<th><a href="javascript:sort('totalUser','desc')">总用户</a></th>
			<th><a href="javascript:sort('earnTimes','desc')">Earn次数</a></th>
			<th><a href="javascript:sort('earnUser','desc')">Earn用户</a></th>
			<th><a href="javascript:sort('earnCoins','desc')">Earn积分</a></th>
			<th><a href="javascript:sort('deductTimes','desc')">deduct次数</a></th>
			<th><a href="javascript:sort('deductUser','desc')">deduct用户</a></th>
			<th><a href="javascript:sort('deductCoins','desc')">deduct积分</a></th>
		</tr>
	</thead>
	<tbody>
		<s:iterator value="logBaseCoinsForms">
			<tr>
				<td>${logDate}</td>
				<td>${increUser }</td>
				<td>${totalUser}</td>
				<td>${earnTimes}</td>
				<td>${earnUser}</td>
				<td>${earnCoins}</td>
				<td>${deductTimes}</td>
				<td>${deductUser}</td>
				<td>${deductCoins}</td>
			</tr>
		</s:iterator>
	</tbody>
</table>

<%@include file="/common/pageSimplifier.jsp"%>

