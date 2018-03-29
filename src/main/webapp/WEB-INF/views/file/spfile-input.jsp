<%@page import="com.tp.utils.Constants" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/common/taglibs.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
    <base href="<%=Constants.TOMCAT_SHOW %>"/>
    <title>文件管理</title>
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
            $("#test2").addClass("acTp");
        });

        function changeSonCategory(categoryId) {
            var childrenIds = $("input:checkbox[name='hiddenSonCatrgory']:checked").map(function (index, elem) {
                return $(elem).val();
            }).get().join(',');
            var childrenIdsArray = childrenIds.split(',');
//            console.log(childrenIdsArray);
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
//                                childrenIds.indexOf("" + data[i].id + "") != -1
                                if (childrenIdsArray.contains("" + data[i].id + "")) {
                                    msg += "<input type='checkbox' id='sonCategoryId" + data[i].id + "' value='" + data[i].id + "' name='checkedItems' checked='checked'>" + data[i].name + "<br>";
                                } else {
                                    msg += "<input type='checkbox' id='sonCategoryId" + data[i].id + "' value='" + data[i].id + "' name='checkedItems'>" + data[i].name + "<br>";
                                }
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

        //判断数组中是否存在某个元素
        Array.prototype.contains = function (needle) {
            for (i in this) {
                if (this[i] == needle) return true;
            }
            return false;
        }

    </script>
</head>
<body>
<h1>视频列表</h1>
<form id="inputForm" action="file/spfile!save.action" method="post" enctype="multipart/form-data"
      class="form-horizontal">
    <c:if test="${not empty actionMessages}">
        <div id="message" class="error">${actionMessages}</div>
    </c:if>
    <input type="hidden" value="${id}" name="id" id="spId"/>
    <div class="tabbable" style="margin-top: 10px;">
        <ul class="nav nav-tabs">
            <li class="active"><a href="#basic" data-toggle="tab">视频信息</a></li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane active" id="basic">
                <div class="control-group">
                    <label for="name" class="control-label">文件名:</label>
                    <div class="controls">
                        <input type="text" id="name" name="name" value="${name}">
                    </div>
                </div>
                <div class="control-group">
                    <label for="upload" class="control-label">上传文件:</label>
                    <div class="controls">
                        <input class="input-file" type="file" id="upload" name="file"/>
                        <span class="help-inline">*仅支持zip文件*</span>
                    </div>
                </div>
                <div class="control-group" style="float: left">
                    <label class="control-label">大分类*:</label>
                    <div class="controls">
                        <s:iterator value="parentTypes" var="parent">
                            <s:set var="index" value="1"></s:set>
                            <c:if test="${not empty parentIds}">
                                <s:iterator value="parentIds" var="pId">
                                    <c:if test="${index == 1}">
                                        <c:if test="${parent.id == pId}">
                                            <input type="checkbox" id="categoryId${parent.id}" value="${parent.id}"
                                                   name="checkedItems"
                                                   checked="checked"
                                                   onclick="changeSonCategory('${parent.id}')">${parent.name}
                                            <s:set var="index" value="0"></s:set>
                                        </c:if>
                                    </c:if>
                                </s:iterator>
                            </c:if>
                            <c:if test="${index == 1}">
                                <input type="checkbox" id="categoryId${parent.id}" value="${parent.id}"
                                       name="checkedItems"
                                       onclick="changeSonCategory('${parent.id}')">${parent.name}
                            </c:if>
                            <br>
                        </s:iterator>
                    </div>
                </div>
                <div class="control-group" style="margin-left: 100px">
                    <label class="control-label">小分类*:</label>
                    <div class="controls" id="subTypesDiv" style="margin-left: 315px">
                        <c:if test="${not empty subTypes}">
                            <s:iterator value="subTypes" var="son">
                                <s:set var="index" value="1"></s:set>
                                <c:if test="${not empty childrenIds}">
                                    <s:iterator value="childrenIds" var="cId">
                                        <c:if test="${index == 1}">
                                            <c:if test="${son.id == cId}">
                                                <input type="checkbox" id="sonCategoryId${son.id}" value="${son.id}"
                                                       name="checkedItems"
                                                       checked="checked">${son.name}
                                                <s:set var="index" value="0"></s:set>
                                            </c:if>
                                        </c:if>
                                    </s:iterator>
                                </c:if>
                                <c:if test="${index == 1}">
                                    <input type="checkbox" id="sonCategoryId${son.id}" value="${son.id}"
                                           name="checkedItems">${son.name}
                                </c:if>
                                <br>
                            </s:iterator>
                        </c:if>
                    </div>
                </div>

                <div class="control-group">
                    <label for="isRecommend" class="control-label">推荐*:</label>
                    <div class="controls">
                        <c:if test="${isRecommend == 1}">
                            <label style="float: left"><input type="radio" name="isRecommend" value="1"
                                                              checked="checked"> 是</label>
                            <label style="float: left;margin-left: 10px"><input type="radio" name="isRecommend"
                                                                                value="0"> 否</label>
                        </c:if>
                        <c:if test="${isRecommend == 0}">
                            <label style="float: left"><input type="radio" name="isRecommend" value="1"> 是</label>
                            <label style="float: left;margin-left: 10px"><input type="radio" name="isRecommend"
                                                                                value="0" checked="checked"> 否</label>
                        </c:if>
                    </div>
                </div>
                <div class="control-group">
                    <label for="lable" class="control-label">关键词*:</label>
                    <div class="controls">
                        <input type="text" id="lable" name="lable" value="${lable}">
                        <span class="help-inline">*关键词之间请以&符号连接，示例:周杰伦&经典*</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="form-actions">
        <shiro:hasPermission name="file:edit">
            <input id="submit_btn" class="btn btn-primary" type="submit" value="保存">&nbsp;
        </shiro:hasPermission>
        <input id="cancel_btn" class="btn" type="button" value="返回" onclick="history.back();">
    </div>
    <%--定义一个div,留作子分类显示标记用--%>
    <div class="control-group" style="display: none">
        <c:if test="${not empty childrenIds}">
            <s:iterator value="childrenIds" var="cId">
                <input type="checkbox" value="${cId}" name="hiddenSonCatrgory" checked="checked">${cId}
            </s:iterator>
        </c:if>
    </div>

</form>
</body>
</html>