<%-- 
    Document   : view
    Created on : Jun 3, 2021, 7:08:56 PM
    Author     : rosha
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Foodbtie View</title>
        <link rel="stylesheet" href="view.css">
    </head>
    <body>
        <%
            int total=0;
            String res_name=request.getParameter("res_name");
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/Foodbite","root","");
                Statement st=conn.createStatement();
                String sql="select * from cart";
                ResultSet rs=st.executeQuery(sql);
                %>
                <div class="box">
                    <%
                        out.println("<h2>Cart</h2>");
                while(rs.next())
                {
                    String food=rs.getString("food");
                    String quantity=rs.getString("quantity");
                    String price=rs.getString("price");
                    total+=Integer.parseInt(price);
                    out.println("<h3>"+food+"|     Q:"+quantity);
                    out.print("|     Rs:"+price+"</h3>");
                }
                out.println("<h3>Total:"+total+"</h3>");
                        %>
                </div>
                <%
            }
            catch(Exception e)
            {
                out.println(e);
            }
try
{
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/Foodbite","root","");
                Statement st=conn.createStatement();
                String sql="select * from coupons";
                ResultSet rs=st.executeQuery(sql);
%>
<div class="box2">
    <%
                        out.println("<h2>Alailable Coupons</h2>");
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
            <div class="box3">
                    <form action="recalc.jsp">
                        <div class="inputBox">
                    <input type="hidden" name="res_name" value="<% out.println(res_name); %>">
                    <input type="text" name="coupon">
                    <label>Coupon Code(Optional)</label>
                        </div>
                    <input type="submit" value="Continue">
            </form>
                <p style="color:red"><%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%></p>
            </div>
                
    </body>
</html>
