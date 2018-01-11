<%@page import="com.tp.utils.Constants"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<table class="table table-hover">
	<thead>
		<tr>
			<th><a href="javascript:sort('serialno','desc')">订单号</a></th>
			<th>商品名称</th>
			<th><a href="javascript:sort('price','desc')">价格</a></th>
			<th>UID</th>
			<th>全名</th>
			<th>QQ</th>
			<th>手机</th>
			<th><a href="javascript:sort('status','desc')">状态</a></th>
			<th style="text-align: center;"><i class="icon-wrench" title="操作"></i></th>
		</tr>
	</thead>
	<tbody>
		<s:iterator value="orderForms">
			<tr>
				<td>
					${fn:substring(serialno,0,-1)}
				</td>
				<td>
					${fn:substring(name,0,10)}
				</td>
				<td>${price/1000}</td>
				<td>
					<c:choose>
						<c:when test="${fn:length(uid)>8}">
							<span onmouseover="show(this)" onmouseout="hide(this)">${fn:substring(uid,0,8)}...</span>
							<div style="display: none; position: relative;">${fn:substring(uid,8,-1)}</div>
						</c:when>
							<c:otherwise>
							${uid}
						</c:otherwise>
					</c:choose>
				</td>
				<td>${fullName}</td>
				<td>${qq}</td>
				<td>${mobile}</td>
				<td>
					<c:choose>
						<c:when test="${status == 0 }">
							<i title="处理成功" class="icon-screenshot allowClass"></i>
						</c:when>
						<c:when test="${status == 1 }">
							<i title="处理成功" class="icon-ok-circle allowClass"></i>
						</c:when>
						<c:when test="${status == 2 }">
							<i title="处理失败" class="icon-remove-sign forbidClass"></i>
						</c:when>
						<c:otherwise>
							${status }(???)
						</c:otherwise>
					</c:choose>
				</td>
				<td style="text-align: center;">
					<c:if test="${status == 0 || status == 1 }">
						<shiro:hasPermission name="order:edit">
							<a href="javascript:void(0)" onclick="edit('${id}')"><i class="icon-edit"></i></a> &nbsp;
						</shiro:hasPermission>
					</c:if>
				</td>
			</tr>
		</s:iterator>
	</tbody>
</table>

<%@include file="/common/pageSimplifier.jsp"%>

