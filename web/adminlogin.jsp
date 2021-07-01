<%-- 
    Document   : adminlogin.jsp
    Created on : 30 May, 2021, 9:42:34 AM
    Author     : rosha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Foodbite Admin</title>
        <link rel="stylesheet" href="signup.css">
    </head>
    <body>
        <div class="box">
            <h2>Admin Login</h2>
            <form action="<%=request.getContextPath()%>/adminlogin" method="POST">
                <div class="inputBox">
                    <input type="email" name="email" required="">
                    <label>Email</label>
                </div>
                <div>
                    <div class="inputBox">
                        <input type="password" name="password" required="">
                        <label>Password</label>
                    </div>
                </div>
                <input type="submit" value="Submit">
                    
            </form>
            <p style="color:red"><%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%></p>
        </div>
    </body>
</html>

