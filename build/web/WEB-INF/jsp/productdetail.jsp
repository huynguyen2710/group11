<%-- 
    Document   : chitietproduct
    Created on : Mar 19, 2019, 1:09:23 PM
    Author     : Hieu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script src="js/simpleCart.min.js"></script>
<!--default-js-->
<script src="js/jquery-2.1.4.min.js"></script>
<!--bootstrtrap-js-->
<script src="js/bootstrap.min.js"></script>
<!--script-->
<!-- FlexSlider -->
<script src="js/imagezoom.js"></script>
<script defer src="js/jquery.flexslider.js"></script>
<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />

<div class="showcase-grid">
    <div class="container">
        <div class="col-md-8 showcase">
            <div class="flexslider">
                <ul class="slides">
                    <div class="thumb-image"> <img src="resources/images/${product.image}" data-imagezoom="true" class="img-responsive"> </div>
                </ul>
            </div>

        </div>
        <div class="col-md-4 showcase">
            <div class="showcase-rt-top">
                <div class="pull-left shoe-name">
                    <h3 style="margin-bottom: 10px;">${product.name}</h3>
                    <h4>${product.price} $</h4>
                </div>
            </div>
            <hr class="featurette-divider">
            <div class="shocase-rt-bot">
                <form action="addtocart.htm" method="post">
                <div class="float-qty-chart">
                    <ul>
                        <li class="qty">
                            <h4 style="margin-top: 10px;">Quantity</h4>
                            <input class="form-control" type="number" name="quantity" min="1" value="1" style="width: 350px; margin-left: -3px; height: 50px ;font-weight: bold; font-size: 20px;"/>
                            <input name="productId" value="${product.productId}" hidden="true"/>
                        </li>
                    </ul>
                    <div class="clearfix"></div>
                </div>
                <ul>
                    <li class="ad-2-crt simpleCart_shelfItem">
                        <button class="btn item_add" role="button" style="width: 350px; height: 50px; font-weight: bold; font-size: 20px;
                                background-color: #A5E126; color: white">Add to cart</button>
                    </li>
                </ul>
                </form>
            </div>
        </div>
        <div class="col-md-12 showcase">
            <table class="table table-borderless table-striped table-earning" >
                <tr><th style="font-size: 20px;">Product ID</th> <td style="font-size: 20px;">${product.productId}</td></tr> 
                <tr><th style="font-size: 20px;">Supplier ID</th> <td style="font-size: 20px;">${product.suppliers.supplierId}</td></tr>  
                <tr><th style="font-size: 20px;">Product name</th> <td style="font-size: 20px;">${product.name}</td></tr> 
                <tr><th style="font-size: 20px;">Brand</th> <td style="font-size: 20px;">${product.brand}</td></tr> 
                <tr><th style="font-size: 20px;">Price</th> <td style="font-size: 20px;">${product.price}</td></tr> 
                <tr><th style="font-size: 20px;">Model code</th> <td <td style="font-size: 20px;">${product.modelCode}</td></tr> 
                <tr><th style="font-size: 20px;">Size</th> <td style="font-size: 20px;">${product.size}</td></tr>
                <tr><th style="font-size: 20px;">Weight</th> <td style="font-size: 20px;">${product.weight}</td></tr> 
                <tr><th style="font-size: 20px;">Color</th> <td style="font-size: 20px;">${product.color}</td></tr> 
                <tr><th style="font-size: 20px;">Network communication</th> <td style="font-size: 20px;">${product.networkCommunication}</td></tr>  
                <tr><th style="font-size: 20px;">Processor</th> <td style="font-size: 20px;">${product.processor}</td></tr>  
                <tr><th style="font-size: 20px;">Processor speed</th> <td style="font-size: 20px;">${product.processorSpeed}</td></tr>  
                <tr><th style="font-size: 20px;">Operating system</th> <td style="font-size: 20px;">${product.operatingSystem}</td></tr>  
                <tr><th style="font-size: 20px;">Screen size</th> <td style="font-size: 20px;">${product.screenSize}</td></tr>  
                <tr><th style="font-size: 20px;">Resolution</th> <td style="font-size: 20px;">${product.resolution}</td></tr>  
                <tr><th style="font-size: 20px;">Screen type</th> <td style="font-size: 20px;">${product.screenType}</td></tr>  
                <tr><th style="font-size: 20px;">VGA</th> <td style="font-size: 20px;">${product.vga}</td></tr>  
                <tr><th style="font-size: 20px;">VGA memory</th> <td style="font-size: 20px;">${product.vgaMemory}</td></tr>  
                <tr><th style="font-size: 20px;">Hard drive capacity</th> <td style="font-size: 20px;">${product.hardDriveCapacity}</td></tr>  
                <tr><th style="font-size: 20px;">Disc</th> <td style="font-size: 20px;">${product.disc}</td></tr>  
                <tr><th style="font-size: 20px;">RAM memory</th> <td style="font-size: 20px;">${product.ramMemory}</td></tr>  
                <tr><th style="font-size: 20px;">RAM gen</th> <td style="font-size: 20px;">${product.ramGen}</td></tr>  
                <tr><th style="font-size: 20px;">BUS</th> <td style="font-size: 20px;">${product.bus}</td></tr>  
                <tr><th style="font-size: 20px;">Camera</th> <td style="font-size: 20px;">${product.camera}</td></tr>  
                <tr><th style="font-size: 20px;">Port</th> <td style="font-size: 20px;">${product.port}</td></tr>  
                <tr style="border-bottom: 1px solid #ddd"><th style="font-size: 20px;">Battery</th> <td style="font-size: 20px;">${product.battery}</td></tr>  
            </table>
        </div>
    </div>
</div>
