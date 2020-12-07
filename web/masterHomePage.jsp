<%-- 
    Document   : masterHomePage
    Created on : 21 Nov, 2020, 10:12:05 PM
    Author     : swast
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Master Home Page</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <h2>Master Home Page</h2>
    <%! String id; %>
    <%! int i; %>
    <%
        Cookie ck[] = request.getCookies();
        for(i=0;i<ck.length;i++){
            if(ck[i].getName().equals("id")) id = ck[i].getValue();
        }
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/prototyperrdatabase","root","");
            PreparedStatement pres = con.prepareStatement("select * from userdetails where uid = ?");
            pres.setString(1, id);
            ResultSet res = pres.executeQuery();
            if(res.next()){
    %>
    <div class="header">
        <li><a href="masterAddTrain.html">Schedule Train</a></li>
        <li><a href="masterViewPassenger.jsp">View Passengers</a></li>
        <li><a href="masterHomePage.jsp">Home Page</a></li>
        <li><a href="logout.jsp">Logout</a></li>
    </div>
    <div class="details">
        <div class="details_header">
            User Details
        </div>
        <div class="details_para">
            <div class="para">
                <div class="innerPara left">Id: </div>
                <div class="innerPara right"><%=res.getString("uid")%></div>
            </div>
            <div class="para">
                <div class="innerPara left">Name: </div>
                <div class="innerPara right"><%=res.getString("name")%></div>
            </div>
            <div class="para">
                <div class="innerPara left">Date Of Birth: </div>
                <div class="innerPara right"><%=res.getDate("dob")%></div>
            </div>
            <div class="para">
                <div class="innerPara left">Gender: </div>
                <div class="innerPara right"><%=res.getString("gender")%></div>
            </div>
            <div class="para">
                <div class="innerPara left">Email Id: </div>
                <div class="innerPara right"><%=res.getString("email")%></div>
            </div>
            <div class="para">
                <div class="innerPara left">Adhaar Card Number: </div>
                <div class="innerPara right"><%=res.getString("adhaar")%></div>
            </div>
        </div>
    </div>
    <%
            }
        }catch(Exception e){
            out.println("Exception = "+e);
        }
    %>
</body>
</html>
