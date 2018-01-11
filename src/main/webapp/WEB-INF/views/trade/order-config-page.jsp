<%@page import="com.tp.utils.Constants"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<table class="table table-hover">
	<thead>
		<tr>
			<th>名称</th>
			<th><a href="javascript:sort('balance','desc')">余额</a></th>
			<th><a href="javascript:sort('cost','desc')">总额</a></th>
			<th>处理商品</th>
			<th>处理货架</th>
			<th><a href="javascript:sort('userRestriction','desc')">用户限制</a></th>
			<th>处理程序</th>
			<th><a href="javascript:sort('status','desc')">状态</a></th>
			<th style="text-align: center;"><i class="icon-wrench" title="操作"></i></th>
		</tr>
	</thead>
	<tbody>
		<s:iterator value="orderConfigForms">
			<tr>
				<td>
					${fn:substring(name,0,5)}
				</td>
				<td>
					<a href="javascript:void(0)" onclick="changeStock('${id }', ${balance})">${balance}</a>
				</td>
				<td>${cost}</td>
				<td>
					${goods.name }
				</td>
				<td>
					<c:forEach items="${shelfForms }" var="sf">
						<c:if test="${sf.value == shelf }">
							${sf.name }
						</c:if>
					</c:forEach>
				</td>
				<td>${userRestriction}</td>
				<td>${beanName}</td>
				<td>
					<c:choose>
						<c:when test="${status == 0 }">
							<i title="停用" class="icon-remove-sign forbidClass"></i>
						</c:when>
						<c:when test="${status == 1 }">
							<i title="启用" class="icon-ok-circle allowClass"></i>
						</c:when>
					</c:choose>
				</td>
				<td style="text-align: center;">
					<shiro:hasPermission name="orderConfig:edit">
						<a href="trade/order-config!input.action?id=${id}"><i class="icon-edit"></i></a> &nbsp;
					</shiro:hasPermission>
					<shiro:hasPermission name="orderConfig:delete">
						<a href="javascript:void(0)" onclick="deleteThis('${id}')"><i class="icon-trash"></i></a>
					</shiro:hasPermission>
				</td>
			</tr>
		</s:iterator>
	</tbody>
</table>

<%@include file="/common/pageSimplifier.jsp"%>

