<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.example.bookingevent.database.MyObject" %>
<%@ page import="java.util.ResourceBundle" %>
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
  </head>
<body>

      <%@ include file="../master/head.jsp" %>
      <div class="container-fluid py-5 mb-5 hero-header">
        <div class="container py-5">
          <div class="row g-5 d-flex align-items-center">
            <% if (request.getAttribute("verify_status").equals("success")){ %>
              <h1 class="text-primary"><%=language.getString("verify_success")%></h1>
            <% } else { %>
              <h1 class="text-danger"><%=language.getString("verify_fail")%></h1>
            <% } %>
            <h3 id="countdown"></h3>
            <h3><%=language.getString("go_to_login").replace("url", request.getContextPath() + "/login")%></h3>
          </div>
        </div>
      </div>

      <%@ include file="../master/foot.jsp" %>
      <script>
        window.onload = function() {
          window.setTimeout(function () {
            location.href = "${pageContext.request.contextPath}/login";
          }, 10000);
          let timeLeft = 10;
          const x = setInterval(function() {
            document.getElementById("countdown").innerHTML = "<%=language.getString("time_redirect")%>".replace("xx", timeLeft);
            timeLeft--;
            if (timeLeft < 0) {
              clearInterval(x);
              document.getElementById("countdown").innerHTML = "0";
            }
          }, 1000);
        };
      </script>
      
  </body>
</html>