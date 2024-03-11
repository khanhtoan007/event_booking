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
</head>

<body>

<%@ include file="./master/head.jsp" %>

<!-- Banner Section Start-->
<div class="container-fluid banner bg-secondary my-5 py-5">
    <div class="container py-5 mt-5">
        <div class="row g-4 align-items-center">
            <div class="col-lg-6">
                <div class="py-4">
                    <h1 class="display-3 text-white">About Us</h1>
                    <p class="fw-normal display-3 text-dark mb-4">Local Explorer</p>
                    <p class="mb-4 text-dark">Chào mừng đến với Local Xplorer - Nền tảng đặt vé trải nghiệm những làng nghề truyền thống tại Hội An!</p>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="position-relative">
                    <img src="../assets/img/Xplorer/logo.png" class="img-fluid w-100 rounded" alt="">
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Banner Section End -->


<!-- Featurs Section Start -->
<div class="container-fluid featurs py-5 ">
    <div class="container py-5">
        <div class="row g-4">
            <div class="col-md-6 col-lg-4">
                <div class="featurs-item text-center rounded bg-light p-4">
                    <div class="featurs-icon btn-square rounded-circle bg-secondary mb-5 mx-auto">
                        <i class="fas fa-users fa-3x text-white"></i>
                    </div>
                    <div class="featurs-content text-center">
                        <h5>Giới thiệu</h5>
                        <p class="mb-0">Chúng tôi tự hào là đội ngũ đứng đằng sau sứ mệnh kết nối du khách với những trải nghiệm tuyệt vời và độc đáo trong những làng nghề truyền thống tại Hội An - một thành phố cổ kính, nổi tiếng với văn hóa độc đáo và sự pha trộn của lịch sử.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-4">
                <div class="featurs-item text-center rounded bg-light p-4">
                    <div class="featurs-icon btn-square rounded-circle bg-secondary mb-5 mx-auto">
                        <i class="fas fa-bullseye fa-3x text-white"></i>
                    </div>
                    <div class="featurs-content text-center">
                        <h5>Nhiệm vụ</h5>
                        <p class="mb-0">Với cam kết mang đến trải nghiệm tuyệt vời và những kí ức tươi đẹp cho khách hàng, chúng tôi đã tạo ra một nền tảng đặt vé đơn giản, linh hoạt và tiện lợi. Chúng tôi hợp tác chặt chẽ với cộng đồng địa phương để đảm bảo bạn có được những trải nghiệm chân thực, tận hưởng sự độc đáo của mỗi làng nghề, nhận được sự chia sẻ chân thành về nghệ thuật truyền thống và cuộc sống hàng ngày.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-4">
                <div class="featurs-item text-center rounded bg-light p-4">
                    <div class="featurs-icon btn-square rounded-circle bg-secondary mb-5 mx-auto">
                        <i class="fas fa-eye fa-3x text-white"></i>
                    </div>
                    <div class="featurs-content text-center">
                        <h5>Tầm nhìn</h5>
                        <p class="mb-0">Đồng hành cùng chúng tôi, bạn không chỉ có cơ hội khám phá những bí mật ẩn sau những ngôi làng nghề tuyệt vời, mà còn ủng hộ sự phát triển bền vững của cộng đồng địa phương. Mỗi tấm vé mà bạn mua không chỉ là một giao dịch, mà là một đóng góp vào việc bảo tồn và phát triển văn hóa truyền thống.</p>
                        <p class="mb-0">Hãy để chúng tôi là điểm xuất phát cho những chuyến phiêu lưu đầy ý nghĩa và đắm chìm trong sự huyền bí của Hội An. Cùng chúng tôi khám phá những câu chuyện và bí mật của những nghệ nhân tài năng, những bức tranh lịch sử và văn hóa độc đáo mỗi khi bạn bước chân vào một làng nghề mới.</p>
                        <p class="mb-0">Chúng tôi mong muốn được kết nối bạn với những trải nghiệm đặc sắc nhất tại Hội An. Xin chân thành cảm ơn bạn đã chọn chúng tôi làm đối tác du lịch trong hành trình của mình!</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Featurs Section End -->


<!-- Contact Start -->
<div class="container-fluid contact">
    <div class="container">
        <div class="p-5 bg-light rounded">
            <div class="row g-4">
                <div class="col-12">
                    <div class="text-center mx-auto" style="max-width: 700px;">
                        <h1 class="display-4 text-primary">Contact us</h1>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="d-flex p-4 rounded mb-4 bg-white">
                                <i class="fas fa-envelope fa-2x text-primary me-4"></i>
                                <div>
                                    <h4>Mail Us</h4>
                                    <p class="mb-2">localxplorervn@gmail.com</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="d-flex p-4 rounded bg-white">
                                <i class="fa fa-phone-alt fa-2x text-primary me-4"></i>
                                <div>
                                    <h4>Telephone</h4>
                                    <p class="mb-2">+84 913 827 180</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Contact End -->


<%@ include file="/views/master/foot.jsp" %>


