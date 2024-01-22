<%@ page import="java.util.ResourceBundle" %>
<%@ page import="com.example.bookingevent.Init.Config" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<% ResourceBundle language = (ResourceBundle) request.getAttribute("language");%>


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
</head>

<body>

<jsp:include page="./master/head.jsp"/>
<div class="container-fluid py-5 mb-5 hero-header d-flex justify-content-center">
  <div class="container row py-5 ">
    <div class="col-md-12 col-lg-6 col-xl-7">
      <img width="100%" src="https://img.vietqr.io/image/<%=Config.bank_id%>-<%=Config.bank_number%>-print.png?amount=${amount}&addInfo=${transfer_content}&accountName=<%=Config.app_name%>" alt="">
    </div>
    <div class="col-md-12 col-lg-6 col-xl-5">
      <div class="table-responsive">
        <table class="table">
          <thead>
          <tr>
            <th scope="col">Products</th>
            <th scope="col">Name</th>
            <th scope="col">Price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Total</th>
          </tr>
          </thead>
          <tbody>
          <tr>
            <th scope="row">
              <div class="d-flex align-items-center mt-2">
                <img src="img/vegetable-item-2.jpg" class="img-fluid rounded-circle" style="width: 90px; height: 90px;" alt="">
              </div>
            </th>
            <td class="py-5">Awesome Brocoli</td>
            <td class="py-5">$69.00</td>
            <td class="py-5">2</td>
            <td class="py-5">$138.00</td>
          </tr>
          <tr>
            <th scope="row">
              <div class="d-flex align-items-center mt-2">
                <img src="img/vegetable-item-5.jpg" class="img-fluid rounded-circle" style="width: 90px; height: 90px;" alt="">
              </div>
            </th>
            <td class="py-5">Potatoes</td>
            <td class="py-5">$69.00</td>
            <td class="py-5">2</td>
            <td class="py-5">$138.00</td>
          </tr>
          <tr>
            <th scope="row">
              <div class="d-flex align-items-center mt-2">
                <img src="img/vegetable-item-3.png" class="img-fluid rounded-circle" style="width: 90px; height: 90px;" alt="">
              </div>
            </th>
            <td class="py-5">Big Banana</td>
            <td class="py-5">$69.00</td>
            <td class="py-5">2</td>
            <td class="py-5">$138.00</td>
          </tr>
          <tr>
            <th scope="row">
            </th>
            <td class="py-5"></td>
            <td class="py-5"></td>
            <td class="py-5">
              <p class="mb-0 text-dark py-3">Subtotal</p>
            </td>
            <td class="py-5">
              <div class="py-3 border-bottom border-top">
                <p class="mb-0 text-dark">$414.00</p>
              </div>
            </td>
          </tr>
          <tr>
            <th scope="row">
            </th>
            <td class="py-5">
              <p class="mb-0 text-dark py-4">Shipping</p>
            </td>
            <td colspan="3" class="py-5">
              <div class="form-check text-start">
                <input type="checkbox" class="form-check-input bg-primary border-0" id="Shipping-1" name="Shipping-1" value="Shipping">
                <label class="form-check-label" for="Shipping-1">Free Shipping</label>
              </div>
              <div class="form-check text-start">
                <input type="checkbox" class="form-check-input bg-primary border-0" id="Shipping-2" name="Shipping-1" value="Shipping">
                <label class="form-check-label" for="Shipping-2">Flat rate: $15.00</label>
              </div>
              <div class="form-check text-start">
                <input type="checkbox" class="form-check-input bg-primary border-0" id="Shipping-3" name="Shipping-1" value="Shipping">
                <label class="form-check-label" for="Shipping-3">Local Pickup: $8.00</label>
              </div>
            </td>
          </tr>
          <tr>
            <th scope="row">
            </th>
            <td class="py-5">
              <p class="mb-0 text-dark text-uppercase py-3">TOTAL</p>
            </td>
            <td class="py-5"></td>
            <td class="py-5"></td>
            <td class="py-5">
              <div class="py-3 border-bottom border-top">
                <p class="mb-0 text-dark">$135.00</p>
              </div>
            </td>
          </tr>
          </tbody>
        </table>
      </div>
      <div class="row g-4 text-center align-items-center justify-content-center border-bottom py-3">
        <div class="col-12">
          <div class="form-check text-start my-3">
            <input type="checkbox" class="form-check-input bg-primary border-0" id="Transfer-1" name="Transfer" value="Transfer">
            <label class="form-check-label" for="Transfer-1">Direct Bank Transfer</label>
          </div>
          <p class="text-start text-dark">Make your payment directly into our bank user. Please use your Order ID as the payment reference. Your order will not be shipped until the funds have cleared in our user.</p>
        </div>
      </div>
      <div class="row g-4 text-center align-items-center justify-content-center border-bottom py-3">
        <div class="col-12">
          <div class="form-check text-start my-3">
            <input type="checkbox" class="form-check-input bg-primary border-0" id="Payments-1" name="Payments" value="Payments">
            <label class="form-check-label" for="Payments-1">Check Payments</label>
          </div>
        </div>
      </div>
      <div class="row g-4 text-center align-items-center justify-content-center border-bottom py-3">
        <div class="col-12">
          <div class="form-check text-start my-3">
            <input type="checkbox" class="form-check-input bg-primary border-0" id="Delivery-1" name="Delivery" value="Delivery">
            <label class="form-check-label" for="Delivery-1">Cash On Delivery</label>
          </div>
        </div>
      </div>
      <div class="row g-4 text-center align-items-center justify-content-center border-bottom py-3">
        <div class="col-12">
          <div class="form-check text-start my-3">
            <input type="checkbox" class="form-check-input bg-primary border-0" id="Paypal-1" name="Paypal" value="Paypal">
            <label class="form-check-label" for="Paypal-1">Paypal</label>
          </div>
        </div>
      </div>
      <div class="row g-4 text-center align-items-center justify-content-center pt-4">
        <button type="button" class="btn border-secondary py-3 px-4 text-uppercase w-100 text-primary">Place Order</button>
      </div>
    </div>
  </div>
    </div>
<%@ include file="./master/foot.jsp" %>