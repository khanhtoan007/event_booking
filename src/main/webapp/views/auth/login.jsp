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
</head>

<body>

<%@ include file="../master/head.jsp" %>
<div class="container-fluid py-5 mb-5 hero-header">
    <div class="container py-5">
        <div class="row g-5 d-flex align-items-center">
            <div class="col-3"></div>
            <div class="col-6">
                <h3 class="mb-5 display-3 text-primary"><%= language.getString("login")%></h3>
                <form action="${pageContext.request.contextPath}/login" method="post">
                    <div class="form-group form-item">
                        <label for="email"><%=language.getString("email")%></label>
                        <input required value="<%=request.getAttribute("email") != null ? request.getAttribute("email") : ""%>" type="email" class="form-control" id="email" name="email">
                    </div>
                    <div class="form-group form-item">

                        <label for="password"><%=language.getString("password")%></label>
                        <input required value="<%=request.getAttribute("password") != null ? request.getAttribute("password") : ""%>" type="password" class="form-control" id="password" name="password">
                    </div>
                    <div class="d-grid gap-2 mt-2">
                        <button type="submit" class="btn btn-primary"><%= language.getString("login").toUpperCase() %></button>
                        <p class="m-0 text-center" style="width: 100%"><%=language.getString("or")%></p>
                        <a style="width: 100%" href="https://accounts.google.com/o/oauth2/auth?client_id=<%=Config.client_id%>&redirect_uri=<%=Config.redirect_uri%>&response_type=code&scope=openid%20profile%20email">
                            <button style="width: 100%" type="button" class="btn btn-primary">
                                <%= language.getString("login_with_google").toUpperCase() %>
                                &nbsp;&nbsp;
                                <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="25" height="25" viewBox="0 0 48 48">
                                    <path fill="#FFC107" d="M43.611,20.083H42V20H24v8h11.303c-1.649,4.657-6.08,8-11.303,8c-6.627,0-12-5.373-12-12c0-6.627,5.373-12,12-12c3.059,0,5.842,1.154,7.961,3.039l5.657-5.657C34.046,6.053,29.268,4,24,4C12.955,4,4,12.955,4,24c0,11.045,8.955,20,20,20c11.045,0,20-8.955,20-20C44,22.659,43.862,21.35,43.611,20.083z"></path><path fill="#FF3D00" d="M6.306,14.691l6.571,4.819C14.655,15.108,18.961,12,24,12c3.059,0,5.842,1.154,7.961,3.039l5.657-5.657C34.046,6.053,29.268,4,24,4C16.318,4,9.656,8.337,6.306,14.691z"></path><path fill="#4CAF50" d="M24,44c5.166,0,9.86-1.977,13.409-5.192l-6.19-5.238C29.211,35.091,26.715,36,24,36c-5.202,0-9.619-3.317-11.283-7.946l-6.522,5.025C9.505,39.556,16.227,44,24,44z"></path><path fill="#1976D2" d="M43.611,20.083H42V20H24v8h11.303c-0.792,2.237-2.231,4.166-4.087,5.571c0.001-0.001,0.002-0.001,0.003-0.002l6.19,5.238C36.971,39.205,44,34,44,24C44,22.659,43.862,21.35,43.611,20.083z"></path>
                                </svg>
                            </button>
                        </a>
                        <a style="width: 100%" href="${pageContext.request.contextPath}/forgot-password">
                            <p class="m-0 text-center" style="width: 100%"><%=language.getString("forgot_password")%></p>
                        </a>
                    </div>
                </form>
            </div>
            <div class="col-3"></div>
        </div>
    </div>
</div>
<%@ include file="../master/foot.jsp" %>