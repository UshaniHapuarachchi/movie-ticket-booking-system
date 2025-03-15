<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 1/10/2023
  Time: 8:54 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="../css/admin_login.css">
</head>
<body>
<div class="center">
    <h1>Login</h1>
    <form method="get" action="admin_index.jsp">
        <div class="txt_field">
            <input type="text" name="username" required>
            <span></span>
            <label>Username</label>
        </div>
        <div class="txt_field">
            <input type="password" name="password" required>
            <span></span>
            <label>Password</label>
        </div>

        <input type="submit" value="Login">
        <div class="signup_link">
            ABC Cinema <a href="http://localhost:8080/abc_cinema_new-1.0-SNAPSHOT/Admin/admin_index.jsp">Admin</a>
        </div>
    </form>
</div>

</body>
</html>
