<!DOCTYPE html>
<html lang="en">
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Title Page-->

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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Main CSS-->
        <link href="../resources/css/theme.css" rel="stylesheet" media="all">

    </head>
    <aside class="menu-sidebar d-none d-lg-block">
            <div class="logo">
                <h2>ADMIN</h2>
            </div>
            <div class="menu-sidebar__content js-scrollbar1">
                <nav class="navbar-sidebar">
                    <ul class="list-unstyled navbar__list">
                        <li>
                            <a href="tocustomermanagement.htm">
                                <i class="fas fa-table"></i>Customer Management</a>
                        </li>
                        <li>
                            <a href="tosuppliermanagement.htm">
                                <i class="fas fa-table"></i>Supplier Management</a>
                        </li>
                        <li>
                            <a href="toproductmanagement.htm">
                                <i class="fas fa-table"></i>Product Management</a>
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
                                    <h2 class="title-1">Supplier management</h2>
                                    <a href="toaddsupplier.htm"><button class="au-btn au-btn-icon au-btn--blue">
                                        <i class="zmdi zmdi-plus"></i>Add new supplier</button></a>
                                </div>
                            </div>
                        </div>
                        <hr>
                        <hr>
                        <div class="row">
                            <div class="col-lg-12">
                                <h5 class="title-1 m-b-25">list of supplier</h5>
                                <div class="table-responsive table--no-card m-b-40">
                                    <table class="table table-borderless table-striped table-earning" style="font-size: 14px;;">
                                        <thead>
                                            <tr>
                                                <th></th>
                                                <th style="font-size: 14px;;">Supplier ID</th>
                                                <th style="font-size: 14px;;">Supplier name</th>
                                                <th style="font-size: 14px;;">Address</th>
                                                <th style="font-size: 14px;;">Phone number</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="item" items="${listsupplier}" >
                                            <tr>
                                            <td style="padding: 20px;">
                                                <a href="toupdatesupplier.htm?supplierId=${item.supplierId}"><i class="fas fa-pencil-square-o" style="font-size: 30px;; color: gray"></i></a>
                                                <a href="removesupplier.htm?supplierId=${item.supplierId}"><i class="fas fa-remove" style="font-size: 30px; color: gray"></i></a>
                                            </td>
                                            <td><c:out value="${item.supplierId}" /></td>
                                            <td><c:out value="${item.supplierName}" /></td>
                                            <td><c:out value="${item.address}" /></td>
                                            <td><c:out value="${item.phoneNumber}" /></td>
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
