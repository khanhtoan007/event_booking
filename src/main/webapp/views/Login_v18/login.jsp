<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>Login V18</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="views/Login_v18/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="views/Login_v18/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="views/Login_v18/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="views/Login_v18/fonts/Linearicons-Free-v1.0.0/icon-font.min.css"> 
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="views/Login_v18/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="views/Login_v18/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="views/Login_v18/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="views/Login_v18/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="views/Login_v18/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="views/Login_v18/css/util.css">
	<link rel="stylesheet" type="text/css" href="views/Login_v18/css/main.css">
<!--===============================================================================================-->
</head>
<body style="background-color: #666666;">
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form class="login100-form validate-form" action="${pageContext.request.contextPath}/login" method="POST" onsubmit="return validateForm()">
					<span class="login100-form-title p-b-43">
						Login to continue
					</span>
					
					
					<div class="wrap-input100 validate-input">
						<input class="input100" type="text" name="username">
						<span class="focus-input100"></span>
						<span class="label-input100">Email</span>
					</div>
					
					
					<div class="wrap-input100 validate-input" data-validate="Password is required">
						<input class="input100" type="password" name="password">
						<span class="focus-input100"></span>
						<span class="label-input100">Password</span>
					</div>

					<!-- <div class="flex-sb-m w-full p-t-3 p-b-32">
						<div class="contact100-form-checkbox">
							<input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me">
							<label class="label-checkbox100" for="ckb1">
								Remember me
							</label>
						</div>

						<div>
							<a href="#" class="txt1">
								Forgot Password?
							</a>
						</div>
					</div> -->
			

					<div class="container-login100-form-btn mt-5">
						<button class="login100-form-btn" type="submit">
							Login
						</button>
						<a href="${pageContext.request.contextPath}/register" class="txt1 mt-3 ">
							Register now
						</a>
					</div>
					
					<div class="text-center p-t-46 p-b-20">
						<span class="txt2">
							or sign up using
						</span>
					</div>

					<div class="login100-form-social flex-c-m">
						<a href="#" class="login100-form-social-item flex-c-m bg1 m-r-5">
							<i class="fa fa-facebook-f" aria-hidden="true"></i>
						</a>

						<a href="#" class="login100-form-social-item flex-c-m bg2 m-r-5">
							<i class="fa fa-twitter" aria-hidden="true"></i>
						</a>
					</div>
				</form>

				<div class="login100-more" style="background-image: url('views/Login_v18/images/bg-01.jpg');">
				</div>
			</div>
		</div>
	</div>
	
	

<!--===============================================================================================-->
	<script>
		function validateForm() {
			var username = document.getElementById("username").value;
			var password = document.getElementById("password-field").value;

			console.log("username", username);
			console.log("password: ", password);


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
	
	
<!--===============================================================================================-->
	<script src="views/Login_v18/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="views/Login_v18/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="views/Login_v18/vendor/bootstrap/js/popper.js"></script>
	<script src="views/Login_v18/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="views/Login_v18/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="views/Login_v18/vendor/daterangepicker/moment.min.js"></script>
	<script src="views/Login_v18/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="views/Login_v18/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="views/Login_v18/js/main.js"></script>

</body>
</html>