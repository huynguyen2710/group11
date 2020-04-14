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
                                    <h2 class="title-1">Add product</h2>
                                    <a href="toproductmanagement.htm"><button class="au-btn au-btn-icon au-btn--blue">
                                            <i class="fas fa-backward"></i>Back</button></a>
                                </div>
                            </div>
                        </div>
                        <hr>
                        <hr>
                        <f:form action="createproduct.htm"  modelAttribute="product" method="post" class="form-horizontal" enctype="multipart/form-data">
                            <div class="row form-group">
                                <div class="col col-md-2">
                                    <label for="file-input" class=" form-control-label">Add Image</label>
                                </div>
                                <div class="col-12 col-md-10">
                                    <input type="file" name="img2" accept="image/*" >
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-2">
                                    <label for="text-input" style="" class=" form-control-label">Product Id</label>
                                </div>
                                <div class="col-12 col-md-10">
                                    <f:input path="productId" cssClass="form-control" />
                                    <p style="color: red"><f:errors path="productId" /></p>
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-2">
                                    <label for="text-input" class=" form-control-label">Supplier Id</label>
                                </div>
                                <div class="col-12 col-md-10">
                                    <f:select path="suppliers.supplierId" cssClass="form-control">
                                        <f:options items="${supplierlist}" />
                                    </f:select>
                                </div>
                            </div>

                            <div class="row form-group">
                                <div class="col col-md-2">
                                    <label for="text-input" class=" form-control-label">Product name</label>
                                </div>
                                <div class="col-12 col-md-10">
                                    <f:input path="name" cssClass="form-control" />
                                    <p style="color: red"><f:errors path="name" /></p>
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-2">
                                    <label for="text-input" class=" form-control-label">Brand</label>
                                </div>
                                <div class="col-12 col-md-10">
                                    <f:input path="brand" cssClass="form-control" />
                                    <p style="color: red"><f:errors path="brand" /></p>
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-2">
                                    <label for="text-input" class=" form-control-label">Price</label>
                                </div>
                                <div class="col-12 col-md-10">
                                    <f:input path="price" cssClass="form-control" type="number" value="1"/>
                                    <p style="color: red"><f:errors path="price" /></p>
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-2">
                                    <label for="text-input" class=" form-control-label">Model code</label>
                                </div>
                                <div class="col-12 col-md-10">
                                    <f:input path="modelCode" cssClass="form-control" />
                                    <p style="color: red"><f:errors path="modelCode" /></p>
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-2">
                                    <label for="text-input" class=" form-control-label">Size</label>
                                </div>
                                <div class="col-12 col-md-10">
                                    <f:input path="size" cssClass="form-control" />
                                    <p style="color: red"><f:errors path="size" /></p>
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-2">
                                    <label for="text-input" class=" form-control-label">Weight</label>
                                </div>
                                <div class="col-12 col-md-10">
                                    <f:input path="weight" cssClass="form-control" type="number" value="1" />
                                    <p style="color: red"><f:errors path="weight" /></p>
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-2">
                                    <label for="text-input" class=" form-control-label">Color</label>
                                </div>
                                <div class="col-12 col-md-10">
                                    <f:input path="color" cssClass="form-control" />
                                    <p style="color: red"><f:errors path="color" /></p>
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-2">
                                    <label for="text-input" class=" form-control-label">Network communication</label>
                                </div>
                                <div class="col-12 col-md-10">
                                    <f:input path="networkCommunication" cssClass="form-control" />
                                    <p style="color: red"><f:errors path="networkCommunication" /></p>
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-2">
                                    <label for="text-input" class=" form-control-label">Processor</label>
                                </div>
                                <div class="col-12 col-md-10">
                                    <f:input path="processor" cssClass="form-control" />
                                    <p style="color: red"><f:errors path="processor" /></p>
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-2">
                                    <label for="text-input" class=" form-control-label">Processor speed</label>
                                </div>
                                <div class="col-12 col-md-10">
                                    <f:input path="processorSpeed" cssClass="form-control" />
                                    <p style="color: red"><f:errors path="processorSpeed" /></p>
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-2">
                                    <label for="text-input" class=" form-control-label">Operating system</label>
                                </div>
                                <div class="col-12 col-md-10">
                                    <f:input path="operatingSystem" cssClass="form-control" />
                                    <p style="color: red"><f:errors path="operatingSystem" /></p>
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-2">
                                    <label for="text-input" class=" form-control-label">Screen size</label>
                                </div>
                                <div class="col-12 col-md-10">
                                    <f:input path="screenSize" cssClass="form-control" />
                                    <p style="color: red"><f:errors path="screenSize" /></p>
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-2">
                                    <label for="text-input" class=" form-control-label">Resolution</label>
                                </div>
                                <div class="col-12 col-md-10">
                                    <f:input path="resolution" cssClass="form-control" />
                                    <p style="color: red"><f:errors path="resolution" /></p>
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-2">
                                    <label for="text-input" class=" form-control-label">Screen type</label>
                                </div>
                                <div class="col-12 col-md-10">
                                    <f:input path="screenType" cssClass="form-control" />
                                    <p style="color: red"><f:errors path="screenType" /></p>
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-2">
                                    <label for="text-input" class=" form-control-label">VGA</label>
                                </div>
                                <div class="col-12 col-md-10">
                                    <f:input path="vga" cssClass="form-control" />
                                    <p style="color: red"><f:errors path="vga" /></p>
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-2">
                                    <label for="text-input" class=" form-control-label">VGA memory</label>
                                </div>
                                <div class="col-12 col-md-10">
                                    <f:input path="vgaMemory" cssClass="form-control" />
                                    <p style="color: red"><f:errors path="vgaMemory" /></p>
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-2">
                                    <label for="text-input" class=" form-control-label">Hard drive capacity</label>
                                </div>
                                <div class="col-12 col-md-10">
                                    <f:input path="hardDriveCapacity" cssClass="form-control" />
                                    <p style="color: red"><f:errors path="hardDriveCapacity" /></p>
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-2">
                                    <label for="text-input" class=" form-control-label">Disc</label>
                                </div>
                                <div class="col-12 col-md-10">
                                    <f:input path="disc" cssClass="form-control" />
                                    <p style="color: red"><f:errors path="disc" /></p>
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-2">
                                    <label for="text-input" class=" form-control-label">RAM memory</label>
                                </div>
                                <div class="col-12 col-md-10">
                                    <f:input path="ramMemory" cssClass="form-control" />
                                    <p style="color: red"><f:errors path="ramMemory" /></p>
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-2">
                                    <label for="text-input" class=" form-control-label">RAM gen</label>
                                </div>
                                <div class="col-12 col-md-10">
                                    <f:input path="ramGen" cssClass="form-control" />
                                    <p style="color: red"><f:errors path="ramGen" /></p>
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-2">
                                    <label for="text-input" class=" form-control-label">BUS</label>
                                </div>
                                <div class="col-12 col-md-10">
                                    <f:input path="bus" cssClass="form-control" />
                                    <p style="color: red"><f:errors path="bus" /></p>
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-2">
                                    <label for="text-input" class=" form-control-label">Camera</label>
                                </div>
                                <div class="col-12 col-md-10">
                                    <f:input path="camera" cssClass="form-control" />
                                    <p style="color: red"><f:errors path="camera" /></p>
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-2">
                                    <label for="text-input" class=" form-control-label">Port</label>
                                </div>
                                <div class="col-12 col-md-10">
                                    <f:input path="port" cssClass="form-control" />
                                    <p style="color: red"><f:errors path="port" /></p>
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-2">
                                    <label for="text-input" class=" form-control-label">Battery</label>
                                </div>
                                <div class="col-12 col-md-10">
                                    <f:input path="battery" cssClass="form-control" />
                                    <p style="color: red"><f:errors path="battery" /></p>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-lg btn-info btn-block">
                                <i class="fa fa-save fa-lg"></i>&nbsp;
                                <span id="payment-button-amount">Add</span>
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
