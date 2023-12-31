<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Inventory</title>
    </head>
    <body>
        <h1>Admin</h1>
        <h2>Administrative Mode</h2>
                <h2>USERS</h2>
                <ul>
                    <li><a href="inventory?editProfile">Edit Profile</a></li>
                    <li><a href="inventory?admin">Inventory</a></li>
                    <li><a href="admin?category">Categories</a></li>
                    <li><a href="admin">Admin</a></li>
                    <li><a href="login?logout">Logout</a></li>
                </ul>
        <table>
            <tr>
                <th>Email</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
            <c:forEach items="${users}" var="users">
                <tr>
                    <td>${users.email}</td>
                    <td>${users.firstName}</td>
                    <td>${users.lastName}</td>
                    <td>
                    <form method="post" action="admin">
                            <input type="submit"  value="Edit">
                            <input type="hidden" name="action" value="edit">
                            <input type="hidden" name="usernameEdit" value="${users.email}">
                    </form>
                    </td>
                    <td>
                    <form method="post" action="admin">
                            <input type="submit" value="Delete">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="usernameDel" value="${users.email}">
                    </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <p>${message}</p>
            <c:if test="${editUser.email != null}">
                    <form method="post" action="admin" name="formEdit">
                        <h2>Edit User</h2>
                        <br>
                        <input type="email" name="emailEdit" placeholder="Email" value="${editUser.email}">
                        <br>
                        <input type="password" name="passwordEdit" placeholder="Password" value="${editUser.password}">
                        <br>
                        <input type="text" name="firstnameEdit" placeholder="First Name" value="${editUser.firstName}">
                        <br>
                        <input type="text" name="lastnameEdit" placeholder="Last Name" value="${editUser.lastName}">
                        <br>
                        <c:choose>
                            <c:when test="${editUser.active}">
                                <input type="radio" id="active" name="activeStatus" value="active" checked="checked"><label for="active" >Active</label>
                                <input type="radio" id="inactive" name="activeStatus" value="inactive"><label for="inactive">Inactive</label>
                            </c:when>
                            <c:otherwise>
                                <input type="radio" id="active" name="activeStatus" value="active"><label for="active">Active</label>
                                <input type="radio" id="inactive" name="activeStatus" value="inactive" checked="checked"><label for="inactive" >Inactive</label>
                            </c:otherwise>
                        </c:choose>
                        <br>
                        <label>Role:</label>
                        <select name="rolesSelect">
                            <c:forEach items="${roles}" var="roles">
                                <option value="${roles.roleId}">${roles.roleName}</option>
                            </c:forEach>
                        </select>
                        <br>
                        <input type="submit" value="Save">
                        <input type="hidden" name="action" value="save">
                        <a href="admin"><input type="button" value="Cancel"></a>
                    </form>
            </c:if>

            <br>
            <c:if test="${editUser.email == null}">
                    <form method="post" action="admin" name="formAdd" required>
                        <h2>ADD USER</h2>
                        <br>
                        Email: <input type="text" name="emailAdd" required>
                        <br>
                        Password: <input type="password" name="passwordAdd" required>
                        <br>
                        First Name: <input type="text" name="firstnameAdd" required>
                        <br>
                        Last Name: <input type="text" name="lastnameAdd" required>
                        <br>
                        <input type="radio" id="active" name="activeStatus" value="active"><label for="active">Active</label>
                        <input type="radio" id="inactive" name="activeStatus" value="inactive" checked="checked"><label for="inactive" >Inactive</label>
                        <br>
                        <label>Role:</label>
                        <select name="rolesSelect">
                            <c:forEach items="${roles}" var="roles">
                                <option value="${roles.roleId}">${roles.roleName}</option>
                            </c:forEach>
                        </select>
                        <br>
                        <input type="submit" name="addUser" value="Save">
                        <input type="hidden" name="action" value="add">
                    </form>
            </c:if>
    </body>
</html>