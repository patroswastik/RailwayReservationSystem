<%-- 
    Document   : addTrain
    Created on : 22 Nov, 2020, 3:32:42 AM
    Author     : swast
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Train Added</title>
        <link rel="stylesheet" href="style.css"></link>
    </head>
    <body>
        <h2>Train Detail Added</h2>
        <div class="header">
            <li><a href="masterAddTrain.html">Schedule Train</a></li>
            <li><a href="masterViewPassenger.jsp">Booked Tickets</a></li>
            <li><a href="masterHomePage.jsp">Home Page</a></li>
        </div>
        <%! String From,To,DepartureDate,ArrivalDate,DepartureTime,ArrivalTime,Type,totalNoOfSeats,price; %>
        <%
            From = request.getParameter("departure");
            To = request.getParameter("arrival");
            DepartureDate = request.getParameter("dateOfDeparture");
            ArrivalDate = request.getParameter("dateOfArrival");
            DepartureTime = request.getParameter("timeOfDeparture");
            ArrivalTime = request.getParameter("timeOfArrival");
            Type = request.getParameter("type");
            totalNoOfSeats = request.getParameter("no_of_seats");
            price = request.getParameter("price");
            if(!From.equals(To)){
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/prototyperrdatabase","root","");
                    PreparedStatement pes = con.prepareStatement("INSERT INTO `traindetails` (`tid`, `departure`, `arrival`, `departure_date`, `arrival_date`, `no_of_seats`, `type`, `departure_time`, `arrival_time`,`price`) VALUES (NULL, ?, ?, ?, ?, ?, ?, ?, ?,?);");
                    pes.setString(1, From);
                    pes.setString(2, To);
                    pes.setString(3, DepartureDate);
                    pes.setString(4, ArrivalDate);
                    pes.setString(5, totalNoOfSeats);
                    pes.setString(6, Type);
                    pes.setString(7, DepartureTime);
                    pes.setString(8, ArrivalTime);
                    pes.setString(9, price);
                    int i = pes.executeUpdate();
        %>
        <div class="details">
            <div class="details_header">Successfully inserted the Train value</div>
        </div>
        <%
                }catch(Exception e){
                    out.println(e);
                }
            }else{
        %>
        <div class="details">
            <div class="details_header">Same Locations have been used</div>
        </div>
        <%
            }
            
            
        %>
    </body>
</html>
