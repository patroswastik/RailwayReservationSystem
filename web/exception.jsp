<%-- 
    Document   : exception
    Created on : 26 Nov, 2020, 5:27:29 AM
    Author     : swast
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exception Occurred</title>
    </head>
    <body>
        <%! String exception;%>
        <% 
            exception = request.getParameter("exception");
        %>
        <h1>Exception Occurred: </h1>
    </body>
</html>
