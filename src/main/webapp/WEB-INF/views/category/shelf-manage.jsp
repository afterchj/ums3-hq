<%@page import="com.tp.utils.Constants"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=Constants.TOMCAT_SHOW %>" />
<meta charset="utf-8">
<title>文件上下架管理</title>
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
	function openwindow(id){
		window.open("file/file-store-info.action?themeId="+id+"&storeId="+$("#store").val(),'newwindow');
	}
	
	$(function() {
		$("#message").fadeOut(3000);
		$("#shelf-tab").addClass("active");
        $("#shelf-tab a").append("<i class='icon-remove-circle'></i>");
		$( "#sortable1, #sortable2" ).sortable({
			//revert: true, //缓冲效果 
	        cursor: 'move', //拖动的时候鼠标样式 
			connectWith: ".connectedSortable"
		}).disableSelection();
		
		$('#manageForm').bind('submit',function(){
			var checked=$("#sortable2").children();
			for(var i=0;i<checked.length;i++){
				$("#cart").append("<input type='hidden' name='checkedFileIds' value="+checked[i].id+">");
			}
			$("#cart").append("<input type='hidden' name='selectId' value="+$("#shelf").val()+">");
		})
		
		$("#store option[value="+${store.id}+"]").attr("selected",true);
		var sid=$("#store").val();
			
		var getData=function(sid){
			$.ajax({
				dataType:"json",
				url:"category/shelf!filterShelf.action?sid="+sid,
				success:function(data){	
					var opt="<option value=0>--请选择--</option>";						
					$.each(data,function(i,val){
						opt+="<option value="+val.id+">"+val.name+"</option>";
					});
					
					$("#shelf").append(opt);
					$("#shelf option[value="+${id}+"]").attr("selected", true);
				}
			});
		};
			
		
		var getRemainFileData=function(sfid){
			$.ajax({
				dataType:"json",
				url:"category/shelf!getRemainFile.action",
				data : {'selectName':$("#selectName").val(), 'dtype':$("#dtype").val(), 'id' : sfid},
				success:function(data){
					var li="";
					$.each(data,function(i,val){
						li+="<li id="+val.id+">"+val.name+"</li>";
					});
					$("#sortable1").append(li);
				}
			});
		};
		var getShelfFileData=function(sfid){
			$.ajax({
				dataType:"json",
				url:"category/shelf!getOnShelfFile.action?id="+sfid,
				success:function(data){
					var li="";
					
					$.each(data,function(i,val){
						li+="<li id="+val.id+">"+val.name+"</li>";
					});
					$("#sortable2").append(li);
				}		
			});
		};
		
		getData(sid);
		
		getRemainFileData(${id});
		getShelfFileData(${id});
		$("#store").change(function(){
			$("#shelf option").remove();
			getData($(this).children('option:selected').val());
			$("#sortable1 li").remove();
			$("#sortable2 li").remove();
		});
		
		$("#shelf").change(function(){
			$("#sortable1 li").remove();
			$("#sortable2 li").remove();
			getRemainFileData($(this).children('option:selected').val());
			getShelfFileData($(this).children('option:selected').val());
		});
		
		$("#dtype").change(function(){
			$("#sortable1 li").remove();
			$("#sortable2 li").remove();
			getRemainFileData($("#shelf").children('option:selected').val());
			getShelfFileData($("#shelf").children('option:selected').val());
		});
		
		$("#selectName").change(function(){
			$("#sortable1 li").remove();
			getRemainFileData($("#shelf").children('option:selected').val());
		});
		
	});
	
	</script>
</head>
<body>
	<form id="manageForm" action="category/shelf!saveFile.action" method="post"
		class="form-horizontal">
		
		<input type="hidden" name="id" value="${id}" />
		<input type="hidden" name="sid" value="${sid}" />
		<c:if test="${not empty actionMessages}">
			<div id="message" class="alert alert-success">${actionMessages}</div>
		</c:if>
		<fieldset>
		<legend><small>文件上下架管理</small></legend>
		<div id="filter" style="margin: 5px;">
			<%-- 商店名称:
			<s:select list="allStores" listKey="id" listValue="name" name=""
				id="store" cssClass="span2"/> --%>
			<input type="hidden" id="store" value="2">
			&nbsp; 文件类型:
			<select id="dtype" name="dtype" class="span2">
				<option value="0">标准解锁</option>
				<option value="1">DIY解锁</option>
			</select>
			&nbsp; 文件名称:
			<s:textfield name="selectName" id="selectName" cssClass="span2"></s:textfield>
			&nbsp; 货架名称:<select id="shelf" class="span2"></select>
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
			<input class="btn" type="button" value="返回" onclick="location.href='category/shelf.action';">
		</div>
	</form>

</body>
</html>
