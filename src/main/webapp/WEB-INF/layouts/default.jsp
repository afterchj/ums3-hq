<%@page import="com.tp.utils.Constants"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<%--<c:set var="ctx" value="<%=Constants.STATIC_SHOW %>" />--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=Constants.TOMCAT_SHOW %>" />
<title>UMS3.0:<sitemesh:title/></title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />

<link type="image/x-icon" href="static/images/favicon.ico" rel="shortcut icon">
<link href="static/bootstrap/2.1.1/css/bootstraped.min.css" type="text/css" rel="stylesheet" />
<link href="static/bootstrap/2.1.1/css/bootstraped-responsive.min.css" type="text/css" rel="stylesheet" />
<link href="static/bootstrap/2.1.1/css/datepicker.css" type="text/css" rel="stylesheet" />
<link href="static/styles/default.min.css" type="text/css" rel="stylesheet" />
<!--[if IE 7]>
    <link rel="stylesheet" href="css/font-awesome-ie7.min.css">
<![endif]-->
<script src="static/jquery/1.7.2/jquery.min.js" type="text/javascript"></script>
<sitemesh:head />

</head>

<body>
	<div class="container-fluid">
		<%@ include file="/WEB-INF/layouts/header.jsp"%>
		<div class="row-fluid" style="margin-top: 10px;">
			<%@ include file="/WEB-INF/layouts/left.jsp"%>
			<div id="main" class="span9" >
				<sitemesh:body />
			</div>
		</div>
		<%@ include file="/WEB-INF/layouts/footer.jsp"%>
	</div>
	<script src="static/bootstrap/2.1.1/js/bootstraped.min.js" type="text/javascript"></script>
	<script src="static/bootstrap/2.1.1/js/bootstrap-datepicker.js" type="text/javascript"></script>
</body>
</html>