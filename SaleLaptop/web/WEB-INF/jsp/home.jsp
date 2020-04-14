<%-- 
    Document   : home
    Created on : Mar 16, 2019, 8:11:32 PM
    Author     : Hieu
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="shop-grid">
    <div class="container">
    <c:forEach items="${listproduct}" var="pro">
            <div class="col-md-4 grid-stn simpleCart_shelfItem">
                <!-- normal -->
                <div class="ih-item square effect3 bottom_to_top">
                    <div class="bottom-2-top">
                        <div class="img"><img  src="resources/images/${pro.image}" alt="/" class="img-responsive gri-wid" style="width: 350px; height: 300px"></div>
                        <div class="info">
                            <div class="pull-left styl-hdn">
                                <h3>${sp.tenSp}</h3>
                            </div>
                            <div class="pull-right styl-price">
                                <form action="addtocart.htm?productId=${pro.productId}&quantity=1" method="post" style="margin-top: -10px;">
                                    <a style="font-weight: bold; font-size: 18px; ">${pro.name}</a>
                                    <p><button style="border: none; background-color:  white"><a href=""  class="item_add"><span class="glyphicon glyphicon-shopping-cart grid-cart" aria-hidden="true"></span> <span class=" item_price">${pro.price} $</span></a></button></p>
                                </form>
                            </div>
                            <div class="clearfix"></div>
                        </div></div>
                </div>
                <!-- end normal -->
                <div class="quick-view">
                    <a href="detail.htm?productId=${pro.productId}">Detail</a>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
