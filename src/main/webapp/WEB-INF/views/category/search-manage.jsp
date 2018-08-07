<%@page import="com.tp.utils.Constants" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <base href="<%=Constants.TOMCAT_SHOW %>"/>
    <meta charset="utf-8">
    <title>热搜列表管理</title>
    <link rel="stylesheet" href="js/jquery/themes/base/jquery.ui.all.css">
    <script src="js/jquery/ui/jquery.ui.core.js"></script>
    <script src="js/jquery/ui/jquery.ui.widget.js"></script>
    <script src="js/jquery/ui/jquery.ui.mouse.js"></script>
    <script src="js/jquery/ui/jquery.ui.draggable.js"></script>
    <script src="js/jquery/ui/jquery.ui.droppable.js"></script>
    <script src="js/jquery/ui/jquery.ui.sortable.js"></script>
    <script src="js/jquery/ui/jquery.ui.accordion.js"></script>

    <style>
        h1 {
            padding: .2em;
            margin: 0;
        }

        #products {
            float: left;
            margin-right: 2em;
        }

        #cart {
            float: left;
        }

        #dict {
            margin-top: 20px;
        }

        #dict li {
            margin-top: 10px;
            margin-right: 20px;
            float: left;
            list-style: none;
            border: solid 1px grey
        }

        sub {
            color: red;
            font-size: 18px;
            font-weight: bold;
        }

        /* style the list to maximize the droppable hitarea */
        #sortable1 li, #sortable2 li {
            margin: 0 5px 0px 15px;
            padding: 0px;
            /*font-size: 1.2em;*/
            width: 150px;
        }

        #sortable2 li a {
            color: #0066CC;
        }

        .ui-widget-content {
            height: 420px;
            width: 260px;
            overflow-y: auto;
        }
    </style>

    <script>

        $(function () {
            $("#message").fadeOut(3000);
            $("#spSearch-tab").addClass("active");
            $("#spSearch-tab a").append("<i class='icon-remove-circle'></i>");
            $("#test2").addClass("acTp");
            $("#sortable1, #sortable2").sortable({
                //revert: true, //缓冲效果
                cursor: 'move', //拖动的时候鼠标样式
                connectWith: ".connectedSortable"
            }).disableSelection();

            $("#manageForm").bind('submit', function () {
                var checked = $("#sortable2").children();
                for (var i = 0; i < checked.length; i++) {
                    $("#cart").append("<input type='hidden' name='checkedFileIds' value=" + checked[i].id + ">");
                }
            });

            $("#topic option[value=" + '${param.id}' + "]").attr("selected", true);

            var getAllDict = function () {
                $("#dict").find("li").remove();
                $.ajax({
                    dataType: "json",
                    url: "category/search!getAllDict.action",
                    data: {},
                    success: function (data) {
                        var li = "";
                        $.each(data, function (i, val) {
                            li += "<li id=" + val.id + ">" + val.name + "<sup style='color: red;font-size: 18px;font-weight:bold;' onclick='deleteDict(" + val.id + ")'>×</sup></li>";
                        });
                        $("#dict").append(li);
                    }
                });
            };

            var getRemainFileData = function () {
                $("#sortable1").find("li").remove();
                $.ajax({
                    dataType: "json",
                    url: "category/search!getRemainFiles.action",
                    data: {},
                    success: function (data) {
                        var li = "";
                        $.each(data, function (i, val) {
                            li += "<li id=" + val.id + ">" + val.name + "</li>";
                        });
                        $("#sortable1").append(li);
                    }
                });
            };

            var getShelfFileData = function () {
                $("#sortable2").find("li").remove();
                $.ajax({
                    dataType: "json",
                    url: "category/search!getOnShelfFiles.action",
                    success: function (data) {
                        var li = "";
                        $.each(data, function (i, val) {
                            li += "<li id=" + val.id + ">" + val.name + "</li>";
                        });
                        $("#sortable2").append(li);
                    }
                });
            };

            $("#edit").bind("click", function () {
                getAllDict();
            });

            $("#save").bind("click", function () {
                $("#sortable2").find("li").remove();
                $("#sortable1").find("li").remove();
                getShelfFileData();
                getRemainFileData();
            });

            $("#add").bind("click", function () {
                var name = $("#name").val();
                $.ajax({
                    url: "category/search!save.action?name=" + name,
                    success: function () {
                        getAllDict();
                    }
                });
            });

            getRemainFileData('${param.id}');
            getShelfFileData('${param.id}');

        });

        function deleteDict(id) {
            if (confirm("确定要删除吗?")) {
//                window.location = "category/search!delete.action?id=" + id;
                $.ajax({
                    dataType: "json",
                    url: "category/search!delete.action?id=" + id,
                    success: function () {
                        $("#dict").find("#" + id).remove();
                    }
                });
            }
        }


    </script>
</head>
<body>
<div style="clear: both">
    <form id="manageForm" action="category/search!saveFile.action" method="post" class="form-horizontal">

    <c:if test="${not empty actionMessages}">
        <div id="message" class="alert alert-success">${actionMessages}</div>
    </c:if>
    <%--<div class="container-fluid">--%>
    <fieldset>
        <legend>
            <small>热搜编辑</small>
        </legend>
        <button id="edit" style="float: right;margin-right: 20px;" class="btn btn-primary btn-lg"
                data-toggle="modal"
                data-target="#myModal">编辑词库
        </button>
        <div id="products">
            <h2>热搜词库</h2>
            <div class="ui-widget-content">
                <ol id="sortable1" class="connectedSortable" style="min-height: 300px;">

                </ol>
            </div>
        </div>

        <div id="cart">
            <h2>已上架热搜</h2>
            <div class="ui-widget-content">
                <ol id="sortable2" class="connectedSortable" style="min-height: 300px;">

                </ol>
            </div>
        </div>
    </fieldset>
        <div class="form-actions">
            <input class="btn btn-primary" type="submit" value="保存" id="btn" />&nbsp;
            <input class="btn" type="button" value="返回" onclick="location.href='category/topic.action';">
        </div>
    </form>
    <!-- 模态框（Modal） -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title" id="myModalLabel">编辑词库</h4>
                </div>
                <div class="modal-body">
                    <%--<form action="category/search!save.action" method="post">--%>
                    <input id="name" type="text" name="name" class="btn btn-default">&nbsp;&nbsp;
                    <input id="add" type="button" class="btn btn-primary" value="添加">
                    <%--</form>--%>
                    <ul id="dict"></ul>
                </div>
                <div class="modal-footer">
                    <button id="save" type="button" class="btn btn-primary" data-dismiss="modal">保存</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
</div>


</body>
</html>
