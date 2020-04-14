<%-- 
    Document   : header
    Created on : Mar 16, 2019, 8:02:10 PM
    Author     : Hieu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="header-top">
    <div class="logo">
        <a href="index.htm">Group11 Shop</a>
    </div>
    <div class="login-bars">
        <a class="btn btn-default log-bar" href="toregister.htm" role="button">Register</a>
        <%
            if (session != null) {
                    if (session.getAttribute("customer2") == null) {
                        out.print("<a class='btn btn-default log-bar' href='tologin.htm' role='button'>Login</a>");
                    }else{
                        out.print("<a class='btn btn-default log-bar' href='logout.htm' role='button'>Logout</a>");
                    }
                }
        %>
        <p style="font-weight: bold">${customer2}</p>
        <div class="cart box_1">
            <a style="color: lawngreen; font-size: 30px;" href="tocart.htm">
                <span><i class="glyphicon glyphicon-shopping-cart"></i>Cart</span>
            </a>
            <div class="clearfix"> </div>
        </div>	
    </div>
    <div class="clearfix"></div>
</div>
