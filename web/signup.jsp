<%-- 
    Document   : signup
    Created on : 25 Nov, 2020, 5:23:40 AM
    Author     : swast
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up</title>
    </head>
    <body>
        <%! String name,dob,gender,phnumber,email,password,adhaar; %>
        <%
            name = request.getParameter("name");
            dob = request.getParameter("dob");
            phnumber = request.getParameter("phnumber");
            gender = request.getParameter("gender");
            adhaar = request.getParameter("adhaar");
            email = request.getParameter("email");
            password = request.getParameter("password");
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/prototyperrdatabase","root","");
                PreparedStatement pes = con.prepareStatement("INSERT INTO `userdetails` (`uid`, `name`, `dob`, `gender`, `phnumber`, `email`, `password`, `adhaar`, `position`) VALUES (NULL, ?, ?, ?, ?, ?, ?, ?, 'passenger');");
                pes.setString(1, name);
                pes.setString(2, dob);
                pes.setString(3, gender);
                pes.setString(4, phnumber);
                pes.setString(5, email);
                pes.setString(6, password);
                pes.setString(7, adhaar);
                pes.executeUpdate();
                response.sendRedirect("index.html");
            }catch(Exception e){
                out.println(e);
            }
        %>
    </body>
</html>
