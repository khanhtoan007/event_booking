<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%@page contentType="text/html" pageEncoding="UTF-8" %>
      <jsp:include page="master/head.jsp" />

      <div class="clearfix"></div>

      <section>
         <div class="header-inner two">
            <div class="inner text-center">
               <h4 class="title text-white uppercase">Create new Post</h4>
               <h5 class="text-white uppercase"></h5>
            </div>
            <div class="overlay bg-opacity-5"></div>
            <img src="images/placeholder.png" alt="" class="img-responsive" />
         </div>
      </section>
      <!-- end header inner -->
      <div class="clearfix"></div>

      <section class="sec-padding">
         <div class="container">
            <form action="new-post" method="post" enctype="multipart/form-data">

               <div class="form-row">
                  <div class="col-md-9">
                     <div class="form-group">
                        <label for="title">Title</label>
                        <input type="text" name="title" class="form-control" id="title" placeholder="Title">
                     </div>
                  </div>

                  <div class="col-md-3">
                     <label for="formFile" class="form-label">Image</label>
                     <input class="form-control" name="image" type="file" id="formFile">

                  </div>
               </div>

               <div class="form-row">
                  <div class="col-md-9">
                     <label for="content" class="form-label">Description</label>
                     <textarea class="form-control" name="description" id="content" rows="10"></textarea>
                  </div>

                  <div class="col-md-3">
                     <label for="start_date" class="form-label">Start date:</label>
                     <input type="date" class="form-control" id="start_date" name="start_date">

                     <label for="end_date" class="form-label margin-top3">End date:</label>
                     <input type="date" class="form-control" id="end_date" name="end_date">
                  </div>
                  <!-- <div class="col-md-3">
                     
                  </div> -->
               </div>

               <div class="form-row">
                  <div class="form-group col-md-9">
                        <label for="location">Location</label>
                        <input type="text" name="location" class="form-control" id="location" placeholder="Location">
                     </div>
                  </div>

                  <div class="col-md-3">
                     <label for="category">Category</label>
                     <select class="form-control" name="category" id="category">
                        <option selected value="0">Choose one</option>
                        <c:forEach items="${cateList}" var="i">
                           <option value="${i.category_id}">${i.name}</option>
                        </c:forEach>
                     </select>
                  </div>
               </div>
               <input type="text" name="author" value="${sessionScope.user.id}" hidden>
               <div class="form-row margin-top3"> 
                  <div class="col-md-3"></div>
                  <div class="col-md-3"></div>
                  <div class="col-md-3"></div>
                  <div class="col-md-3">
                     <button type="submit" class="btn btn-primary">Add</button>
                     <a class="btn btn-dark" href="/booking/homepage">Cancel</a>
                  </div>
               </div>

            </form>
         </div>
      </section>
      <!-- end section -->
      <div class="clearfix"></div>

      <section class="section-fulldark sec-padding margin-top3">
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
                     <li><a href="#"><i class="fa fa-angle-right"></i> Aliquam porttitor vestibulum ipsum</a></li>
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
                        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit sit et justo amet. Suspendisse et
                           justo.</p>
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
                        <li><a class="twitter" href="https://twitter.com/codelayers"><i class="fa fa-twitter"></i></a>
                        </li>
                        <li><a href="https://www.facebook.com/codelayers"><i class="fa fa-facebook"></i></a></li>

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
                        href="https://1.envato.market/codelayers">Codelayers</a> | All rights reserved.</span></div>
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
      <script src="js/scrolltotop/totop.js"></script>
      <script src="js/mainmenu/jquery.sticky.js"></script>

      <script src="js/scripts/functions.js" type="text/javascript"></script>
      </body>

      </html>