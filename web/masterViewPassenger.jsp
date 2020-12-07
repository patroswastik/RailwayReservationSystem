<%-- 
    Document   : masterViewPassenger
    Created on : 25 Nov, 2020, 7:03:11 AM
    Author     : swast
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Passengers</title>
        <link rel="stylesheet" href="style.css"></link>
    </head>
    <body>
        <h2>View Passengers</h2>
        <div class="header">
            <li><a href="masterAddTrain.html">Schedule Train</a></li>
            <li><a href="masterViewPassenger.jsp">View Passengers</a></li>
            <li><a href="masterHomePage.jsp">Home Page</a></li>
        </div>
        <div class="details">
            <div class="details_header">Passengers</div>
            <div class="details_para">
                <table>
            <%
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/prototyperrdatabase","root","");
                    PreparedStatement pres = con.prepareStatement("select * from ticketdetails inner join userdetails on ticketdetails.uid=userdetails.uid order by tid asc");
                    ResultSet res = pres.executeQuery();
                    if(res.next()){
                        res.beforeFirst();
            %>
            <tr>
                <th>TID</th>
                <th>UID</th>
                <th>Name</th>
                <th>Phone Number</th>
                <th>Email</th>
                <th>Departure</th>
                <th>Arrival</th>
                <th>No. Of Tickets</th>
                <th>Departure Date</th>
                <th>Arrival Date</th>
                <th>Departure Time</th>
                <th>Arrival Time</th>
                <th>Type</th>
                <th>Food</th>
                <th>PNR</th>
            </tr>
            <%
                        while(res.next()){
            %>
                <tr>
                    <td><%=res.getString("tid")%></td>
                    <td><%=res.getString("uid")%></td>
                    <td><%=res.getString("name")%></td>
                    <td><%=res.getString("phnumber")%></td>
                    <td><%=res.getString("email")%></td>
                    <td><%=res.getString("departure")%></td>
                    <td><%=res.getString("arrival")%></td>
                    <td><%=res.getString("no_of_tickets")%></td>
                    <td><%=res.getString("departure_date")%></td>
                    <td><%=res.getString("arrival_date")%></td>
                    <td><%=res.getString("departure_time")%></td>
                    <td><%=res.getString("arrival_time")%></td>
                    <td><%=res.getString("type")%></td>
                    <td><%=res.getString("food")%></td>
                    <td><%=res.getString("pnr")%></td>
                </tr>
            <%
                        }
            %>
                </table>
            <%
                    }else{
            %>
                <h2>No Passengers</h2>
            <%
                }
                }catch(Exception e){
                    out.println(e);
                }
            %>
            
            </div>
        </div>
    </body>
</html>
