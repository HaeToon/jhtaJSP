<%@ page import="com.heo96.jsp05.connect.JDBCConnectionPool" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-05-16
  Time: 오후 2:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../include/header.jsp"%>
<%
    String userID=request.getParameter("userID");
    JDBCConnectionPool jdbcConnectionPool=new JDBCConnectionPool();
    String sql = "select * from board where userid=? order by no";
    PreparedStatement pstmt = jdbcConnectionPool.conn.prepareStatement(sql);
    pstmt.setString(1,userID);
    ResultSet rs = pstmt.executeQuery();
%>
<div class="container">
    <h2 class="mt-5 mb-5">LIST</h2>
    <form action="content-view.jsp" method="get" id="member-list-form">
        <table class="table table-striped">
            <thead>
            <tr>
                <th>No</th>
                <th>Subject</th>
                <th>Name</th>
                <th>Hit</th>
                <th>Date</th>
            </tr>
            </thead>
            <tbody>
            <%      while (rs.next()) { %>
            <tr>
                <td><%=rs.getInt("no")%></td>
                <td><a href="content-view.jsp?no=<%=rs.getInt("no")%>"><%=rs.getString("subject")%><a/></td>
                <td><%=rs.getString("username")%></td>
                <td><%=rs.getString("hit")%></td>
                <td><%=rs.getString("regdate")%></td>
            </tr>
            <%  }
                rs.close();
                pstmt.close();
                jdbcConnectionPool.close();
            %>
            </tbody>
        </table>
    </form>
    <div class="mt-5 mb-5"><a href="../board/write.jsp" class="btn btn-primary">글쓰기</a>
    <a href="../board/list.jsp" class="btn btn-outline-primary">목록으로</a></div>
<%@include file="../include/footer.jsp"%>
jdbcConnectionPool.close();

