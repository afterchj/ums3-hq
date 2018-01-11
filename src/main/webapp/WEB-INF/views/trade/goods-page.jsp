<%@page import="com.tp.utils.Constants"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<table class="table table-hover">
	<thead>
		<tr>
			<th>商品名称</th>
			<th><a href="javascript:sort('stock','desc')">库存</a></th>
			<th><a href="javascript:sort('sales','desc')">销量</a></th>
			<th>过期时间</th>
			<th><a href="javascript:sort('price','desc')">价格/元</a></th>
			<th><a href="javascript:sort('payback','desc')">偿付/元</a></th>
			<th><a href="javascript:sort('sort','desc')">排序</a></th>
			<th><a href="javascript:sort('shelf','desc')">货架</a></th>
			<th style="text-align: center;"><i class="icon-wrench" title="操作"></i></th>
		</tr>
	</thead>
	<tbody>
		<s:iterator value="goodsForms">
			<tr>
				<td>
					${fn:substring(name,0,10)}
				</td>
				<td>
					<a href="javascript:void(0)" onclick="changeStock('${id }', ${stock})">${stock}</a>
				</td>
				<td>${sales}</td>
				<td>
					${expiryDate}
				</td>
				<td>${price / 1000.0}</td>
				<td>${payback / 1000.0}</td>
				<td>${sort}</td>
				<td>
					<c:forEach items="${shelfForms }" var="sf">
						<c:if test="${sf.value == shelf }">
							${sf.name }
						</c:if>
					</c:forEach>
				</td>
				<td style="text-align: center;">
					<shiro:hasPermission name="goods:edit">
						<a href="trade/goods!input.action?id=${id}"><i class="icon-edit"></i></a> &nbsp;
					</shiro:hasPermission>
					<shiro:hasPermission name="goods:delete">
						<a href="javascript:void(0)" onclick="deleteThis('${id}')"><i class="icon-trash"></i></a>
					</shiro:hasPermission>
				</td>
			</tr>
		</s:iterator>
	</tbody>
</table>

<%@include file="/common/pageSimplifier.jsp"%>

