<%@page import="com.tp.utils.Constants"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<table class="table table-hover">
	<thead>
		<tr>
			<th>作者昵称</th>
			<th>作者ID</th>
			<th>Pic</th>
			<th>作品描述</th>
			<th>共享</th>
			<th><a href="javascript:sort2('status','asc')">状态</a></th>
			<th><a href="javascript:sort2('createDate','asc')">时间</a></th>
			<!-- <th>操作</th> -->
		</tr>
	</thead>
	<tbody>
		<s:iterator value="workVos" var="work">
			<tr>
				<td><s:property value="#work.nickname" /></td>
				<td><s:property value="#work.uid" /></td>
				<td><img style="width: 30px; height: 30px"
					src="<s:property value='#work.pic' />"></td>
				<td>
					<c:choose>
						<c:when test="${fn:length(work.descr)>20}">
							<span onmouseover="show(this)" onmouseout="hide(this)">${fn:substring(work.descr,0,20)}....</span>
							<div style="display: none; position: relative;">${work.descr}</div>
						</c:when>
							<c:otherwise>
								${work.descr}
							</c:otherwise>
					</c:choose>
				</td>
				<td><s:property value="#work.shared" /></td>
				<td>
					<s:if test="#work.status == 0">
						<i title="启用" class="icon-ok-circle allowClass"
							onclick="adjustStatus('${work.id}', this)"></i>
					</s:if> <s:else>
						<i title="停用" class="icon-remove-sign forbidClass"
							onclick="adjustStatus('${work.id}', this)"></i>
					</s:else>
				</td>
				<td><s:property value="#work.createDate" /></td>
				<%-- <td>
					<shiro:hasPermission name="work:edit">
						<a href="javascript:void(0)" onclick="deleteThis('${work.id}')"><i
							class="icon-trash"></i></a>
					</shiro:hasPermission></td> --%>
			</tr>
		</s:iterator>
	</tbody>
</table>
<jsp:include page="/common/pageSimplifier.jsp"></jsp:include>

