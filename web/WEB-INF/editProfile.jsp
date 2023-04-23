<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Inventory</title>
    </head>
    <body>
        <header>
            <h1>HOME nVentory</h1>
            <h2>Edit Profile</h2>
        </header>
                <h2>Menu</h2>
                <ul>
                    <li><a href="inventory?editProfile">Edit Profile</a></li>
                    <li><a href="inventory?admin">Inventory</a></li>
                    <c:if test="${user.role.roleId == 1}">
                        <li><a href="admin?category">Categories</a></li>
                        <li><a href="admin">Admin</a></li>
                    </c:if>
                    <li><a href="login?logout">Logout</a></li>
                </ul>
            <form method="post" action="inventory">
                <label>Email: </label>
                <input type="email" name="emailEdit" placeholder="Email" value="${editProfile.email}">
                <br>
                <label>Password: </label>
                <input type="password" name="passwordEdit" placeholder="Password" value="${editProfile.password}">
                <br>
                <label>First Name: </label>
                <input type="text" name="firstnameEdit" placeholder="First Name" value="${editProfile.firstName}">
                <br>
                <label>Last Name: </label>
                <input type="text" name="lastnameEdit" placeholder="Last Name" value="${editProfile.lastName}">
                <br>
                <c:choose>
                    <c:when test="${editProfile.active}">
                        <input type="radio" id="active" name="activeStatus" value="active" checked="checked"><label for="active" >Active</label>
                        <input type="radio" id="inactive" name="activeStatus" value="inactive"><label for="inactive">Inactive</label>
                    </c:when>
                    <c:otherwise>
                        <input type="radio" id="active" name="activeStatus" value="active"><label for="active">Active</label>
                        <input type="radio" id="inactive" name="activeStatus" value="inactive" checked="checked"><label for="inactive" >Inactive</label>
                    </c:otherwise>
                </c:choose>
                <br>
                <input type="submit" value="Save">
                <input type="hidden" name="action" value="saveProfile">
                <a href="inventory"><input type="button" value="Cancel"></a>
            </form>
    </body>
</html>
