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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css"
              integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g=="
              crossorigin="anonymous" referrerpolicy="no-referrer"/>
    </head>

    <body>
    
        <jsp:include page="./master/head.jsp"/>


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
<%--                                --%>
<%--                                <li class="nav-item">--%>
<%--                                    <a class="d-flex m-2 py-2 bg-light rounded-pill" data-bs-toggle="pill" href="#tab-3">--%>
<%--                                        <span class="text-dark" style="width: 130px;">Fruits</span>--%>
<%--                                    </a>--%>
<%--                                </li>--%>
<%--                                <li class="nav-item">--%>
<%--                                    <a class="d-flex m-2 py-2 bg-light rounded-pill" data-bs-toggle="pill" href="#tab-4">--%>
<%--                                        <span class="text-dark" style="width: 130px;">Bread</span>--%>
<%--                                    </a>--%>
<%--                                </li>--%>
<%--                                <li class="nav-item">--%>
<%--                                    <a class="d-flex m-2 py-2 bg-light rounded-pill" data-bs-toggle="pill" href="#tab-5">--%>
<%--                                        <span class="text-dark" style="width: 130px;">Meat</span>--%>
<%--                                    </a>--%>
<%--                                </li>--%>
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
                                                <div class="rounded position-relative fruite-item">
                                                    <div class="fruite-img">
                                                        <img src="${pageContext.request.contextPath}${event.image}" class="img-fluid w-100 rounded-top" alt="">
                                                    </div>
                                                    <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">${event.category_name}</div>
                                                    <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                        <h4>${event.title}</h4>
                                                        <p>${event.content}</p>
                                                        <div class="d-flex justify-content-between flex-lg-wrap">
                                                            <p class="text-dark fs-5 fw-bold mb-0">${event.price}VND</p>
                                                            <a href="${pageContext.request.contextPath}/event-detail?event_id=${event.id}" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i><%=language.getString("view_details")%></a>
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


        <!-- Featurs Start -->
        <div class="container-fluid service py-5">
            <div class="container py-5">
                <div class="row g-4 justify-content-center">
                    <div class="col-md-6 col-lg-4" >
                        <a href="#">
                            <div class="service-item bg-secondary rounded border border-secondary" style="height: 440px">
                                <img src="${pageContext.request.contextPath}/assets/img/langgom.jpg" class="img-fluid rounded-top w-100" alt="">
                                <div class="px-4 rounded-bottom">
                                    <div class="service-content bg-primary text-center p-4 rounded">
                                        <h5 class="text-white">Daily Event</h5>
                                        <h3 class="mb-0">5% OFF</h3>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-6 col-lg-4" >
                        <a href="#">
                            <div class="service-item bg-dark rounded border border-dark" style="height: 440px">
                                <img src="${pageContext.request.contextPath}/assets/img/langgom.jpg" class="img-fluid rounded-top w-100" alt="">
                                <div class="px-4 rounded-bottom">
                                    <div class="service-content bg-light text-center p-4 rounded">
                                        <h5 class="text-primary">Reputation</h5>
                                        <h3 class="mb-0">Free to use</h3>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-6 col-lg-4" >
                        <a href="#">
                            <div class="service-item bg-primary rounded border border-primary" style="height: 440px">
                                <img src="${pageContext.request.contextPath}/avatars/langgom.jpg" class="img-fluid rounded-top w-100" alt="">
                                <div class="px-4 rounded-bottom">
                                    <div class="service-content bg-secondary text-center p-4 rounded">
                                        <h5 class="text-white">Exotic Event</h5>
                                        <h3 class="mb-0">Alway Up to Date</h3>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Featurs End -->


        <!-- Vesitable Shop Start-->
        <div class="container-fluid vesitable py-5">
            <div class="container py-5">
                <h1 class="mb-0">Làng lụa</h1>
                <div class="owl-carousel vegetable-carousel justify-content-center">
                    <div class="border border-primary rounded position-relative vesitable-item">
                        <div class="vesitable-img">
                            <img src="${pageContext.request.contextPath}/assets/img/langlua/IMG_3077.JPG" class="img-fluid w-100 rounded-top" alt="">
                        </div>
                        <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px; right: 10px;">Workshop</div>
                        <div class="p-4 rounded-bottom">
                            <h4>Làng lụa</h4>
                            <p>Trải nghiệm tham quan làng lụa tại Hội An</p>
                            <div class="d-flex justify-content-between flex-lg-wrap">
                                <p class="text-dark fs-5 fw-bold mb-0">35000VND</p>
                                <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Vesitable Shop End -->




        <!-- Bestsaler Product Start -->
            <!--
