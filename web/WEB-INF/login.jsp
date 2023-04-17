<%-- 
    Document   : login
    Created on : Apr 14, 2023, 11:46:34 PM
    Author     : burha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <h1>HOME nVentory</h1>
        <h2>Login</h2>
        <form action="login" method="post">
            E-mail Address: <input type="text" name="email" required><br>
            Password: <input type="password" name="password" required><br>
            <input type="submit" value="Log in"><br>
            <a href="login?register">Register</a>
        </form>
        ${message}
    </body>
</html>