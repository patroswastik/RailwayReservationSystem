<%-- 
    Document   : book
    Created on : 22 Nov, 2020, 5:19:44 PM
    Author     : swast
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.Random" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ticket Booked</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <h2>Book Ticket</h2>
        <div class="header">
            <li><a href="passengerBookTicket.html">Book Ticket</a></li>
            <li><a href="passengerViewTicket.jsp">Booked Tickets</a></li>
            <li><a href="passengerCancelTicket.html">Cancel Ticket</a></li>
            <li><a href="passengerHomePage.jsp">Home Page</a></li>
        </div>
        <div class="details">
            <div class="details_header">
                Ticket Booked
            </div>
            <div class="details_para">
        <%! String Uid,Tid,Departure,Arrival,DepartureDate,ArrivalDate,DepartureTime,ArrivalTime,NoOfSeats,Type,Price,Food; %>
        <%! long pnr; %>
        <%! int i; %>
        <%
            Cookie cookie[] = request.getCookies();
            if(cookie!=null){
                for(i=0;i<cookie.length;i++){
                    if(cookie[i].getName().equals("id")) Uid = cookie[i].getValue();
                }
            }
            Tid = request.getParameter("tid");
            Departure = request.getParameter("departure");
            Arrival = request.getParameter("arrival");
            DepartureDate = request.getParameter("departure_date");
            ArrivalDate = request.getParameter("arrival_date");
            DepartureTime = request.getParameter("departure_time");
            ArrivalTime = request.getParameter("arrival_time");
            NoOfSeats = request.getParameter("no_of_seats");
            Type = request.getParameter("type");
            Price = request.getParameter("price");
            Food = request.getParameter("food");
            pnr = 1000000000 + new Random().nextInt(900000000);
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/prototyperrdatabase","root","");
                PreparedStatement pres = con.prepareStatement("INSERT INTO `ticketdetails` (`tid`, `no_of_tickets`, `departure`, `arrival`, `class`, `departure_date`, `arrival_date`, `type`, `food`, `departure_time`, `arrival_time`, `pnr`,`uid`) VALUES (?, ?, ?, ?, 5, ?, ?, ?, ?, ?, ?, ?, ?);");
                PreparedStatement pes = con.prepareStatement("UPDATE `traindetails` SET `no_of_seats` = `no_of_seats`-? WHERE `traindetails`.`tid` = ?;");
                pes.setString(1, NoOfSeats);
                pes.setString(2, Tid);
                pres.setString(1, Tid);
                pres.setString(2, NoOfSeats);
                pres.setString(3, Departure);
                pres.setString(4, Arrival);
                pres.setString(5, DepartureDate);
                pres.setString(6, ArrivalDate);
                pres.setString(7, Type);
                pres.setString(8, Food);
                pres.setString(9, DepartureTime);
                pres.setString(10, ArrivalTime);
                pres.setString(11, String.valueOf(pnr));
                pres.setString(12, Uid);
                int i=pres.executeUpdate();
                int j=pes.executeUpdate();
                if(i != 0){
        %>
        <table>
            <tr>
                <div class="para">
                    <td><div class="innerPara left">Tid</div></td>
                    <td><div class="innerPara right"><%=Tid%></div></td>
                </div>
            </tr>
            <tr>
                <div class="para">
                    <td><div class="innerPara left">Departure</div></td>
                    <td><div class="innerPara right"><%=Departure%></div></td>
                </div>
            </tr>
            <tr>
                <div class="para">
                    <td><div class="innerPara left">Arrival</div></td>
                    <td><div class="innerPara right"><%=Arrival%></div></td>
                </div>
            </tr>
            <tr>
                <div class="para">
                    <td><div class="innerPara left">Departure Date</div></td>
                    <td><div class="innerPara right"><%=DepartureDate%></div></td>
                </div>
            </tr>
            <tr>    
                <div class="para">
                    <td><div class="innerPara left">Arrival Date</div></td>
                    <td><div class="innerPara right"><%=ArrivalDate%></div></td>
                </div>
            <tr>
                <div class="para">
                    <td><div class="innerPara left">Departure Time</div></td>
                    <td><div class="innerPara right"><%=DepartureTime%></div></td>
                </div>
            </tr>
            <tr>
                <div class="para">
                    <td><div class="innerPara left">Arrival Time</div></td>
                    <td><div class="innerPara right"><%=ArrivalTime%></div></td>
                </div>
            </tr>
            <tr>
                <div class="para">
                    <td><div class="innerPara left">Number Of Seats</div></td>
                    <td><div class="innerPara right"><%=NoOfSeats%></div></td>
                </div>
            </tr>
            <tr>
                <div class="para">
                    <td><div class="innerPara left">Type</div></td>
                    <td><div class="innerPara right"><%=Type%></div></td>
                </div>
            </tr>
            <tr>
                <div class="para">
                    <td><div class="innerPara left">Price</div></td>
                    <td><div class="innerPara right"><%=Price%></div></td>
                </div>
            </tr>
            <tr>
                <div class="para">
                    <td><div class="innerPara left">Food</div></td>
                    <td><div class="innerPara right"><%=Food%></div></td>
                </div>
            </tr>
            <tr>
                <div class="para">
                    <td><div class="innerPara left">PNR</div></td>
                    <td><div class="innerPara right"><%=pnr%></div></td>
                </div>
            </tr>
        </table>
        <%            
                }else{
                    out.println("Ticket Not Booked");
                }
            }catch(Exception e){
                out.println("Exception Occurred" + e);
            }
        %>
            </div>
        </div>
    </body>
</html>
