<%-- 
    Document   : passengerHomePage
    Created on : 20 Nov, 2020, 2:17:08 AM
    Author     : swast
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Passenger Home Page</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <h2>Passenger Home Page</h2>
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
        <li><a href="passengerBookTicket.html">Book Ticket</a></li>
        <li><a href="passengerViewTicket.jsp">Booked Tickets</a></li>
        <li><a href="passengerCancelTicket.html">Cancel Ticket</a></li>
        <li><a href="PassengerHomePage.jsp">Home Page</a></li>
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
