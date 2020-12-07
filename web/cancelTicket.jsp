<%-- 
    Document   : cancel
    Created on : 23 Nov, 2020, 1:21:19 AM
    Author     : swast
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cancel Ticket</title>
        <link rel="stylesheet" href="style.css"></link>
    </head>
    <body>
        <h2>Cancel Ticket</h2>
        <div class="header">
            <li><a href="passengerBookTicket.html">Book Ticket</a></li>
            <li><a href="passengerViewTicket.jsp">Booked Tickets</a></li>
            <li><a href="passengerCancelTicket.jsp">Cancel Ticket</a></li>
            <li><a href="passengerHomePage.jsp">Home Page</a></li>
        </div>
        <div class="details">
            <div class="details_header">
                <h3>Ticket Canceled</h3>
            </div>
        </div>
        <%! String pnr,tid; %>
        <%! int noOfSeats; %>
        <%
            pnr = request.getParameter("pnr");
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/prototyperrdatabase","root","");
                PreparedStatement pres = con.prepareStatement("SELECT * FROM `ticketdetails` WHERE `pnr` = ?");
                pres.setString(1, pnr);
                ResultSet res = pres.executeQuery();
                if(res.next()){
                    noOfSeats = Integer.parseInt(res.getString("no_of_tickets"));
                    tid = res.getString("tid");
                    PreparedStatement pes = con.prepareStatement("delete from ticketdetails where pnr=?");
                    pes.setString(1, pnr);
                    int i=pes.executeUpdate();
                }
                PreparedStatement p = con.prepareStatement("UPDATE `traindetails` SET `no_of_seats` = `no_of_seats` + ? WHERE `traindetails`.`tid` = ?;");
                p.setString(1, String.valueOf(noOfSeats));
                p.setString(2, tid);
                p.executeUpdate();
            }catch(Exception e){
                out.println(e);
            }
        %>
    </body>
</html>
