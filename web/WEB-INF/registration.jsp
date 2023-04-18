
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100&display=swap" rel="stylesheet">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HOME nVentory</title>
    </head>
    <body>
        <h1>HOME nVentory</h1>
        <h2 name="title">Registration</h2>
        <form method="post" action="register">   
            Email-Address<input type="email" name="registerEmail" value="" required>
            <br>
           Password <input type="password" name="registerPassword" value="" required>
            <br>
           First Name <input type="text" name="registerFirstName" value="" required>
            <br>
           Last Name<input type="text" name="registerLastName" value="" required>
            <br>
            <input type="submit" value="Register">
            <input type="hidden" name="action" value="Submit">
        </form>
        </body>
</html>
