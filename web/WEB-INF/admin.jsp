<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <h2 name="title">Manage Users</h2>
        <div name="left">
            <div name="menu">
                <h2>Menu</h2>
                <ul>
                    <li><a href="inventory?editProfile">Edit Profile</a></li>
                    <li><a href="inventory?admin">Inventory</a></li>
                    <li><a href="admin?category">Categories</a></li>
                    <li><a href="admin">Admin</a></li>
                    <li><a href="login?logout">Logout</a></li>
                </ul>
            </div>
        </div>   
        <div name="center">
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
        </div>
        <div name="right">
            <c:if test="${editUser.email != null}">
                <div name="edit">
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
                </div>
            </c:if>

            <br>
            <c:if test="${editUser.email == null}">
                <div name="add">
                    <form method="post" action="admin" name="formAdd" required>
                        <h2>Add User</h2>
                        <br>
                        <input type="text" name="emailAdd" placeholder="Email" required>
                        <br>
                        <input type="password" name="passwordAdd" placeholder="Password" required>
                        <br>
                        <input type="text" name="firstnameAdd" placeholder="First Name" required>
                        <br>
                        <input type="text" name="lastnameAdd" placeholder="Last Name" required>
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
                </div>
            </c:if>
        </div>
    </body>
</html>