<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@page import="com.tp.web.vo.Page"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	Page p = (Page) ActionContext.getContext().getValueStack().findValue("page");
	Integer totalPages = p.getTotalPages();
	Integer pageNo = p.getPageNo();
	int pages = p.getTotalSliders();
	Long totalRecords = p.getTotalRecords();
%>

<!--分页开始-->
<div class="page_list page_middle">
	<input type="hidden" value="<%=pageNo%>" id="pageNo" /> 
	<input type="hidden" name="page.orderKey" id="orderKey"	value="${page.orderKey}" /> 
	<input type="hidden" name="page.orderValue" id="orderValue" value="${page.orderValue}" />

	<%
		if (totalPages > 0) {
	%>
	<div class="page_middle">
		<span class="pageinfo"><u></u>共<%=totalPages%>页/<%=totalRecords%>条记录</span>

		<%
			if (pageNo == 1) {
		%>
		<span class='disabled'><u></u>首页</span> <span class='disabled'><u></u>上页</span>
		<%
			} else {
		%>
		<a href="javascript:changePage(1)"><u></u>首页</a> <a
			href="javascript:changePage(<%=pageNo - 1%>)"><u></u>上页</a>
		<%
			}
		%>
		<%
			Integer startPage = pageNo - pages / 2;
				if (startPage < 1) {
					startPage = 1;
				}
				Integer endPage = startPage + pages;
				if (endPage > totalPages) {
					endPage = totalPages;
				}
				for (int i = startPage; i <= endPage; i++) {
					if (i == pageNo) {
		%>
		<span class='current'><u></u><%=i%></span>
		<%
			} else {
		%>
		<a href="javascript:void(0)" onclick="return changePage(<%=i%>)"><u></u><%=i%></a>
		<%
			}
				}
		%>

		<%
			if (pageNo == totalPages) {
		%>
		<span class='disabled'><u></u>下页</span> <span class='disabled'><u></u>末页</span>
		<%
			} else {
		%>
		<a href="javascript:changePage(<%=pageNo + 1%>)" class='pnext'
			onfocus='this.blur()'><u></u>下页</a> <a
			href="javascript:changePage(<%=totalPages%>)"><u></u>末页</a>
		<%
			}
		%>
	</div>
	<%
		}
	%>
</div>
<!-- 分页结束 -->



