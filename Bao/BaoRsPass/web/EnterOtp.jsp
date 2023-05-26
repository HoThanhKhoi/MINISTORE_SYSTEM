<%-- 
    Document   : EnterOtp
    Created on : May 22, 2023, 6:23:14 PM
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
        <form method="post" action="ValidateOtp">
            <input name="otp" type="text"/>
            <input type="submit" name="check" vlaue="check"/>
        </form>
    </body>
</html>
