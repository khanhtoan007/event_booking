<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.ResourceBundle" %>
<%@ page import="com.example.bookingevent.Init.Config" %>
<%@ page import="com.example.bookingevent.database.MyObject" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<% ResourceBundle language = (ResourceBundle) request.getAttribute("language");%>
<% ArrayList<MyObject> cart = (ArrayList<MyObject>) request.getAttribute("carts");%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title><%=Config.app_name%></title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="${pageContext.request.contextPath}/assets/lib/lightbox/css/lightbox.min.css" rel="stylesheet">

    <link href="${pageContext.request.contextPath}/assets/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


    <!-- Customized Bootstrap Stylesheet -->
    <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css"
        integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g=="
        crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>

<body>

<jsp:include page="./master/head.jsp"/>


    <div class="container py-5">
        <div class="row g-5 align-items-center py-5">
            <h3 class="mb-5 display-3 text-primary mt-5  py-5"><%= language.getString("cart") %></h3>
            <table class="table">
                <thead>
                <tr>
                    <th scope="col"></th>
                    <th scope="col"><%=language.getString("title")%></th>
                    <th scope="col"><%=language.getString("quantity")%></th>
                    <th scope="col"><%=language.getString("current_price")%></th>
                    <th scope="col"><%=language.getString("note")%></th>
                    <th class="text-center" scope="col"><%=language.getString("action")%></th>
                </tr>
                </thead>
                <tbody>
                <% for (int i = 0; i < cart.size(); i++) { %>
                    <tr>
                        <td ><input class="groupCheckbox" id="cart_item" type="checkbox" value="<%=cart.get(i).id%>"></td>
                        <td><a href="${pageContext.request.contextPath}/event-detail?event_id=<%=cart.get(i).id%>"><%=cart.get(i).event_title%></a> </td>
                        <td>
                            <div class="input-group quantity" style="width: 100px;">
                                <div class="input-group-btn">
                                    <button class="btn btn-sm btn-minus rounded-circle bg-light border" >
                                        <i class="fa fa-minus"></i>
                                    </button>
                                </div>
                                <input type="text" class="form-control form-control-sm text-center border-0" value="<%=cart.get(i).quantity%>">
                                <div class="input-group-btn">
                                    <button class="btn btn-sm btn-plus rounded-circle bg-light border">
                                        <i class="fa fa-plus"></i>
                                    </button>
                                </div>
                            </div>
                        <td><input type="text" readonly name="currentPrice" id="currentPrice" value="<%=cart.get(i).price%>"></td>
                        <td><%=cart.get(i).note%></td>
                        <td>
                            <div class="col-md-12">
                                <a href="${pageContext.request.contextPath}/user/delete-cart?id=<%=cart.get(i).id%>">
                                    <button class="btn btn-danger" style="width: 100%">Delete</button>
                                </a>
                            </div>
                        </td>
                    </tr>
                <% } %>
                </tbody>
            </table>
        </div>
            <input type="checkbox" id="checkAll">
            <label for="checkAll">Check All</label>
        <div class="row g-4 justify-content-end">
            <div class="col-8"></div>
            <div class="col-sm-8 col-md-7 col-lg-6 col-xl-4">
                <div class="bg-light rounded">
                    <div class="p-4">
                        <h1 class="display-6 mb-4">Cart <span class="fw-normal">Total</span></h1>
                        <div class="d-flex justify-content-between mb-4">
                            <h5 class="mb-0 me-4">Amount</h5>
                            <p class="mb-0">${bill.amount}</p>
                        </div>
                        <div class="d-flex justify-content-between">
                            <h5 class="mb-0 me-4">Your Item</h5>
                            <div class="">
                                <p class="mb-0">${bill.transfer_context}</p>
                            </div>
                        </div>
                        <p class="mb-0 text-end">${bill.status}</p>
                    </div>
                    <div class="py-4 mb-4 border-top border-bottom d-flex justify-content-between">
                        <h5 class="mb-0 ps-4 me-4">Total</h5>
<%--                        <c:set var="totalAmount" value="${bill.amount*bill.price}"/>--%>
<%--                        <p class="mb-0 pe-4">${totalAmount}</p>--%>
                    </div>
                    <button class="btn border-secondary rounded-pill px-4 py-3 text-primary text-uppercase mb-4 ms-4" type="button">
                        <a href="${pageContext.request.contextPath}/user/bill">Proceed Checkout</a></button>
                </div>
            </div>
        </div>
    </div>
<%@ include file="/views/master/foot.jsp" %>
<script>
    document.getElementById("checkAll").addEventListener("change", function() {
        var checkboxes = document.getElementsByClassName("groupCheckbox");
        for (var i = 0; i < checkboxes.length; i++) {
            checkboxes[i].checked = this.checked;
        }
    });
    document.getElementById("cart_item").addEventListener("change", function() {
        // Handle checkbox change
        if (this.checked) {
            // Checkbox is checked
        } else {
            // Checkbox is unchecked
        }
    });
</script>
