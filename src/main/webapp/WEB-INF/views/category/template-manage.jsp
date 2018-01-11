<%@page import="com.tp.utils.Constants"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<base href="<%=Constants.TOMCAT_SHOW %>" />
    <meta charset="utf-8">
    <title>模板文件管理</title>
    <link rel="stylesheet"
          href="js/jquery/themes/base/jquery.ui.all.css">
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
            /* style the list to maximize the droppable hitarea */
        #sortable1 li,#sortable2 li {
            margin: 0 5px 0px 15px;
            padding: 0px;
            /*font-size: 1.2em;*/
            width: 150px;
        }

        #sortable2 li a {
            color: #0066CC;
        }
        .ui-widget-content{
            height: 420px;
            width: 260px;
            overflow-y: auto;
        }
    </style>

    <script>

        $(function() {
            $("#message").fadeOut(3000);
            $("#template-tab").addClass("active");
            $("#template-tab a").append("<i class='icon-remove-circle'></i>");
            $( "#sortable1, #sortable2" ).sortable({
                //revert: true, //缓冲效果
                cursor: 'move', //拖动的时候鼠标样式
                connectWith: ".connectedSortable"
            }).disableSelection();
            
            $("#manageForm").bind('submit', function(){
            	 var checked=$("#sortable2").children();
                 for(var i=0;i<checked.length;i++){
                     $("#cart").append("<input type='hidden' name='checkedFileIds' value="+checked[i].id+">");
                 }
                 $("#cart").append("<input type='hidden' name='selectId' value="+$("#shelf").val()+">");
            })

            $("#template option[value="+'${param.id}'+"]").attr("selected",true);

            var getRemainFileData=function(templateId){
                $.ajax({
                    dataType:"json",
                    url:"category/template!getRemainFile.action",
                    data:{'id':templateId, 'diyID':$("#diy").val(), 'selectName':$("#selectName").val()},
                    success:function(data){
                        var li="";
                        $.each(data,function(i,val){
                            li+="<li id="+val.id+">"+val.name+"</li>";
                        });
                        $("#sortable1").append(li);
                    }
                });
            };
            var getShelfFileData=function(templateId){
                $.ajax({
                    dataType:"json",
                    url:"category/template!getOnShelfFile.action?id="+templateId,
                    success:function(data){
                        var li="";
                        $.each(data,function(i,val){
                            li+="<li id="+val.id+">"+val.name+"</li>";
                        });
                        $("#sortable2").append(li);
                    }
                });
            };

            getRemainFileData('${param.id}');
            getShelfFileData('${param.id}');

            $("#template").change(function(){
                $("#sortable1 li").remove();
                $("#sortable2 li").remove();
                var selectedId=$(this).children('option:selected').val();
                getRemainFileData(selectedId);
                getShelfFileData(selectedId);
                $("#templateId").val(selectedId);
            });
            
            $("#diy").change(function(){
                $("#sortable1 li").remove();
                /* $("#sortable2 li").remove(); */
                getRemainFileData('${param.id}');
            });
            
            $("#selectName").change(function(){
    			$("#sortable1 li").remove();
    			getRemainFileData('${param.id}');
    		});

        });

    </script>
</head>
<body>
<form id="manageForm" action="category/template!saveFile.action" method="post"
      class="form-horizontal">

    <input type="hidden" id="templateId" name="id" value="${id}" />

    <c:if test="${not empty actionMessages}">
        <div id="message" class="alert alert-success">${actionMessages}</div>
    </c:if>
    <fieldset>
        <legend><small>模板文件管理</small></legend>
        <div id="filter" style="margin: 5px;">
            分类名称:
            <s:select id="diy" list="diys" listKey="id" listValue="name" name="" cssClass="span2"/> 
             &nbsp;&nbsp;文件名称:
			<s:textfield name="selectName" id="selectName" cssClass="span2"></s:textfield>
            &nbsp;&nbsp; 模板名称:
            <s:select list="templates" listKey="id" listValue="name" name=""
                      id="template" cssClass="span2"/>
        </div>
        <div id="products">
            <h2>仓库文件</h2>
            <div class="ui-widget-content">
                <ol id="sortable1" class="connectedSortable"
                    style="min-height: 300px;">

                </ol>
            </div>
        </div>

        <div id="cart">
            <h2>已上架文件</h2>
            <div class="ui-widget-content">
                <ol id="sortable2" class="connectedSortable"
                    style="min-height: 300px;">

                </ol>
            </div>
        </div>
    </fieldset>
    <div class="form-actions">
        <input class="btn btn-primary" type="submit" value="保存" id="btn" />&nbsp;
        <input class="btn" type="button" value="返回" onclick="location.href='category/template.action';">
    </div>
</form>
</body>
</html>
