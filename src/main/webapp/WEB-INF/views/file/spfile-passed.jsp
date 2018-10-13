<%@page import="com.tp.utils.Constants" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/common/taglibs.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
    <base href="<%=Constants.TOMCAT_SHOW%>"/>
    <title>已通过列表</title>
    <script src="js/table.js"></script>
    <script>
        $(function () {
            $("#message").fadeOut(3000);
            $("#check-sp").addClass("active");
            $("#check-sp a").append("<i class='icon-remove-circle'></i>");
            $("#test3").addClass("acTp");

            $("#parent option[value=" + '${param.parent}' + "]").attr("selected", true);
            <%--$("#children option[value=" + '${param.children}' + "]").attr("selected", true);--%>

            var getSubItems = function (pid, flag) {
                $.ajax({
                    type: "get",
                    url: "getJson?pid=" + pid,
                    success: function (result) {
                        var data = JSON.parse(result);
                        var obj = document.getElementById("children");
                        var cid = $("#children option:selected").val();
                        obj.length = flag;
                        for (var i = 0; i < data.length; i++) {
                            if (data[i].id != cid) {
                                obj.options.add(new Option(data[i].name, data[i].id));
                            }
                        }
                    },
                });
            };
            $("#parent").change(function () {
                var pid = $("#parent option:selected").val();
                getSubItems(pid, 1);
            });
            getSubItems('${param.parent}', 2);

//            $("#parent").change(function () {
//                var pid = $("#parent option:selected").val();
//                $.ajax({
//                    type: "get",
//                    url: "getJson?pid=" + pid,
//                    success: function (result) {
//                        var data = JSON.parse(result);
//                        var obj = document.getElementById("children");
//                        obj.length = 1;
//                        for (var i = 0; i < data.length; i++) {
//                            obj.options.add(new Option(data[i].name, data[i].id));
//                        }
//                    },
//                });
//            });

            //全选和反选
            $("#selectAll").click(function () {
//                alert("result=" + $("input[type='checkbox']").is(':checked'));
                if ($("input[name='selectedIds']").is(':checked') == true) {
                    $("input[name='selectedIds']").removeAttr("checked");
                } else {
                    $("input[name='selectedIds']").attr("checked", "true");
                }
            });
            var boxes = document.getElementsByTagName("input");
            $("#changeAll").click(function () {
                var ids = [];
                for (i = 0; i < boxes.length; i++) {
                    if (boxes[i].name == "selectedIds" && boxes[i].checked == true) {
                        ids.push(boxes[i].value);
                    }
                }
                window.location = "file/spfile-passed!changeAll.action?selectedIds=" + ids;
            });

            $("#deleteAll").click(function () {
                var ids = [];
                for (i = 0; i < boxes.length; i++) {
                    if (boxes[i].name == "selectedIds" && boxes[i].checked == true) {
                        ids.push(boxes[i].value);
                    }
                }
                window.location = "file/spfile-passed!deleteAll.action?selectedIds=" + ids.toString();
            });

        });

        function doupload() {
            window.location = "file/spfile-upload!user.action?categoryId=" + '${param['categoryId']}' + "&sonCategoryId=" + '${param['sonCategoryId']}';
        }

        function deleteThis(id) {
            if (confirm("确定要删除吗?")) {
                window.location = "file/spfile-passed!delete.action?id=" + id;
            }
        }
        function doHot(id, pageNo) {
            window.location = "file/spfile!hotTag.action?id=" + id + "&page.pageNo=" + pageNo;
        }
        function doNew(id, pageNo) {
            window.location = "file/spfile!newTag.action?id=" + id + "&page.pageNo=" + pageNo;
        }

        function searchByName() {
            var title = $("#title").val().trim();
            window.location = "file/spfile!searchByName.action?title=" + title;
        }

        function changeStatus(id) {
            window.location = "file/spfile-passed!change.action?id=" + id;
        }

    </script>
    <style type="text/css">
        #myUl li {
            float: left;
            list-style: none;
            margin-left: 10px;
        }

        #myUl select {
            width: 150px;
        }

    </style>
