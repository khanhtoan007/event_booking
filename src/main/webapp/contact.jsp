<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="master/head.jsp"/>
  <div class="clearfix"></div>
  
  <section>
    <div class="header-inner two">
      <div class="inner text-center">
        <h4 class="title text-white uppercase">Contact Us</h4>
        <h5 class="text-white uppercase">Get many More Features</h5>
      </div>
      <div class="overlay bg-opacity-5"></div>
      <img src="http://placehold.it/1920x800" alt="" class="img-responsive"/> </div>
  </section>
  <!-- end header inner -->
  <div class="clearfix"></div>
  
  <section class="sec-padding">
    <div class="container">
      <div class="row">
        <div class="col-md-9">
          
		<div class="col-md-12 nopadding">
        <div id="map" class="map">
    <p>This will be replaced with the Google Map.</p>
</div>
        </div>
        <div class="clearfix"></div>
        <br/><br/>
        
          <div class="smart-forms">
			
            <h3>Send Us A message</h3>
            <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Suspendisse et justo. Praesent mattis commodo augue. Aliquam ornare hendrerit consectetuer adipiscing elit. Suspendisse et justo. augue.</p>
            <br/><br/>
            
                <form method="post" action="php/smartprocess.php" id="smart-form">
                    <div>
                    
                        <div class="section">
                            <label class="field prepend-icon">
                                <input type="text" name="sendername" id="sendername" class="gui-input" placeholder="Enter name">
                                <span class="field-icon"><i class="fa fa-user"></i></span>  
                            </label>
                        </div><!-- end section -->
                        
                        <div class="section">
                            <label class="field prepend-icon">
                                <input type="email" name="emailaddress" id="emailaddress" class="gui-input" placeholder="Email address">
                                <span class="field-icon"><i class="fa fa-envelope"></i></span>
                            </label>
                        </div><!-- end section -->
                        
                         <div class="section colm colm6">
                                <label class="field prepend-icon">
                                    <input type="tel" name="telephone" id="telephone" class="gui-input" placeholder="Telephone">
                                    <span class="field-icon"><i class="fa fa-phone-square"></i></span>  
                                </label>
                            </div><!-- end section -->
                            
                        <div class="section">
                            <label class="field prepend-icon">
                                <input type="text" name="sendersubject" id="sendersubject" class="gui-input" placeholder="Enter subjec">
                                <span class="field-icon"><i class="fa fa-lightbulb-o"></i></span>
                            </label>
                        </div><!-- end section -->
                        
                        <div class="section">
                            <label class="field prepend-icon">
                                <textarea class="gui-textarea" id="sendermessage" name="sendermessage" placeholder="Enter message"></textarea>
                                <span class="field-icon"><i class="fa fa-comments"></i></span>
                                <span class="input-hint"> <strong>Hint:</strong> Please enter between 80 - 300 characters.</span>   
                            </label>
                        </div><!-- end section -->
                        
                        
                        <!--<div class="section">
                            <div class="smart-widget sm-left sml-120">
                                <label class="field">
                                    <input type="text" name="captcha" id="captcha" class="gui-input sfcode" maxlength="6" placeholder="Enter CAPTCHA">
                                </label>
                                <label class="button captcode">
                                    <img src="php/captcha/captcha.php?<?php echo time();?>" id="captchax" alt="captcha">
                                    <span class="refresh-captcha"><i class="fa fa-refresh"></i></span>
                                </label>
                            </div> 
                        </div>-->
                        
                        
                       <div class="result"></div><!-- end .result  section --> 
                                                                                                                    
                    </div><!-- end .form-body section -->
                    <div class="form-footer">
                        <button type="submit" data-btntext-sending="Sending..." class="button btn-primary green">Submit</button>
                        <button type="reset" class="button"> Cancel </button>
                    </div><!-- end .form-footer section -->
                </form>
            </div><!-- end .smart-forms section -->
          
          
        </div>
        <!--end left-->
        
        <div class="col-md-3">
          <h4>Featured Properties</h4>
          <div class="title-line-4 green less-margin"></div>
          <div class="clearfix"></div>
          <a href="#"><img src="http://placehold.it/390x230" alt="" class="img-responsive"/></a>
          <h5 class="paddtop1"><a href="#">500 Lorem Street, FL</a></h5>
          <p>Suspendisse et justo. Praesent mattis commodo augue. Aliquam ornare hendrerit augue. Cras tellus</p>
          <h6 class="text-green-3">$20,000</h6>
          <br/>
          
          <div class="divider-line solid light"></div>
          
          <br/>
          <br/>
          <a href="#"><img src="http://placehold.it/390x230" alt="" class="img-responsive"/></a>
          <h5 class="paddtop1"><a href="#">500 Lorem Street, FL</a></h5>
          <p>Suspendisse et justo. Praesent mattis commodo augue. Aliquam ornare hendrerit augue. Cras tellus</p>
          <h6 class="text-green-3">$20,000</h6>
          <br/>
          
         
        </div>
        <!--end right--> 
        
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
            <div class="image-left"><img src="http://placehold.it/80x80" alt=""/></div>
            <div class="text-box-right">
              <h6 class="text-white less-mar3 oswald nopadding"><a href="#">Clean And Modern</a></h6>
              <p>Lorem ipsum dolor sit</p>
              <div class="footer-post-info"> <span>By John Doe</span><span> May 20</span> </div>
            </div>
            <div class="divider-line solid dark opacity-4  margin"></div>
            <div class="clearfix"></div>
            <div class="image-left"><img src="http://placehold.it/80x80" alt=""/></div>
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
              <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit sit et justo amet. Suspendisse et justo.</p>
              <br />
              <form method="get" action="index.html">
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
<script src="js/scrolltotop/totop.js"></script> 
<script src="js/mainmenu/jquery.sticky.js"></script> 
 
<script type="text/javascript" src="js/smart-forms/jquery.form.min.js"></script>
<script type="text/javascript" src="js/smart-forms/jquery.validate.min.js"></script>
<script type="text/javascript" src="js/smart-forms/additional-methods.min.js"></script>
<script type="text/javascript" src="js/smart-forms/smart-form.js"></script> 
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
<script type="text/javascript" src="js/gmaps/jquery.gmap.js"></script>
<script type="text/javascript" src="js/gmaps/examples.js"></script> 
<script src="js/scripts/functions.js" type="text/javascript"></script>  
</body>
</html>