<div class="container-fluid py-5">
<div class="container py-5">
<div class="text-center mx-auto mb-5" style="max-width: 700px;">
<h1 class="display-4">Bestseller Products</h1>
<p>Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable.</p>
</div>
<div class="row g-4">
<div class="col-lg-6 col-xl-4">
<div class="p-4 rounded bg-light">
<div class="row align-items-center">
<div class="col-6">
<img src="${pageContext.request.contextPath}/assets/img/best-product-1.jpg" class="img-fluid rounded-circle w-100" alt="">
</div>
<div class="col-6">
<a href="#" class="h5">Organic Tomato</a>
<div class="d-flex my-3">
<i class="fas fa-star text-primary"></i>
<i class="fas fa-star text-primary"></i>
<i class="fas fa-star text-primary"></i>
<i class="fas fa-star text-primary"></i>
<i class="fas fa-star"></i>
</div>
<h4 class="mb-3">3.12 $</h4>
<a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
</div>
</div>
</div>
</div>
<div class="col-lg-6 col-xl-4">
<div class="p-4 rounded bg-light">
<div class="row align-items-center">
<div class="col-6">
<img src="${pageContext.request.contextPath}/assets/img/best-product-2.jpg" class="img-fluid rounded-circle w-100" alt="">
</div>
<div class="col-6">
<a href="#" class="h5">Organic Tomato</a>
<div class="d-flex my-3">
<i class="fas fa-star text-primary"></i>
<i class="fas fa-star text-primary"></i>
<i class="fas fa-star text-primary"></i>
<i class="fas fa-star text-primary"></i>
<i class="fas fa-star"></i>
</div>
<h4 class="mb-3">3.12 $</h4>
<a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
</div>
</div>
</div>
</div>
<div class="col-lg-6 col-xl-4">
<div class="p-4 rounded bg-light">
<div class="row align-items-center">
<div class="col-6">
<img src="${pageContext.request.contextPath}/assets/img/best-product-3.jpg" class="img-fluid rounded-circle w-100" alt="">
</div>
<div class="col-6">
<a href="#" class="h5">Organic Tomato</a>
<div class="d-flex my-3">
<i class="fas fa-star text-primary"></i>
<i class="fas fa-star text-primary"></i>
<i class="fas fa-star text-primary"></i>
<i class="fas fa-star text-primary"></i>
<i class="fas fa-star"></i>
</div>
<h4 class="mb-3">3.12 $</h4>
<a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
</div>
</div>
</div>
</div>
<div class="col-lg-6 col-xl-4">
<div class="p-4 rounded bg-light">
<div class="row align-items-center">
<div class="col-6">
<img src="${pageContext.request.contextPath}/assets/img/best-product-4.jpg" class="img-fluid rounded-circle w-100" alt="">
</div>
<div class="col-6">
<a href="#" class="h5">Organic Tomato</a>
<div class="d-flex my-3">
<i class="fas fa-star text-primary"></i>
<i class="fas fa-star text-primary"></i>
<i class="fas fa-star text-primary"></i>
<i class="fas fa-star text-primary"></i>
<i class="fas fa-star"></i>
</div>
<h4 class="mb-3">3.12 $</h4>
<a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
</div>
</div>
</div>
</div>
<div class="col-lg-6 col-xl-4">
<div class="p-4 rounded bg-light">
<div class="row align-items-center">
<div class="col-6">
<img src="${pageContext.request.contextPath}/assets/img/best-product-5.jpg" class="img-fluid rounded-circle w-100" alt="">
</div>
<div class="col-6">
<a href="#" class="h5">Organic Tomato</a>
<div class="d-flex my-3">
<i class="fas fa-star text-primary"></i>
<i class="fas fa-star text-primary"></i>
<i class="fas fa-star text-primary"></i>
<i class="fas fa-star text-primary"></i>
<i class="fas fa-star"></i>
</div>
<h4 class="mb-3">3.12 $</h4>
<a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
</div>
</div>
</div>
</div>
<div class="col-lg-6 col-xl-4">
<div class="p-4 rounded bg-light">
<div class="row align-items-center">
<div class="col-6">
<img src="${pageContext.request.contextPath}/assets/img/best-product-6.jpg" class="img-fluid rounded-circle w-100" alt="">
</div>
<div class="col-6">
<a href="#" class="h5">Organic Tomato</a>
<div class="d-flex my-3">
<i class="fas fa-star text-primary"></i>
<i class="fas fa-star text-primary"></i>
<i class="fas fa-star text-primary"></i>
<i class="fas fa-star text-primary"></i>
<i class="fas fa-star"></i>
</div>
<h4 class="mb-3">3.12 $</h4>
<a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
</div>
</div>
</div>
</div>
<div class="col-md-6 col-lg-6 col-xl-3">
<div class="text-center">
<img src="${pageContext.request.contextPath}/assets/img/fruite-item-1.jpg" class="img-fluid rounded" alt="">
<div class="py-4">
<a href="#" class="h5">Organic Tomato</a>
<div class="d-flex my-3 justify-content-center">
<i class="fas fa-star text-primary"></i>
<i class="fas fa-star text-primary"></i>
<i class="fas fa-star text-primary"></i>
<i class="fas fa-star text-primary"></i>
<i class="fas fa-star"></i>
</div>
<h4 class="mb-3">3.12 $</h4>
<a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
</div>
</div>
</div>
<div class="col-md-6 col-lg-6 col-xl-3">
<div class="text-center">
<img src="${pageContext.request.contextPath}/assets/img/fruite-item-2.jpg" class="img-fluid rounded" alt="">
<div class="py-4">
<a href="#" class="h5">Organic Tomato</a>
<div class="d-flex my-3 justify-content-center">
<i class="fas fa-star text-primary"></i>
<i class="fas fa-star text-primary"></i>
<i class="fas fa-star text-primary"></i>
<i class="fas fa-star text-primary"></i>
<i class="fas fa-star"></i>
</div>
<h4 class="mb-3">3.12 $</h4>
<a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
</div>
</div>
</div>
<div class="col-md-6 col-lg-6 col-xl-3">
<div class="text-center">
<img src="${pageContext.request.contextPath}/assets/img/fruite-item-3.jpg" class="img-fluid rounded" alt="">
<div class="py-4">
<a href="#" class="h5">Organic Tomato</a>
<div class="d-flex my-3 justify-content-center">
<i class="fas fa-star text-primary"></i>
<i class="fas fa-star text-primary"></i>
<i class="fas fa-star text-primary"></i>
<i class="fas fa-star text-primary"></i>
<i class="fas fa-star"></i>
</div>
<h4 class="mb-3">3.12 $</h4>
<a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
</div>
</div>
</div>
<div class="col-md-6 col-lg-6 col-xl-3">
<div class="text-center">
<img src="${pageContext.request.contextPath}/assets/img/fruite-item-4.jpg" class="img-fluid rounded" alt="">
<div class="py-2">
<a href="#" class="h5">Organic Tomato</a>
<div class="d-flex my-3 justify-content-center">
<i class="fas fa-star text-primary"></i>
<i class="fas fa-star text-primary"></i>
<i class="fas fa-star text-primary"></i>
<i class="fas fa-star text-primary"></i>
<i class="fas fa-star"></i>
</div>
<h4 class="mb-3">3.12 $</h4>
<a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
</div>
</div>
</div>
</div>
</div>
</div>

