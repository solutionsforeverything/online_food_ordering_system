<%-- 
    Document   : foods
    Created on : Jun 2, 2021, 2:06:20 PM
    Author     : rosha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Foodbite Foods</title>
        <link rel="stylesheet" href="restaurants.css">
    </head>
    <body>
<%
    String res_name=request.getAttribute("res_name").toString();
    String res_rating=request.getAttribute("res_rating").toString();
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/Foodbite","root","");
                Statement st=conn.createStatement();
                String sql="select * from "+res_name+"";
                ResultSet rs=st.executeQuery(sql);                
                %>            
                <div class="box">
                <%
                 out.println("<h2>"+res_name+"</h2>"+"<h2>Rating:"+res_rating);
                while(rs.next())
                {
                    String food=rs.getString("food");
                    String price=rs.getString("price");
                    out.println("<h3>"+food);
                    out.print("|     Rs:"+price+"</h3>");
                }
                %>
            <p style="color:red"><%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%></p>
            <p style="color:green"><%=(request.getAttribute("sucMessage") == null) ? "" : request.getAttribute("sucMessage")%></p>

                    </div>
                <%
            }
            catch(Exception e)
            {
                out.println(e);
            }
%>
        <div class="box2">
            <form action="<%=request.getContextPath()%>/selectfood" method="POST">
                <input type="hidden" name="res_name" value="<% out.println(res_name); %>">  
                <input type="hidden" name="res_rating" value="<% out.println(res_rating); %>"> 
                <div class="inputBox">
                    <input type="name" name="name" required="">
                    <label>Food Name</label>
                </div>
                <div class="inputBox">
                    <input type="number" name="quantity" required="" min="1">
                    <label>Quantity</label>
                </div>
                <input type="submit" value="Add To Cart">
            </form>
                <div class="two">
                                <form action="<%=request.getContextPath()%>/reset" method="POST">
                <input type="hidden" name="res_name" value="<% out.println(res_name); %>">  
                <input type="hidden" name="res_rating" value="<% out.println(res_rating); %>"> 
                 <input type="submit" value="Reset Cart">
            </form>
                </div>
                 <div class="four">
                    <form action="<%=request.getContextPath()%>/confirm " method="POST"> 
                    <input type="hidden" name="res_name" value="<% out.println(res_name); %>">  
                     <input type="hidden" name="res_rating" value="<% out.println(res_rating); %>"> 
                    <input type="submit" value="Buy">
            </form>
                 </div>
        </div>
        <div class="three">            
            <form action="index.html">
                <input type="submit" value="Logout">
            </form>
</div>
    </body>
</html>
