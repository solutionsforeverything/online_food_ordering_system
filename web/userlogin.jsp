<%-- 
    Document   : userlogin
    Created on : 30 May, 2021, 9:45:24 AM
    Author     : rosha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Foodbite Login</title>
        <link rel="stylesheet" href="signup.css">
    </head>
    <body>
        <div class="box">
            <h2>Login</h2>
            <form action="<%=request.getContextPath()%>/loginservlet" method="POST">
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
            <p>Doesn't have an account? <a href="usersignup.jsp" >Sign up</a></p>
            <p style="color:red"><%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%></p>
            <p style="color:green"><%=(request.getAttribute("sucMessage") == null) ? "" : request.getAttribute("sucMessage")%></p>
        </div>
    </body>
</html>