<%--
  Created by IntelliJ IDEA.
  User: hongjian.chen
  Date: 2018/3/29
  Time: 14:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>测试多选</title>

    <script type="text/javascript">
        $(function () {
            $("#home-test").addClass("active");
            $("#home-test a").append("<i class='icon-remove-circle'></i>");
        });
    </script>
</head>
<body>
<h1>测试功能</h1><br>
<hr>
<form action="test/test!input.action" method="get">
    <p>爱好：
    <ul style="list-style-type: none">
        <li><input type="checkbox" name="hobby" value="1">游泳</li>
        <li><input type="checkbox" name="hobby" value="2">打球</li>
        <li><input type="checkbox" name="hobby" value="3">唱歌</li>
    </ul>
    </p>
    <p>地址：
        <select name="address">
            <option value="4">江西</option>
            <option value="5">江苏</option>
            <option value="6">广东</option>
        </select>
        -
        <select name="address">
            <option value="7">南昌</option>
            <option value="8">苏州</option>
            <option value="9">深圳</option>
        </select>
    </p>
    <input type="submit" value="提交">
</form>
</body>
</html>
