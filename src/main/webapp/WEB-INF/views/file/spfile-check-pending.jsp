<%@page import="com.tp.utils.Constants" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/common/taglibs.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
    <base href="<%=Constants.TOMCAT_SHOW%>"/>
    <title>待审核列表</title>
    <script src="js/table.js"></script>
    <script>
        $(document).ready(function () {
            $("#message").fadeOut(3000);
            $("#check-tab").addClass("active");
            $("#test3").addClass("acTp");
            $("#check-tab a").append("<i class='icon-remove-circle'></i>");
            var categoryId = '${param['categoryId']}';
            var sonCategoryId = '${param['sonCategoryId']}';
            if (categoryId != null)  {
                $("#parentCategory option[value="+categoryId+"]").attr("selected",true);
            }
            var cc = document.getElementById("childrenCategory");

            var getData = function(categoryId) {
                $
                        .ajax({
                            dataType : "json",
                            url : "file/spfile-check-pending!getChildrenCategory.action?categoryId="
                            + categoryId,
                            success : function(data) {
                                                    for(var i=0;i<data.length;i++) {
                                                        var opn =
                                                                document.createElement("option");
                                                        opn.innerHTML = data[i].name;
                                                        opn.setAttribute("value",data[i].id);
                                                        cc.appendChild(opn);
                                                    }
                                if (sonCategoryId != null)  {
                                    $("#childrenCategory option[value="+sonCategoryId+"]").attr("selected",true);
                                }
                            }
                        });
            };
            getData(categoryId);

            $("#parentCategory").change(function() {
                $("#childrenCategory option:not(:first)").remove();
                getData($(this).children('option:selected').val());
            });

            $("#selectAll").click(function () {
                if($("#selectAll").is(':checked') == true){
                    $("input[name='spfile']").attr("checked", "true");
                }else {
                    $("input[name='spfile']").removeAttr("checked");
                }
            });

            var spfiles = document.getElementsByName("spfile");

            $("#downloadSelected").click(function () {
                var ids = "";
                for (i = 0; i < spfiles.length; i++) {
                    if (spfiles[i].checked&&(i!=spfiles.length-1)) {
                        ids+="#"+spfiles[i].value+",";
                    }else if(spfiles[i].checked&&(i==spfiles.length-1)){
                        ids+="#"+spfiles[i].value;
                    }
                }
                $(""+ids+"").trigger("click");
            });

            $("#passSelected").click(function () {
                var ids = [];
                for (i = 0; i < spfiles.length; i++) {
                    if (spfiles[i].checked) {
                        ids.push(spfiles[i].value);
                    }
                }
                window.location = "file/spfile-check-pending!passTag.action?selectedIds=" + ids;
            });

            $("#rejectSelected").click(function () {
                var ids = [];
                for (i = 0; i < spfiles.length; i++) {
                    if (spfiles[i].checked) {
                        ids.push(spfiles[i].value);
                    }
                }
                window.location = "file/spfile-check-pending!delete.action?selectedIds=" + ids;
            });

            $("#deleteSelected").click(function () {
                var ids = [];
                for (i = 0; i < spfiles.length; i++) {
                    if (spfiles[i].checked) {
                        ids.push(spfiles[i].value);
                    }
                }
                window.location = "file/spfile-check-pending!delete.action?selectedIds=" + ids;
            });
        });

        function singleSelect() {
            var radio = document.getElementsByName("spfile");
            var obj = document.getElementById("selectAll");
            var selectedLength=$("input[name='spfile']:checked").length;
            if (selectedLength==radio.length){
                obj.checked = true;
            }else {
                obj.checked = false;
            }
        }


        function deleteThis(id) {
            if (confirm("确定要删除吗?")) {
                window.location = "file/spfile-check-pending!delete.action?id=" + id;
            }
        }

        function doPass(id, pageNo) {
            window.location = "file/spfile-check-pending!passTag.action?id=" + id + "&page.pageNo=" + pageNo;
        }

        function search(btn) {
            var categoryId = $("#parentCategory").children('option:selected').val();
            var sonCategoryId = $("#childrenCategory").children('option:selected').val();
            window.location = "file/spfile-check-pending.action?categoryId="+categoryId+"&sonCategoryId="+sonCategoryId;
        }

    </script>
    <style type="text/css">
        .list{position:relative;}
        .list span img{ /*CSS for enlarged image*/
            border-width: 0;
            padding: 50px; width:100px;
        }
        .list span{
            position: absolute;
            /*padding: 20px;*/
            /*border: 1px solid gray;*/
            visibility: hidden;
            /*background-color:#FFFFFF;*/
        }
        .list:hover{
            background-color:transparent;
        }
        .list:hover span{
            visibility: visible;
            top:0; left:60px;
        }
    </style>