-->
        <!-- Bestsaler Product End -->




        <!-- Tastimonial Start -->
        <div class="container-fluid testimonial py-5">
            <div class="container py-5">
                <div class="testimonial-header text-center">
                    <h4 class="text-primary">Our Testimonial</h4>
                    <h1 class="display-5 mb-5 text-dark">Our Client Saying!</h1>
                </div>
                <div class="owl-carousel testimonial-carousel">
                    <div class="testimonial-item img-border-radius bg-light rounded p-4">
                        <div class="position-relative">
                            <i class="fa fa-quote-right fa-2x text-secondary position-absolute" style="bottom: 30px; right: 0;"></i>
                            <div class="mb-4 pb-4 border-bottom border-secondary">
                                <p class="mb-0">Cần phát triển thêm nữa!
                                </p>
                            </div>
                            <div class="d-flex align-items-center flex-nowrap">
                                <div class="bg-secondary rounded">
                                    <img src="${pageContext.request.contextPath}/assets/img/testimonial-1.jpg" class="img-fluid rounded" style="width: 100px; height: 100px;" alt="">
                                </div>
                                <div class="ms-4 d-block">
                                    <h4 class="text-dark">Nathan</h4>
                                    <p class="m-0 pb-3">Profession</p>
                                    <div class="d-flex pe-5">
                                        <i class="fas fa-star text-primary"></i>
                                        <i class="fas fa-star text-primary"></i>
                                        <i class="fas fa-star text-primary"></i>
                                        <i class="fas fa-star text-primary"></i>
                                        <i class="fas fa-star"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="testimonial-item img-border-radius bg-light rounded p-4">
                        <div class="position-relative">
                            <i class="fa fa-quote-right fa-2x text-secondary position-absolute" style="bottom: 30px; right: 0;"></i>
                            <div class="mb-4 pb-4 border-bottom border-secondary">
                                <p class="mb-0">Website không tệ đối với sinh viên
                                </p>
                            </div>
                            <div class="d-flex align-items-center flex-nowrap">
                                <div class="bg-secondary rounded">
                                    <img src="${pageContext.request.contextPath}/assets/img/avatar.jpg" class="img-fluid rounded" style="width: 100px; height: 100px;" alt="">
                                </div>
                                <div class="ms-4 d-block">
                                    <h4 class="text-dark">Senior Tuan</h4>
                                    <p class="m-0 pb-3">Profession</p>
                                    <div class="d-flex pe-5">
                                        <i class="fas fa-star text-primary"></i>
                                        <i class="fas fa-star text-primary"></i>
                                        <i class="fas fa-star text-primary"></i>
                                        <i class="fas fa-star text-primary"></i>
                                        <i class="fas fa-star text-primary"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="testimonial-item img-border-radius bg-light rounded p-4">
                        <div class="position-relative">
                            <i class="fa fa-quote-right fa-2x text-secondary position-absolute" style="bottom: 30px; right: 0;"></i>
                            <div class="mb-4 pb-4 border-bottom border-secondary">
                                <p class="mb-0">Có cố gắng, tiếp tục phát huy, đề tài kinh tế tiềm năng
                                </p>
                            </div>
                            <div class="d-flex align-items-center flex-nowrap">
                                <div class="bg-secondary rounded">
                                    <img src="${pageContext.request.contextPath}/assets/img/avatar.jpg" class="img-fluid rounded" style="width: 100px; height: 100px;" alt="">
                                </div>
                                <div class="ms-4 d-block">
                                    <h4 class="text-dark">Nguyen Dinh Duc</h4>
                                    <p class="m-0 pb-3">CEO of Babylon</p>
                                    <div class="d-flex pe-5">
                                        <i class="fas fa-star text-primary"></i>
                                        <i class="fas fa-star text-primary"></i>
                                        <i class="fas fa-star text-primary"></i>
                                        <i class="fas fa-star text-primary"></i>
                                        <i class="fas fa-star text-primary"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Tastimonial End -->



<%@ include file="/views/master/foot.jsp" %>
