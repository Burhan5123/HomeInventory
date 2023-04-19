
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<html>  
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HOME nVentory</title>
    </head>
    <body>
        <h1>Home nVentory</h1>
        <h2>Login</h2>
        <form method="post" action="login">
            E-mail Address: <input type="email" name="email" required>
            <br>
            Password: <input type="password" name="password" required>
            <br>
            
            <br>
            <input type="submit" value="Login"> <a href="login?register"> Register Now</a>
            <input type="hidden" name="action" value="login">
        </form>
        <p>${message}</p>
    </body>
</html>
