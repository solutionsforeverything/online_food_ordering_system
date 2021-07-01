<%-- 
    Document   : thankyou
    Created on : Jun 3, 2021, 11:30:29 PM
    Author     : rosha
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link rel="stylesheet" href="restaurants.css">
    </head>
    <body>
        <%
            String res_name=request.getParameter("rname");
            String orating=request.getParameter("rating");
            String crating=request.getParameter("rate");
            String order=request.getParameter("order");
            String new_res="";
            try
            {
                new_res=res_name.trim();
                orating=orating.trim();
                crating=crating.trim();
                order=order.trim();
                float new_rating=(Float.parseFloat(orating)+Float.parseFloat(crating))/Float.parseFloat(order);
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/Foodbite","root","");
                Statement st=conn.createStatement();
                PreparedStatement psr=conn.prepareStatement("insert into rating values('"+new_res+"','"+crating+"')");
                psr.executeUpdate();
               PreparedStatement ps=conn.prepareStatement("update restaurants set rating='"+new_rating+"' where name='"+new_res+"'");
                ps.executeUpdate();
                PreparedStatement pst=conn.prepareStatement("delete from cart");
                pst.executeUpdate();
            }
            catch(Exception e)
                    {
                       out.println(e);
                    }
            %>
            <div class="box2">
                <h2>THANK YOU</h2>
            </div>
                    <div class="three">            
            <form action="index.html">
                <input type="submit" value="Logout">
            </form>
</div>
    </body>
</html>
