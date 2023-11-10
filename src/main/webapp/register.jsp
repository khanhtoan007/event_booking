<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <title>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <title>Đăng ký tài khoản | Website quản trị v2.0</title>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1">
                <link rel="stylesheet" type="text/css" href="css/Logincss/logincss.css">
                <link rel="stylesheet" type="text/css" href="css/main.css">
                <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
                    rel="stylesheet">
                <link rel="stylesheet"
                    href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-sweetalert/1.0.1/sweetalert.min.css">
                <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
                <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
                <link rel="stylesheet"
                    href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
                <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">


                <script>
                    function validateForm() {
                        var name = document.getElementById("password").value;
                        var username = document.getElementById("password").value;
                        var password = document.getElementById("password").value;
                        var repassword = document.getElementById("repassword").value;
                        var phone = document.getElementById("phone").value;

                        console.log("password:", password);
                        console.log("repassword", repassword);

                        if (name == "") {
                            alert("Tên không được để trống");
                            return false;
                        }

                        if (phone != "") {
                            var regex = /^(0|\+84)\d{9,10}$/;

                            if (!regex.test(phone)) {
                                alert("Vui lòng nhập số điện thoại Việt Nam hợp lệ!");
                                return false;
                            }
                        }
                        if (username == "") {
                            alert("Username không được để trống");
                            return false;
                        }
                        if (password == "") {
                            alert("Mật khẩu không được để trống");
                            return false;
                        }
                        if (password !== repassword) {
                            alert("Mật khẩu không khớp!");
                            return false;
                        }

                        return true;
                    }
                </script>
            </head>

    <body>
        <div class="limiter">
            <div class="container-login100">
                <div class="wrap-login100">
                    <div class="login100-pic js-tilt" data-tilt>
                        <img src="team.jpg" alt="IMG">
                    </div>
                    <form class="login100-form validate-form" action="${pageContext.request.contextPath}/register"
                        method="POST" onsubmit="return validateForm()">
                        <span class="login100-form-title">
                            <b>ĐĂNG KÝ TÀI KHOẢN</b>
                        </span>
                        <form>
                            <div class="wrap-input100 validate-input"
                                data-validate="Bạn cần nhập đúng thông tin như: ex@abc.xyz">
                                <input id="email" class="input100" type="email" placeholder="Nhập email" name="email" />
                                <span class="focus-input100"></span>
                                <span class="symbol-input100">
                                    <i class='bx bx-envelope' ></i>
                                </span>
                            </div>
                            <div class="wrap-input100 validate-input">
                                <input id="name" class="input100" type="text" placeholder="Họ và tên" name="name"
                                    required />
                                <span class="focus-input100"></span>
                                <span class="symbol-input100">
                                    <i class='bx bx-rename'></i>
                                </span>
                            </div>
                            <div class="wrap-input100 validate-input">
                                <input id="phone" class="input100" type="text" placeholder="Số điện thoại"
                                    name="phone" />
                                <span class="focus-input100"></span>
                                <span class="symbol-input100">
                                    <i class='bx bxs-phone'></i>
                                </span>
                            </div>
                            <div class="wrap-input100 validate-input">
                                <input id="username" class="input100" type="text" placeholder="Username" name="username"
                                    required />
                                <span class="focus-input100"></span>
                                <span class="symbol-input100">
                                    <i class='bx bx-user'></i>
                                </span>
                            </div>
                            <div class="wrap-input100 validate-input"
                                data-validate="Password phải có ít nhất 8 ký tự">
                                <input id="password" class="input100" type="password" placeholder="Password"
                                    name="password" required />
                                <span class="focus-input100"></span>
                                <span class="symbol-input100">
                                    <i class='bx bx-lock-alt'></i>
                                </span>
                            </div>
                            <div class="wrap-input100 validate-input"
                                data-validate="Password phải có cả chữ và số">
                                <input id="repassword" class="input100" type="password"
                                    placeholder="Nhập lại Password" name="repassword" required />
                                <span class="focus-input100"></span>
                                <span class="symbol-input100">
                                    <i class='bx bxs-lock-alt'></i>
                                </span>
                            </div>
                            <div class="container-login100-form-btn">
                                <button type="submit" class="btn btn-info"> Đăng Ký</button>
                            </div>

                            <div class="text-center p-t-12">
                                <a class="txt2" href="login.jsp">
                                    Trở về đăng nhập
                                </a>
                            </div>
                        </form>
                    </form>
                </div>
            </div>
        </div>




        <!-- script -->


    </body>

    </html>