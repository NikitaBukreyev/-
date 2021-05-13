<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>All the teams</title>
    <style>
        <%@include file="/JSP/CSS/NavBar.css" %>
        <%@include file="/JSP/CSS/OtherStyle.css" %>
    </style>
</head>
<body>

<div class="navbar">
    <div class="left-part">
        Это --> ЛОГО
    </div>
    <div class="right-part">
        <c:choose>
            <c:when test="${isAdmin == true}">
                Сейчас ты Админ
                <a href="admin/">Control panel</a>
            </c:when>
            <c:otherwise>
                Гость<br>
                <form action="" method="post" class="login-form">
                    <input type="text" placeholder="Type login" name="login">
                    <br>
                    <input type="password" placeholder="Type password" name="password">
                    <br>
                    <input type="submit" value="Login" />
                </form>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<table border='1' width='100%' style='text-align: center' class="games">
    <tr>
        <th>Первая команда</th>
        <th>Вторая команда</th>
        <th>Спорт</th>
        <th>Дата</th>
        <th>Счет</th>
    </tr>
    <tr class="search">
        <td>
            <form action='' method='get'>
                <input type='text' name="first-team-name" placeholder="Type team's name" />
                <input type="submit" value="Search" />
            </form>
        </td>
        <td>
            <form action='' method='get'>
                <input type='text' name="second-team-name" placeholder="Type team's name" />
                <input type="submit" value="Search" />
            </form>
        </td>
        <td>
            <form action='' method='get'>
                <input type='text' name="sport-name" placeholder="Type sport" />
                <input type="submit" value="Search" />
            </form>
        </td>
        <td></td>
        <td></td>
    </tr>
    <c:forEach items="${games}" var="game">
        <tr>
            <td>${game.firstTeam.name}</td>
            <td>${game.secondTeam.name}</td>
            <td>${game.sport.name}</td>
            <td><fmt:formatDate type="both" value="${game.date}" /></td>
            <td>${game.score.key}:${game.score.value}</td>
        </tr>

    </c:forEach>
</table>

</body>
</html>