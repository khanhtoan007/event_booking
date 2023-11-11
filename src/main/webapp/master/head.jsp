<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!doctype html>
        <!--[if IE 7 ]>    <html lang="en-gb" class="isie ie7 oldie no-js"> <![endif]-->
        <!--[if IE 8 ]>    <html lang="en-gb" class="isie ie8 oldie no-js"> <![endif]-->
        <!--[if IE 9 ]>    <html lang="en-gb" class="isie ie9 no-js"> <![endif]-->
        <!--[if (gt IE 9)|!(IE)]><!-->
        <!--<![endif]-->
        <!--<![endif]-->
        <html lang="en">


        <head>
            <title>Event Booking Platform</title>
            <meta charset="utf-8">
            <!-- Meta -->
            <meta name="keywords" content="" />
            <meta name="author" content="">
            <meta name="robots" content="" />
            <meta name="description" content="" />

            <!-- this styles only adds some repairs on idevices  -->
            <meta name="viewport" content="width=device-width, initial-scale=1.0">

            <!-- Favicon -->
            <link rel="shortcut icon" href="images/favicon.ico">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
            <!-- Google fonts - witch you want to use - (rest you can just remove) -->
            <link
                href='https://fonts.googleapis.com/css?family=Open+Sans:300,300italic,400,400italic,600,600italic,700,700italic,800,800italic'
                rel='stylesheet' type='text/css'>
            <link href='https://fonts.googleapis.com/css?family=Roboto:100,200,300,400,500,600,700,800,900'
                rel='stylesheet' type='text/css'>
            <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
                rel="stylesheet">
            <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

            <!-- Stylesheets -->
            <link rel="stylesheet" media="screen" href="js/bootstrap/bootstrap.min.css" type="text/css" />
            <link rel="stylesheet" href="js/mainmenu/menu.css" type="text/css" />
            <link rel="stylesheet" href="css/default.css" type="text/css" />
            <link rel="stylesheet" href="css/layouts.css" type="text/css" />
            <link rel="stylesheet" href="css/shortcodes.css" type="text/css" />
            <link rel="stylesheet" href="css/font-awesome/css/font-awesome.min.css">
            <link rel="stylesheet" media="screen" href="css/responsive-leyouts.css" type="text/css" />
            <link rel="stylesheet" href="js/masterslider/style/masterslider.css" />

            <link rel="stylesheet" type="text/css" href="css/Simple-Line-Icons-Webfont/simple-line-icons.css"
                media="screen" />
            <link rel="stylesheet" href="css/et-line-font/et-line-font.css">
            <link href="js/owl-carousel/owl.carousel.css" rel="stylesheet">
            <link rel="stylesheet" href="js/jFlickrFeed/style.css" />
            <link rel="stylesheet" type="text/css" href="js/tabs/assets/css/responsive-tabs.css">


            <!-- Remove the below comments to use your color option -->
            <!--<link rel="stylesheet" href="css/colors/lightblue.css" />-->
            <!--<link rel="stylesheet" href="css/colors/orange.css" />-->
            <!--<link rel="stylesheet" href="css/colors/green.css" />-->
            <!--<link rel="stylesheet" href="css/colors/pink.css" />-->
            <!--<link rel="stylesheet" href="css/colors/red.css" />-->
            <!--<link rel="stylesheet" href="css/colors/purple.css" />-->
            <!--<link rel="stylesheet" href="css/colors/bridge.css" />-->
            <!--<link rel="stylesheet" href="css/colors/yellow.css" />-->
            <%-- <link rel="stylesheet" href="css/colors/violet.css" />--%>
            <!--<link rel="stylesheet" href="css/colors/cyan.css" />-->
            <!--<link rel="stylesheet" href="css/colors/mossgreen.css" />-->

            <!-- just remove the below comments witch bg patterns you want to use -->
            <!--<link rel="stylesheet" href="css/bg-patterns/pattern-default.css" />-->
            <!--<link rel="stylesheet" href="css/bg-patterns/pattern-1.css" />-->
            <!--<link rel="stylesheet" href="css/bg-patterns/pattern-2.css" />-->
            <!--<link rel="stylesheet" href="css/bg-patterns/pattern-3.css" />-->
            <!--<link rel="stylesheet" href="css/bg-patterns/pattern-4.css" />-->
            <link rel="stylesheet" href="css/bg-patterns/pattern-5.css" />
            <!--<link rel="stylesheet" href="css/bg-patterns/pattern-6.css" />-->
            <!--<link rel="stylesheet" href="css/bg-patterns/pattern-7.css" />-->
            <!--<link rel="stylesheet" href="css/bg-patterns/pattern-8.css" />-->
            <!--<link rel="stylesheet" href="css/bg-patterns/pattern-9.css" />-->
            <!--<link rel="stylesheet" href="css/bg-patterns/pattern-10.css" />-->
            <!--<link rel="stylesheet" href="css/bg-patterns/pattern-11.css" />-->
            <!--<link rel="stylesheet" href="css/bg-patterns/pattern-12.css" />-->
            <style>
                .notification {
                    position: relative;
                    display: inline-block;
                }

                .notification-icon {
                    font-size: 20px;
                    cursor: pointer;
                }

                .notification-dropdown {
                    position: absolute;
                    top: 100%;
                    right: 0;
                    min-width: 200px;
                    background-color: #fff;
                    border: 1px solid #ccc;
                    border-radius: 4px;
                    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
                    padding: 10px;
                    display: none;
                    z-index: 99999;
                    width: 500px;
                }

                .notification-dropdown-item {
                    display: flex;
                    align-items: center;
                    padding: 5px;
                }

                .notification-dropdown-item i {
                    margin-right: 10px;
                }

                .notification:hover .notification-dropdown {
                    display: block;
                }
            </style>
        </head>


        <body>
            <div class="wrapper-boxed">
                <div class="site_wrapper">
                    <div class="topbar light topbar-padding">
                        <div class="container">
                            <div class="pull-right">

                                <ul class="toplist toppadding" id="app">

                                    <c:if test="${sessionScope.user.role.equals('Admin')}">
                                        <li><a href="${pageContext.request.contextPath}/login.jsp">Admin</a></li>
                                    </c:if>
                                    <c:if test="${sessionScope.user == null}">
                                        <li><a href="${pageContext.request.contextPath}/login">Login</a></li>
                                        <li><a href="${pageContext.request.contextPath}/register">Register</a></li>
                                    </c:if>
                                    <li><select class="form-control">
                                            <option value="">Vietnamese</option>
                                            <option value="">English</option>
                                        </select></li>
                                    <li>
                                        <div class="notification">
                                            <i class="fas fa-bell notification-icon"></i> <span id="new_noti_number"
                                                style="color: red">({{notification_list.length}})</span>
                                            <div class="notification-dropdown">
                                                <div class="notification-dropdown-item"
                                                    v-for="(value, key) in notification_list" :key="key">
                                                    <i class="fas fa-envelope"></i>
                                                    <a
                                                        :href="'${pageContext.request.contextPath}/mana-poster-request-status-id=' + value.request_id">{{value.username}}
                                                        yêu cầu trở thành poster</a>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="">
                                        <i class="fas fa-user notification-icon"></i>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                    <div id="header">
                        <div class="container">
                            <div class="navbar green navbar-default yamm">
                                <div class="navbar-header">
                                    <button type="button" data-toggle="collapse" data-target="#navbar-collapse-grid"
                                        class="navbar-toggle two three"><span class="icon-bar"></span><span
                                            class="icon-bar"></span><span class="icon-bar"></span></button>
                                    <a href="${pageContext.request.contextPath}/homepage" class="navbar-brand"><img
                                            src="images/logo.png" alt="" /></a>
                                </div>
                                <div id="navbar-collapse-grid" class="navbar-collapse collapse pull-right">
                                    <ul class="nav green navbar-nav">
                                        <li><a href="${pageContext.request.contextPath}/homepage"
                                                class="dropdown-toggle active">Home</a></li>
                                        <li><a href="${pageContext.request.contextPath}/event-listing"
                                                class="dropdown-toggle">Event</a></li>
                                        <!-- <li><a href="${pageContext.request.contextPath}/properties.jsp" class="dropdown-toggle">Properties</a></li> -->
                                        <li><a href="${pageContext.request.contextPath}/gallery.jsp"
                                                class="dropdown-toggle">Gallery</a></li>
                                        <li><a href="${pageContext.request.contextPath}/agents.jsp"
                                                class="dropdown-toggle">Agents</a></li>
                                        <li><a href="${pageContext.request.contextPath}/contact.jsp"
                                                class="dropdown-toggle">Contact</a></li>
                                    </ul>
                                </div>
                                <div class="clearfix"></div>
                                