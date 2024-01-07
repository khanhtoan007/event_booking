<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="vi">

    <head>
        <title>Đăng nhập quản trị | Website quản trị v2.0</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="css/Logincss/logincss.css">
        <link rel="stylesheet" type="text/css" href="css/main.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-sweetalert/1.0.1/sweetalert.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">

        <script>
            function validateForm() {
                var username = document.getElementById("username").value;
                var password = document.getElementById("password-field").value;

                console.log("username", username);
                console.log("password: ", password);

<<<<<<< HEAD
=======
                // Đặt 1 Admin ảo để đăng nhập quản trị

>>>>>>> origin/Dung

                // Nếu không nhập gì mà nhấn đăng nhập thì sẽ báo lỗi
                if (username == "" || password == "") {
                    alert("Bạn chưa điền đầy đủ thông tin đăng nhập...");
                    return false;
                }

                // Nếu không nhập mật khẩu mà đúng tài khoản
                if (username == "admin" && password == "") {
                    alert("Bạn chưa nhập mật khẩu...");
                    return false;
                }

                // Nếu không nhập tài khoản sẽ báo lỗi
                if (username == null || username.trim() == "" || username === "") {
                    alert("Tài khoản đang để trống...");
                    return false;
                }

                // Nếu không nhập mật khẩu sẽ báo lỗi
                if (password == null || password.trim() == "") {
                    alert("Mật khẩu đang để trống...");
                    return false;
                // } else {
                //     // Nếu trống toàn bộ thì báo lỗi
                //     alert("Sai thông tin đăng nhập hãy kiểm tra lại...");
                //     return false;
                };

                return true;
            }
        </script>
        
    </head>

    <body
        style="background-image: url('https://sukienvietsky.com/upload/images/cho%20thue%20man%20hinh%20led%20hcm%204(5).jpeg') ">
        <div class="limiter">
            <div class="container-login100">
                <div class="wrap-login100">
                    <div class="login100-pic js-tilt" data-tilt>
                        <img src="team.jpg" alt="IMG">
                    </div>
                    <!--=====TIÊU ĐỀ======-->
                    <form class="login100-form validate-form" action="${pageContext.request.contextPath}/login"
                        method="POST" onsubmit="return validateForm()">
                        <span class="login100-form-title">
                            <b>ĐĂNG NHẬP HỆ THỐNG</b>
                        </span>
                        <!--=====FORM INPUT TÀI KHOẢN VÀ PASSWORD======-->
                        <form>
                            <div class="wrap-input100 validate-input">
                                <input class="input100" type="text" placeholder="Tài khoản" name="username" id="username">
                                <span class="focus-input100"></span>
                                <span class="symbol-input100">
                                    <i class="bx bx-user"></i>
                                </span>
                            </div>
                            <div class="wrap-input100 validate-input">
                                <input autocomplete="off" class="input100" type="password" placeholder="Mật khẩu"
                                    name="password" id="password-field">
                                </span>
                                <span class="symbol-input100">
                                    <i class="bx bx-key"></i>
                                </span>
                            </div>

                            <!--=====ĐĂNG NHẬP======-->
                            <div class="container-login100-form-btn">
                                <button type="submit" class="btn btn-info" > Đăng nhập  </button>
                            </div>

                            <div class="text-right p-t-12">
                                <a class="txt2" href="register.jsp">
                                    Đăng ký tài khoản
                                </a>
                            </div>
                        </form>
                        <!--=====FOOTER======-->
                    </form>
                </div>
            </div>
        </div>
        <!--Javascript-->
        <script src="/WEB-INF/main.js"></script>
        <script src="https://unpkg.com/boxicons@latest/dist/boxicons.js"></script>
        <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
        <script src="vendor/bootstrap/js/popper.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
        <script src="vendor/select2/select2.min.js"></script>
        <script type="text/javascript">
            //show - hide mật khẩu
            function myFunction() {
                var x = document.getElementById("myInput");
                if (x.type === "password") {
                    x.type = "text"
                } else {
                    x.type = "password";
                }
            }

        </script>
        
    </body>

    </html>