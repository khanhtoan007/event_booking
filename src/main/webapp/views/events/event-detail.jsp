<%@ page import="com.example.bookingevent.Init.Config" %>
<%@ page import="java.util.ResourceBundle" %>
<%@ page import="com.example.bookingevent.database.MyObject" %>
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

    <!-- Fancyboxt -->
    <script src="https://cdn.jsdelivr.net/npm/@fancyapps/ui@5.0/dist/fancybox/fancybox.umd.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fancyapps/ui@5.0/dist/fancybox/fancybox.css" />
</head>

<body>
        <%@ include file="../master/head.jsp" %>
<!-- Single Page Header start -->

<div class="container-fluid page-header py-5" style="background: linear-gradient(rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.3)), url(/images/IMG_3098.JPG);">
    <h1 class="text-center text-white display-6">Shop Detail</h1>
    <ol class="breadcrumb justify-content-center mb-0">
        <li class="breadcrumb-item"><a href="#">Home</a></li>
        <li class="breadcrumb-item"><a href="#">Pages</a></li>
        <li class="breadcrumb-item active text-white">Shop Detail</li>
    </ol>
</div>
<!-- Single Page Header End -->


        <!-- Single Product Start -->
        <div class="container-fluid py-5">
            <div class="container py-5">
                <div class="row g-4 mb-5">
                    <div class="col-lg-8 col-xl-9" id="eventDetails" data-userid="<%= session.getAttribute("user_id") %>" data-eventid="${event.id}" data-price="${event.price}">
                        <div class="row g-4">
                            <div class="col-lg-12">
                                <div class="border rounded">
                                    <img src="images/${otherImages.get(0)}" class="img-fluid rounded" style="max-height: 390px;" alt="Image">
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <h4 class="fw-bold mb-3">${event.title}</h4>
                                <div class="d-flex align-items-center mb-2">
                                    <i class="far fa-clock me-2"></i>
                                    <h6>Khung giờ hoạt động: ${event.start_date} - ${event.end_date}</h6>
                                </div>
                                <div class="d-flex align-items-start mb-2 text-left">
                                    <i class="fas fa-map-marker-alt me-2 mt-1"></i>
                                    <h6>${event.location}</h6>
                                </div>
                                <div class="d-flex align-items-start mb-2 text-left" style="padding-left: 20px;">
                                    <p></p>
                                </div>
                            </div>

                            <div class="col-lg-12">
                                <nav>
                                    <div class="nav nav-tabs mb-3">
                                        <button class="nav-link active border-white border-bottom-0" type="button" role="tab"
                                                id="nav-ticket-tab" data-bs-toggle="tab" data-bs-target="#nav-ticket"
                                                aria-controls="nav-ticket" aria-selected="true">Thông tin vé</button>
                                        <button class="nav-link border-white border-bottom-0" type="button" role="tab"
                                                id="nav-about-tab" data-bs-toggle="tab" data-bs-target="#nav-about"
                                                aria-controls="nav-about" aria-selected="true">Giới thiệu</button>
                                        <button class="nav-link border-white border-bottom-0" type="button" role="tab"
                                                id="nav-mission-tab" data-bs-toggle="tab" data-bs-target="#nav-mission"
                                                aria-controls="nav-mission" aria-selected="false">Đánh giá</button>
                                    </div>
                                </nav>
                                <div class="tab-content mb-5">
                                    <div class="tab-pane active" id="nav-ticket" role="tabpanel" aria-labelledby="nav-ticket-tab">
                                        <p>${event.content}</p>
                                    </div>
                                    <div class="tab-pane" id="nav-about" role="tabpanel" aria-labelledby="nav-about-tab">
                                        <div class="row text-center text-lg-start">
                                            <c:forEach items="${otherImages}" var="i" begin="1">
                                                <div class="col-lg-3 col-md-4 col-6">
                                                    <a href="images/${i}"  data-fancybox="gallery" class="d-block mb-4 h-100">
                                                        <img class="img-fluid img-thumbnail" src="images/${i}" style="max-height: 150px; width: -webkit-fill-available;">
                                                    </a>
                                                </div>
                                            </c:forEach>
                                            <!-- <div class="col-lg-3 col-md-4 col-6">
                                                <a href="https://source.unsplash.com/aob0ukAYfuI/400x300" data-fancybox="gallery" class="d-block mb-4 h-100">
                                                    <img class="img-fluid img-thumbnail" src="https://source.unsplash.com/aob0ukAYfuI/400x300" alt="">
                                                </a>
                                            </div> -->
                                        </div>

                                        <p>${event.content} </p>

                                    </div>
                                    <div class="tab-pane" id="nav-mission" role="tabpanel" aria-labelledby="nav-mission-tab">

                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>

                    <!-- Cart  -->
                    <div class="col-lg-4 col-xl-3 mx-auto" >
                        <div class="bg-light rounded border border-dark d-flex flex-column align-items-center" style="position: sticky; top: 120px; z-index: 99;">
                            <form action="${pageContext.request.contextPath}/user/add_to_cart" method="post">

                                <div class="m-3">
                                    <h4 class="fw-bold mb-3 mt-3 ml-2 border-bottom border-secondary pb-4 text-left">${event.title}</h4>
                                    <div class="d-flex align-items-center mb-2">
                                        <i class="far fa-clock me-2"></i>
                                        <span>${event.start_date} - ${event.end_date}</span>
                                    </div>
                                    <div class="d-flex align-items-start mb-2 border-bottom border-secondary pb-4 text-left">
                                        <i class="fas fa-map-marker-alt me-2 mt-1"></i>
                                        <span>${event.location}</span>
                                    </div>

                                    <div class="d-flex justify-content-center align-items-center flex-column">
                                        <h5 class="fw-bold mb-3">${event.price} VND</h5>

                                        <div class="input-group quantity mb-3" style="width: 100px;">
                                            <div class="input-group-btn">
                                                <button type="button" class="btn btn-sm btn-minus rounded-circle bg-light border" onclick="decrementQuantity()">
                                                    <i class="fa fa-minus"></i>
                                                </button>
                                            </div>
                                            <input required type="text" name="quantity" id="quantityValue" class="form-control form-control-sm text-center border-0" value="1">
                                            <div class="input-group-btn">
                                                <button type="button" class="btn btn-sm btn-plus rounded-circle bg-light border" onclick="incrementQuantity()">
                                                    <i class="fa fa-plus"></i>
                                                </button>
                                            </div>
                                        </div>
                                        <%String s = "type='button' onclick=please_login()";%>
                                        <input type="hidden" name="event_id" value="${event.id}">
                                        <a href="#" class="btn border border-secondary rounded-pill px-4 py-2 mb-2 mt-3 text-danger align-items-center"><i class="fas fa-ticket-alt me-2 text-danger"></i> Mua ngay</a>
                                        <button class="btn border border-secondary rounded-pill px-4 py-2 mb-3 text-primary align-items-center" <%=user_id == null ? s : "type='submit'"%><i class="fa fa-shopping-bag me-2 text-primary"></i> <%=language.getString("add2cart")%></button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <h1 class="fw-bold mb-0">Các sự kiện khác</h1>
                <div class="vesitable">
                    <div class="owl-carousel vegetable-carousel justify-content-center">
                        <div class="border border-primary rounded position-relative vesitable-item">
                            <div class="vesitable-img">
                                <img src="https://i.ibb.co/hZN0xbh/LangLua.png" class="img-fluid rounded-top" style="width: 303px; height: 242px;" alt="">
                            </div>
                            <!-- <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px; right: 10px;">Vegetable</div> -->
                            <div class="p-4 pb-0 rounded-bottom">
                                <h4>Làng lụa </h4>
                                <p>8:00 - 21:00, từ thứ 2 đến Chủ nhật</p>
                                <div class="d-flex justify-content-between flex-lg-wrap">
                                    <p class="text-dark fs-5 fw-bold">299.000 VND</p>
                                    <a href="${pageContext.request.contextPath}/event-detail?event_id=16" class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Xem chi tiết</a>
                                </div>
                            </div>
                        </div>
                        <div class="border border-primary rounded position-relative vesitable-item">
                            <div class="vesitable-img">
                                <img src="https://i.ibb.co/8dQzzk9/KimBong.png" class="img-fluid rounded-top" style="width: 303px; height: 242px;" alt="">
                            </div>
                            <!-- <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px; right: 10px;">Vegetable</div> -->
                            <div class="p-4 pb-0 rounded-bottom">
                                <h4>Làng mộc Kim Bồng</h4>
                                <p>Cả ngày, từ thứ 2 đến Chủ nhật</p>
                                <div class="d-flex justify-content-between flex-lg-wrap">
                                    <p class="text-dark fs-5 fw-bold">Miễn phí</p>
                                    <a href="${pageContext.request.contextPath}/event-detail?event_id=1" class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Xem chi tiết</a>
                                </div>
                            </div>
                        </div>
                        <div class="border border-primary rounded position-relative vesitable-item">
                            <div class="vesitable-img">
                                <img src="https://i.ibb.co/12R3ZTR/Tra-Que-Organic.png" class="img-fluid rounded-top" style="width: 303px; height: 242px;" alt="">
                            </div>
                            <!-- <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px; right: 10px;">Vegetable</div> -->
                            <div class="p-4 pb-0 rounded-bottom">
                                <h4>Tra que Organic Cooking class</h4>
                                <p>8h00 - 17h00</p>
                                <div class="d-flex justify-content-between flex-lg-wrap">
                                    <p class="text-dark fs-5 fw-bold">650.000 VND</p>
                                    <a href="${pageContext.request.contextPath}/event-detail?event_id=12" class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Xem chi tiết</a>
                                </div>
                            </div>
                        </div>
                        <div class="border border-primary rounded position-relative vesitable-item">
                            <div class="vesitable-img">
                                <img src="https://i.ibb.co/MgZRr54/ThanhHa.png" class="img-fluid rounded-top" style="width: 303px; height: 242px;" alt="">
                            </div>
                            <!-- <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px; right: 10px;">Vegetable</div> -->
                            <div class="p-4 pb-0 rounded-bottom">
                                <h4>Làng gốm Thanh Hà</h4>
                                <p>8h30 - 16h30</p>
                                <div class="d-flex justify-content-between flex-lg-wrap">
                                    <p class="text-dark fs-5 fw-bold">50.000 VND</p>
                                    <a href="${pageContext.request.contextPath}/event-detail?event_id=15" class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Xem chi tiết</a>
                                </div>
                            </div>
                        </div>
                        <div class="border border-primary rounded position-relative vesitable-item">
                            <div class="vesitable-img">
                                <!-- update src img cho ni cho t voi -->
                                <img src="" class="img-fluid rounded-top" style="width: 303px; height: 242px;" alt="">
                            </div>
                            <!-- <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px; right: 10px;">Vegetable</div> -->
                            <div class="p-4 pb-0 rounded-bottom">
                                <h4>Lồng đèn Hội An</h4>
                                <p>8h30 - 16h30</p>
                                <div class="d-flex justify-content-between flex-lg-wrap">
                                    <p class="text-dark fs-5 fw-bold">100.000 VND</p>
                                    <a href="${pageContext.request.contextPath}/event-detail?event_id=11" class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Xem chi tiết</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Single Product End -->

        <script>
            let quantityValue = 1; // initial value

            function incrementQuantity() {
                quantityValue++;
                updateQuantityDisplay();
            }

            function decrementQuantity() {
                if (quantityValue > 1) {
                    quantityValue--;
                    updateQuantityDisplay();
                }
            }

            function updateQuantityDisplay() {
                document.getElementById("quantityValue").innerText = quantityValue;
            }
            function please_login(){
                toastr.warning("<%=language.getString("please_login")%>")
            }
        </script>

<%@ include file="../master/foot.jsp" %>