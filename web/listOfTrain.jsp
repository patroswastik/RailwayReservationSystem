<%-- 
    Document   : book
    Created on : 22 Nov, 2020, 5:13:52 AM
    Author     : swast
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Of Trains</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <h2>List Of Trains</h2>
        <div class="header">
            <li><a href="passengerBookTicket.html">Book Ticket</a></li>
            <li><a href="passengerViewTicket.jsp">Booked Tickets</a></li>
            <li><a href="passengerCancelTicket.html">Cancel Ticket</a></li>
            <li><a href="passengerHomePage.jsp">Home Page</a></li>
        </div>
        <div class="details">
            <div class="details_header">
                List Of Trains
            </div>
            <table>
                <tr>
                    <th>Tid</th>
                    <th>Departure</th>
                    <th>Arrival</th>
                    <th>Departure Date</th>
                    <th>Arrival Date</th>
                    <th>Departure Time</th>
                    <th>Arrival Time</th>
                    <th>No Of Seats Available</th>
                    <th>Type</th>
                    <th>Price</th>
                </tr>
        <%! String From,To,DepartureDate,Type,noOfSeats,Food,uid; %>
        <%! int price; %>
        <%  From = request.getParameter("departure");
            To = request.getParameter("arrival");
            DepartureDate = request.getParameter("dateOfDeparture");
            Type = request.getParameter("type");
            noOfSeats = request.getParameter("no_of_seats");
            Food = request.getParameter("food");
            if(!From.equals(To)){
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/prototyperrdatabase","root","");
                    PreparedStatement pes = con.prepareStatement("select * from traindetails where departure=? and arrival=? and departure_date=? and no_of_seats > ? and type=?");
                    pes.setString(1, From);
                    pes.setString(2, To);
                    pes.setString(3, DepartureDate);
                    pes.setString(4, noOfSeats);
                    pes.setString(5, Type);
                    ResultSet res = pes.executeQuery();
                    if(res.next()){
                        res.beforeFirst();
                        while(res.next()){
                            price = Integer.parseInt(res.getString("price"))*Integer.parseInt(noOfSeats);
        %>
                            <form action="book.jsp" method="get">
                                <tr>
                                    <td><%=res.getString("tid")%></td>
                                    <input type="hidden" name="tid" value="<%=res.getString("tid")%>"></input>
                                    <td><%=res.getString("departure")%></td>
                                    <input type="hidden" name="departure" value="<%=res.getString("departure")%>"></input>
                                    <td><%=res.getString("arrival")%></td>
                                    <input type="hidden" name="arrival" value="<%=res.getString("arrival")%>"></input>
                                    <td><%=res.getString("departure_date")%></td>
                                    <input type="hidden" name="departure_date" value="<%=res.getString("departure_date")%>"></input>
                                    <td><%=res.getString("arrival_date")%></td>
                                    <input type="hidden" name="arrival_date" value="<%=res.getString("arrival_date")%>"></input>
                                    <td><%=res.getString("departure_time")%></td>
                                    <input type="hidden" name="departure_time" value="<%=res.getString("departure_time")%>"></input>
                                    <td><%=res.getString("arrival_time")%></td>
                                    <input type="hidden" name="arrival_time" value="<%=res.getString("arrival_time")%>"></input>
                                    <td><%=res.getString("no_of_seats")%></td>
                                    <input type="hidden" name="no_of_seats" value="<%=noOfSeats%>"></input>
                                    <td><%=res.getString("type")%></td>
                                    <input type="hidden" name="type" value="<%=res.getString("type")%>"></input>
                                    <td><%=price%></td>
                                    <input type="hidden" name="price" value="<%=price%>"></input>
                                    <td><%=Food%></td>
                                    <input type="hidden" name="food" value="<%=Food%>"></input>
                                    <td><button type="submit">Book Ticket</button></td>
                                </tr>
                            </form>
        <%                }
                    }else{
                        out.println("No Train List Found!!!");
                    }
                }catch(Exception e){
                    out.println(e);
                }
            }else{
                out.println("Exception Occurred because of Same Locations");
            }
        %>
            </table>
        </div>
    </body>
</html>
