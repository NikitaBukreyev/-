<%@page import="Config.Config"%>
<div class="navbar">
    <div class="left-part">
        Это --> ЛОГО
    </div>
    <div class="right-part">
        <form action="exit" method="post">
            Привет Админ!!
            <input type="submit" value="Exit">
        </form>
        (<a href="<%=Config.ADMIN%>">Main page</a>|<a href="teams">Team control</a>|<a href="sports">Sport control</a>)
    </div>
</div>
