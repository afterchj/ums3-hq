<%@page import="com.tp.utils.Constants" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/common/taglibs.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
    <base href="<%=Constants.TOMCAT_SHOW %>"/>
    <title>文件上传</title>
    <link href="${ctx}/static/jquery-validation/1.10.0/validate.css" rel="stylesheet">
    <link href="${ctx}/static/bootstrap/2.1.1/css/slider.css" rel="stylesheet">
    <script src="${ctx}/static/jquery-validation/1.10.0/jquery.validate.min.js"></script>
    <script src="${ctx}/static/jquery-validation/1.10.0/messages_bs_zh.js"></script>
    <script src="${ctx}/static/bootstrap/2.1.1/js/bootstrap-slider.js"></script>
    <script>
        $(document).ready(function () {
            $("#splock-tab").addClass("active");
            $("#splock-tab a").append("<i class='icon-remove-circle'></i>");
            $('#percent').slider("setValue", $("#percent").val());
            $("#test2").style.display='block';
            $("#message").fadeOut(3000);
        });

        function changeSonCategory(categoryId) {
            $.ajax({
                dataType: "json",
                url: "file/spfile!getSubTypesByParentId.action",
                data: {'categoryId': categoryId},
                success: function (data) {
                    if (data != null) {
//                        $("#subTypesDiv").empty();
                        var msg = "";
                        for (var i = 0; i < data.length; i++) {
                            var children = $('#sonCategoryId' + data[i].id).val();
                            if (!children) {
                                msg += "<input type='checkbox' id='sonCategoryId" + data[i].id + "' value='" + data[i].id + "' name='checkedItems'>" + data[i].name + "<br>";
                            } else {
                                msg += "";
                            }
                        }
                        if (!children && msg != "") {
                            msg = "<HR style='height: 1px;width: 100px;background-color:#000;margin-top: 1px;margin-bottom: 1px'>" + msg;
                        }
                        $("#subTypesDiv").append(msg);
                    }
                }
            });
        }

    </script>
</head>
<body>
<h1>视频管理</h1>
<form id="inputForm" action="file/spfile-upload!userUpload.action" method="post" enctype="multipart/form-data"
      class="form-horizontal">
    <s:hidden name="dtype"/>
    <c:if test="${not empty actionMessages}">
        <div id="message" class="error">${actionMessages}</div>
    </c:if>
    <fieldset>
        <legend>
            <small>视频解锁上传</small>
        </legend>
        <div class="control-group">
            <label for="upload1" class="control-label">上传视频:</label>
            <div class="controls">
                <s:file id="upload1" name="userUpload" cssClass="input-file required"></s:file>
                <%--<span class="help-inline">*仅支持zip文件*</span>--%>
            </div>
            <label for="upload2" class="control-label">上传封面:</label>
            <div class="controls">
                <s:file id="upload2" name="userUpload" cssClass="input-file required"></s:file>
                <%--<span class="help-inline">*仅支持zip文件*</span>--%>
            </div>
        </div>
        <div class="control-group">
            <label for="name" class="control-label">名称:<font class="red">*</font></label>
            <div class="controls">
                <s:textfield id="name" name="name" maxlength="30" cssClass="required"></s:textfield>
            </div>
        </div>
        <c:if test="${not empty parentTypes}">
            <div class="control-group" style="float: left">
                <label class="control-label">大分类*:</label>
                <div class="controls">
                    <s:iterator value="parentTypes" var="parent">
                        <input type="checkbox" id="categoryId${parent.id}" value="${parent.id}"
                               name="checkedItems"
                               onclick="changeSonCategory('${parent.id}')">${parent.name}
                        <br>
                    </s:iterator>
                </div>
            </div>
            <div class="control-group" style="margin-left: 100px">
                <label class="control-label">小分类*:</label>
                <div class="controls" id="subTypesDiv" style="margin-left: 315px">
                    <c:if test="${not empty subTypes}">
                        <s:iterator value="subTypes" var="son">
                            <input type="checkbox" id="sonCategoryId${son.id}" value="${son.id}"
                                   name="checkedItems">${son.name}
                            <br>
                        </s:iterator>
                    </c:if>
                </div>
            </div>
        </c:if>

        <div class="control-group">
            <label for="isRecommend" class="control-label">推荐*:</label>
            <div class="controls">
                <label style="float: left"><input type="radio" name="isRecommend" value="1"> 是</label>
                <label style="float: left;margin-left: 10px"><input type="radio" name="isRecommend" value="0"
                                                                    checked="checked"> 否</label>
            </div>
        </div>
        <div class="control-group">
            <label for="lable" class="control-label">关键词*:</label>
            <div class="controls">
                <input type="text" id="lable" name="lable">
                <span class="help-inline">*关键词之间请以&符号连接，示例:周杰伦&经典*</span>
            </div>
        </div>
    </fieldset>
    <div class="form-actions">
        <input type="submit" class="btn btn-primary" value="上传">&nbsp;
        <input type="button" class="btn" onclick="history.back();" value="取消"/>
    </div>

</form>

</body>
</html>