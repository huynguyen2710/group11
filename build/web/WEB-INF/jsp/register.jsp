<%-- 
    Document   : login
    Created on : Mar 17, 2019, 11:33:06 AM
    Author     : Hieu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="resources/vendor/bootstrap-4.1/bootstrap.min.css" rel="stylesheet" media="all">

        <!-- Vendor CSS-->

        <!-- Main CSS-->
        <link href="resources/css/theme.css" rel="stylesheet" media="all">
    </head>
    <body class="animsition">
        <div class="page-wrapper">
            <div class="container">
                <div class="col-6" style="margin: auto; margin-top: 50px;">
                    <h3 style="text-align: center">Register</h3>
                    <div class="login-form">
                        <f:form action="register.htm" modelAttribute="customer" method="POST">
                            <f:input path="customerId" hidden="true" value="CT"/>
                            <div class="form-group">
                                <label style="font-size: 13px;">Customer name *</label>
                                <f:input cssClass="form-control input-sm " path="name"/>
                                <p style="color: red"><f:errors path="name"/></p>
                            </div>
                            <div class="form-group">
                                <label style="font-size: 13px;">Phone number *</label>
                                <f:input cssClass="form-control input-sm" path="phoneNumber"/>
                                <p style="color: red"><f:errors path="phoneNumber"/></p>
                            </div>
                            <div class="form-group">
                                <label style="font-size: 13px;">Address *</label>
                                <f:input cssClass="form-control input-sm" path="address"/>
                                <p style="color: red"><f:errors path="address"/></p>
                            </div>
                            <div class="form-group">
                                <label style="font-size: 13px;">Identification number *</label>
                                <f:input cssClass="form-control input-sm" path="identificationNumber"/>
                                <p style="color: red"><f:errors path="identificationNumber"/></p>
                            </div>
                            <div class="form-group">
                                <label style="font-size: 13px;">Email *</label>
                                <f:input cssClass="form-control input-sm" type="email" path="email"/>
                                <p style="color: red"><f:errors path="email"/></p>
                            </div>
                            <div class="form-group">
                                <label style="font-size: 13px;">User name *</label>
                                <f:input cssClass="form-control input-sm" path="userName"/>
                                <p style="color: red"><f:errors path="userName"/></p>
                            </div>
                            <div class="form-group">
                                <label style="font-size: 13px;">Password *</label>
                                <f:input cssClass="form-control input-sm" type="password" path="password"/>
                                <p style="color: red"><f:errors path="password"/></p>
                            </div>
                            <button class="au-btn au-btn--block au-btn--green m-b-20" type="submit">Register</button>
                        </f:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="resources/vendor/jquery-3.2.1.min.js"></script>
    <!-- Bootstrap JS-->
    <script src="resources/vendor/bootstrap-4.1/popper.min.js"></script>
    <script src="resources/vendor/bootstrap-4.1/bootstrap.min.js"></script>
    <!-- Vendor JS       -->
    <script src="resources/vendor/slick/slick.min.js">
    </script>
    <script src="resources/vendor/wow/wow.min.js"></script>
    <script src="resources/vendor/animsition/animsition.min.js"></script>
    <script src="resources/vendor/bootstrap-progressbar/bootstrap-progressbar.min.js">
    </script>
    <script src="resources/vendor/counter-up/jquery.waypoints.min.js"></script>
    <script src="resources/vendor/counter-up/jquery.counterup.min.js">
    </script>
    <script src="resources/vendor/circle-progress/circle-progress.min.js"></script>
    <script src="resources/vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
    <script src="resources/vendor/chartjs/Chart.bundle.min.js"></script>
    <script src="resources/vendor/select2/select2.min.js">
    </script>

    <!-- Main JS-->
    <script src="resources/js/main.js"></script>
</body>
</html>