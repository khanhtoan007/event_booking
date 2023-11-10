<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <jsp:include page="master/head.jsp" />

        <div class="clearfix"></div>

        <section class=" sec-padding section-light">
            <div class="container">
                <div class="row slide-nextprev-but-1">
                    <div class="col-xs-12 text-center">
                        <h3 class="uppercase font-weight-5">My Event Posts</h3>
                        <div class="title-line-4 green align-center"></div>
                    </div>
                    <div class="clearfix"></div>
                    <div id="owl-demo4" class="owl-carousel">
                        <div class="item">

                            <c:forEach items="${eventList}" var="i">
                                <div class="col-md-4 col-sm-6">
                                    <div class="feature-box-66">
                                        <div class="image-holder" style="max-width: 390px; max-height: 230px; object-fit: cover;"> <a href="#">
                                                <c:if test="${i.state == 0}" >
                                                    <div class="status">Expired</div>
                                                </c:if>
                                                <c:if test="${i.state == 1}" >
                                                    <div class="status">Available </div>
                                                </c:if>
                                                <div class="price"> ${i.category}</div>
                                                <img src="${i.image}" alt="" style="max-width: 390px; object-fit: cover;"/>
                                            </a> </div>
                                        <div class="text-box-inner">
                                            <h5 class="less-mar1"><a href="#">${i.title}</a></h5>
                                            <span>${i.location}</span>
                                            <div class="clearfix"></div>
                                            <br />
                                            <div class="property-info">
                                                <div class="pull-left"><span><i class="fa fa-calendar"></i> ${i.start_date} - ${i.end_date}</span></div>
                                                <%-- <div class="pull-right"><span><i class="fa fa-tasks"></i> 100 ft2</span>
                                                    <span><i class="fa fa-car"></i> 100 ft2</span></div> --%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--end column-->
                            </c:forEach>
                        </div>
                        <!--end item-->

                        <div class="item">
                            <div class="col-md-4 col-sm-6">
                                <div class="feature-box-66">
                                    <div class="image-holder"> <a href="#">
                                            <div class="status">For Rent</div>
                                            <div class="price">$ 11,000 <span>/ Month</span></div>
                                            <img src="http://placehold.it/390x230" alt="" class="img-responsive" />
                                        </a> </div>
                                    <div class="text-box-inner">
                                        <h5 class="less-mar1"><a href="#">268 Green Hills Lane</a></h5>
                                        <span>New York City</span>
                                        <div class="clearfix"></div>
                                        <br />
                                        <div class="property-info">
                                            <div class="pull-left"><span><i class="fa fa-bed"></i> 100 ft2</span></div>
                                            <div class="pull-right"><span><i class="fa fa-tasks"></i> 100 ft2</span>
                                                <span><i class="fa fa-car"></i> 100 ft2</span></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--end column-->

                            <div class="col-md-4 col-sm-6">
                                <div class="feature-box-66">
                                    <div class="image-holder"> <a href="#">
                                            <div class="status">For Rent</div>
                                            <div class="price">$ 11,000 <span>/ Month</span></div>
                                            <img src="http://placehold.it/390x230" alt="" class="img-responsive" />
                                        </a> </div>
                                    <div class="text-box-inner">
                                        <h5 class="less-mar1"><a href="#">268 Green Hills Lane</a></h5>
                                        <span>New York City</span>
                                        <div class="clearfix"></div>
                                        <br />
                                        <div class="property-info">
                                            <div class="pull-left"><span><i class="fa fa-bed"></i> 100 ft2</span></div>
                                            <div class="pull-right"><span><i class="fa fa-tasks"></i> 100 ft2</span>
                                                <span><i class="fa fa-car"></i> 100 ft2</span></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--end column-->

                            <div class="col-md-4 col-sm-6">
                                <div class="feature-box-66">
                                    <div class="image-holder"> <a href="#">
                                            <div class="status">For Rent</div>
                                            <div class="price">$ 11,000 <span>/ Month</span></div>
                                            <img src="http://placehold.it/390x230" alt="" class="img-responsive" />
                                        </a> </div>
                                    <div class="text-box-inner">
                                        <h5 class="less-mar1"><a href="#">268 Green Hills Lane</a></h5>
                                        <span>New York City</span>
                                        <div class="clearfix"></div>
                                        <br />
                                        <div class="property-info">
                                            <div class="pull-left"><span><i class="fa fa-bed"></i> 100 ft2</span></div>
                                            <div class="pull-right"><span><i class="fa fa-tasks"></i> 100 ft2</span>
                                                <span><i class="fa fa-car"></i> 100 ft2</span></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--end column-->
                        </div>
                        <!--end item-->

                    </div>
                    <!--end carousel-->

                </div>
            </div>
        </section>
        <!-- end section -->
        <div class="clearfix"></div>


        <section class="section-fulldark sec-padding">
            <div class="container">
                <div class="row">
                    <div class="col-md-3 clearfix">
                        <div class="item-holder">
                            <h4 class="uppercase footer-title less-mar3">Recent Posts</h4>
                            <div class="footer-title-bottomstrip"></div>
                            <div class="clearfix"></div>
                            <div class="image-left"><img src="http://placehold.it/80x80" alt="" /></div>
                            <div class="text-box-right">
                                <h6 class="text-white less-mar3 oswald nopadding"><a href="#">Clean And Modern</a></h6>
                                <p>Lorem ipsum dolor sit</p>
                                <div class="footer-post-info"> <span>By John Doe</span><span> May 20</span> </div>
                            </div>
                            <div class="divider-line solid dark opacity-4  margin"></div>
                            <div class="clearfix"></div>
                            <div class="image-left"><img src="http://placehold.it/80x80" alt="" /></div>
                            <div class="text-box-right">
                                <h6 class="text-white less-mar3 oswald"><a href="#">Layered PSD Files</a></h6>
                                <p>Lorem ipsum dolor sit</p>
                                <div class="footer-post-info"> <span>By John Doe</span><span> May 20</span> </div>
                            </div>
                        </div>
                    </div>
                    <!--end item-->

                    <div class="col-md-3 clearfix">
                        <h4 class="uppercase footer-title less-mar3">quick links</h4>
                        <div class="clearfix"></div>
                        <div class="footer-title-bottomstrip"></div>
                        <ul class="usefull-links">
                            <li><a href="#"><i class="fa fa-angle-right"></i> Placerat bibendum</a></li>
                            <li><a href="#"><i class="fa fa-angle-right"></i> Ullamcorper odio nec turpis</a></li>
                            <li><a href="#"><i class="fa fa-angle-right"></i> Aliquam porttitor vestibulum ipsum</a>
                            </li>
                            <li><a href="#"><i class="fa fa-angle-right"></i> Lobortis enim nec nisi</a></li>
                            <li><a href="#"><i class="fa fa-angle-right"></i> Placerat bibendum</a></li>
                        </ul>
                    </div>
                    <!--end item-->

                    <div class="col-md-3 clearfix">
                        <div class="item-holder">
                            <h4 class="uppercase footer-title less-mar3">Newsletter</h4>
                            <div class="clearfix"></div>
                            <div class="footer-title-bottomstrip"></div>
                            <div class="newsletter">
                                <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit sit et justo amet.
                                    Suspendisse et justo.</p>
                                <br />
                                <form method="get" action="index.html">
                                    <input class="email_input dark" name="samplees" id="samplees" value="E-mail Address"
                                        onFocus="if(this.value == 'E-mail Address') {this.value = '';}"
                                        onBlur="if (this.value == '') {this.value = 'E-mail Address';}" type="text">
                                    <input name="submit" value="Go" class="input_submit dark" type="submit" />
                                </form>
                            </div>
                            <div class="margin-top3"></div>
                            <ul class="social-icons-3 dark-2">
                                <li><a class="twitter" href="https://twitter.com/codelayers"><i
                                            class="fa fa-twitter"></i></a></li>
                                <li><a href="https://www.facebook.com/codelayers"><i class="fa fa-facebook"></i></a>
                                </li>

                                <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                    <!--end item-->

                    <div class="col-md-3 clearfix">
                        <div class="item-holder">
                            <h4 class="uppercase footer-title less-mar3">Flicke Feed</h4>
                            <div class="clearfix"></div>
                            <div class="footer-title-bottomstrip"></div>
                            <ul id="basicuse" class="thumbs">
                            </ul>
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
                    <div class="col-md-12"> <span>Copyright © 2020 <a
                                href="https://1.envato.market/hasta-html-by-codelayers">hasta</a> By <a
                                href="https://1.envato.market/codelayers">Codelayers</a> | All rights reserved.</span>
                    </div>
                </div>
            </div>
        </section>
        <!--end section-->
        <div class="clearfix"></div>

        <a href="#" class="scrollup green-3"></a><!-- end scroll to top of the page-->
        </div>
        </div>
        <!--end sitewraper-->

        <!-- ============ JS FILES ============ -->
        <script type="text/javascript" src="js/universal/jquery.js"></script>
        <script src="js/bootstrap/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/jFlickrFeed/jflickrfeed.min.js"></script>
        <script src="js/jFlickrFeed/jquery.cycle.all.min.js"></script>
        <script src="js/masterslider/jquery.easing.min.js"></script>
        <script src="js/masterslider/masterslider.min.js"></script>
        <script type="text/javascript">
            (function ($) {
              "use strict";
              var slider = new MasterSlider();
              // adds Arrows navigation control to the slider.
              slider.control('arrows');
              slider.control('bullets');
        
              slider.setup('masterslider', {
                width: 1600,    // slider standard width
                height: 660,   // slider standard height
                space: 0,
                speed: 45,
                layout: 'boxed',
                loop: true,
                preload: 0,
                autoplay: true,
                view: "parallaxMask"
              });
        
            })(jQuery);
          </script>
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
        <script src="js/owl-carousel/owl.carousel.js"></script>
        <script src="js/owl-carousel/custom.js"></script>
        <script src="js/tabs/assets/js/responsive-tabs.min.js" type="text/javascript"></script>
        <script type="text/javascript" src="js/tabs/smk-accordion.js"></script>
        <script type="text/javascript" src="js/tabs/custom.js">
        </script>
        <script src="js/scrolltotop/totop.js"></script>
        <script src="js/mainmenu/jquery.sticky.js"></script>

        <script src="js/scripts/functions.js" type="text/javascript"></script>
        </body>

        </html>