<%@page import="com.tp.utils.Constants" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/common/taglibs.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
    <base href="<%=Constants.TOMCAT_SHOW%>"/>
    <title>视频列表</title>
    <script src="js/table.js"></script>
    <script>
        $(document).ready(function () {
            $("#message").fadeOut(3000);
            $("#splock-tab").addClass("active");
            $("#test2").addClass("acTp");
            $("#splock-tab a").append("<i class='icon-remove-circle'></i>");
            var categoryId = '${param['categoryId']}';
            var sonCategoryId = '${param['sonCategoryId']}';
            if (categoryId == null) {
                $("#categoryAll").addClass("active");
            } else {
                $("#categoryId" + categoryId).addClass("active");
            }
            if (sonCategoryId == null) {
                $("#sonCategoryAll").addClass("active");
            } else {
                $("#sonCategoryId" + sonCategoryId).addClass("active");
            }

            var source = '${param['source']}';
            if (source != null && source !='')  {
                $("#source option[value="+source+"]").attr("selected",true);
            }

            $("#source").change(function() {
                $("#content tr:not(:first)").remove();
                var source = $(this).children('option:selected').val();
                window.location = "file/spfile.action?source="+source;
            });
        });

        function deleteThis(id) {
            if (confirm("确定要删除吗?")) {
                window.location = "file/spfile!delete.action?id=" + id;
            }
        }

        function doupload() {
            window.location = "file/spfile-upload.action?categoryId=" + '${param['categoryId']}' + "&sonCategoryId=" + '${param['sonCategoryId']}';
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


    </script>
</head>
<body>
<h1>视频列表</h1>
<form id="mainForm" action="file/spfile.action" method="post"
      class="form-horizontal">
    <input type="hidden" name="categoryId"
           value="${param['categoryId']}">
    <input type="hidden" name="sonCategoryId"
           value="${param['sonCategoryId']}">
    <c:if test="${not empty actionMessages}">
        <div id="message" class="alert alert-success">
            <button data-dismiss="alert" class="close">×</button>
                ${actionMessages}</div>
    </c:if>
    <div id="filter" style="display: inline; margin-left: 20px;">
        <input id="title" name="title" type="text" style="width:200px" size="20" placeholder="标题"/>&nbsp;
        <input id="search" type="button" value="搜索" name="search" onclick="searchByName();"/>
        &nbsp;&nbsp;&nbsp;&nbsp;来源:
        <select id="source" name="source">
            <option value="0">全部</option>
            <option value="1">用户投稿</option>
            <option value="2">官方上传</option>
        </select>
        <div class="pull-right">
            <a class="icon-plus" href="javascript:void(0)" onclick="doupload();">新增</a>
        </div>
    </div>
    <div>
        <ul class="nav nav-pills" style="margin-bottom: 2px;">
            <li id="category"><a href="javascript:void(0)">大分类:</a>
            <li id="categoryAll"><a href="file/spfile.action?source=${source}&categoryId=">全部</a>
            </li>
            <s:iterator value="parentTypes" var="parent">
                <li id="categoryId${parent.id}"><a
                        href="file/spfile.action?categoryId=${parent.id}&source=${source}">${parent.name}</a>
                </li>
            </s:iterator>
        </ul>
    </div>
    <div>
        <ul class="nav nav-pills" style="margin-bottom: 2px;">
            <li id="category"><a href="javascript:void(0)">小分类:</a>
            <li id="sonCategoryAll"><a
                    href="file/spfile.action?source=${source}&categoryId=${categoryId}&sonCategoryId=">全部</a>
            </li>
            <c:if test="${not empty subTypes}">
                <s:iterator value="subTypes" var="son">
                    <li id="sonCategoryId${son.id}"><a
                            href="file/spfile.action?categoryId=${categoryId}&sonCategoryId=${son.id}&source=${source}">${son.name}</a>
                    </li>
                </s:iterator>
            </c:if>
        </ul>
    </div>
    <table id="content" class="table table-hover">
        <thead>
        <tr>
            <th>视频编号</th>
            <th>视频名称</th>
            <th><a href="javascript:sort('createTime','asc')">添加时间</a></th>
            <th><a href="javascript:sort('modifyTime','asc')">更新时间</a></th>
            <th>视频预览</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <s:iterator value="page.result">
            <tr>
                <td><s:if test="isHot==1">
                    <i class="icon-thumbs-up" style="color: #ff6600;"></i>
                </s:if> <s:if test="isNew==1">
                    <i class="icon-time" style="color: #ff6600"></i>
                </s:if>
                        ${id}
                </td>
                <td><a href="file/spfile!input.action?id=${id}&page.pageNo=${page.pageNo}">${name}</a></td>
                <td>${createTime}</td>
                <td>${modifyTime}</td>
                <td><a href="${ctx}/files/${downloadPath}" target="_blank">视频预览</a></td>
                <td><shiro:hasPermission name="file:edit">
                    <s:if test="isNew==1">
                        <a href="javascript:void(0)"
                           onclick="doNew('${id}','${page.pageNo}')"><i
                                class="icon-star"></i></a>
                    </s:if>
                    <s:else>
                        <a href="javascript:void(0)"
                           onclick="doNew('${id}','${page.pageNo}')"><i
                                class="icon-star-empty"></i></a>
                    </s:else>
                    &nbsp;
                    <s:if test="isHot==1">
                        <a href="javascript:void(0)"
                           onclick="doHot('${id}','${page.pageNo}')"><i
                                class="icon-heart"></i></a>
                    </s:if>
                    <s:else>
                        <a href="javascript:void(0)"
                           onclick="doHot('${id}','${page.pageNo}')"><i
                                class="icon-heart-empty"></i></a>
                    </s:else>
                    &nbsp;
                    <a href="javascript:void(0)" onclick="deleteThis('${id}')"><i class="icon-trash"></i></a> &nbsp;
                    <a href="file/spfile!refresh.action?id=${id}"><i class="icon-refresh"></i></a>
                </shiro:hasPermission></td>
            </tr>
        </s:iterator>
        </tbody>
    </table>
    <%@include file="/common/page.jsp" %>

</form>
</body>
</html>