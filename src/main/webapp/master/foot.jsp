<%--
  Created by IntelliJ IDEA.
  User: FPTSHOP
  Date: 11/4/2023
  Time: 9:45 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<script src="js/masterslider/jquery.easing.min.js"></script>
<script src="js/masterslider/masterslider.min.js"></script>
<script type="text/javascript">
  (function($) {
    "use strict";
    var slider = new MasterSlider();
    // adds Arrows navigation control to the slider.
    slider.control('arrows');
    slider.control('bullets');

    slider.setup('masterslider' , {
      width:1600,    // slider standard width
      height:660,   // slider standard height
      space:0,
      speed:45,
      layout:'boxed',
      loop:true,
      preload:0,
      autoplay:true,
      view:"parallaxMask"
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
</script> <script src="js/scrolltotop/totop.js"></script>
<script src="js/mainmenu/jquery.sticky.js"></script>

<script src="js/scripts/functions.js" type="text/javascript"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.7.10/vue.min.js" integrity="sha512-H8u5mlZT1FD7MRlnUsODppkKyk+VEiCmncej8yZW1k/wUT90OQon0F9DSf/2Qh+7L/5UHd+xTLrMszjHEZc2BA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/1.4.0/axios.js" integrity="sha512-RjvSEaeDqPCfUVQ9kna2/2OqHz/7F04IOl1/66LmQjB/lOeAzwq7LrbTzDbz5cJzlPNJ5qteNtHR56XaJSTNWw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
  var app = new Vue({
    el: "#app",
    data:{
      socket : new WebSocket((window.location.protocol === 'https:' ? 'wss://' : 'ws://') + window.location.host + '${pageContext.request.contextPath}/my-websocket'),
      notification_list : [],
      test : 1
    },
    created(){
      setTimeout(() => {
        this.socket.send("subscribe:" + 0);
      }, 1000);
      this.getAllNotifications()
      this.socket.onmessage = (event) => {
        this.notification_list.push({'request_id' : event.data.split(",")[0], 'username' : event.data.split(",")[1]})
        console.log(this.notification_list)
      }
    },
    methods:{
      getAllNotifications(){
        axios.get("${pageContext.request.contextPath}/get-all-notifications")
                .then((res) => {
                  this.notification_list = JSON.parse(res.data.data)
                  console.log(this.notification_list)
                })
      }
    }
  })
</script>
</body>
</html>
