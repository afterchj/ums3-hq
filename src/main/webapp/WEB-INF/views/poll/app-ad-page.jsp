<%@page import="com.tp.utils.Constants"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<table class="table table-hover">
	<thead>
		<tr>
			<th><a href="javascript:sort2('offset','asc')">排名</a></th>
			<th>标题</th>
			<th>文件名称</th>
			<th>展示图片</th>
			<th>包名</th>
			<th><a href="javascript:sort2('status','asc')">状态</a></th>
			<th><a href="javascript:sort2('createDate','asc')">创建时间</a></th>
			<th>操作</th>
		</tr>
	</thead>
	<tbody>
		<s:iterator value="appAdForms" var="appAd">
			<tr>
				<td><s:property value="#appAd.offset" /></td>
				<td><a href="file/file!input.action?dtype=2&id=${appAd.file.id }&page.pageNo=1"><s:property value="#appAd.file.title" /></a></td>
				<td><s:property value="#appAd.file.name" /></td>
				<td><img style="width: 30px; height: 30px"
					src="<s:property value='#appAd.file.preWebPath' />"></td>
				<td><s:property value="#appAd.file.marketURL" /></td>
				<td>
                   <s:if test="#appAd.status == 0">
						<i title="启用" class="icon-ok-circle allowClass"
							onclick="adjustStatus(${appAd.id}, this)"></i>
					</s:if> <s:else>
						<i title="停用" class="icon-remove-sign forbidClass"
							onclick="adjustStatus(${appAd.id}, this)"></i>
					</s:else>
                </td>
				<td><s:property value="#appAd.createDate" /></td>
				<td>
					<a href="javascript:void(0)" onclick="deleteThis('${appAd.id}')"><i
						class="icon-trash"></i></a>
				</td>
			</tr>
		</s:iterator>
	</tbody>
</table>
<jsp:include page="/common/pageSimplifier.jsp"></jsp:include>

