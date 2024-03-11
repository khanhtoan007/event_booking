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
    <div class="row g-5 align-items-center">
      <h3 class="mb-5 display-3 text-primary"><%= language.getString("register") %></h3>
      <form action="${pageContext.request.contextPath}/register" method="post">
        <div class="row">
          <div class="col-6">
            <div class="form-group">
              <label for="email"><%=language.getString("email")%></label>
              <input required value="<%=request.getAttribute("email") != null ? request.getAttribute("email") : ""%>" type="email" class="form-control" id="email" name="email">
            </div>
            <div class="form-group">
              <label for="name"><%=language.getString("name")%></label>
              <input required value="<%=request.getAttribute("name") != null ? request.getAttribute("name") : ""%>" type="text" class="form-control" id="name" name="name">
            </div>
            <div class="form-group">
              <label for="phone"><%=language.getString("phone")%></label>
              <input required value="<%=request.getAttribute("phone") != null ? request.getAttribute("phone") : ""%>" type="tel" class="form-control" id="phone" name="phone">
            </div>
          </div>
          <div class="col-6">
            <div class="form-group">
              <label for="password"><%=language.getString("password")%></label>
              <input required value="<%=request.getAttribute("password") != null ? request.getAttribute("password") : ""%>" type="password" class="form-control" id="password" name="password">
            </div>
            <div class="form-group">
              <label for="re_password"><%=language.getString("re_password")%></label>
              <input required value="<%=request.getAttribute("re_password") != null ? request.getAttribute("re_password") : ""%>" type="password" class="form-control" id="re_password" name="re_password">
            </div>
            <div class="form-group">
              <label><%=language.getString("gender")%></label>
              <div class="row">
                <div class="col-6">
                  <div class="form-group">
                    <label for="email"><%=language.getString("email")%></label>
                    <input required value="<%=request.getAttribute("email") != null ? request.getAttribute("email") : ""%>" type="email" class="form-control" id="email" name="email">
                  </div>
                  <div class="form-group">
                    <label for="name"><%=language.getString("name")%></label>
                    <input required value="<%=request.getAttribute("name") != null ? request.getAttribute("name") : ""%>" type="text" class="form-control" id="name" name="name">
                  </div>
                  <div class="form-group">
                    <label for="phone"><%=language.getString("phone")%></label>
                    <input required value="<%=request.getAttribute("phone") != null ? request.getAttribute("phone") : ""%>" type="tel" class="form-control" id="phone" name="phone">
                  </div>
                </div>
                <div class="col-6">
                  <div class="form-group">
                    <label for="password"><%=language.getString("password")%></label>
                    <input required value="<%=request.getAttribute("password") != null ? request.getAttribute("password") : ""%>" type="password" class="form-control" id="password" name="password">
                  </div>
                  <div class="form-group">
                    <label for="re_password"><%=language.getString("re_password")%></label>
                    <input required value="<%=request.getAttribute("re_password") != null ? request.getAttribute("re_password") : ""%>" type="password" class="form-control" id="re_password" name="re_password">
                  </div>
                  <div class="form-group">
                    <label><%=language.getString("gender")%></label>
                    <div class="row">
                      <div class="col-6">
                        <div class="form-check">
                          <input class="form-check-input" type="radio" name="gender" id="flexRadioDefault1" value="true" <%=request.getAttribute("gender")!=null ? request.getAttribute("gender").equals("true") ? "checked" : "" : ""%>>
                          <label class="form-check-label" for="flexRadioDefault1">
                            <%=language.getString("male")%>
                          </label>
                        </div>
                      </div>
                      <div class="col-6">
                        <div class="form-check">
                          <input class="form-check-input" type="radio" name="gender" id="flexRadioDefault2"  value="false" <%=request.getAttribute("gender")!=null ? request.getAttribute("gender").equals("false") ? "checked" : "" : ""%>>
                          <label class="form-check-label" for="flexRadioDefault2">
                            <%=language.getString("female")%>
                          </label>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="d-grid gap-2 mt-2">
                <button type="submit" class="btn btn-primary"><%= language.getString("register").toUpperCase() %></button>
                <p><%=language.getString("already_have_account").replace("url", request.getContextPath() + "/login")%></p><br>
              </div>
            </div>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>


      <%@ include file="../master/foot.jsp" %>
    </body>
</html>
