<%-- 
    Document   : index
    Created on : May 25, 2023, 9:51:13 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello ${customer.getName()}</h1>
        <form action="MainController" method="post">
            <button type="submit" name="action" value="logout">Logout</button>
        </form>
        
    </body>
</html>
