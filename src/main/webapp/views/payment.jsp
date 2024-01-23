<%@ page import="java.util.ResourceBundle" %>
<%@ page import="com.example.bookingevent.Init.Config" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
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


<!-- Single Page Header start -->
<div class="container-fluid page-header py-5">
  <h1 class="text-center text-white display-6">Checkout</h1>
  <ol class="breadcrumb justify-content-center mb-0">
    <li class="breadcrumb-item"><a href="#">Home</a></li>
    <li class="breadcrumb-item"><a href="#">Pages</a></li>
    <li class="breadcrumb-item active text-white">Checkout</li>
  </ol>
</div>
<!-- Single Page Header End -->


<div class="container-fluid py-5">
  <div class="container py-5">
    <% if ((boolean) request.getAttribute("change")) { %>
    <h1>số lượng đã bị thay đổi.</h1>
    <% } %>
    <form action="#">
      <div class="row g-5">
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
              <c:forEach var="cart" items="${carts}">
                <tr>
                  <th scope="row">
                    <div class="d-flex align-items-center mt-2">
                      <img src="${pageContext.request.contextPath}${cart.image}" class="img-fluid rounded-circle" style="width: 90px; height: 90px;" alt="">
                    </div>
                  </th>
                  <td class="py-5">${cart.event_title}</td>
                  <td class="py-5">
                    <fmt:formatNumber value="${cart.price}" type="currency" currencyCode="VND" maxFractionDigits="0"/>
                  </td>
                  <td class="py-5">${cart.quantity}</td>
                  <td class="py-5">
                    <fmt:formatNumber value="${cart.amount}" type="currency" currencyCode="VND" maxFractionDigits="0"/>
                  </td>
                </tr>
              </c:forEach>
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
                    <fmt:formatNumber value="${amount}" type="currency" currencyCode="VND" maxFractionDigits="0"/>
                  </div>
                </td>
              </tr>
              </tbody>
            </table>
          </div>
          <div class="row g-4 text-center align-items-center justify-content-center border-bottom py-3">
            <div class="col-12">
              <div class="form-check text-start my-3">
                <input type="checkbox" class="form-check-input bg-primary border-0" id="Payments-1" name="Payments" value="Payments">
                <label class="form-check-label" for="Payments-1"><p>I agree to Local Xplorer's <a target="_blank" href="" rel="noopener noreferrer">Terms of Use</a> and <a target="_blank" href="" rel="noopener noreferrer">Information Privacy Policy</a></p>
                </label>
              </div>
            </div>
          </div>
          <div class="row g-4 text-center align-items-center justify-content-center pt-4">
            <button type="button" class="btn border-secondary py-3 px-4 text-uppercase w-100 text-primary">Confirm Payment</button>
          </div>
        </div>
      </div>
    </form>
  </div>
    </div>
<%@ include file="./master/foot.jsp" %>
<script>
  var app = new Vue({
    el: "#app",
    data:{
      socket : new WebSocket((window.location.protocol === 'https:' ? 'wss://' : 'ws://') + window.location.host + '${pageContext.request.contextPath}/my-websocket'),
    },
    created(){
      setTimeout(() => {
        this.socket.send("subscribe:" + '${transfer_content}');
      }, 2000);
      this.socket.onmessage = (event) => {
        const message = JSON.parse(event.data);
        if (message === true){
          toastr.success("<%=language.getString("payment_verified")%>")
          location.href = "<%=request.getContextPath() + "/"%>"
        }
      }
    },
    methods:{

    }
  })
</script>