</head>
<body>
<form id="mainForm" action="file/spfile-passed.action" method="get" class="form-horizontal">
    <fieldset>
        <legend>
            <small>已通过列表</small>
        </legend>
        <%--<div id="messageBox" class="alert alert-error" style="display:none">输入有误，请先更正。</div>--%>

        <ul id="myUl" style="margin-left: -11px;">
            <li><label for="parent">大分类:</label></li>
            <li>
                <select id="parent" name="parent">
                    <option value="">
                        全部
                    </option>
                    <%--<c:if test="${parent !=null}">--%>
                    <%--<option value="${parent}" selected>${parentName}</option>--%>
                    <%--</c:if>--%>
                    <c:if test="${not empty items}">
                        <c:forEach items="${items}" var="son">
                            <c:if test="${son.dtype=='parent'}">
                                <option value="${son.id}">${son.name}</option>
                            </c:if>
                        </c:forEach>
                    </c:if>
                </select>
            </li>
            <li><label for="children">子分类:</label></li>
            <li>
                <select id="children" name="children">
                    <option value="">
                        全部
                    </option>
                    <c:if test="${children !=null}">
                        <option value="${children}" selected>${childrenName}</option>
                    </c:if>
                    <c:if test="${not empty items}">
                        <s:iterator value="items" var="son">
                            <c:if test="${son.dtype=='children'}">
                                <option value="${son.id}">${son.name}</option>
                            </c:if>
                        </s:iterator>
                    </c:if>
                    <%--<c:choose>--%>
                    <%--<c:when test="${children !=null}">--%>
                    <%--<option value="${children}" selected>${childrenName}</option>--%>
                    <%--</c:when>--%>
                    <%--<c:otherwise>--%>
                    <%--<s:iterator value="items" var="son">--%>
                    <%--<c:if test="${son.dtype=='children'}">--%>
                    <%--<option value="${son.id}">${son.name}</option>--%>
                    <%--</c:if>--%>
                    <%--</s:iterator>--%>
                    <%--</c:otherwise>--%>
                    <%--</c:choose>--%>
                </select>
            </li>
            <li><label for="status">状态:</label></li>
            <li>
                <select id="status" name="status">
                    <s:if test="status==0">
                        <option value="${status}" selected>未上架</option>
                    </s:if>
                    <s:if test="status==1">
                        <option value="${status}" selected>已上架</option>
                    </s:if>
                    <option value="0">
                        未上架
                    </option>
                    <option value="1">
                        已上架
                    </option>
                </select>
            </li>
            <li><input style="margin-left: 28px" class="btn btn-primary" id="btn-submit" type="submit" value="查询"></li>
        </ul>
</form>
<div class="pull-right">
    <a class="icon-plus" href="javascript:void(0)" onclick="doupload();">新增</a>
</div>
<table class="table table-hover">
    <thead>
    <tr>
        <th>序号</th>
        <th>头像</th>
        <th>呢城</th>
        <th>视频</th>
        <th>标题</th>
        <td>标签</td>
        <td>分类</td>
        <td>大小</td>
        <th><a href="javascript:sort('createTime','asc')">上传时间</a></th>
        <th><a href="javascript:sort('modifyTime','asc')">上架时间</a></th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
    <s:iterator value="page.result">
        <tr>
            <td><input type="checkbox" id="dn_${id}" name="selectedIds" value="${id}">${id}</td>
            <td><img style="width: 30px;height: 30px;" alt="头像" title="用户头像"
                     src="http://www.uichange.com/public/account/user/icon/00002fc1e01646e497c996c64a91b455-656.png">
            </td>
            <td>测试</td>
            <td><a href="${ctx}/files/${downloadPath}" target="_blank">视频预览</a></td>
            <td><a href="file/spfile!input.action?id=${id}&page.pageNo=${page.pageNo}">${name}</a></td>
            <td>${lable}</td>
            <td>${items[0].name}</td>
            <td>${size}</td>
            <td>${createTime}</td>
            <td>${modifyTime}</td>

            <td><shiro:hasPermission name="file:edit">
                <s:if test="status==0">
                    <a href="javascript:void(0)" onclick="changeStatus(${id})"><i class="icon-circle-blank"></i></a>
                </s:if>
                <s:elseif test="status==1">
                    <a href="javascript:void(0)" onclick="changeStatus(${id})"><i class="icon-circle"></i></a>
                </s:elseif>
                <a href="${ctx}/files/${downloadPath}" download="" target="_blank"><i class="icon-download"></i></a>
                <a href="javascript:void(0)" onclick="deleteThis(${id})"><i class="icon-trash"></i></a>
                <a href="file/spfile!input.action?id=${id}"><i class="icon-edit"></i></a>

            </shiro:hasPermission></td>
        </tr>
    </s:iterator>
    </tbody>
</table>
<hr style="margin-top: -15px">
<div id="tools">
    <p><input type="checkbox" value="全选" id="selectAll"/>全选本页
        &nbsp;
        <%--<input type="checkbox" value="全不选" id="unSelect"/>全不选--%>
        <%--<input type="checkbox" value="反选" id="reverseSelect"/>反选--%>
        <a href="javascript:void(0)" id="changeAll"><i class="icon-circle-blank"></i></a>
        <a href="${ctx}/files/${downloadPath}" download=""><i class="icon-download"></i></a>
        <a href="javascript:void(0)" id="deleteAll"><i class="icon-trash"></i></a></p>
</div>
<%@include file="/common/page.jsp" %>

</form>
</body>
</html>