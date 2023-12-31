<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<!--[if IE 7 ]>    <html lang="en-gb" class="isie ie7 oldie no-js"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en-gb" class="isie ie8 oldie no-js"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en-gb" class="isie ie9 no-js"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<!--<![endif]-->
<!--<![endif]-->
<html lang="en">
<head>
  <title>Hasta - Responsive MultiPurpose HTML5 Template</title>
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
  <link rel="stylesheet" type="text/css" href="js/cubeportfolio/cubeportfolio.min.css">
  <link rel="stylesheet" type="text/css" href="css/Simple-Line-Icons-Webfont/simple-line-icons.css" media="screen" />
  <link rel="stylesheet" href="css/et-line-font/et-line-font.css">
  <link rel="stylesheet" href="js/jFlickrFeed/style.css" />




  <!-- Remove the below comments to use your color option -->
  <!--<link rel="stylesheet" href="css/colors/lightblue.css" />-->
  <!--<link rel="stylesheet" href="css/colors/orange.css" />-->
  <!--<link rel="stylesheet" href="css/colors/green.css" />-->
  <!--<link rel="stylesheet" href="css/colors/pink.css" />-->
  <!--<link rel="stylesheet" href="css/colors/red.css" />-->
  <!--<link rel="stylesheet" href="css/colors/purple.css" />-->
  <!--<link rel="stylesheet" href="css/colors/bridge.css" />-->
  <!--<link rel="stylesheet" href="css/colors/yellow.css" />-->
  <!--<link rel="stylesheet" href="css/colors/violet.css" />-->
  <!--<link rel="stylesheet" href="css/colors/cyan.css" />-->
  <!--<link rel="stylesheet" href="css/colors/mossgreen.css" />-->

  <!-- just remove the below comments witch bg patterns you want to use -->
  <!--<link rel="stylesheet" href="css/bg-patterns/pattern-default.css" />-->
  <!--<link rel="stylesheet" href="css/bg-patterns/pattern-1.css" />-->
  <!--<link rel="stylesheet" href="css/bg-patterns/pattern-2.css" />-->
  <!--<link rel="stylesheet" href="css/bg-patterns/pattern-3.css" />-->
  <!--<link rel="stylesheet" href="css/bg-patterns/pattern-4.css" />-->
  <!--<link rel="stylesheet" href="css/bg-patterns/pattern-5.css" />-->
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
            <li><a href="#">Login</a></li>
            <li><a href="#">Register</a></li>
            <li class="last"><span class="call-us-box">Call Us (888) 123-4567</span></li>
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
            <a href="index.html" class="navbar-brand"><img src="images/logo.png" alt=""/></a> </div>
          <div id="navbar-collapse-grid" class="navbar-collapse collapse pull-right">
            <ul class="nav green navbar-nav">
              <li><a href="${pageContext.request.contextPath}/index.jsp" class="dropdown-toggle active">Home</a></li>
              <li><a href="${pageContext.request.contextPath}/listings.jsp" class="dropdown-toggle">Event</a></li>
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

    <section>
      <div class="header-inner two">
        <div class="inner text-center">
          <h4 class="title text-white uppercase">Properties Gallery</h4>
          <h5 class="text-white uppercase">Get many More Features</h5>
        </div>
        <div class="overlay bg-opacity-5"></div>
        <img src="http://placehold.it/1920x800" alt="" class="img-responsive"/> </div>
    </section>
    <!-- end header inner -->
    <div class="clearfix"></div>

    <section class="sec-padding">
      <div class="demo-juicy-projects">
        <div class="cbp-panel">
          <div id="filters-container" class="cbp-l-filters-button style-4 ">
            <div data-filter="*" class="cbp-filter-item-active cbp-filter-item"> All
              <div class="cbp-filter-counter"></div>
            </div>
            <div data-filter=".identity" class="cbp-filter-item"> Apartments
              <div class="cbp-filter-counter"></div>
            </div>
            <div data-filter=".web-design" class="cbp-filter-item"> Offices
              <div class="cbp-filter-counter"></div>
            </div>
            <div data-filter=".graphic" class="cbp-filter-item"> Villas
              <div class="cbp-filter-counter"></div>
            </div>
            <div data-filter=".logos" class="cbp-filter-item"> Residentails
              <div class="cbp-filter-counter"></div>
            </div>
          </div>
          <div id="grid-container" class="cbp">
            <div class="cbp-item graphic identity">
              <div class="cbp-caption">
                <div class="cbp-caption-defaultWrap"> <img src="http://placehold.it/800x600" alt=""> </div>
                <div class="cbp-caption-activeWrap">
                  <div class="cbp-l-caption-alignCenter">
                    <div class="cbp-l-caption-body"> <a href="http://placehold.it/800x600" class="cbp-caption cbp-lightbox">More info</a> </div>
                  </div>
                </div>
              </div>
              <div class="cbp-l-grid-projects-title">268 Green Hills Lane</div>
              <div class="cbp-l-grid-projects-desc">Venenatis Quis</div>
            </div>
            <!--end item-->

            <div class="cbp-item graphic graphic">
              <div class="cbp-caption">
                <div class="cbp-caption-defaultWrap"> <img src="http://placehold.it/800x600" alt=""> </div>
                <div class="cbp-caption-activeWrap">
                  <div class="cbp-l-caption-alignCenter">
                    <div class="cbp-l-caption-body"> <a href="http://placehold.it/800x600" class="cbp-caption cbp-lightbox">More info</a> </div>
                  </div>
                </div>
              </div>
              <div class="cbp-l-grid-projects-title">268 Green Hills Lane</div>
              <div class="cbp-l-grid-projects-desc">Venenatis Quis</div>
            </div>
            <!--end item-->

            <div class="cbp-item graphic identity graphic logos">
              <div class="cbp-caption">
                <div class="cbp-caption-defaultWrap"> <img src="http://placehold.it/800x600" alt=""> </div>
                <div class="cbp-caption-activeWrap">
                  <div class="cbp-l-caption-alignCenter">
                    <div class="cbp-l-caption-body"> <a href="http://placehold.it/800x600" class="cbp-caption cbp-lightbox">More info</a> </div>
                  </div>
                </div>
              </div>
              <div class="cbp-l-grid-projects-title">268 Green Hills Lane</div>
              <div class="cbp-l-grid-projects-desc">Venenatis Quis</div>
            </div>
            <!--end item-->

            <div class="cbp-item graphic graphic">
              <div class="cbp-caption">
                <div class="cbp-caption-defaultWrap"> <img src="http://placehold.it/800x600" alt=""> </div>
                <div class="cbp-caption-activeWrap">
                  <div class="cbp-l-caption-alignCenter">
                    <div class="cbp-l-caption-body"> <a href="http://placehold.it/800x600" class="cbp-caption cbp-lightbox">More info</a> </div>
                  </div>
                </div>
              </div>
              <div class="cbp-l-grid-projects-title">268 Green Hills Lane</div>
              <div class="cbp-l-grid-projects-desc">Venenatis Quis</div>
            </div>
            <!--end item-->

            <div class="cbp-item graphic identity logos web-design">
              <div class="cbp-caption">
                <div class="cbp-caption-defaultWrap"> <img src="http://placehold.it/800x600" alt=""> </div>
                <div class="cbp-caption-activeWrap">
                  <div class="cbp-l-caption-alignCenter">
                    <div class="cbp-l-caption-body"> <a href="http://placehold.it/800x600" class="cbp-caption cbp-lightbox">More info</a> </div>
                  </div>
                </div>
              </div>
              <div class="cbp-l-grid-projects-title">268 Green Hills Lane</div>
              <div class="cbp-l-grid-projects-desc">Venenatis Quis</div>
            </div>
            <!--end item-->

            <div class="cbp-item graphic identity graphic web-design">
              <div class="cbp-caption">
                <div class="cbp-caption-defaultWrap"> <img src="http://placehold.it/800x600" alt=""> </div>
                <div class="cbp-caption-activeWrap">
                  <div class="cbp-l-caption-alignCenter">
                    <div class="cbp-l-caption-body"> <a href="http://placehold.it/800x600" class="cbp-caption cbp-lightbox">More info</a> </div>
                  </div>
                </div>
              </div>
              <div class="cbp-l-grid-projects-title">268 Green Hills Lane</div>
              <div class="cbp-l-grid-projects-desc">Venenatis Quis</div>
            </div>
            <!--end item-->
          </div>
        </div>
      </div>
    </section>
    <!--end section-->
    <div class="clearfix"></div>

    <section class="section-fulldark sec-padding">
      <div class="container">
        <div class="row">

          <div class="col-md-6 clearfix">
            <h4 class="uppercase footer-title less-mar3">quick links</h4>
            <div class="clearfix"></div>
            <div class="footer-title-bottomstrip"></div>
            <ul class="usefull-links">
              <li><a href="#"><i class="fa fa-angle-right"></i> Nền tảng liên kết</a></li>
              <li><a href="#"><i class="fa fa-angle-right"></i> Thông tin liên hệ</a></li>
              <li><a href="#"><i class="fa fa-angle-right"></i> Aliquam porttitor vestibulum ipsum</a></li>
              <li><a href="#"><i class="fa fa-angle-right"></i> About us</a></li>
              <li><a href="#"><i class="fa fa-angle-right"></i> Chính sách</a></li>
              <li><a href="#"><i class="fa fa-angle-right"></i> Help center</a></li>
              <li><a href="#"><i class="fa fa-angle-right"></i> Placerat bibendum</a></li>
              <li><a href="#"><i class="fa fa-angle-right"></i> Lobortis enim nec nisi</a></li>
              <li><a href="#"><i class="fa fa-angle-right"></i> Placerat bibendum</a></li>
            </ul>
          </div>
          <!--end item-->

          <div class="col-md-6 clearfix">
            <div class="item-holder">
              <h4 class="uppercase footer-title less-mar3">Newsletter</h4>
              <div class="clearfix"></div>
              <div class="footer-title-bottomstrip"></div>
              <div class="newsletter">
                <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit sit et justo amet. Suspendisse et justo.</p>
                <br />
                <form method="get" action="">
                  <input class="email_input dark" name="samplees" id="samplees" value="E-mail Address" onFocus="if(this.value == 'E-mail Address') {this.value = '';}" onBlur="if (this.value == '') {this.value = 'E-mail Address';}" type="text">
                  <input name="submit" value="Go" class="input_submit dark" type="submit"/>
                </form>
              </div>
              <div class="margin-top3"></div>
              <ul class="social-icons-3 dark-2">
                <li><a class="twitter" href="https://twitter.com/codelayers"><i class="fa fa-twitter"></i></a></li>
                <li><a href="https://www.facebook.com/codelayers"><i class="fa fa-facebook"></i></a></li>

                <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
              </ul>
              <div class="clearfix"></div>
            </div>
          </div>
          <!--end item-->


        </div>
      </div>
    </section>
    <!--end section-->
    <div class="clearfix"></div>

    <section class="section-copyrights sec-moreless-padding">
      <div class="container">
        <div class="row">
          <div class="col-md-12"> <span>Copyright © 2020 <a href="https://1.envato.market/hasta-html-by-codelayers">hasta</a> By <a href="https://1.envato.market/codelayers">Codelayers</a> | All rights reserved.</span></div>
        </div>
      </div>
    </section>
    <!--end section-->
    <div class="clearfix"></div>

    <a href="#" class="scrollup green-3"></a><!-- end scroll to top of the page-->
  </div></div>
<!--end sitewraper-->

<!-- ============ JS FILES ============ -->

<script type="text/javascript" src="js/universal/jquery.js"></script>
<script src="js/bootstrap/bootstrap.min.js" type="text/javascript"></script>
<script src="js/jFlickrFeed/jflickrfeed.min.js"></script>
<script src="js/jFlickrFeed/jquery.cycle.all.min.js"></script>
<script>
  $('#basicuse').jflickrfeed({
    limit: 6,
    qstrings: {
      id: '133294431@N08'
    },
    itemTemplate:
            '<li>' +
            '<a href="{{image_b}}"><img src="{{image_s}}" alt="{{title}}" /></a>' +
            '</li>'
  });
</script>
<script src="js/mainmenu/customeUI.js"></script>
<script type="text/javascript" src="js/cubeportfolio/jquery.cubeportfolio.min.js"></script>
<script type="text/javascript" src="js/cubeportfolio/main-juicy.js"></script>
<script src="js/scrolltotop/totop.js"></script>
<script src="js/mainmenu/jquery.sticky.js"></script>

<script src="js/scripts/functions.js" type="text/javascript"></script>
</body>
</html>
