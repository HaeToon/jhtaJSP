<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.heo96.jsp04.utils.CookieManager" %><%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-05-10
  Time: 오전 11:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String userID = request.getParameter("userID");
    String userPW = request.getParameter("userPW");
    String saveID = request.getParameter("saveID");
//    System.out.println(savdID);

    Class.forName("oracle.jdbc.OracleDriver");
    Connection conn =DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","heoth","1234");

    String sql = "select * from member where userID = ? and userPW =?";
    PreparedStatement pstmt =conn.prepareStatement(sql);
    pstmt.setString(1,userID);
    pstmt.setString(2,userPW);
    ResultSet rs =pstmt.executeQuery(); //결과 돌려주는것. ResultSet 에서 값을 가져올때는 대소문자 구별x
    if(rs.next()){
        //로그인 된것
        if(saveID!=null && saveID.equals("yes")){
        CookieManager.createCookie(response,"loggedID",userID,60*60);
        } else {
            CookieManager.deleteCookie(response,"loggedID");
        }
       String userId=  rs.getString("userid");
       String userName =  rs.getString("username");
//       String userBirth = rs.getString("userbith");
//       int no = rs.getInt("no");
//        System.out.println(userId +"==="+userName);
//        session.setAttribute("NO",no);
        session.setAttribute("userID",userId);
        session.setAttribute("userName",userName);
//        session.setAttribute("userBirth",userBirth);
        response.sendRedirect("index.jsp");
    }else {
        response.sendRedirect("login.jsp");
    }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
