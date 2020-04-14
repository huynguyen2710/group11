<!DOCTYPE html>
<html lang="en">
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Fontfaces CSS-->
        <link href="../resources/css/font-face.css" rel="stylesheet" media="all">
        <link href="../resources/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
        <link href="../resources/vendor/font-awesome-5/css/fontawesome-all.min.css" rel="stylesheet" media="all">
        <link href="../resources/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">

        <!-- Bootstrap CSS-->
        <link href="../resources/vendor/bootstrap-4.1/bootstrap.min.css" rel="stylesheet" media="all">

        <!-- Vendor CSS-->
        <link href="../resources/vendor/animsition/animsition.min.css" rel="stylesheet" media="all">
        <link href="../resources/vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet" media="all">
        <link href="../resources/vendor/wow/animate.css" rel="stylesheet" media="all">
        <link href="../resources/vendor/css-hamburgers/hamburgers.min.css" rel="stylesheet" media="all">
        <link href="../resources/vendor/slick/slick.css" rel="stylesheet" media="all">
        <link href="../resources/vendor/select2/select2.min.css" rel="stylesheet" media="all">
        <link href="../resources/vendor/perfect-scrollbar/perfect-scrollbar.css" rel="stylesheet" media="all">
        <!-- Main CSS-->
        <link href="../resources/css/theme.css" rel="stylesheet" media="all">

    </head>
    <body class="animsition">
        <%
                if (session != null) {
                    if (session.getAttribute("customerId") == null) {
                        response.sendRedirect("login.htm");
                    }
                }
            %>
        <!-- MENU SIDEBAR-->
        <aside class="menu-sidebar d-none d-lg-block">
            <div class="logo">
                <h2>ADMIN</h2>
            </div>
            <div class="menu-sidebar__content js-scrollbar1">
                <nav class="navbar-sidebar">
                    <ul class="list-unstyled navbar__list">
                        <li>
                            <a href="tocustomermanagement.htm">
                                <i class="fas fa-table"></i>Customer management</a>
                        </li>
                        <li>
                            <a href="tosuppliermanagement.htm">
                                <i class="fas fa-table"></i>Supplier management</a>
                        </li>
                        <li>
                            <a href="toproductmanagement.htm">
                                <i class="fas fa-table"></i>Product management</a>
                        </li>
                        <li>
                            <a href="tocheckthebill.htm">
                                <i class="fas fa-table"></i>Check the bill</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </aside>
        <!-- END MENU SIDEBAR-->

        <!-- PAGE CONTAINER-->
        <div class="page-container">
            <!-- HEADER DESKTOP-->
            <header class="header-desktop">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div style="float: right;" class="header-wrap">
                            <div class="header-button">
                                <div class="account-wrap">
                                    <div class="account-item clearfix js-item-menu">
                                        <div class="image">
                                            <img src="../resources/images/admin.png" alt="" />
                                        </div>
                                        <div class="content">
                                            <a class="js-acc-btn" href="#">${customername}</a>
                                        </div>
                                        <div class="account-dropdown js-dropdown">
                                            <div class="account-dropdown__footer">
                                                <a href="login.htm">
                                                    <i class="zmdi zmdi-power"></i>Logout</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            <!-- HEADER DESKTOP-->

            <!-- MAIN CONTENT-->
            <div class="main-content">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="overview-wrap">
                                    <h2 class="title-1">Update supplier</h2>
                                    <a href="tosuppliermanagement.htm"><button class="au-btn au-btn-icon au-btn--blue">
                                            <i class="fas fa-backward"></i>Back</button></a>
                                </div>
                            </div>
                        </div>
                        <hr>
                        <hr>
                        <f:form action="updatesupplier.htm"  modelAttribute="supplier" method="post" class="form-horizontal">
                            <div class="row form-group">
                                <div class="col-12 col-md-10">
                                    <f:input path="supplierId" cssClass="form-control" hidden="true"/>
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-2">
                                    <label for="text-input" class=" form-control-label">Supplier Name</label>
                                </div>
                                <div class="col-12 col-md-10">
                                    <f:input path="supplierName" cssClass="form-control" />
                                    <p style="color: red"><f:errors path="supplierName" /></p>
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-2">
                                    <label for="text-input" class=" form-control-label">Address</label>
                                </div>
                                <div class="col-12 col-md-10">
                                    <f:input path="address" cssClass="form-control" />
                                    <p style="color: red"><f:errors path="address" /></p>
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-2">
                                    <label for="text-input" class=" form-control-label">Phone number</label>
                                </div>
                                <div class="col-12 col-md-10">
                                    <f:input path="phoneNumber" cssClass="form-control" />
                                    <p style="color: red"><f:errors path="phoneNumber" /></p>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-lg btn-info btn-block">
                                <i class="fa fa-save fa-lg"></i>&nbsp;
                                <span id="payment-button-amount">Update</span>
                                <span id="payment-button-sending" style="display:none;">Sending…</span>
                            </button>
                        </f:form>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <!-- Jquery JS-->
    <script src="../resources/vendor/jquery-3.2.1.min.js"></script>
    <!-- Bootstrap JS-->
    <script src="../resources/vendor/bootstrap-4.1/popper.min.js"></script>
    <script src="../resources/vendor/bootstrap-4.1/bootstrap.min.js"></script>
    <!-- Vendor JS       -->
    <script src="../resources/vendor/slick/slick.min.js">
    </script>
    <script src="../resources/vendor/wow/wow.min.js"></script>
    <script src="../resources/vendor/animsition/animsition.min.js"></script>
    <script src="../resources/vendor/bootstrap-progressbar/bootstrap-progressbar.min.js">
    </script>
    <script src="../resources/vendor/counter-up/jquery.waypoints.min.js"></script>
    <script src="../resources/vendor/counter-up/jquery.counterup.min.js">
    </script>
    <script src="../resources/vendor/circle-progress/circle-progress.min.js"></script>
    <script src="../resources/vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
    <script src="../resources/vendor/chartjs/Chart.bundle.min.js"></script>
    <script src="../resources/vendor/select2/select2.min.js">
    </script>

    <!-- Main JS-->
    <script src="../resources/js/main.js"></script>

</body>

</html>
<!-- end document-->

<!-- end document-->
