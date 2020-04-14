<%-- 
    Document   : capnhatthongtin
    Created on : Mar 19, 2019, 11:46:40 PM
    Author     : Hieu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
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
                <f:form action="updateinfor.htm"  modelAttribute="customer" method="post" class="form-horizontal" enctype="multipart/form-data">
                    <div class="row form-group">
                        <div class="col col-md-2">
                            <label for="text-input" class=" form-control-label">Avatar</label>
                        </div>
                        <div class="col-12 col-md-10">
                            <input name="photo" type="file" accept="image/*" />
                        </div>
                    </div>
                    <div class="row form-group" hidden="true">
                        <div class="col-12 col-md-10">
                            <f:input path="customerId" cssClass="form-control" />
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col col-md-2">
                            <label for="text-input" class=" form-control-label">Name</label>
                        </div>
                        <div class="col-12 col-md-10">
                            <f:input path="name" cssClass="form-control" />
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col col-md-2">
                            <label for="text-input" class=" form-control-label">Phone number</label>
                        </div>
                        <div class="col-12 col-md-10">
                            <f:input path="phoneNumber" cssClass="form-control" />
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col col-md-2">
                            <label for="text-input" class=" form-control-label">Address</label>
                        </div>
                        <div class="col-12 col-md-10">
                            <f:input path="address" cssClass="form-control" />
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col col-md-2">
                            <label for="text-input" class=" form-control-label">Email</label>
                        </div>
                        <div class="col-12 col-md-10">
                            <f:input path="email" type="email" cssClass="form-control" />
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col col-md-2">
                            <label for="text-input" class=" form-control-label">Identification number</label>
                        </div>
                        <div class="col-12 col-md-10">
                            <f:input path="identificationNumber" cssClass="form-control" />
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col col-md-2">
                            <label for="text-input" class=" form-control-label">Date of birth</label>
                        </div>
                        <div class="col-12 col-md-10">
                            <f:input path="dateOfBirth" type="date" cssClass="form-control" />
                        </div>
                    </div>
                    <div class="row form-group" hidden="true">
                        <div class="col-12 col-md-10">
                            <f:input path="userName" cssClass="form-control" />
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col col-md-2">
                            <label for="text-input" class=" form-control-label">Password</label>
                        </div>
                        <div class="col-12 col-md-10">
                            <f:input path="password" cssClass="form-control"/>
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col col-md-2">
                            <label class=" form-control-label" hidden="true">Admin permission</label>
                        </div>
                        <div class="col-12 col-md-10" hidden="true">
                            <label for="inline-radio1" class="form-check-label ">
                                <f:radiobutton path="adminPermission" value="true" checked="true"/>Admin
                            </label>
                            <label for="inline-radio2" class="form-check-label" style="margin-left: 10px">
                                <f:radiobutton path="adminPermission" value="false"/>Customer
                            </label>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-lg btn-info btn-block">
                        <i class="fa fa-save fa-lg"></i>&nbsp;
                        <span id="payment-button-amount">Update</span>
                        <span id="payment-button-sending" style="display:none;">Sending…</span>
                    </button>
                </f:form>
            </div>
            <jsp:include page="include/footer.jsp" />    
    </body>
</html>

