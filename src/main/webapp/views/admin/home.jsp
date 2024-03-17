<%@ page import="java.util.ResourceBundle" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.example.bookingevent.database.MyObject" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ page import="com.example.bookingevent.Init.Config" %>
<%@ page import="com.example.bookingevent.database.DB" %>
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
          <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

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

  <div class="container py-5">

    <div style="width: 600px; margin: 0 auto;">
      <canvas id="myChart"></canvas>
    </div>
  </div>
  
  <div class="container py-5" id="app">
    <div class="row g-5 align-items-center py-5">
      <h3 class="mb-5 display-3 text-primary mt-5  py-5">Tất cả đơn hàng</h3>
      <div class="table-responsive">
        <table class="table table-striped table-bordered justify-content-center">
          <thead>
          <tr>
            <th scope="col">User</th>
            <th scope="col">Event</th>
            <th scope="col" class="col-3"><%=language.getString("current_price")%></th>
            <th scope="col"><%=language.getString("quantity")%></th>
            <th scope="col"><%=language.getString("amount")%></th>
          </tr>
          </thead>
          <tbody>
            <!-- Remove this comment to import data to table -->
          <!-- <c:forEach items="${bills}" var="bill">
            <tr>
            <td class="py-5">Hieu</td>
            <td class="py-5">
              <a href="${pageContext.request.contextPath}/event-detail?event_id=${bill.event_id}">Lang gom</a>
            </td>
            <td class="py-5">
              <fmt:formatNumber value="50000" type="currency" currencyCode="VND" maxFractionDigits="0"/>
            </td>
            <td class="py-5">2</td>
            <td class="py-5">
              <fmt:formatNumber value="100000" type="currency" currencyCode="VND" maxFractionDigits="0"/>
            </td>
          </tr>
          </c:forEach> -->

              <tr>
                <td class="py-5">Hieu</td>
                <td class="py-5">
                  <a href="${pageContext.request.contextPath}/event-detail?event_id=${bill.event_id}">Lang gom</a>
                </td>
                <td class="py-5">
                  <fmt:formatNumber value="50000" type="currency" currencyCode="VND" maxFractionDigits="0"/>
                </td>
                <td class="py-5">2</td>
                <td class="py-5">
                  <fmt:formatNumber value="100000" type="currency" currencyCode="VND" maxFractionDigits="0"/>
                </td>
              </tr>

              <tr>
                <td class="py-5">Hieu</td>
                <td class="py-5">
                  <a href="${pageContext.request.contextPath}/event-detail?event_id=${bill.event_id}">Lang gom</a>
                </div>
                <td class="py-5">
                  <fmt:formatNumber value="50000" type="currency" currencyCode="VND" maxFractionDigits="0"/>
                </td>
                <td class="py-5">2</td>
                <td class="py-5">
                  <fmt:formatNumber value="100000" type="currency" currencyCode="VND" maxFractionDigits="0"/>
                </td>
              </tr>
            </tbody>

        </table>
      </div>
    </div>
  </div>


  <script>

    const data = {
      labels: [
        'Làng gốm',
        'Làng rau',
        'Lồng đèn',
        'Làng mộc',
        'Làng lụa'
      ],
      datasets: [{
        label: 'Số tiền vé đã bán',
        data: [300, 50, 100, 200, 70],
        backgroundColor: [
          'rgb(255, 99, 132)',
          'rgb(54, 162, 235)',
          'rgb(255, 205, 86)',
          'rgb(75, 192, 192)',
          'rgb(201, 203, 207)'
        ],
        hoverOffset: 4
      }]
    };

    const ctx = document.getElementById('myChart');
  
    new Chart(ctx, {
      type: 'doughnut',
      data: data
    });
  </script>



<%@ include file="/views/master/foot.jsp" %>
</body>
</html>