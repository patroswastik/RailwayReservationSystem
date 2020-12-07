<%-- 
    Document   : logout
    Created on : 25 Nov, 2020, 4:32:53 AM
    Author     : swast
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout</title>
    </head>
    <body>
        <h2>Logout Successful</h2>
        <%! int i; %>
        <%
            Cookie cookie[] = request.getCookies();
            for(i=0;i<cookie.length;i++){
                if(cookie[i].getName().equals("id")){
                    cookie[i].setMaxAge(0);
                    response.addCookie(cookie[i]);
                }
            }
            response.sendRedirect("index.html");
        %>
    </body>
</html>
