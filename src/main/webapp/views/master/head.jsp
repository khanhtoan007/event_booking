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
<html>
<head>
    <meta charset="utf-8">
    <title>Fruitables - Vegetable Website Template</title>
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
<!-- Spinner Start -->
<div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
    <div class="spinner-grow text-primary" role="status"></div>
</div>
<!-- Spinner End -->


<!-- Navbar start -->
<div class="container-fluid fixed-top">
    <div class="container topbar bg-primary d-none d-lg-block">
        <div class="d-flex justify-content-between">
            <div class="top-info ps-2">
                <small class="me-3"><i class="fas fa-map-marker-alt me-2 text-secondary"></i> <a href="#" class="text-white">123 Street, New York</a></small>
                <small class="me-3"><i class="fas fa-envelope me-2 text-secondary"></i><a href="#" class="text-white">Email@Example.com</a></small>
            </div>
            <div class="top-link pe-2">
                <a href="#" class="text-white"><small class="text-white mx-2">Privacy Policy</small>/</a>
                <a href="#" class="text-white"><small class="text-white mx-2">Terms of Use</small>/</a>
                <a href="#" class="text-white"><small class="text-white ms-2">Sales and Refunds</small></a>
            </div>
        </div>
    </div>
    <div class="container px-0">
        <nav class="navbar navbar-light bg-white navbar-expand-xl">
            <a href="${pageContext.request.contextPath}/" class="navbar-brand"><h1 class="text-primary display-6"><%=Config.app_name%></h1></a>
            <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="fa fa-bars text-primary"></span>
            </button>
            <div class="collapse navbar-collapse bg-white" id="navbarCollapse">
                <div class="navbar-nav mx-auto">
                    <a href="${pageContext.request.contextPath}/views/index.jsp" class="nav-item nav-link active">Home</a>
                    <a href="${pageContext.request.contextPath}/events" class="nav-item nav-link">Shop</a>
                    <a href="${pageContext.request.contextPath}/event-detail" class="nav-item nav-link">Shop Detail</a>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Pages</a>
                        <div class="dropdown-menu m-0 bg-secondary rounded-0">
                            <a href="${pageContext.request.contextPath}/views/cart.html" class="dropdown-item">Cart</a>
                            <a href="${pageContext.request.contextPath}/views/products/checkout.jsp" class="dropdown-item">Chackout</a>
                            <a href="${pageContext.request.contextPath}/views/testimonial.html" class="dropdown-item">Testimonial</a>
                            <a href="${pageContext.request.contextPath}/views/404.html" class="dropdown-item">404 Page</a>
                        </div>
                    </div>
                    <a href="${pageContext.request.contextPath}/views/contact.html" class="nav-item nav-link">Contact</a>
                </div>
                <div class="d-flex m-3 me-0">
                        <form class="position-relative me-4 my-auto" action="${pageContext.request.contextPath}/change-language" onchange="submit()" method="post">
                            <input type="hidden" name="current_uri" value="<%=request.getAttribute("uri")%>">
                            <select class="form-control" name="lang" id="lang">
                                    <option <%=language.getLocale().getLanguage().equals("en") ? "selected" : ""%> value="en"><%=language.getString("english")%></option>
                                    <option <%=language.getLocale().getLanguage().equals("vi") ? "selected" : ""%> value="vi"><%=language.getString("vietnamese")%></option>
                            </select>
                        </form>
                    <button class="btn-search btn border border-secondary btn-md-square rounded-circle bg-white me-4 ml-2" data-bs-toggle="modal" data-bs-target="#searchModal"><i class="fas fa-search text-primary"></i></button>
                    <a href="#" class="position-relative me-4 my-auto">
                        <i class="fa fa-shopping-bag fa-2x"></i>
                        <span class="position-absolute bg-secondary rounded-circle d-flex align-items-center justify-content-center text-dark px-1" style="top: -5px; left: 15px; height: 20px; min-width: 20px;">3</span>
                    </a>
                    <% if (user_id == null) { %>
                        <div class="row">
                            <div class="col-6 d-flex flex-column align-content-center">
                                <a style="margin-top: 8px;" href="${pageContext.request.contextPath}/register"><span class=""><%=language.getString("register")%></span></a>
                            </div>
                            <div class="col-6 d-flex flex-column align-content-center">
                                <a style="margin-top: 8px;" href="${pageContext.request.contextPath}/login"><span class=""><%=language.getString("login")%></span></a>
                            </div>
<%--                            <div class="col-md-6 p-0 d-flex">--%>
<%--                                <a class="m-auto" href="${pageContext.request.contextPath}/register"><span class="text-nowrap"><%=language.getString("register")%></span></a>--%>
<%--                            </div>--%>
<%--                            &nbsp;&nbsp;--%>
<%--                            <div class="col-md-6 p-0 d-flex">--%>
<%--                                <a class="m-auto" href="${pageContext.request.contextPath}/login"><span class="text-nowrap"><%=language.getString("login")%></span></a>--%>
<%--                            </div>--%>
                        </div>
                    <% } else { %>
                        <% if (user != null) { %>
                            <a href="${pageContext.request.contextPath}/user/profile" class="mr-1">
                                <img src="<%=user.avatar.startsWith("http") ? user.avatar : request.getContextPath() + user.avatar%>" alt="" style="width: 44px; height: 44px;border-radius: 50%; object-fit: cover">
                            </a>
                            <div class="dropdown d-flex flex-column justify-content-center">
                                <p class="dropdown-toggle align-items-center m-0 ml-1" id="dropdownMenuButton1" data-bs-toggle="dropdown"><%=user.name%></p>
                                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/user/profile"><%=language.getString("profile")%></a></li>
                                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/logout"><%=language.getString("logout")%></a></li>
                                </ul>
                            </div>
                        <% } %>
                    <% } %>
                </div>
            </div>
        </nav>
    </div>
</div>
<!-- Navbar End -->