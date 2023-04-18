<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100&display=swap" rel="stylesheet">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HOME nVentory</title>
    </head>
    <body>
        <header>
            <h1>HOME nVentory</h1>
            <h2 name="title">Inventory for ${user.firstName} ${user.lastName}</h2>
        </header>
        <div name="left">
            <div name="menu">
                <h2>Menu</h2>
                <ul>
                    <li><a href="inventory?editProfile">Edit Profile</a></li>
                    <li><a href="inventory">Inventory</a></li>
                    <c:if test="${user.role.roleId == 1}">
                        <li><a href="admin?category">Categories</a></li>
                        <li><a href="admin">Admin</a></li>
                    </c:if>
                    <li><a href="login?logout">Logout</a></li>
                </ul>
            </div>
            <c:if test="${user.role.roleId == 1}">
                <form method="post" action="inventory" name="formSearch">
                    <input type="text" name="searchItem" value="${searchItem}" placeholder="Search Items">
                    <input type="submit" value="Search">
                    <input type="hidden" name="action" value="search">
                    <a href="inventory?admin"><input type="button" value="Clear"></a>
                </form>
            </c:if>
        </div>
        <div name="center">
            <div name="table">
                <c:if test="${items != null && searchItem != null}">
                    <p>Search Results: <p>
                    <table>

                        <tr>
                            <th>Owner</th>
                            <th>Item Name</th>
                        </tr>
                        <c:forEach items="${items}" var="items">
                            <c:if test="${items.itemName.contains(searchItem)}">
                                <tr>
                                    <td>${items.owner.firstName}</td>
                                    <td>${items.itemName}</td>
                                </tr>
                            </c:if>
                        </c:forEach>
                    </table>
                    <br>
                </c:if>
                <p>All items:</p>
                <table>
                    <tr>
                        <th>Owner</th>
                        <th>Category</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                    <c:forEach items="${items}" var="items">
                        <tr>
                            <td>${items.owner.firstName}</td>
                            <td>${items.category.categoryName}</td>
                            <td>${items.itemName}</td>
                            <td>${items.price}</td>
                            <td>
                                <form method="post" action="inventory">
                                    <input type="submit" value="Edit">
                                    <input type="hidden" name="action" value="edit">
                                    <input type="hidden" name="itemID" value="${items.itemID}">
                                </form>
                            </td>
                            <td>
                                <form method="post" action="inventory">
                                    <input type="submit" name="action" value="Delete">
                                    <input type="hidden" name="itemID" value="${items.itemID}">
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
            <p>${message}</p>
        </div>
        <div name="right">
            <c:if test="${editItem.itemID != null}">
                <form method="post" action="inventory" name="formEdit">
                    <h2>Edit Item</h2>
                    <br>
                    <label>Category: </label>
                    <select name="categoryEdit" value="">
                        <c:forEach items="${categories}" var="categories">
                            <option value="${categories.categoryID}">${categories.categoryName}</options>
                        </c:forEach>
                    </select>
                    <br>
                    <label>Name: </label>
                    <input type="text" name="itemEdit" value="${editItem.itemName}" placeholder="Item Name">
                    <br>
                    <label>Price: </label>
                    <input type="text" name="priceEdit" value="${editItem.price}" placeholder="Price">
                    <br>
                    <input type="submit" value="Save">
                    <input type="hidden" name="action" value="save">
                    <a href="inventory"><input type="button" value="Cancel"></a>
                </form>
            </c:if>

            <c:if test="${editItem == null}">
                <form method="post" action="inventory" name="formAdd">
                    <h2>Add Item</h2>
                    <br>
                    <label>Category: </label> 
                    <select name="categoryAdd">
                        <option value="1">kitchen</option>
                        <option value="2">bathroom</option>
                        <option value="3">living room</option>
                        <option value="4">basement</option>
                        <option value="5">bedroom</option>
                        <option value="6">garage</option>
                        <option value="7">office</option>
                        <option value="8">utility room</option>
                        <option value="9">storage</option>
                        <option value="10">other</option>
                    </select>
                    <br>
                    <label>Name: </label>
                    <input type="text" name="itemAdd" value="" placeholder="Item Name" required>
                    <br>
                    <label>Price: </label>
                    <input type="number" name="priceAdd" value="" placeholder="Price" step=".01" required>
                    <br>
                    <input type="submit" value="Add">
                    <input type="hidden" name="action" value="add">
                </form>
            </c:if>
        </div>
    </body>
</html>
