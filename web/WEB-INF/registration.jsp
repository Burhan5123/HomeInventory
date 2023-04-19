
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HOME nVentory</title>
    </head>
    <body>
        <h1>HOME nVentory</h1>
        <h2 name="title">Registration</h2>
        <form method="post" action="register">   
            <input type="email" name="registerEmail" placeholder="Email" value="" required>
            <br>
            <input type="password" name="registerPassword" placeholder="Password" value="" required>
            <br>
            <input type="text" name="registerFirstName" placeholder="First Name" value="" required>
            <br>
            <input type="text" name="registerLastName" placeholder="Last Name" value="" required>
            <br>
            <input type="submit" value="Register">
            <input type="hidden" name="action" value="Submit">
        </form>
        </body>
</html>
