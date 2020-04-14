<%-- 
    Document   : giohang
    Created on : Mar 21, 2019, 2:15:15 PM
    Author     : Hieu
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="check">
    <div class="container">
        <form action="toreceipt.htm">
            <div class="col-md-12 cart-items">
                <h1>Cart</h1>
                <h3 style="margin-bottom: 50px; text-align: center">${notification}</h3>
                <c:forEach var="item" items="${listcart}">
                    <div class="cart-header">
                        <div class="close1"><a href="removecart.htm?productId=${item.productId}"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></a></div>
                        <div class="cart-sec simpleCart_shelfItem">
                            <div class="cart-item cyc">
                                <img src="resources/images/${item.image}" class="img-responsive" alt=""/>
                            </div>
                            <div class="cart-item-info" style="margin-top: -5px;">
                                <ul class="qty">
                                    <li style="font-size: 20px;"><span>Product name: &nbsp</span><span style="font-weight: bold"> ${item.name}</span></li>
                                    <br>
                                    <li style="font-size: 20px;"><span>Price per product :&nbsp</span><input type="number" value="${item.price}" style="border: none; background-color: white" disabled="true" id="price"></input></li>
                                    <br>
                                    <li style="font-size: 20px;"><span>Quantity :&nbsp&nbsp</span><input type="number" value="${item.quantity}" style="border: none; background-color: white" id="quantity" disabled="true"></input></li>
                                    <br>
                                </ul>
                                <div class="delivery" style="margin-top: 5px; color: red">
                                    <p style="font-size: 20px;">Total price :&nbsp</p><p style="font-size: 20px; color: black" id="total">${item.total}</p>
                                    <div class="clearfix"></div>
                                </div>	
                            </div>
                            <div class="clearfix"></div>

                        </div>
                    </div>
                </c:forEach>
                <script>$(document).ready(function (c) {
                        $('.close2').on('click', function (c) {
                            $('.cart-header2').fadeOut('slow', function (c) {
                                $('.cart-header2').remove();
                            });
                        });
                    });
                </script>
            </div>
            <div class="col-md-3"></div>
            <div class="col-md-6"><button class="btn item_add" role="button" style="width: 100%;height: 50px; font-weight: bold; font-size: 20px;
                                          background-color: #A5E126; color: white">Pay</button></div>
            <div class="col-md-3"></div>
            <div class="clearfix"> </div>
        </form>
    </div>
</div>