
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

    <!-- Google fonts - witch you want to use - (rest you can just remove) -->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300,300italic,400,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Roboto:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>

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

    <link rel="stylesheet" type="text/css" href="css/Simple-Line-Icons-Webfont/simple-line-icons.css" media="screen" />
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
<%--    <link rel="stylesheet" href="css/colors/violet.css" />--%>
    <!--<link rel="stylesheet" href="css/colors/cyan.css" />-->
    <!--<link rel="stylesheet" href="css/colors/mossgreen.css" />-->

    <!-- just remove the below comments witch bg patterns you want to use -->
    <!--<link rel="stylesheet" href="css/bg-patterns/pattern-default.css" />-->
    <!--<link rel="stylesheet" href="css/bg-patterns/pattern-1.css" />-->
    <!--<link rel="stylesheet" href="css/bg-patterns/pattern-2.css" />-->
    <!--<link rel="stylesheet" href="css/bg-patterns/pattern-3.css" />-->
    <!--<link rel="stylesheet" href="css/bg-patterns/pattern-4.css" />-->
<%--    <link rel="stylesheet" href="css/bg-patterns/pattern-5.css" />--%>
    <!--<link rel="stylesheet" href="css/bg-patterns/pattern-6.css" />-->
    <!--<link rel="stylesheet" href="css/bg-patterns/pattern-7.css" />-->
    <!--<link rel="stylesheet" href="css/bg-patterns/pattern-8.css" />-->
    <!--<link rel="stylesheet" href="css/bg-patterns/pattern-9.css" />-->
    <!--<link rel="stylesheet" href="css/bg-patterns/pattern-10.css" />-->
    <!--<link rel="stylesheet" href="css/bg-patterns/pattern-11.css" />-->
    <!--<link rel="stylesheet" href="css/bg-patterns/pattern-12.css" />-->

</head>


<body>
<div class="wrapper-boxed">
    <div class="site_wrapper">
        <div class="topbar light topbar-padding">
            <div class="container">
                <div class="topbar-right-items pull-right">
                    <ul class="toplist toppadding">
                        <li><a href="${pageContext.request.contextPath}/login.jsp">Admin</a></li>
                        <li><a href="${pageContext.request.contextPath}/login">Login</a></li>
                        <li><a href="${pageContext.request.contextPath}/register">Register</a></li>
                        <li><select>
                            <option value="">Vietnamese</option>
                            <option value="">English</option>

                        </select></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="clearfix"></div>
        <div id="header">
            <div class="container">
                <div class="navbar green navbar-default yamm">
                    <div class="navbar-header">
                        <button type="button" data-toggle="collapse" data-target="#navbar-collapse-grid" class="navbar-toggle two three"><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
                        <a href="${pageContext.request.contextPath}/homepage" class="navbar-brand"><img src="images/logo.png" alt=""/></a> </div>
                    <div id="navbar-collapse-grid" class="navbar-collapse collapse pull-right">
                        <ul class="nav green navbar-nav">
                            <li><a href="${pageContext.request.contextPath}/homepage" class="dropdown-toggle active">Home</a></li>
                            <li><a href="${pageContext.request.contextPath}/event-listing" class="dropdown-toggle">Event</a></li>
                            <!-- <li><a href="${pageContext.request.contextPath}/properties.jsp" class="dropdown-toggle">Properties</a></li> -->
                            <li><a href="${pageContext.request.contextPath}/gallery.jsp" class="dropdown-toggle">Gallery</a></li>
                            <li><a href="${pageContext.request.contextPath}/agents.jsp" class="dropdown-toggle">Agents</a></li>
                            <li><a href="${pageContext.request.contextPath}/contact.jsp" class="dropdown-toggle">Contact</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!--end menu-->
        <div class="clearfix"></div>
