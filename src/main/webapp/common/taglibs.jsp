<%@page import="com.tp.utils.Constants"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="<%=Constants.STATIC_SHOW %>"/>
<c:set var="tomcat" value="<%=Constants.TOMCAT_SHOW %>"/>
<%--<c:set var="tomcat" value="${pageContext.request.contextPath}" />--%>
<%--<c:set var="ctx" value="${pageContext.request.contextPath}" />--%>
