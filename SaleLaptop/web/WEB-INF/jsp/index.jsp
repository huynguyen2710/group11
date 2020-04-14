<%-- 
    Document   : index
    Created on : Mar 16, 2019, 7:06:11 PM
    Author     : Hieu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="include/css.jsp" />
    </head>
    <body>
        <div class="header">
            <div class="container">
                <jsp:include page="include/header.jsp" />
                <jsp:include page="include/menu.jsp" />
            </div>
        </div>
        <jsp:include page="${page2}.jsp" />
        <jsp:include page="include/footer.jsp" />    
    </body>
</html>
