<%@ page import="com.example.bookingevent.database.MyObject" %>
<%@ page import="java.util.ResourceBundle" %>
<%@ page import="com.example.bookingevent.Init.Config" %>
<%@ page import="com.example.bookingevent.database.DB" %>
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
  <h1 class="text-center text-white display-6">Bought Tickets</h1>
  <ol class="breadcrumb justify-content-center mb-0">
    <li class="breadcrumb-item"><a href="#">Home</a></li>
    <li class="breadcrumb-item active text-white">Bought Tickets</li>
  </ol>
</div>
<!-- Single Page Header End -->

<div class="container py-5" id="app">
  <div class="row g-5 align-items-center py-5">
    <h3 class="mb-5 display-3 text-primary mt-5  py-5"><%= language.getString("bought_product") %></h3>
    <div class="table-responsive">
      <table class="table table-striped table-bordered">
        <thead>
        <tr>
          <th scope="col">Products</th>
          <th scope="col" class="col-3"><%=language.getString("title")%></th>
          <th scope="col"><%=language.getString("bought_tickets")%></th>
          <th scope="col">Start Date</th>
          <th scope="col">End Date</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${bought_products}" var="cart">
          <tr>
            <th scope="row" class="d-flex justify-content-center">
              <div class="  mt-2">
                <img src="${pageContext.request.contextPath}/${cart.image}" class="img-fluid" style="width:120px; height: 90px;" alt="">
              </div>
            </th>
            <td class="py-5"><a href="${pageContext.request.contextPath}/event-detail?event_id=${cart.event_id}">${cart.event_title}</a></td>
            <td class="py-5">${cart.quantity}</td>
            <td class="py-5">${cart.start_date}</td>
            <td class="py-5">${cart.end_date}</td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
    </div>
  </div>
</div>



<%@ include file="../master/foot.jsp" %>
