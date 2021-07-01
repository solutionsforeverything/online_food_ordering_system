<%-- 
    Document   : rating
    Created on : Jun 3, 2021, 10:36:00 PM
    Author     : rosha
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
                <link rel="stylesheet" href="view.css">
    </head>
    <body>
        <%
            String total=request.getParameter("total");
            String res_name=request.getParameter("res_name");
            request.setAttribute("res_name",res_name);
            int amount=0,order=0,rate_table=0;
            float rating=0;
            String new_res="";
            
            try
            {
                new_res=res_name.trim();
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/Foodbite","root","");
                Statement st=conn.createStatement();
                String sql="select * from restaurants where name='"+new_res+"'";
                ResultSet rs=st.executeQuery(sql);
                if(rs.next())
                {
                    amount=Integer.parseInt(rs.getString("earnings"));
                    order=Integer.parseInt(rs.getString("orders"));
                    rating=Float.parseFloat(rs.getString("rating"));
                }
                total=total.trim();
                order+=1;
                if(order>1)
                {
                    try
                    {
                        Statement state=conn.createStatement();
                        String newsql="select * from rating";
                        ResultSet newrs=state.executeQuery(newsql);
                        while(newrs.next())
                        {
                            rate_table+=Integer.parseInt(newrs.getString("rate"));
                        }
                        rating=rate_table;
                    }
                    catch(Exception e)
                    {
                        out.println(e);
                    }
                }
                amount+=Integer.parseInt(total);
                PreparedStatement ps=conn.prepareStatement("update restaurants set earnings='"+amount+"',orders='"+order+"' where name='"+new_res+"'");
                ps.executeUpdate();
            }
            catch(Exception e)
                    {
                       out.println(e);
                    }
            %>
            <div class="box2">
                <h2>Order Success</h2>
                <form class="inputBox" action="thankyou.jsp">
                    <input type="hidden" name="rating" value="<% out.println(rating); %>">
                    <input type="hidden" name="rname" value="<% out.println(new_res); %>">
                    <input type="hidden" name="order" value="<% out.println(String.valueOf(order)); %>">  
                    <input type="number" name="rate" required="" min="1" max="5">
                    <label>Rating</label>
                    <input type="submit" value="Submit">
                </form>
            </div>
    </body>
</html>
