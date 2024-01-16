<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>New Event</title>
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
        <link href="assets/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
        <link href="assets/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


        <!-- Customized Bootstrap Stylesheet -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="assets/css/style.css" rel="stylesheet">
    </head>

    <body>

        <jsp:include page="../master/head.jsp"/>


        <!-- Single Page Header start -->
        <div class="container-fluid page-header py-5" style="background: linear-gradient(rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.3)), url(assets/img/Xplorer/real_long_den/IMG_3098.JPG);">
            <h1 class="text-center text-white display-6">Chi tiết sự kiện</h1>
            <ol class="breadcrumb justify-content-center mb-0">
                <li class="breadcrumb-item"><a href="#">Trang chủ</a></li>
                <li class="breadcrumb-item"><a href="#">Danh sách sự kiện</a></li>
                <li class="breadcrumb-item active text-white">Tạo sự kiện</li>
            </ol>
        </div>
        <!-- Single Page Header End -->


        <!-- Checkout Page Start -->
        <div class="container-fluid py-5">
            <div class="container py-5">
                <h1 class="mb-4">Thêm sự kiện mới</h1>
                <form action="#">
                    <div class="row g-5">
                        <div class="col-md-12 col-lg-12 col-xl-12">
                            <div class="row">
                                <div class="col-md-12 col-lg-12">
                                    <div class="form-item w-100">
                                        <label class="form-label my-3">Tiêu đề<sup>*</sup></label>
                                        <input type="text" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-3">
                                    <div class="form-item">
                                        <label class="form-label my-3">Ảnh bìa<sup>*</sup></label>
                                        <input class="form-control" type="file" id="formFile">
                                    </div>
                                </div>
                                <div class="col-3">
                                    <div class="form-item">
                                        <label class="form-label my-3">Ngày bắt đầu<sup>*</sup></label>
                                        <input type="text" class="form-control">
                                    </div>
                                </div>
                                <div class="col-3">
                                    <div class="form-item">
                                        <label class="form-label my-3">Ngày kết thúc<sup>*</sup></label>
                                        <input type="text" class="form-control">
                                    </div>
                                </div>
                                <div class="col-3">
                                    <div class="form-item">
                                        <label class="form-label my-3">Danh mục<sup>*</sup></label>
                                        <select class="form-select" aria-label="Default select example">
                                            <option selected>Open this select menu</option>
                                            <option value="1">One</option>
                                            <option value="2">Two</option>
                                            <option value="3">Three</option>
                                          </select>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="form-item">
                                <label class="form-label my-3">Địa chỉ <sup>*</sup></label>
                                <input type="text" class="form-control" placeholder="Nhập vào địa chỉ">
                            </div>

                            <div class="row">
                                <div class="col-4">
                                    <div class="form-item">
                                        <label class="form-label my-3">Số vé<sup>*</sup></label>
                                        <input type="number" class="form-control">
                                    </div>
                                </div>
                                <div class="col-4">
                                    <div class="form-item">
                                        <label class="form-label my-3">Giá<sup>*</sup></label>
                                        <div class="input-group">
                                            <input type="text" class="form-control" placeholder="Giá vé" aria-label="Giá vé" aria-describedby="basic-addon2">
                                            <span class="input-group-text" id="basic-addon2">VND</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
 
                            <div class="form-item">
                                <label class="form-label my-3">Nội dung<sup>*</sup></label>
                                <textarea name="text" class="form-control" spellcheck="false" cols="30" rows="11" placeholder=""></textarea>
                            </div>
                        
  
                            <hr class="my-3">

                            <div class="text-end">
                                <button type="submit" class="btn btn-primary border-2 border-secondary py-3 px-4 rounded-pill text-white" style="">Submit Now</button>
                            </div>
                        </div>

                    </div>
                </form>
            </div>
        </div>
        <!-- Checkout Page End -->


        <jsp:include page="../master/foot.jsp"/>
    </body>

</html>