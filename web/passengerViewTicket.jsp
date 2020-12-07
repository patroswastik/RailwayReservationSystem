<%-- 
    Document   : passengerViewTicket
    Created on : 24 Nov, 2020, 4:12:08 AM
    Author     : swast
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Booked Tickets</title>
        <link rel="stylesheet" href="style.css"></link>
    </head>
    <body>
        <h2>Ticket</h2>
        <div class="header">
            <li><a href="passengerBookTicket.html">Book Ticket</a></li>
            <li><a href="passengerViewTicket.jsp">Booked Tickets</a></li>
            <li><a href="passengerCancelTicket.html">Cancel Ticket</a></li>
            <li><a href="passengerHomePage.jsp">Home Page</a></li>
        </div>
        <div class="details">
            <div class="details_header">
                Ticket Details
            </div>
            <%! String id; %>
            <%! String pnr,Tid,Departure,Arrival,DepartureDate,ArrivalDate,DepartureTime,ArrivalTime,NoOfSeats,Type,Price,Food; %>
            <%! int i; %>
            <%
                Cookie ck[] = request.getCookies();
                for(i=0;i<ck.length;i++) if(ck[i].getName().equals("id")) id = ck[i].getValue();
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/prototyperrdatabase","root","");
                    PreparedStatement pres = con.prepareStatement("select * from ticketdetails where uid=?");
                    pres.setString(1, id);
                    ResultSet res = pres.executeQuery();
                    if(res.next()){
            %>
                        <table>
                            <tr>
                                <div class="para">
                                    <td><div class="innerPara left">Tid</div></td>
                                    <td><div class="innerPara left">Departure</div></td>
                                    <td><div class="innerPara left">Arrival</div></td>
                                    <td><div class="innerPara left">Departure Date</div></td>
                                    <td><div class="innerPara left">Arrival Date</div></td>
                                    <td><div class="innerPara left">Departure Time</div></td>
                                    <td><div class="innerPara left">Arrival Time</div></td>
                                    <td><div class="innerPara left">Number Of Seats</div></td>
                                    <td><div class="innerPara left">Type</div></td>
                                    <td><div class="innerPara left">Food</div></td>
                                    <td><div class="innerPara left">PNR</div></td>
                                </div>
                            </tr>
            <%
                        res.beforeFirst();
                        while(res.next()){
                            pnr = res.getString("pnr");
                            Tid = res.getString("tid");
                            Departure = res.getString("departure");
                            Arrival = res.getString("arrival");
                            DepartureDate = res.getString("departure_date");
                            ArrivalDate = res.getString("arrival_date");
                            DepartureTime = res.getString("departure_time");
                            ArrivalTime = res.getString("arrival_time");
                            Type = res.getString("type");
                            NoOfSeats = res.getString("no_of_tickets");
                            Food = res.getString("food");
            %>
                            <tr>
                                <form action="showTicket.jsp" method="post">
                                    <div class="para">
                                        <td><div class="innerPara right"><%=Tid%></div></td>
                                        <td><div class="innerPara right"><%=Departure%></div></td>
                                        <td><div class="innerPara right"><%=Arrival%></div></td>
                                        <td><div class="innerPara right"><%=DepartureDate%></div></td>
                                        <td><div class="innerPara right"><%=ArrivalDate%></div></td>
                                        <td><div class="innerPara right"><%=DepartureTime%></div></td>
                                        <td><div class="innerPara right"><%=ArrivalTime%></div></td>
                                        <td><div class="innerPara right"><%=NoOfSeats%></div></td>
                                        <td><div class="innerPara right"><%=Type%></div></td>
                                        <td><div class="innerPara right"><%=Food%></div></td>
                                        <td><div class="innerPara right"><%=pnr%></div></td>
                                        <input type="hidden" name="pnr" value=<%=pnr%>>
                                        <td><button type="submit">View Ticket</button></td>
                                    </div>
                                    
                                </form>
                            </tr>
            <%
                        }
                    %></table><%
                    }else{
                        out.println("<h2>No Tickets Booked Yet</h2>");
                    }
                }catch(Exception e){
                    
                }
            %>
        </div>
    </body>
</html>
