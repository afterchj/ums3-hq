<%@page import="com.tp.utils.Constants"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<table class="table table-hover">
	<thead>
		<tr>
			<th><a href="javascript:sort2('loginName','asc')">登陆名</a></th>
			<th>Pic</th>
			<th>昵称</th>
			<th>类型</th>
			<th><a href="javascript:sort2('allowComment','asc')">发言</a></th>
			<th><a href="javascript:sort2('allowPost','asc')">发帖</a></th>
			<th><a href="javascript:sort2('createDate','asc')">创建时间</a></th>
			<th><a href="javascript:sort2('loginDate','asc')">登陆时间</a></th>
			<!-- <th>操作</th> -->
		</tr>
	</thead>
	<tbody>
		<s:iterator value="memberVos" var="member">
			<tr>
				<td><s:property value="#member.loginName" /></td>
				<td><img style="width: 30px; height: 30px"
					src="<s:property value='#member.pic' />"></td>
				<td><s:property value="nickname" /></td>
				<td><s:property value="#member.type" /></td>
				<td><s:if test="#member.allowComment == 1">
						<i title="允许发言" class="icon-comment allowClass"
							onclick="adjustComment('${member.id}', this)"></i>
					</s:if> <s:else>
						<i title="禁止发言" class="icon-comment forbidClass" 
							onclick="adjustComment('${member.id}', this)"></i>
					</s:else></td>
				<td><s:if test="#member.allowPost == 1">
						<i title="允许发帖" class="icon-bullhorn allowClass"
							onclick="adjustPost('${member.id}', this)"></i>
					</s:if> <s:else>
						<i title="禁止发帖" class="icon-bullhorn forbidClass" 
							onclick="adjustPost('${member.id}', this)"></i>
					</s:else></td>
				<td><s:property value="#member.createDate" /></td>
				<td><s:property value="#member.loginDate" /></td>
				<%-- <td><shiro:hasPermission name="member:edit">
						<a href="javascript:void(0)" onclick="deleteThis('${member.id}')"><i
							class="icon-trash"></i></a>
					</shiro:hasPermission></td> --%>
			</tr>
		</s:iterator>
	</tbody>
</table>
<jsp:include page="/common/pageSimplifier.jsp"></jsp:include>

