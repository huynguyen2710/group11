<%-- 
    Document   : hoadon
    Created on : Mar 22, 2019, 4:03:40 AM
    Author     : Hieu
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                <div class="col-md-4 cart-total">
                    <f:form action="pay.htm" modelAttribute="receipt">
                        <div class="price-details">
                            <h3>Receipt</h3>
                            <f:input path="receiptId" value='R' hidden="true"/>
                            <f:input path="transactionDay" value='${date}' hidden="true"/>
                            <f:input path="total" value='${total}' hidden="true"/>
                            <input id="customers.customerId" hidden="true" name="customers.customerId" value="<% out.print(session.getAttribute("customerID2")); %>"/>
                            <span>Customer name</span>
                            <span class="total1"><% out.print(session.getAttribute("customer2")); %></span>
                            <span>Email</span>
                            <span class="total1"><% out.print(session.getAttribute("email2"));%></span>
                            <span>Transaction day</span>
                            <input type="date" value="${date}" name="transactionDay" style="border: none; color: gray; background-color: white" disabled="true"/>
                            <span>The number of products</span>
                            <span class="total1">${quantity}</span>
                            <span>Total money</span>
                            <span class="total1">${total}</span>
                            <span>Discount</span>
                            <span class="total1">0%</span>
                            <div class="clearfix"></div>				 
                        </div>
                        <hr class="featurette-divider">
                        <ul class="total_price">
                            <li class="last_price"> <h4>Into money</h4></li>	
                            <li class="last_price"><span>${total}</span></li>
                            <div class="clearfix"> </div>
                        </ul> 
                        <button class="btn item_add" role="button" style="width: 100%;height: 50px; font-weight: bold; font-size: 20px;
                                background-color: #A5E126; color: white; margin-top: 10px;">Pay</button>
                        <div class="clearfix"> </div>
                    </f:form>
                </div>
                <div class="col-md-8 cart-items">
                    <h1>Receipt detail</h1>
                    <c:forEach var="item" items="${listcart}">
                        <div class="cart-header">
                            <div class="cart-sec simpleCart_shelfItem">
                                <div class="cart-item cyc">
                                    <img src="resources/images/${item.image}" class="img-responsive" alt=""/>
                                </div>
                                <div class="cart-item-info" style="margin-top: -5px;">
                                    <ul class="qty">
                                        <li style="font-size: 20px;"><span>Product name :</span><span> ${item.name}</span></li>
                                        <br>
                                        <li style="font-size: 20px;"><span>Price per product:&nbsp</span><input type="number" value="${item.price}" style="border: none; background-color: white" disabled="true"></input></li>
                                        <br>
                                        <li style="font-size: 20px;"><span>Quantity :&nbsp&nbsp</span><input type="number" value="${item.quantity}" style="border: none; background-color: white" disabled="true"></input></li>
                                        <br>
                                    </ul>
                                    <div class="delivery" style="margin-top: 5px; color: red">
                                        <p style="font-size: 20px;">Total :&nbsp</p><p style="font-size: 20px; color: black">${item.total}</p>
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
                <div class="clearfix"> </div>
            </div>
            <jsp:include page="include/footer.jsp" />    
    </body>
</html>