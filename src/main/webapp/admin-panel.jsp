<%--
  Created by IntelliJ IDEA.
  User: phamtiendung
  Date: 11/10/2023
  Time: 8:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Danh sách nhân viên | Quản trị Admin</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
    <!-- or -->
    <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css"
          href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>

<body onload="time()" class="app sidebar-mini rtl">
<!-- Navbar-->
<header class="app-header">
    <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar"
                                    aria-label="Hide Sidebar"></a>
    <!-- Navbar Right Menu-->
    <ul class="app-nav">


        <!-- User Menu-->
        <li><a class="app-nav__item" href="login.html"><i class='bx bx-log-out bx-rotate-180'></i> </a>

        </li>
    </ul>
</header>
<!-- Sidebar menu-->
<div class="app-sidebar__overlay" data-toggle="sidebar"></div>
<aside class="app-sidebar">
    <div class="app-sidebar__user"><img class="app-sidebar__user-avatar" src="https://scontent.fhan14-3.fna.fbcdn.net/v/t39.30808-6/381447984_3491584267771826_1051543770127819054_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=5f2048&_nc_ohc=hLFDkPVnpokAX9rOJiA&_nc_ht=scontent.fhan14-3.fna&oh=00_AfAZ--kbXwUl2IUqvrsecn8eLPH7mqjM9dUZAORnDZnhwQ&oe=654EC2FB" width="50px"
                                        alt="User Image">
        <div>
            <p class="app-sidebar__user-name"><b>Tiến Dũng</b></p>
            <p class="app-sidebar__user-designation">Chào mừng bạn đến với trang Admin</p>
        </div>
    </div>
    <hr>
    <ul class="app-menu">
        <li><a class="app-menu__item haha" href="Banhang.html"><i class='app-menu__icon bx bx-cart-alt'></i>
            <span class="app-menu__label">Bán hàng</span></a></li>
        <li><a class="app-menu__item active" href="index.html"><i class='app-menu__icon bx bx-tachometer'></i><span
                class="app-menu__label">Bảng thống kê</span></a></li>
        <li><a class="app-menu__item " href="managePoster.html"><i class='app-menu__icon bx bx-id-card'></i> <span
                class="app-menu__label">Quản lý poster</span></a></li>
        <li><a class="app-menu__item" href="manageEventPost.html"><i
                class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Quản lý bài đăng</span></a>
        </li>
        <li><a class="app-menu__item" href="manageUser.html"><i class='app-menu__icon bx bx-task'></i><span
                class="app-menu__label">Quản lý người dùng</span></a></li>
        <li><a class="app-menu__item" href="#"><i class='app-menu__icon bx bx-run'></i><span
                class="app-menu__label">Quản lý nội bộ
          </span></a></li>
        <li><a class="app-menu__item" href="#"><i class='app-menu__icon bx bx-dollar'></i><span
                class="app-menu__label">Bảng kê lương</span></a></li>
        <li><a class="app-menu__item" href="#"><i class='app-menu__icon bx bx-cog'></i><span class="app-menu__label">Cài
            đặt hệ thống</span></a></li>
    </ul>
</aside>
<main class="app-content">
    <div class="row">
        <div class="col-md-12">
            <div class="app-title">
                <ul class="app-breadcrumb breadcrumb">
                    <li class="breadcrumb-item"><a href="#"><b>Bảng thống kê</b></a></li>
                </ul>
                <div id="clock"></div>
            </div>
        </div>
    </div>
    <div class="row">
        <!--Left-->
        <div class="col-md-12 col-lg-6">
            <div class="row">
                <!-- col-6 -->
                <div class="col-md-6">
                    <div class="widget-small primary coloured-icon"><i class='icon bx bxs-user-account fa-3x'></i>
                        <div class="info">
                            <h4>Tổng người dùng</h4>
                            <p><b>1500 người dùng</b></p>
                        </div>
                    </div>
                </div>
                <!-- col-6 -->
                <div class="col-md-6">
                    <div class="widget-small info coloured-icon"><i class='icon bx bxs-data fa-3x'></i>
                        <div class="info">
                            <h4>Tổng Poster</h4>
                            <p><b>500 Poster</b></p>
                        </div>
                    </div>
                </div>
                <!-- col-6 -->
                <div class="col-md-6">
                    <div class="widget-small warning coloured-icon"><i class='icon bx bxs-shopping-bags fa-3x'></i>
                        <div class="info">
                            <h4>Tổng đơn hàng</h4>
                            <p><b>200 đơn hàng</b></p>
                            <p class="info-tong">Tổng số hóa đơn bán hàng trong tháng.</p>
                        </div>
                    </div>
                </div>

                <!-- col-12 -->
                <div class="col-md-12">
                    <div class="tile">
                        <h3 class="tile-title">Tình trạng đơn hàng</h3>
                        <div>
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>ID đơn hàng</th>
                                    <th>Tên khách hàng</th>
                                    <th>Tổng tiền</th>
                                    <th>Trạng thái</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>AL3947</td>
                                    <td>Phạm Thị Ngọc</td>
                                    <td>
                                        1.400.000 đ
                                    </td>
                                    <td><span class="badge bg-info">Chờ xử lý</span></td>
                                </tr>
                                <tr>
                                    <td>MD0837</td>
                                    <td>Triệu Thanh Phú</td>
                                    <td>
                                        3.000.000 đ
                                    </td>
                                    <td><span class="badge bg-success">Đã hoàn thành</span></td>
                                </tr>
                                <tr>
                                    <td>MT9835</td>
                                    <td>Đặng Hoàng Phúc	</td>
                                    <td>
                                        700.000 đ
                                    </td>
                                    <td><span class="badge bg-danger">Đã hủy	</span></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <!-- / div trống-->
                    </div>
                </div>
                <!-- / col-12 -->
                <!-- col-12 -->
                <div class="col-md-12">
                    <div class="tile">
                        <h3 class="tile-title">Tài khoản VIP</h3>
                        <div>
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Tên khách hàng</th>
                                    <th>Username</th>
                                    <th>Số điện thoại</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>#183</td>
                                    <td>Phạm Tiến Dũng</td>
                                    <td>dungptde12</td>
                                    <td><span class="tag tag-success">0921387221</span></td>
                                </tr>
                                <tr>
                                    <td>#219</td>
                                    <td>Phạm Tiến Dũng</td>
                                    <td>dungptde12</td>
                                    <td><span class="tag tag-warning">0912376352</span></td>
                                </tr>
                                <tr>
                                    <td>#627</td>
                                    <td>Phạm Tiến Dũng</td>
                                    <td>dungptde12</td>
                                    <td><span class="tag tag-primary">01287326654</span></td>
                                </tr>
                                <tr>
                                    <td>#175</td>
                                    <td>Phạm Tiến Dũng</td>
                                    <td>dungptde12</td>
                                    <td><span class="tag tag-danger">0912376763</span></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>

                    </div>
                </div>
                <!-- / col-12 -->
            </div>
        </div>
        <!--END left-->
        <!--Right-->
        <div class="col-md-12 col-lg-6">
            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <h3 class="tile-title">Dữ liệu lượng truy cập 6 tháng gần đây</h3>
                        <div class="embed-responsive embed-responsive-16by9">
                            <canvas class="embed-responsive-item" id="lineChartDemo"></canvas>
                        </div>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="tile">
                        <h3 class="tile-title">Thống kê 6 tháng doanh thu</h3>
                        <div class="embed-responsive embed-responsive-16by9">
                            <canvas class="embed-responsive-item" id="barChartDemo"></canvas>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <!--END right-->
    </div>



