<%@ page import="com.heo96.jsp03.util.CookieManager" %><%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-05-09
  Time: 오후 2:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
//    String popuplive = request.getParameter("popupLive");
//    if(popuplive.equals("on")) {
//        CookieManager.deleteCookie(response, "oneDayCookie");
//    }
    CookieManager.deleteCookie(response, "oneDayCookie");
    response.sendRedirect("popup-main.jsp");
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
