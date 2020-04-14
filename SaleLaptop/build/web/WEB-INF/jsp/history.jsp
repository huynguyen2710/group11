<%-- 
    Document   : thongtinkhachhang
    Created on : Mar 19, 2019, 1:09:07 PM
    Author     : Hieu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="include/css.jsp" />
    </head>
    <body>
        <%
            if (session != null) {
                if (session.getAttribute("customerID2") == null) {
                    response.sendRedirect("login.htm");
                }
            }
        %>
        <div class="header">
            <div class="container">
                <jsp:include page="include/header.jsp" />
                <jsp:include page="include/menu.jsp" />
            </div>
        </div>

        <div class="showcase-grid ">
            <div class="container">
                <div class="col-md-12 showcase " style="padding-left: 0px; padding-right: 0px;">
                    <div class="row">
                        <div class="col-lg-12">
                            <h5 class="title-1 m-b-25" style="font-size: 30px; margin-bottom: 20px; font-weight: bold">Your receipt list</h5>
                            <div class="table-responsive table--no-card m-b-40">
                                <table class="table table-borderless table-striped table-earning" style="font-size: 14px;;">
                                    <thead>
                                        <tr>
                                            <th style="font-size: 14px;;">Receipt ID</th>
                                            <th style="font-size: 14px;;">Transaction day</th>
                                            <th style="font-size: 14px;;">Into money</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="item" items="${listreceipt}" >
                                            <tr>
                                                <td><c:out value="${item.receiptId}" /></td>
                                                <td><c:out value="${item.transactionDay}" /></td>
                                                <td><c:out value="${item.total}" /></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> 

    <jsp:include page="include/footer.jsp" />    
</body>
</html>

