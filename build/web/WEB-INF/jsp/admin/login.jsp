
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        <div class="page-wrapper">
            <div class="page-content--bge5">
                <div class="container" style="margin: auto;">
                    <div class="login-wrap">
                        <div class="login-content">
                            <div class="login-logo">
                                <h3>LOGIN</h3>
                            </div>
                            <div class="login-form">
                                <f:form action="login.htm" modelAttribute="customer" method="POST">
                                    <div class="form-group">
                                        <label>Username</label>
                                        <f:input cssClass="au-input au-input--full" path="userName"/>
                                        <p style="color: red"><f:errors path="userName"/></p>
                                    </div>
                                    <div class="form-group">
                                        <label>Password</label>
                                        <f:input cssClass="au-input au-input--full" type="password" path="password"/>
                                        <p style="color: red"><f:errors path="password"/></p>
                                    </div>
                                    <div class="login-checkbox">
                                        <label>
                                            <input type="checkbox" name="remember">Remember password
                                        </label>
                                        <label>
                                            <a href="adforgotpassword.htm">Forgot password</a>
                                        </label>
                                    </div>
                                    <button class="au-btn au-btn--block au-btn--green m-b-20" type="submit">Login</button>
                                </f:form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
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