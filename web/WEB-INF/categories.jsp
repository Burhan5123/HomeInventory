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
        <h1>HOME nVentory</h1>
        <h2>Your Categories</h2>
                <h2>Menu</h2>
                <ul>
                    <li><a href="inventory?editProfile">Edit Profile</a></li>
                    <li><a href="inventory?admin">Inventory</a></li>
                    <li><a href="admin?category">Categories</a></li>
                    <li><a href="admin">Admin</a></li>
                    <li><a href="login?logout">Logout</a></li>
                </ul>
            <table>
                <tr>
                    <th>Category ID</th>
                    <th>Category Name</th>
                    <th>Edit</th>
                </tr>
                <c:forEach items="${categories}" var="categories">
                    <tr>
                        <td>${categories.getCategoryId() }</td>
                        <td>${categories.categoryName}</td>
                        <td>
                            <form method="get" action="admin?edit">
                                <input type="submit" value="Edit">
                                <input type="hidden" name="action" value="edit">
                                <input type="hidden" name="catID" value="${categories.getCategoryId()}">
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <c:if test="${editCat.getCategoryId()  != null}">
                <form method="post" action="admin" name="formEdit">
                    <h2>Edit Category</h2>
                    <br>
                    <label>Category ID: </label>
                    <input type="number" name="editCatID" value="${editCat.getCategoryId() }" placeholder="Category ID" disabled="">
                    <br>
                    <label>Category Name: </label>
                    <input type="text" name="editCatName" value="${editCat.categoryName}" placeholder="Category Name">
                    <br>
                    <input type="submit" value="Save">
                    <input type="hidden" name="action" value="saveCat">
                    <a href="admin?category"><input type="button" value="Cancel"></a>
                </form>
            </c:if>
            <br>
            <c:if test="${editCat.getCategoryId()  == null}">
                <form method="get" action="admin?add" name="formAdd">
                    <h2>Add Category</h2>
                    <br>
                    <label>Category Name: </label>
                    <input type="text" name="addCatName" value="" placeholder="Category Name">
                    <br>
                    <input type="submit" value="Add">
                </form>
            </c:if>
    </body>
</html>
