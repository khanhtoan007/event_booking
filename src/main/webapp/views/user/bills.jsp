<%@ page import="com.example.bookingevent.database.MyObject" %>
<%@ page import="java.util.ResourceBundle" %>
<%@ page import="com.example.bookingevent.Init.Config" %>
<%@ page import="com.example.bookingevent.database.DB" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<% ResourceBundle language = (ResourceBundle) request.getAttribute("language");%>
<% String user_id = (String) session.getAttribute("login"); %>
<%MyObject user = DB.getUser(user_id);%>


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

<%@ include file="../master/head.jsp" %>

<!-- Single Page Header start -->
<div class="container-fluid page-header py-5">
  <h1 class="text-center text-white display-6"><%= language.getString("bills") %></h1>
  <ol class="breadcrumb justify-content-center mb-0">
    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/homepage">Home</a></li>
    <li class="breadcrumb-item active text-white"><%= language.getString("bills") %></li>
  </ol>
</div>
<!-- Single Page Header End -->

<div class="container py-5" id="app">
  <div class="row g-5 align-items-center py-5">
    <h3 class="mb-5 display-3 text-primary mt-5  py-5"><%= language.getString("bills") %></h3>
    <div class="table-responsive">
      <table class="table table-striped table-bordered justify-content-center">
        <thead>
        <tr>
          <th scope="col">Products</th>
          <th scope="col" class="col-3"><%=language.getString("current_price")%></th>
          <th scope="col"><%=language.getString("quantity")%></th>
          <th scope="col"><%=language.getString("amount")%></th>
          <th scope="col">Transfer Content</th>
          <th scope="col">Checkout</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${bills}" var="bill">
          <tr>
            <th scope="row" class="d-flex justify-content-center">
              <div class="  mt-2">
                <a href="${pageContext.request.contextPath}/event-detail?event_id=${bill.event_id}">${bill.event_title}</a>
              </div>
            </th>
            <td class="py-5">
              <fmt:formatNumber value="${bill.price}" type="currency" currencyCode="VND" maxFractionDigits="0"/>
            </td>
            <td class="py-5">${bill.quantity}</td>
            <td class="py-5">
              <fmt:formatNumber value="${bill.amount}" type="currency" currencyCode="VND" maxFractionDigits="0"/>
            </td>
            <td class="py-5">${bill.transfer_content}</td>
            <td class="py-5"><a href="${pageContext.request.contextPath}/user/payment?bill_id=${bill.bill_id}" class="btn-success btn">Pay</a></td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
    </div>
  </div>
</div>

<%@ include file="../master/foot.jsp" %>

</body>
</html>
