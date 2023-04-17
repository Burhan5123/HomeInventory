<%-- 
    Document   : registration
    Created on : Apr 14, 2023, 11:58:33 PM
    Author     : burha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
    </head>
    <body>
        <h1>HOME nVentory</h1>
        <h2>Registration</h2>
        <form action="register" method="post">
            Firstname: <input type="text" name="firstname" value="${firstname}"><br>
            Lastname: <input type="text" name="lastname" value="${lastname}"><br>
            E-mail Address: <input type="text" name="email" value="${email}"><br>
            Password: <input type="password" name="password" value="${password}"><br>
            <input type="submit" value="Create Account"> 
        </form>
    </body>
</html>
