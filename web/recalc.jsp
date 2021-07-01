<%-- 
    Document   : recalc
    Created on : Jun 3, 2021, 9:46:24 PM
    Author     : rosha
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
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
            String res_name=request.getParameter("res_name");
            String coupon_code=request.getParameter("coupon");
            int total=0;
            if(coupon_code.length()==0)
            {
                coupon_code="NONE";
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/Foodbite","root","");
                Statement st=conn.createStatement();
                String sql="select * from cart";
                ResultSet rs=st.executeQuery(sql);
                %>
                <div class="box">
                    <%
                        while(rs.next())
                        {
                            String price=rs.getString("price");
                            total+=Integer.parseInt(price);
                        }
                                        out.println("<h2>Applied Coupon:"+coupon_code.toUpperCase()+"</h2>");
                out.println("<h2>Deduction:"+"0"+"</h2>");
                out.println("<h2>Total Cost:"+(int)total+"</h2>");
                        %>
                </div>
                <%
                }
                catch(Exception e){
                    out.println(e);
                }
                
            }
            else
            {
                try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/Foodbite","root","");
                Statement st=conn.createStatement();
                String sql="select * from coupons where name='"+coupon_code+"'";
                ResultSet rs=st.executeQuery(sql);
                if(!rs.next())
                {
                    request.setAttribute("res_name",res_name);
                    request.setAttribute("errMessage","Invalid Code");
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("view.jsp");
                    requestDispatcher.forward(request, response);
                }
                else
                {
                    float deduction=Float.parseFloat(rs.getString("deduction"));
                    Statement st1=conn.createStatement();
                    String sql1="select * from cart";
                    ResultSet rst=st1.executeQuery(sql1);
                    %>
                    <div class="box">
                        <%
                while(rst.next())
                {
                    String price=rst.getString("price");
                    total+=Integer.parseInt(price);
                }
                deduction=(int)(total*(deduction/100));
                total=(int)(total-(int)deduction);
                out.println("<h2>Applied Coupon:"+coupon_code.toUpperCase()+"</h2>");
                out.println("<h2>Deduction:"+(int)deduction+"</h2>");
                out.println("<h2>Total Cost:"+(int)total+"</h2>");
                            %>
                    </div>
                    <%
                }
            }
            catch(Exception e)
            {
                out.println(e);
            }
            }
            %>
            <div class="box5">
                    <form action="rating.jsp">
                    <input type="hidden" name="res_name" value="<% out.println(res_name); %>">
                    <input type="hidden" name="total" value="<% out.println(total); %>">
                    <input type="submit" value="Confirm Order">
            </form>
                <p style="color:red"><%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%></p>
            </div>
    </body>
</html>