</head>
<body>
<h1>待审核列表</h1>
<%--<form id="mainForm" action="file/spfile.action" method="post"--%>
      <%--class="form-horizontal">--%>
    <c:if test="${not empty actionMessages}">
        <div id="message" class="alert alert-success">
            <button data-dismiss="alert" class="close">×</button>
                ${actionMessages}</div>
    </c:if>
    <div>
        <div id="" style="margin-bottom: 5px;">
            大分类:
            <s:select list="allParentCategory" listKey="id" listValue="name" name=""
                      id="parentCategory" cssClass="span2" />
            子分类:
            <%--<s:select list="allSunCategory" listKey="id" listValue="name" name=""--%>
            <%--id="category" cssClass="span2" />--%>
            <select id="childrenCategory" >
                <option value="0">全部</option>
            </select>
            <input type="button" id="submit_btn"
                   class="btn" value="查询" onclick="search(this);" />

        </div>
    </div>
    <table class="table table-hover">
        <thead>
        <tr>
            <th>序号</th>
            <th>头像</th>
            <th>昵称</th>
            <th>视频</th>
            <th>标题</th>
            <th>标签</th>
            <th>分类</th>
            <th>大小</th>
            <th><a href="javascript:sort('createTime','asc')">上传时间</a></th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <s:iterator value="page.result">
            <tr>
                <td><input type="checkbox" name="spfile" id="c2" value="${id}" onclick="singleSelect()"/>${id}
                </td>
                <td><img alt="${icon}" src="${icon}" style="height: 30px;width: 50px;"></td>
                <td>${nickname}</td>

                <td><a class="list" href="http://www.uichange.com/ums3-client2/files/${downloadPath}" target="_blank"><img alt="${iconPath}" src="http://www.uichange.com/ums3-client2/files/${iconPath}" style="height: 30px;width: 50px;"><span><img src="http://www.uichange.com/ums3-client2/files/${iconPath}" alt="big" /></span></a></td>

                <td><a href="file/spfile-check-pending.action?id=${id}">${name}</a></td>
                <td>${lable}</td>
                <td>${items[0].name}</td>
                <td>${size}M</td>
                <td>${createTime}</td>
                <td><a href="http://www.uichange.com/ums3-client2/files/${downloadPath}" download=""><i id="${id}" class="icon-download"></i></a>
                    &nbsp;
                    <a href="javascript:void(0)" onclick="doPass('${id}','${page.pageNo}')"><i
                            class="icon-ok-circle allowClass"></i></a>
                    &nbsp;
                    <a href="javascript:void(0)" onclick="deleteThis('${id}')"><i
                    class="icon-remove-sign forbidClass"></i></a>
                    &nbsp;
                    <a href="javascript:void(0)" onclick="deleteThis('${id}')"><i
                            class="icon-trash"></i></a></td>
            </tr>
        </s:iterator>
        </tbody>
    </table>
<hr style="margin-top: -15px">
<div id="tools">
    <p><input type="checkbox" value="全选" id="selectAll"/>全选本页
        &nbsp;

        <a href="javascript:void(0)" id="downloadSelected"><i class="icon-download"></i></a>
        <a href="javascript:void(0)" id="passSelected"><i class="icon-ok-circle allowClass"></i></a>
        <a href="javascript:void(0)" id="rejectSelected"><i class="icon-remove-sign forbidClass"></i></a>
        <a href="javascript:void(0)" id="deleteSelected"><i class="icon-trash"></i></a></p>
</div>
    <%@include file="/common/page.jsp" %>
<%--</form>--%>
</body>
</html>