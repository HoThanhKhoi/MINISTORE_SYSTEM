<%-- 
    Document   : EnterNewPass
    Created on : May 23, 2023, 7:06:16 PM
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
        <h1>Enter new Pass</h1>
        <form action="ChangeNewPasswordServlet" method="post">
            <input name="newPass" type="text"/>
            <input name="changePass" type="submit"/>
        </form>
    </body>
</html>
