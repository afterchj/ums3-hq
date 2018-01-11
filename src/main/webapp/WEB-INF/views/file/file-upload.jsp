<%@page import="com.tp.utils.Constants"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp" %>
<!DOCTYPE HTML>
<html>
	<head>
		<base href="<%=Constants.TOMCAT_SHOW %>" />
		<title>文件上传</title>	
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
						checkedCategoryIds:"required",
						longDescription:{
							required:true,
							maxlength:500
						}
					},
					messages:{
						title:{
							remote:"文件已存在"
						}						
					},
					errorPlacement: function(error, element) {
						if (element.is(":radio") )
							error.appendTo (element.parent());
						else
							error.insertAfter( element );
					}				
				});
				/**
				$("#upload").bind('change', function() {
								
			  					return this.files[0].size<1;
		
						});
				*/
				$("#message").fadeOut(3000);
				$("#golist").click(function(){
					window.location="file/file.action";
				});
				
			});

		</script>
	</head>
	<body>
		<h1>文件管理</h1>
		<form id="inputForm" action="file/file-upload!upload.action" method="post" enctype="multipart/form-data" class="form-horizontal">
			<s:hidden name="dtype" />
			<c:if test="${not empty actionMessages}">
				<div id="message" class="error">${actionMessages}</div>	
			</c:if>
			<fieldset>
				<legend><small>解锁上传</small></legend>
				<div class="control-group">
					<label for="upload" class="control-label">上传文件:<font class="red">*</font></label>
					<div class="controls">
						<s:file id="upload" name="upload" cssClass="input-file required"></s:file>
						<!-- <input type="file" id="upload" name="upload" class="input-file" required="required"/> -->
						<span class="help-inline">*仅支持zip文件,最大28M*</span>
					</div>
				</div>		
				<div class="control-group">
					<label for="title" class="control-label">标题:<font class="red">*</font></label>
					<div class="controls">
						<s:textfield id="title" name="title" maxlength="30" cssClass="required"></s:textfield>
						<%-- <input type="text" id="title" name="title" maxlength="30" value="${title}" class="required"> --%>
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
						<label for="checkedCategoryIds" class="control-label">分类:<font class="red">*</font></label>
						<div class="controls">
							<s:checkboxlist name="checkedCategoryIds" list="allCategoryList" listKey="id" listValue="name" theme="custom"></s:checkboxlist>
						</div>
					</div>	
				</c:if>
                
				<s:hidden name="checkedStoreIds" value="2"></s:hidden>
				
				<%-- <div class="control-group">
					<label for="checkedStoreIds" class="control-label">投放市场:</label>
					<div class="controls">
						<s:checkboxlist name="checkedStoreIds" id="checkedStoreIds" list="allStore" listKey="id" listValue="name" theme="custom"></s:checkboxlist>
					</div>
				</div>	 --%>	
				<div class="control-group">
					<label for="marketURL" class="control-label">apk包名:<font class="red">*</font></label>
					<div class="controls">
						<s:textfield id="marketURL" name="marketURL"  maxlength="100" cssClass="required"></s:textfield>
					</div>	
				</div>
				
				<div class="control-group">
					<label for="version" class="control-label">文件版本:<font class="red">*</font></label>
					<div class="controls">
						<s:textfield id="version" name="version" maxlength="10" cssClass="required"></s:textfield>
					</div>	
				</div>
				
				<%-- <div class="control-group">
					<label for="shortDescription" class="control-label">简要描述:<font class="red">*</font></label>
					<div class="controls">
						<input type="text" id="shortDescription" name="shortDescription" value="${shortDescription}" maxlength="50" class="required">
					</div>					
				</div> --%>
				<div class="control-group">
					<label for="longDescription" class="control-label" style="vertical-align: top">详细描述:<font class="red">*</font></label>
					<div class="controls">
						<s:textarea cssClass="input-xxlarge" rows="6" id="longDescription" name="longDescription"></s:textarea>
					</div>					
				</div>
				<div class="control-group">
					<label for="author" class="control-label">作者:<font class="red">*</font></label>
					<div class="controls">
						<s:textfield id="author" name="author" maxlength="25" cssClass="required"></s:textfield>
					</div>	
				</div>
			</fieldset>
			<div class="form-actions">
				<input type="submit" class="btn btn-primary" value="上传">&nbsp;
				<input type="button" class="btn"  onclick="history.back();" value="取消"/>
			</div>	

		</form>

	</body>
</html>