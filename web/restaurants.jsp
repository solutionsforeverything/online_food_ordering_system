<%-- 
    Document   : restaurants
    Created on : 2 Jun, 2021, 11:45:10 AM
    Author     : rosha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Foodbite Restaurant</title>
        <link rel="stylesheet" href="restaurants.css">
    </head>
    <body>
        <%
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/Foodbite","root","");
                Statement st=conn.createStatement();
                String sql="select * from restaurants";
                ResultSet rs=st.executeQuery(sql);
                %>
                                    <div class="box">
                <%
                    out.println("<h2>Restaurants</h2>");
                while(rs.next())
                {
                    String name=rs.getString("name");                          
                    out.println("<h3>"+name+"</h3>");      
                }
                %>
                    </div>
                <%
            }
            catch(Exception e)
            {
                out.println(e);
            }
            %>
        <div class="box2">
            <form action="<%=request.getContextPath()%>/selectrest" method="POST">
                <div class="inputBox">
                    <input type="name" name="name" required="">
                    <label>Restaurant Name</label>
                </div>
                <input type="submit" value="Select">
            </form>
            <p style="color:red"><%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%></p>
        </div>
    </body>
</html>
