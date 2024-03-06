<%@ page import="java.util.ResourceBundle" %>
<%@ page import="com.example.bookingevent.Init.Config" %>
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
    
        <%@ include file="./master/head.jsp" %>


        <!-- Hero Start -->
        <div class="container-fluid py-5 mb-5 hero-header">
            <div class="container py-5">
                <div class="row g-5 align-items-center">
                    <div class="col-md-12 col-lg-7">
                        <h4 class="mb-3 text-secondary">Hoi An Events</h4>
                        <h1 class="mb-5 display-3 text-primary">Daily Event</h1>
                        <div class="position-relative mx-auto">
                            <input class="form-control border-2 border-secondary w-75 py-3 px-4 rounded-pill" type="number" placeholder="Search">
                            <button type="submit" class="btn btn-primary border-2 border-secondary py-3 px-4 position-absolute rounded-pill text-white h-100" style="top: 0; right: 25%;">Submit Now</button>
                        </div>
                    </div>
                    <div class="col-md-12 col-lg-5">
                        <div id="carouselId" class="carousel slide position-relative" data-bs-ride="carousel">
                            <div class="carousel-inner" role="listbox">
                                <div class="carousel-item active rounded">
                                    <img src="${pageContext.request.contextPath}/assets/img/Longdenhungan.png" class="img-fluid w-100 h-100 bg-secondary rounded" alt="First slide">
                                    <a href="#" class="btn px-4 py-2 text-white rounded">Workshop</a>
                                </div>
                                <div class="carousel-item rounded">
                                    <img src="${pageContext.request.contextPath}/assets/img/Kimmoc.png" class="img-fluid w-100 h-100 rounded" alt="Second slide">
                                    <a href="#" class="btn px-4 py-2 text-white rounded">Handmade</a>
                                </div>
                                <div class="carousel-item rounded">
                                    <img src="${pageContext.request.contextPath}/assets/img/Tra%20que%20organic.png" class="img-fluid w-100 h-100 rounded" alt="Third slide">
                                    <a href="#" class="btn px-4 py-2 text-white rounded">Handmade</a>
                                </div>
                            </div>
                            <button class="carousel-control-prev" type="button" data-bs-target="#carouselId" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#carouselId" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Hero End -->



        <!-- Fruits Shop Start-->
        <div class="container-fluid fruite py-5">
            <div class="container py-5">
                <div class="tab-class text-center">
                    <div class="row g-4">
                        <div class="col-lg-4 text-start">
                            <h1><%=language.getString("homepage_master_title")%></h1>
                        </div>
                        <div class="col-lg-8 text-end">
                            <ul class="nav nav-pills d-inline-flex text-center mb-5">
                                <li class="nav-item">
                                    <a class="d-flex m-2 py-2 bg-light rounded-pill active" data-bs-toggle="pill" href="#tab-1">
                                        <span class="text-dark" style="width: 130px;"><%=language.getString("all_product")%></span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="tab-content">
                        <div id="tab-1" class="tab-pane fade show p-0 active">
                            <div class="row g-4">
                                <div class="col-lg-12">
                                    <div class="row g-4">
                                        <c:forEach var="event" items="${listEvent}">
                                            <div class="col-md-6 col-lg-4 col-xl-3">
                                                <div class="rounded position-relative fruite-item" style="display: flex; flex-direction: column;">
                                                    <div class="fruite-img">
                                                        <img src="images/${event.image}" class="img-fluid w-100 rounded-top" alt="">
                                                    </div>
                                                    <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">${event.category_name}</div>
                                                    <div class="p-4 border border-secondary border-top-0 rounded-bottom" style="flex-grow: 1; display: flex; flex-direction: column; justify-content: flex-end;">
                                                        <h4>${event.title}</h4>
                                                        <p>${event.content}</p>
                                                        <div class="d-flex flex-column">
                                                            <p class="text-dark fs-5 fw-bold mb-0">${event.price}VND</p>
                                                            <a href="${pageContext.request.contextPath}/event?id=${event.id}" class="btn border border-secondary rounded-pill px-4 py-1 text-primary align-items-center"><i class="fa fa-shopping-bag me-2 text-primary"></i><%=language.getString("view_details")%></a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>      
            </div>
        </div>
        <!-- Fruits Shop End-->







        <%@ include file="./master/foot.jsp" %>
    </body>
</html>
