<%-- 
    Document   : thongtincustomer
    Created on : Mar 19, 2019, 1:09:07 PM
    Author     : Hieu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                <div class="col-md-6 showcase " style="padding-left: 0px;">
                    <div class="flexslider">
                        <ul class="slides">
                            <div class="thumb-image"> <img src="resources/images/${customer.profilePicture}" data-imagezoom="true" class="img-responsive"> </div>
                        </ul>
                    </div>
                </div>
                <div class="col-md-6 showcase" style="padding-right: 0px;">
                    <div class="pull-left shoe-name" style="width: 100%;">
                        <h3>Account information</h3>
                        <p hidden="true">${customer.customerId}</p>
                        <table class="table table-borderless table-striped table-earning">
                            <tr><th>Customer name</th><td>${customer.name}</td></tr>
                            <tr><th>Phone number</th><td>${customer.phoneNumber}</td></tr>
                            <tr><th>Address</th><td>${customer.address}</td></tr>
                            <tr><th>Email</th><td>${customer.email}</td></tr>
                            <tr><th>Identification number</th><td>${customer.identificationNumber}</td></tr>
                            <tr><th>Date of birth</th><td>${customer.dateOfBirth}</td></tr>
                            <tr><th>User name</th><td>${customer.userName}</td></tr>
                            <tr><th>Password</th><td>${customer.password}</td></tr>
                        </table>
                    </div>
                    <li class="ad-2-crt simpleCart_shelfItem" style="list-style: none;">
                        <a class="btn" href="toupdateinfor.htm?customerId=${customer.customerId}" role="button">Update</a>
                    </li>
                    <li class="ad-2-crt simpleCart_shelfItem" style="list-style: none;">
                        <a class="btn" href="history.htm?customerId=${customer.customerId}" role="button">View transaction history</a>
                    </li>
                </div>
            </div>
        </div>
    </div> 

    <jsp:include page="include/footer.jsp" />    
</body>
</html>

