<%@page import="com.tp.utils.Constants"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="<%=Constants.STATIC_SHOW %>"/>
<!DOCTYPE HTML>
<html>
	<head>
	<base href="<%=Constants.TOMCAT_SHOW %>" />
	<title>502</title>
	<style>
		p{
			font-size: 30px;
			line-height: 36px;
			margin:60px 10px;
			color:#666;
		}
	</style>
	</head>
	<body>
		<p>
			这个解锁是要收费的哦！您的手机适用的收费渠道正在努力建设中，给您带来不便，敬请谅解！
			<br>
	    	您可以下载其他免费的解锁玩玩看！
		</p>
	</body>
	
</html>