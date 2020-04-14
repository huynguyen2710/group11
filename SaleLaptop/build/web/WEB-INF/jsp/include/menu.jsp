<%-- 
    Document   : menu
    Created on : Mar 16, 2019, 8:02:04 PM
    Author     : Hieu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="header-botom">
    <div class="content white">
        <nav class="navbar navbar-default nav-menu" role="navigation">
            <div style="margin-left: 360px;">
                <ul class="nav navbar-nav nav-font" >
                    <li>
                        <a style=" font-size: 20px; font-weight: bold" href="index.htm" class="dropdown-toggle" data-toggle="dropdown">Products</a>
                    </li>
                    <li><a href="contact.htm" style=" font-size: 20px; font-weight: bold">Contact</a></li>
                    <li><a style=" font-size: 20px; font-weight: bold" href="<%
                        out.print("toinfor.htm?customerId="+session.getAttribute("customerID2"));
                %>">Account management</a></li>
                    <div class="clearfix"></div>
                </ul>
                <div class="clearfix"></div>
            </div>
            <!--/.navbar-collapse-->
            <div class="clearfix"></div>
        </nav>
        <!--/.navbar-->   
        <div class="clearfix"></div>
    </div>
    <!--/.content--->
</div>
