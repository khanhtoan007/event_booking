<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Event Detail</title>
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
                <li class="breadcrumb-item active text-white">Chi tiết sự kiện</li>
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
                                        <img src="assets/img/Xplorer/LongDenHungAn.png" class="img-fluid rounded" style="max-height: 390px;" alt="Image">
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <h4 class="fw-bold mb-3">Tham quan và trải nghiệm Làng lồng đèn Hưng An</h4>
                                <div class="d-flex align-items-center mb-2">
                                    <i class="far fa-clock me-2"></i>
                                    <h6>Khung giờ hoạt động: 9h00 - 21h00</h6>
                                </div>
                                <div class="d-flex align-items-start mb-2 text-left">
                                    <i class="fas fa-map-marker-alt me-2 mt-1"></i>
                                    <h6>Hội An</h6>
                                </div>
                                <div class="d-flex align-items-start mb-2 text-left" style="padding-left: 20px;">
                                    <p>63 Nguyễn Thị Minh Khai, Phường Minh An, Hội An, Quảng Nam</p>
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
                                        <p>Giá vé: 100.000 VND/ người bao gồm 1 suất tham gia làm lồng đèn, du khách có thể mang chiếc lồng đèn thành phẩm của mình 
                                            về như một món quà kỷ niệm. </p>
                                    </div>
                                    <div class="tab-pane" id="nav-about" role="tabpanel" aria-labelledby="nav-about-tab">
                                        <p>Làng gốm Thanh Hà, hùng vĩ và tráng lệ, đã chôn chặt bí mật nghề truyền thống của mình trong quá 500 năm. 
                                            Không chỉ là nơi sản sinh những sản phẩm gốm độc đáo, làng này còn là nơi quy tụ tinh hoa văn hóa và lịch sử bền vững 
                                            của người Việt Nam. Trải qua những ngày tháng đầy gian khổ, nghề gốm Thanh Hà vẫn là nguồn sống kiên cường, nơi những đôi bàn 
                                            tay tài năng và kiên trì vẫn duy trì và phát triển nghệ thuật độc đáo này. </p>
                                        <p>Những tác phẩm gốm tinh tế và tỉ mỉ chứng tỏ bản thân quá trình tạo ra chúng lại là một cuộc thách thức đầy thử thách. 
                                            Đòi hỏi sự khéo léo và kỹ thuật tinh tế, những đôi bàn tay của người nghệ nhân là nguồn cảm hứng vô tận cho những tác phẩm 
                                            tuyệt vời.</p>
                                        <p>Đặc biệt, đa phần những người nghệ nhân này đều là con cháu của những người tiền bối, được truyền nghề từ đời này sang đời khác. 
                                            Đồng thời, với sự sáng tạo cá nhân, họ đã khắc sâu dấu ấn văn hóa vào từng sản phẩm, đưa làng gốm Thanh Hà lên tầm cao mới. 
                                            Những thành tựu đỉnh cao này không chỉ thu hút sự chú ý quốc tế mà còn giúp họ đoạt lấy danh hiệu 
                                            "Thợ thủ công hàng đầu" tại làng gốm Thanh Hà, như một minh chứng rực rỡ cho bản năng và tâm huyết của họ.</p>
                                    </div>
                                    <div class="tab-pane" id="nav-mission" role="tabpanel" aria-labelledby="nav-mission-tab">
                                        
                                    </div>
                                    <div class="tab-pane" id="nav-vision" role="tabpanel">
                                        <p class="text-dark">Tempor erat elitr rebum at clita. Diam dolor diam ipsum et tempor sit. Aliqu diam
                                            amet diam et eos labore. 3</p>
                                        <p class="mb-0">Diam dolor diam ipsum et tempor sit. Aliqu diam amet diam et eos labore.
                                            Clita erat ipsum et lorem et sit</p>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    
                    <!-- Cart  -->
                    <div class="col-lg-4 col-xl-3 mx-auto" >
                        <div class="bg-light rounded border border-dark d-flex flex-column align-items-center" style="position: sticky; top: 120px; z-index: 99;">
                            <div class="m-3">
                                <h4 class="fw-bold mb-3 mt-3 ml-2 border-bottom border-secondary pb-4 text-left">Tham quan và trải nghiệm Làng lồng đèn Hưng An</h4>
                                <div class="d-flex align-items-center mb-2">
                                    <i class="far fa-clock me-2"></i>
                                    <span>9h00 - 21h00</span>
                                </div>
                                <div class="d-flex align-items-start mb-2 border-bottom border-secondary pb-4 text-left">
                                    <i class="fas fa-map-marker-alt me-2 mt-1"></i>
                                    <span>63 Nguyễn Thị Minh Khai, Phường Minh An, Hội An, Quảng Nam</span>
                                </div>
                    
                                <div class="d-flex justify-content-center align-items-center flex-column">
                                    <h5 class="fw-bold mb-3">100.000 VND</h5>
                    
                                    <div class="input-group quantity mb-3" style="width: 100px;">
                                        <div class="input-group-btn">
                                            <button class="btn btn-sm btn-minus rounded-circle bg-light border">
                                                <i class="fa fa-minus"></i>
                                            </button>
                                        </div>
                                        <input type="text" class="form-control form-control-sm text-center border-0" value="1">
                                        <div class="input-group-btn">
                                            <button class="btn btn-sm btn-plus rounded-circle bg-light border">
                                                <i class="fa fa-plus"></i>
                                            </button>
                                        </div>
                                    </div>
                    
                                    <a href="#" class="btn border border-secondary rounded-pill px-4 py-2 mb-2 mt-3 text-danger align-items-center"><i class="fas fa-ticket-alt me-2 text-danger"></i> Mua ngay</a>
                                    <a href="#" class="btn border border-secondary rounded-pill px-4 py-2 mb-3 text-primary align-items-center"><i class="fa fa-shopping-bag me-2 text-primary"></i> Thêm vào giỏ hàng</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <h1 class="fw-bold mb-0">Các sự kiện khác</h1>
                <div class="vesitable">
                    <div class="owl-carousel vegetable-carousel justify-content-center">
                        <div class="border border-primary rounded position-relative vesitable-item">
                            <div class="vesitable-img">
                                <img src="assets/img/Xplorer/LangLua.png" class="img-fluid rounded-top" style="width: 303px; height: 242px;" alt="">
                            </div>
                            <!-- <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px; right: 10px;">Vegetable</div> -->
                            <div class="p-4 pb-0 rounded-bottom">
                                <h4>Làng lụa </h4>
                                <p>8:00 - 21:00, từ thứ 2 đến Chủ nhật</p>
                                <div class="d-flex justify-content-between flex-lg-wrap">
                                    <p class="text-dark fs-5 fw-bold">50.000 - 299.000 VND</p>
                                    <a href="#" class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Thêm vào giỏ hàng</a>
                                </div>
                            </div>
                        </div>
                        <div class="border border-primary rounded position-relative vesitable-item">
                            <div class="vesitable-img">
                                <img src="assets/img/Xplorer/KimBong.png" class="img-fluid rounded-top" style="width: 303px; height: 242px;" alt="">
                            </div>
                            <!-- <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px; right: 10px;">Vegetable</div> -->
                            <div class="p-4 pb-0 rounded-bottom">
                                <h4>Làng mộc Kim Bồng</h4>
                                <p>Cả ngày, từ thứ 2 đến Chủ nhật</p>
                                <div class="d-flex justify-content-between flex-lg-wrap">
                                    <p class="text-dark fs-5 fw-bold">Miễn phí</p>
                                    <a href="#" class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Thêm vào giỏ hàng</a>
                                </div>
                            </div>
                        </div>
                        <div class="border border-primary rounded position-relative vesitable-item">
                            <div class="vesitable-img">
                                <img src="assets/img/Xplorer/TraQueOrganic.png" class="img-fluid rounded-top" style="width: 303px; height: 242px;" alt="">
                            </div>
                            <!-- <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px; right: 10px;">Vegetable</div> -->
                            <div class="p-4 pb-0 rounded-bottom">
                                <h4>Tra que Organic Cooking class</h4>
                                <p>8h00 - 17h00</p>
                                <div class="d-flex justify-content-between flex-lg-wrap">
                                    <p class="text-dark fs-5 fw-bold">650.000 VND</p>
                                    <a href="#" class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Thêm vào giỏ hàng</a>
                                </div>
                            </div>
                        </div>
                        <div class="border border-primary rounded position-relative vesitable-item">
                            <div class="vesitable-img">
                                <img src="assets/img/Xplorer/ThanhHa.png" class="img-fluid rounded-top" style="width: 303px; height: 242px;" alt="">
                            </div>
                            <!-- <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px; right: 10px;">Vegetable</div> -->
                            <div class="p-4 pb-0 rounded-bottom">
                                <h4>Làng gốm Thanh Hà</h4>
                                <p>8h30-16h30</p>
                                <div class="d-flex justify-content-between flex-lg-wrap">
                                    <p class="text-dark fs-5 fw-bold">30.000 - 50.000 VND</p>
                                    <a href="#" class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Thêm vào giỏ hàng</a>
                                </div>
                            </div>
                        </div>
                        <div class="border border-primary rounded position-relative vesitable-item">
                            <div class="vesitable-img">
                                <img src="assets/img/vegetable-item-5.jpg" class="img-fluid rounded-top" style="width: 303px; height: 242px;" alt="">
                            </div>
                            <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px; right: 10px;">Vegetable</div>
                            <div class="p-4 pb-0 rounded-bottom">
                                <h4>Potatoes</h4>
                                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
                                <div class="d-flex justify-content-between flex-lg-wrap">
                                    <p class="text-dark fs-5 fw-bold">$7.99 / kg</p>
                                    <a href="#" class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Thêm vào giỏ hàng</a>
                                </div>
                            </div>
                        </div>
                        <div class="border border-primary rounded position-relative vesitable-item">
                            <div class="vesitable-img">
                                <img src="assets/img/vegetable-item-6.jpg" class="img-fluid rounded-top" style="width: 303px; height: 242px;" alt="">
                            </div>
                            <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px; right: 10px;">Vegetable</div>
                            <div class="p-4 pb-0 rounded-bottom">
                                <h4>Parsely</h4>
                                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
                                <div class="d-flex justify-content-between flex-lg-wrap">
                                    <p class="text-dark fs-5 fw-bold">$7.99 / kg</p>
                                    <a href="#" class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Thêm vào giỏ hàng</a>
                                </div>
                            </div>
                        </div>
                        <div class="border border-primary rounded position-relative vesitable-item">
                            <div class="vesitable-img">
                                <img src="assets/img/vegetable-item-5.jpg" class="img-fluid rounded-top" style="width: 303px; height: 242px;" alt="">
                            </div>
                            <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px; right: 10px;">Vegetable</div>
                            <div class="p-4 pb-0 rounded-bottom">
                                <h4>Potatoes</h4>
                                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
                                <div class="d-flex justify-content-between flex-lg-wrap">
                                    <p class="text-dark fs-5 fw-bold">$7.99 / kg</p>
                                    <a href="#" class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Thêm vào giỏ hàng</a>
                                </div>
                            </div>
                        </div>
                        <div class="border border-primary rounded position-relative vesitable-item">
                            <div class="vesitable-img">
                                <img src="assets/img/vegetable-item-6.jpg" class="img-fluid rounded-top" style="width: 303px; height: 242px;" alt="">
                            </div>
                            <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px; right: 10px;">Vegetable</div>
                            <div class="p-4 pb-0 rounded-bottom">
                                <h4>Parsely</h4>
                                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit sed do eiusmod te incididunt</p>
                                <div class="d-flex justify-content-between flex-lg-wrap">
                                    <p class="text-dark fs-5 fw-bold">$7.99 / kg</p>
                                    <a href="#" class="btn border border-secondary rounded-pill px-3 py-1 mb-4 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Thêm vào giỏ hàng</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Single Product End -->

        <jsp:include page="../master/foot.jsp"/>
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

        function addToCart() {
            // Retrieve data values from the HTML
            const userId = document.getElementById("eventDetails").getAttribute("data-userid");
            const eventId = document.getElementById("eventDetails").getAttribute("data-eventid");
            const price = document.getElementById("eventDetails").getAttribute("data-price");

            // Use these values as needed (e.g., send them in an AJAX request or construct a URL)
            console.log("User ID:", userId);
            console.log("Event ID:", eventId);
            console.log("Quantity:", quantityValue);
            console.log("Price:", price);

            // Add your logic to send the data to the server (e.g., AJAX request or form submission)
        }
    </script>


    </body>
</html>
        
