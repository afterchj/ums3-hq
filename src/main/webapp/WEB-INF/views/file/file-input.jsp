<%@page import="com.tp.utils.Constants"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp" %>
<!DOCTYPE HTML>
<html>
	<head>
		<base href="<%=Constants.TOMCAT_SHOW %>" />
		<title>文件管理</title>
		<link href="${ctx}/static/jquery-validation/1.10.0/validate.css" rel="stylesheet">
        <link href="${ctx}/static/bootstrap/2.1.1/css/slider.css" rel="stylesheet">
		<script src="${ctx}/static/jquery-validation/1.10.0/jquery.validate.min.js"></script>
		<script src="${ctx}/static/jquery-validation/1.10.0/messages_bs_zh.js"></script>
        <script src="${ctx}/static/bootstrap/2.1.1/js/bootstrap-slider.js"></script>
		<script>
			$(document).ready(function(){
				$("#lock-tab").addClass("active");
                $("#lock-tab a").append("<i class='icon-remove-circle'></i>");
                $('#percent').slider("setValue",$("#percent").val());
				$("#inputForm").validate({
					rules:{
						title:{
							remote:"file/file!checkTitle.action?oldTitle="+encodeURIComponent('${title}')							
						},
						checkedCategoryId:"required"						
					},
					messages:{
						title:{
							remote:"文件已存在"
						}						
					},
					errorPlacement: function(error, element) {
						if (element.is(":checkbox") )
							error.appendTo (element.parent());
						else
							error.insertAfter( element );
					}	
				
				});
			});
		
		</script>
	</head>
	<body>
		<h1>文件管理</h1>
		<form id="inputForm" action="file/file!save.action" method="post" enctype="multipart/form-data" class="form-horizontal">	
			<input type="hidden" value="${id}" name="id"/>
            <input type="hidden" name="dtype" id="dtype" value="${dtype}">
			<input type="hidden" value="${page.pageNo}" name="page.pageNo">
			<div class="tabbable" style="margin-top: 10px;">
				<ul class="nav nav-tabs">
					<li class="active"><a href="#basic" data-toggle="tab">基本属性</a></li>
					<s:iterator value="fileInfo" status="info">
						<li><a href="#${language}" data-toggle="tab">${language}</a></li>
					</s:iterator>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="basic">
						<div class="control-group">
							<label for="name" class="control-label">文件名:</label>
							<div class="controls">
								<input class="disabled" id="name" type="text" value="${name}" disabled>
							</div>
						</div>
						<div class="control-group">
							<label for="title" class="control-label">标题:</label>
							<div class="controls">
								<input type="text" id="title" name="title" size="25" maxlength="30" value="${title}" class="required">
							</div>			
						</div>
						<div class="control-group">
							<label for="upload" class="control-label">上传文件:</label>
							<div class="controls">
								<input class="input-file" type="file" id="upload" name="file" />
								<span class="help-inline">*仅支持zip文件,最大28M*</span>
							</div>
						</div>
                        <div class="control-group">
                            <label for="tags" class="control-label">Tag:</label>
                            <div class="controls">
                                <s:checkboxlist list="tagList" id="tags" name="checkedTagIds" listKey="id" listValue="name" theme="custom"></s:checkboxlist>
                            </div>
                        </div>
                        <c:if test="${not empty allCategoryList}">
							<div class="control-group">
								<label for="checkedCategoryIds" class="control-label">文件分类:<font class="red">*</font></label>
								<div class="controls">
									<s:checkboxlist id="checkedCategoryIds" name="checkedCategoryIds" list="allCategoryList" listKey="id" listValue="name" theme="custom"></s:checkboxlist>
								</div>
							</div>	
						</c:if>
						<s:hidden name="checkedStoreIds" value="2"></s:hidden>
						<%-- <div class="control-group">
							<label for="checkedStoreIds" class="control-label">投放商店:</label>
							<div class="controls">
								<s:checkboxlist name="checkedStoreIds" id="checkedStoreIds" list="allStore" listKey="id" listValue="name" theme="custom"></s:checkboxlist>
							</div>
						</div>	 --%>			
						<div class="control-group"> 
							<label for="marketURL" class="control-label">APK包名:</label>
							<div class="controls">
								<s:textfield id="marketURL" name="marketURL"  maxlength="100" cssClass="required"></s:textfield>
							</div>			
						</div>
						<div class="control-group">
							<label for="version" class="control-label">文件版本:</label>
							<div class="controls">
								<input type="text" id="version" name="version" value="${version}" maxlength="10" class="required">
							</div>				
						</div>	
					</div>
					<s:iterator value="fileInfo" status="info">
						<div id="${language}" class="tab-pane">
							<input type="hidden" name="fileInfo[${info.index}].id" value="${id}"/>
							<div class="control-group">
								<label for="title" class="control-label">文件别名:</label>
								<div class="controls">
									<input type="text" id="title[${info.index}]" name="fileInfo[${info.index}].title" value="${title}" maxlength="50" class="required"/>
								</div>
							</div>
							<%-- <div class="control-group">
								<label for="shortDescription" class="control-label">简要描述:</label>
								<div class="controls">
									<input id="shortDescription[${info.index}]" name="fileInfo[${info.index}].shortDescription" type="text" maxlength="50" value="${shortDescription}" class="required"/>
								</div>
							</div> --%>
							<div class="control-group">
								<label for="longDescription" class="control-label" style="vertical-align: top">详细描述:</label>
								<div class="controls">
									<textarea class="input-xxlarge" rows="6" id="longDescription[${info.index}]" name="fileInfo[${info.index}].longDescription" class="required" maxlength="500">${longDescription}</textarea>
								</div>
							</div>
							<div class="control-group">
								<label for="author" class="control-label">作者:</label>
								<div class="controls">
									<input type="text" id="author[${info.index}]" name="fileInfo[${info.index}].author" value="${author}" maxlength="25" class="required"/>
								</div>
							</div>
							<%-- <div class="control-group">
								<label for="price" class="control-label">单价:</label>
								<div class="controls">
									<div class="input-prepend input-append">
										<span class="add-on">￥</span>
										<input type="text" id="price[${info.index}]" name="fileInfo[${info.index}].price" value="${price}" maxlength="10" class="number" />
										<span class="add-on">.00</span>
									</div>							
								</div>
							</div> --%>
						</div>
					</s:iterator>
				</div>
			</div>
		
			<div class="form-actions">
			<shiro:hasPermission name="file:edit">
				<input id="submit_btn" class="btn btn-primary" type="submit" value="保存">&nbsp;
			</shiro:hasPermission>	
				<input id="cancel_btn" class="btn" type="button" value="返回" onclick="history.back();">
			</div>

		</form>
	</body>
</html>