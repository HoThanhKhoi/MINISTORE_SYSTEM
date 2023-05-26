<%-- 
    Document   : EnterEmail
    Created on : May 25, 2023, 7:41:12 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action='ResetPassServlet' method="post">
            <input name='email' type='text'/>
            <input type='submit' value='Enter'/>
        </form>
    </body>
</html>
