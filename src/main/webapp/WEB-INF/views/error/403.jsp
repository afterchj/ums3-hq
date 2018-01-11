<%@page import="com.tp.utils.Constants"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ page import="org.apache.shiro.authc.ExcessiveAttemptsException"%>
<%@ page import="org.apache.shiro.authc.IncorrectCredentialsException"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="<%=Constants.STATIC_SHOW %>"/>
<html>
<head>
	<base href="<%=Constants.TOMCAT_SHOW %>" />
	<title>403 - 用户权限不足</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>

<body>
	<div><h1>用户权限不足.</h1></div>
	<div><a href="<c:url value="/"/>">返回首页</a></div>
</body>
</html>