</main>
<script src="js/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
<script src="js/popper.min.js"></script>
<script src="https://unpkg.com/boxicons@latest/dist/boxicons.js"></script>
<!--===============================================================================================-->
<script src="js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script src="js/main.js"></script>
<!--===============================================================================================-->
<script src="js/plugins/pace.min.js"></script>
<!--===============================================================================================-->
<script type="text/javascript" src="js/plugins/chart.js"></script>
<!--===============================================================================================-->
<script type="text/javascript">
    var data = {
        labels: ["Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4", "Tháng 5", "Tháng 6"],
        datasets: [{
            label: "Dữ liệu đầu tiên",
            fillColor: "rgba(255, 213, 59, 0.767), 212, 59)",
            strokeColor: "rgb(255, 212, 59)",
            pointColor: "rgb(255, 212, 59)",
            pointStrokeColor: "rgb(255, 212, 59)",
            pointHighlightFill: "rgb(255, 212, 59)",
            pointHighlightStroke: "rgb(255, 212, 59)",
            data: [20, 59, 90, 51, 56, 100]
        },
            {
                label: "Dữ liệu kế tiếp",
                fillColor: "rgba(9, 109, 239, 0.651)  ",
                pointColor: "rgb(9, 109, 239)",
                strokeColor: "rgb(9, 109, 239)",
                pointStrokeColor: "rgb(9, 109, 239)",
                pointHighlightFill: "rgb(9, 109, 239)",
                pointHighlightStroke: "rgb(9, 109, 239)",
                data: [48, 48, 49, 39, 86, 10]
            }
        ]
    };
    var ctxl = $("#lineChartDemo").get(0).getContext("2d");
    var lineChart = new Chart(ctxl).Line(data);

    var ctxb = $("#barChartDemo").get(0).getContext("2d");
    var barChart = new Chart(ctxb).Bar(data);
</script>
<script type="text/javascript">
    //Thời Gian
    function time() {
        var today = new Date();
        var weekday = new Array(7);
        weekday[0] = "Chủ Nhật";
        weekday[1] = "Thứ Hai";
        weekday[2] = "Thứ Ba";
        weekday[3] = "Thứ Tư";
        weekday[4] = "Thứ Năm";
        weekday[5] = "Thứ Sáu";
        weekday[6] = "Thứ Bảy";
        var day = weekday[today.getDay()];
        var dd = today.getDate();
        var mm = today.getMonth() + 1;
        var yyyy = today.getFullYear();
        var h = today.getHours();
        var m = today.getMinutes();
        var s = today.getSeconds();
        m = checkTime(m);
        s = checkTime(s);
        nowTime = h + " giờ " + m + " phút " + s + " giây";
        if (dd < 10) {
            dd = '0' + dd
        }
        if (mm < 10) {
            mm = '0' + mm
        }
        today = day + ', ' + dd + '/' + mm + '/' + yyyy;
        tmp = '<span class="date"> ' + today + ' - ' + nowTime +
            '</span>';
        document.getElementById("clock").innerHTML = tmp;
        clocktime = setTimeout("time()", "1000", "Javascript");

        function checkTime(i) {
            if (i < 10) {
                i = "0" + i;
            }
            return i;
        }
    }
</script>
</body>

</html>