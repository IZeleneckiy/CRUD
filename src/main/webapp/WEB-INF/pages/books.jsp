<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html align="center">
<head>
    <title>Books Page</title>

    <style type="text/css">
        .tg {
            border-collapse: collapse;
            border-spacing: 0;
            border-color: #ccc;
        }

        .tg td {
            font-family: Arial, sans-serif;
            font-size: 14px;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #fff;
        }

        .tg th {
            font-family: Arial, sans-serif;
            font-size: 14px;
            font-weight: normal;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #f0f0f0;
        }

        .tg .tg-4eph {
            background-color: #f9f9f9
        }
    </style>
</head>
<body>
<a href="../../index.jsp">Back to main menu</a>

<br/>
<br/>

<h1>Book List</h1>

<br/>
<form action="searchBook">
    <label>Search books by title:</label>
    <input type="text" name="searchTitle" id="searchTitle" placeholder="">
    <input class="btn btn-xs" type='submit' value='Search'/>
    <a href="<c:url value="/books"/>">back to all books</a>
</form>
<br/>

<c:if test="${!empty listBooks}">
    <table align="center" class="tg">
        <tr>
            <th width="80">id</th>
            <th width="120">title</th>
            <th width="120">description</th>
            <th width="120">author</th>
            <th width="120">isbn</th>
            <th width="120">printYear</th>
            <th width="120">readAlready</th>
            <th width="60">read</th>
            <th width="60">edit</th>
            <th width="60">delete</th>
        </tr>
        <c:forEach items="${listBooks}" var="book">
            <tr>
                <td>${book.id}</td>
                <td>${book.title}</td>
                <td>${book.description}</td>
                <td>${book.author}</td>
                <td>${book.isbn}</td>
                <td>${book.printYear}</td>
                <td>${book.readAlready}</td>
                <td><a href="<c:url value='/read/${book.id}'/>">Read</a></td>
                <td><a href="<c:url value='/edit/${book.id}'/>">Edit</a></td>
                <td><a href="<c:url value='/remove/${book.id}'/>">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
</c:if>

<br/>
<br/>
<div id="pagination">
    <c:url value="/books" var="prev">
        <c:param name="page" value="${page-1}"/>
    </c:url>
    <c:if test="${page > 1}">
    <a href="<c:out value="${prev}" />" class="pn prev">Prev</a>
    </c:if>
    <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
    <c:choose>
    <c:when test="${page == i.index}">
    <span>${i.index}</span>
    </c:when>
    <c:otherwise>
    <c:url value="/books" var="url">
        <c:param name="page" value="${i.index}"/>
    </c:url>
    <a href='<c:out value="${url}" />'>${i.index}</a>
    </c:otherwise>
    </c:choose>
    </c:forEach>
    <c:url value="/books" var="next">
        <c:param name="page" value="${page + 1}"/>
    </c:url>
    <c:if test="${page + 1 <= maxPages}">
    <a href='<c:out value="${next}" />' class="pn next">Next</a>
    </c:if>
    <br/>
    <br/>

<h1><a href="<c:url value="/add"/>">Add a Book</a></h1>

</body>
</html>
