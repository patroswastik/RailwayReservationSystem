<%-- 
    Document   : verify
    Created on : 20 Nov, 2020, 2:06:21 AM
    Author     : swast
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Verify Page</title>
    </head>
    <body>
        <%! String user,pass; %>
        <%
            user = request.getParameter("username");
            pass = request.getParameter("password");
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/prototyperrdatabase","root","");
                PreparedStatement pes = con.prepareStatement("select * from userdetails where email=? and password=?");
                pes.setString(1, user);
                pes.setString(2, pass);
                ResultSet res = pes.executeQuery();
                if(res.next()){
                    Cookie ck = new Cookie("id",res.getString("uid"));
                    ck.setMaxAge(60*60);
                    response.addCookie(ck);
                    if(res.getString("position").equals("passenger")){
                        response.sendRedirect("passengerHomePage.jsp");
                    }else{
                        response.sendRedirect("masterHomePage.jsp");
                    }
                }else{
                    response.sendRedirect("error.jsp");
                }
            }catch(Exception e){
                response.sendRedirect("exception.jsp");
            }
        %>
            
    </body>
</html>
