/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author rosha
 */
public class addfood extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String res_name=request.getParameter("rname");
            String food_name=request.getParameter("food");
            int price=Integer.parseInt(request.getParameter("price"));
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/Foodbite","root","");
                Statement st=conn.createStatement();
                String sql="select * from restaurants where name='"+res_name+"'";
                ResultSet rs=st.executeQuery(sql);
                if(!rs.next())
                {
                    request.setAttribute("errorMessage3","Restaurant Doesn't Exists");
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("adminoperation.jsp");
                    requestDispatcher.forward(request, response);
                }
                else
                {
                    String sql1="select * from "+res_name+" where food='"+food_name+"'";
                    ResultSet rst=st.executeQuery(sql1);
                    if(rst.next())
                    {
                        request.setAttribute("errorMessage3","Food Already Exists");
                        RequestDispatcher requestDispatcher = request.getRequestDispatcher("adminoperation.jsp");
                        requestDispatcher.forward(request, response);
                        
                    }
                    else
                    {
                        PreparedStatement ps=conn.prepareStatement("insert into "+res_name+" values('"+food_name+"','"+price+"')");
                        ps.executeUpdate();
                        request.setAttribute("successMessage3","Food Added");
                        RequestDispatcher requestDispatcher = request.getRequestDispatcher("adminoperation.jsp");
                        requestDispatcher.forward(request, response);
                    }
                }
            }
            catch(Exception e)
            {
                out.println(e);
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
