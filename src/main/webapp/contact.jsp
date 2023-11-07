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

<jsp:include page="master/foot.jsp"/>

