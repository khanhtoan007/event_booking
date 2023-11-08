<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="master/head.jsp"/>

        <div class="clearfix"></div>

        <!-- masterslider -->
        <div class="master-slider ms-skin-default" id="masterslider">

            <!-- slide 1 -->
            <div class="ms-slide slide-1" data-delay="9">
                <div class="slide-pattern"></div>

                <img src="images/sliders/masterslider/master1.jpg" alt=""/>

                <h3 class="ms-layer text34"
                    style="top: 400px;"
                    data-type="text"
                    data-delay="500"
                    data-ease="easeOutExpo"
                    data-duration="1230"
                    data-effect="scale(1.5,1.6)"> find the property of your dreams</h3>

                <h3 class="ms-layer text6"
                    style="top: 260px;"
                    data-type="text"
                    data-effect="top(45)"
                    data-duration="2000"
                    data-delay="1500"
                    data-ease="easeOutExpo"> Lorem ipsum dolor sit amet consectetuer adipiscing elit<br/>
                    Suspendisse et justo
                    Praesent mattis commodo augue Aliquam ornare. </h3>

                <a class="ms-layer sbut13"
                   style="left: 730px; top: 340px;"
                   data-type="text"
                   data-delay="2000"
                   data-ease="easeOutExpo"
                   data-duration="1200"
                   data-effect="scale(1.5,1.6)"> Read More </a>

            </div>
            <!-- end slide 1 -->
            <!-- slide 2 -->
            <div class="ms-slide slide-2" data-delay="9">
                <div class="slide-pattern"></div>

                <img src="images/sliders/masterslider/master2.avif" alt=""/>

                <h3 class="ms-layer text34"
                    style="top: 400px;"
                    data-type="text"
                    data-delay="500"
                    data-ease="easeOutExpo"
                    data-duration="1230"
                    data-effect="scale(1.5,1.6)"> find the property of your dreams</h3>

                <h3 class="ms-layer text6"
                    style="top: 260px;"
                    data-type="text"
                    data-effect="top(45)"
                    data-duration="2000"
                    data-delay="1500"
                    data-ease="easeOutExpo"> Lorem ipsum dolor sit amet consectetuer adipiscing elit<br/>
                    Suspendisse et justo
                    Praesent mattis commodo augue Aliquam ornare. </h3>

                <a class="ms-layer sbut13"
                   style="left: 730px; top: 340px;"
                   data-type="text"
                   data-delay="2000"
                   data-ease="easeOutExpo"
                   data-duration="1200"
                   data-effect="scale(1.5,1.6)"> Read More </a>

            </div>
            <!-- end slide 2 -->
            <!-- slide 3 -->
            <div class="ms-slide slide-3" data-delay="9">
                <div class="slide-pattern"></div>

                <img src="images/sliders/masterslider/master3.avif" alt=""/>

                <h3 class="ms-layer text34"
                    style="top: 400px;"
                    data-type="text"
                    data-delay="500"
                    data-ease="easeOutExpo"
                    data-duration="1230"
                    data-effect="scale(1.5,1.6)"> find the property of your dreams</h3>

                <h3 class="ms-layer text6"
                    style="top: 260px;"
                    data-type="text"
                    data-effect="top(45)"
                    data-duration="2000"
                    data-delay="1500"
                    data-ease="easeOutExpo"> Lorem ipsum dolor sit amet consectetuer adipiscing elit<br/>
                    Suspendisse et justo
                    Praesent mattis commodo augue Aliquam ornare. </h3>

                <a class="ms-layer sbut13"
                   style="left: 730px; top: 340px;"
                   data-type="text"
                   data-delay="2000"
                   data-ease="easeOutExpo"
                   data-duration="1200"
                   data-effect="scale(1.5,1.6)"> Read More </a>

            </div>
            <!-- end slide 3 -->


        </div>
        <!-- end of masterslider -->
        <div class="clearfix"></div>

        <section class="property-search">
            <div class="container">
                <div class="row">
                    <div class="col-md-3 col-sm-6">
                        <label>Keyword</label>
                        <br/>
                        <input type="text" placeholder="Any" value="" name="keyword">
                    </div>
                    <!--end item-->

                    <div class="col-md-3 col-sm-6">
                        <label>Location</label>
                        <select>
                            <option value="" selected="selected"> Any </option>
                            <option value="" > consectetur </option>
                            <option value="" > Suspendisse </option>
                        </select>
                    </div>
                    <!--end item-->

                    <div class="col-md-3 col-sm-6">
                        <label>Property Type</label>
                        <select>
                            <option value="" selected="selected"> Any </option>
                            <option value="" > Commercial </option>
                            <option value="" > Office </option>
                            <option value="" > Rent </option>
                            <option value="" > Residential </option>
                            <option value="" > Apartment</option>
                            <option value="" > Villa </option>
                        </select>
                    </div>
                    <!--end item-->

                    <div class="col-md-3 col-sm-6">
                        <label>Property Status</label>
                        <select>
                            <option value="" selected="selected"> Any </option>
                            <option value="" > For Rent </option>
                            <option value="" > For Sale </option>
                        </select>
                    </div>
                    <!--end item-->

                    <div class="clearfix"></div>
                    <div class="col-divider-margin-1"></div>

                    <div class="col-md-2 col-sm-6">
                        <label>Minimum Price</label>
                        <select>
                            <option value="" selected="selected"> Any </option>
                            <option value="" > $1000 </option>
                            <option value="" > $5000 </option>
                            <option value="" > $10,000 </option>
                            <option value="" > $15,000 </option>
                            <option value="" > $20,000 </option>
                            <option value="" > $25,000 </option>
                            <option value="" > $30,000 </option>
                            <option value="" > $35,000 </option>
                        </select>
                    </div>
                    <!--end item-->

                    <div class="col-md-2 col-sm-6">
                        <label>Maximum Price</label>
                        <select>
                            <option value="" selected="selected"> Any </option>
                            <option value="" > $1000 </option>
                            <option value="" > $5000 </option>
                            <option value="" > $10,000 </option>
                            <option value="" > $15,000 </option>
                            <option value="" > $20,000 </option>
                            <option value="" > $25,000 </option>
                            <option value="" > $30,000 </option>
                            <option value="" > $35,000 </option>
                        </select>
                    </div>
                    <!--end item-->

                    <div class="col-md-2 col-sm-6">
                        <label>Area (Sq Ft)</label>
                        <br/>
                        <input type="text" value="" name="Area">
                    </div>
                    <!--end item-->

                    <div class="col-md-2 col-sm-6"> <br/>
                        <input class="search-btn" type="submit" value="Search">
                    </div>
                    <!--end item-->

                </div>
            </div>
        </section>
        <!-- end section -->
        <div class="clearfix"></div>


        <section class=" sec-padding section-light">
            <div class="container">
                <div class="row slide-nextprev-but-1">
                    <div class="col-xs-12 text-center">
                        <h3 class="uppercase font-weight-5">SPECIAL OFFERS </h3>
                        <div class="title-line-4 green align-center"></div>
                    </div>
                    <div class="clearfix"></div>
                    <div id="owl-demo7" class="owl-carousel">
                        <div class="item">
                            <c:forEach items="${list}" var="list">
                                <div class="col-md-4 col-sm-6">
                                    <div class="feature-box-66">
                                        <div class="image-holder"> <a href="#">
                                            <div class="status">${list.state == "1" ? "Available" : "Expired"}</div>
                                            <div class="price">${list.author}</div>
                                            <img src="http://placehold.it/390x230" alt="" class="img-responsive"/></a> </div>
                                        <div class="text-box-inner">
                                            <h5 class="less-mar1"><a href="#">${list.title}</a></h5>
                                            <span>${list.location}</span>
                                            <div class="clearfix"></div>
                                            <br/>
                                            <div class="property-info">
                                                <div class="pull-left"><span><i class="fa fa-times-circle-o"></i> ${list.post_date}</span></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                            <!--end column-->

<%--                            <div class="col-md-4 col-sm-6">--%>
<%--                                <div class="feature-box-66">--%>
<%--                                    <div class="image-holder"> <a href="#">--%>
<%--                                        <div class="status">For Rent</div>--%>
<%--                                        <div class="price">$ 11,000 <span>/ Month</span></div>--%>
<%--                                        <img src="http://placehold.it/390x230" alt="" class="img-responsive"/></a> </div>--%>
<%--                                    <div class="text-box-inner">--%>
<%--                                        <h5 class="less-mar1"><a href="#">268 Green Hills Lane</a></h5>--%>
<%--                                        <span>New York City</span>--%>
<%--                                        <div class="clearfix"></div>--%>
<%--                                        <br/>--%>
<%--                                        <div class="property-info">--%>
<%--                                            <div class="pull-left"><span><i class="fa fa-bed"></i> 100 ft2</span></div>--%>
<%--                                            <div class="pull-right"><span><i class="fa fa-tasks"></i> 100 ft2</span> <span><i class="fa fa-car"></i> 100 ft2</span></div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <!--end column-->--%>

<%--                            <div class="col-md-4 col-sm-6">--%>
<%--                                <div class="feature-box-66">--%>
<%--                                    <div class="image-holder"> <a href="#">--%>
<%--                                        <div class="status">For Rent</div>--%>
<%--                                        <div class="price">$ 11,000 <span>/ Month</span></div>--%>
<%--                                        <img src="http://placehold.it/390x230" alt="" class="img-responsive"/></a> </div>--%>
<%--                                    <div class="text-box-inner">--%>
<%--                                        <h5 class="less-mar1"><a href="#">268 Green Hills Lane</a></h5>--%>
<%--                                        <span>New York City</span>--%>
<%--                                        <div class="clearfix"></div>--%>
<%--                                        <br/>--%>
<%--                                        <div class="property-info">--%>
<%--                                            <div class="pull-left"><span><i class="fa fa-bed"></i> 100 ft2</span></div>--%>
<%--                                            <div class="pull-right"><span><i class="fa fa-tasks"></i> 100 ft2</span> <span><i class="fa fa-car"></i> 100 ft2</span></div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
                            <!--end column-->
                        </div>
                        <!--end item-->

                        <div class="item">
                            <div class="col-md-4 col-sm-6">
                                <div class="feature-box-66">
                                    <div class="image-holder"> <a href="#">
                                        <div class="status">For Rent</div>
                                        <div class="price">$ 11,000 <span>/ Month</span></div>
                                        <img src="http://placehold.it/390x230" alt="" class="img-responsive"/></a> </div>
                                    <div class="text-box-inner">
                                        <h5 class="less-mar1"><a href="#">268 Green Hills Lane</a></h5>
                                        <span>New York City</span>
                                        <div class="clearfix"></div>
                                        <br/>
                                        <div class="property-info">
                                            <div class="pull-left"><span><i class="fa fa-bed"></i> 100 ft2</span></div>
                                            <div class="pull-right"><span><i class="fa fa-tasks"></i> 100 ft2</span> <span><i class="fa fa-car"></i> 100 ft2</span></div>
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
                                        <img src="http://placehold.it/390x230" alt="" class="img-responsive"/></a> </div>
                                    <div class="text-box-inner">
                                        <h5 class="less-mar1"><a href="#">268 Green Hills Lane</a></h5>
                                        <span>New York City</span>
                                        <div class="clearfix"></div>
                                        <br/>
                                        <div class="property-info">
                                            <div class="pull-left"><span><i class="fa fa-bed"></i> 100 ft2</span></div>
                                            <div class="pull-right"><span><i class="fa fa-tasks"></i> 100 ft2</span> <span><i class="fa fa-car"></i> 100 ft2</span></div>
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
                                        <img src="http://placehold.it/390x230" alt="" class="img-responsive"/></a> </div>
                                    <div class="text-box-inner">
                                        <h5 class="less-mar1"><a href="#">268 Green Hills Lane</a></h5>
                                        <span>New York City</span>
                                        <div class="clearfix"></div>
                                        <br/>
                                        <div class="property-info">
                                            <div class="pull-left"><span><i class="fa fa-bed"></i> 100 ft2</span></div>
                                            <div class="pull-right"><span><i class="fa fa-tasks"></i> 100 ft2</span> <span><i class="fa fa-car"></i> 100 ft2</span></div>
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
                <div class="row slide-nextprev-but-1">
                    <div class="col-xs-12 text-center">
                        <h3 class="uppercase font-weight-5">TRENDING NEWS </h3>
                        <div class="title-line-4 green align-center"></div>
                    </div>
                    <div class="clearfix"></div>
                    <div id="owl-demo6" class="owl-carousel">
                        <div class="item">
                            <div class="col-md-4 col-sm-6">
                                <div class="feature-box-66">
                                    <div class="image-holder"> <a href="#">
                                        <div class="status">For Rent</div>
                                        <div class="price">$ 11,000 <span>/ Month</span></div>
                                        <img src="http://placehold.it/390x230" alt="" class="img-responsive"/></a> </div>
                                    <div class="text-box-inner">
                                        <h5 class="less-mar1"><a href="#">268 Green Hills Lane</a></h5>
                                        <span>New York City</span>
                                        <div class="clearfix"></div>
                                        <br/>
                                        <div class="property-info">
                                            <div class="pull-left"><span><i class="fa fa-bed"></i> 100 ft2</span></div>
                                            <div class="pull-right"><span><i class="fa fa-tasks"></i> 100 ft2</span> <span><i class="fa fa-car"></i> 100 ft2</span></div>
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
                                        <img src="http://placehold.it/390x230" alt="" class="img-responsive"/></a> </div>
                                    <div class="text-box-inner">
                                        <h5 class="less-mar1"><a href="#">268 Green Hills Lane</a></h5>
                                        <span>New York City</span>
                                        <div class="clearfix"></div>
                                        <br/>
                                        <div class="property-info">
                                            <div class="pull-left"><span><i class="fa fa-bed"></i> 100 ft2</span></div>
                                            <div class="pull-right"><span><i class="fa fa-tasks"></i> 100 ft2</span> <span><i class="fa fa-car"></i> 100 ft2</span></div>
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
                                        <img src="http://placehold.it/390x230" alt="" class="img-responsive"/></a> </div>
                                    <div class="text-box-inner">
                                        <h5 class="less-mar1"><a href="#">268 Green Hills Lane</a></h5>
                                        <span>New York City</span>
                                        <div class="clearfix"></div>
                                        <br/>
                                        <div class="property-info">
                                            <div class="pull-left"><span><i class="fa fa-bed"></i> 100 ft2</span></div>
                                            <div class="pull-right"><span><i class="fa fa-tasks"></i> 100 ft2</span> <span><i class="fa fa-car"></i> 100 ft2</span></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--end column-->
                        </div>
                        <!--end item-->

                        <div class="item">
                            <div class="col-md-4 col-sm-6">
                                <div class="feature-box-66">
                                    <div class="image-holder"> <a href="#">
                                        <div class="status">For Rent</div>
                                        <div class="price">$ 11,000 <span>/ Month</span></div>
                                        <img src="http://placehold.it/390x230" alt="" class="img-responsive"/></a> </div>
                                    <div class="text-box-inner">
                                        <h5 class="less-mar1"><a href="#">268 Green Hills Lane</a></h5>
                                        <span>New York City</span>
                                        <div class="clearfix"></div>
                                        <br/>
                                        <div class="property-info">
                                            <div class="pull-left"><span><i class="fa fa-bed"></i> 100 ft2</span></div>
                                            <div class="pull-right"><span><i class="fa fa-tasks"></i> 100 ft2</span> <span><i class="fa fa-car"></i> 100 ft2</span></div>
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
                                        <img src="http://placehold.it/390x230" alt="" class="img-responsive"/></a> </div>
                                    <div class="text-box-inner">
                                        <h5 class="less-mar1"><a href="#">268 Green Hills Lane</a></h5>
                                        <span>New York City</span>
                                        <div class="clearfix"></div>
                                        <br/>
                                        <div class="property-info">
                                            <div class="pull-left"><span><i class="fa fa-bed"></i> 100 ft2</span></div>
                                            <div class="pull-right"><span><i class="fa fa-tasks"></i> 100 ft2</span> <span><i class="fa fa-car"></i> 100 ft2</span></div>
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
                                        <img src="http://placehold.it/390x230" alt="" class="img-responsive"/></a> </div>
                                    <div class="text-box-inner">
                                        <h5 class="less-mar1"><a href="#">268 Green Hills Lane</a></h5>
                                        <span>New York City</span>
                                        <div class="clearfix"></div>
                                        <br/>
                                        <div class="property-info">
                                            <div class="pull-left"><span><i class="fa fa-bed"></i> 100 ft2</span></div>
                                            <div class="pull-right"><span><i class="fa fa-tasks"></i> 100 ft2</span> <span><i class="fa fa-car"></i> 100 ft2</span></div>
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
                <div class="row slide-nextprev-but-1">
                    <div class="col-xs-12 text-center">
                        <h3 class="uppercase font-weight-5">FEATURED EVENTS </h3>
                        <div class="title-line-4 green align-center"></div>
                    </div>
                    <div class="clearfix"></div>
                    <div id="owl-demo4" class="owl-carousel">
                        <div class="item">
                            <div class="col-md-4 col-sm-6">
                                <div class="feature-box-66">
                                    <div class="image-holder"> <a href="#">
                                        <div class="status">For Rent</div>
                                        <div class="price">$ 11,000 <span>/ Month</span></div>
                                        <img src="http://placehold.it/390x230" alt="" class="img-responsive"/></a> </div>
                                    <div class="text-box-inner">
                                        <h5 class="less-mar1"><a href="#">268 Green Hills Lane</a></h5>
                                        <span>New York City</span>
                                        <div class="clearfix"></div>
                                        <br/>
                                        <div class="property-info">
                                            <div class="pull-left"><span><i class="fa fa-bed"></i> 100 ft2</span></div>
                                            <div class="pull-right"><span><i class="fa fa-tasks"></i> 100 ft2</span> <span><i class="fa fa-car"></i> 100 ft2</span></div>
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
                                        <img src="http://placehold.it/390x230" alt="" class="img-responsive"/></a> </div>
                                    <div class="text-box-inner">
                                        <h5 class="less-mar1"><a href="#">268 Green Hills Lane</a></h5>
                                        <span>New York City</span>
                                        <div class="clearfix"></div>
                                        <br/>
                                        <div class="property-info">
                                            <div class="pull-left"><span><i class="fa fa-bed"></i> 100 ft2</span></div>
                                            <div class="pull-right"><span><i class="fa fa-tasks"></i> 100 ft2</span> <span><i class="fa fa-car"></i> 100 ft2</span></div>
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
                                        <img src="http://placehold.it/390x230" alt="" class="img-responsive"/></a> </div>
                                    <div class="text-box-inner">
                                        <h5 class="less-mar1"><a href="#">268 Green Hills Lane</a></h5>
                                        <span>New York City</span>
                                        <div class="clearfix"></div>
                                        <br/>
                                        <div class="property-info">
                                            <div class="pull-left"><span><i class="fa fa-bed"></i> 100 ft2</span></div>
                                            <div class="pull-right"><span><i class="fa fa-tasks"></i> 100 ft2</span> <span><i class="fa fa-car"></i> 100 ft2</span></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--end column-->
                        </div>
                        <!--end item-->

                        <div class="item">
                            <div class="col-md-4 col-sm-6">
                                <div class="feature-box-66">
                                    <div class="image-holder"> <a href="#">
                                        <div class="status">For Rent</div>
                                        <div class="price">$ 11,000 <span>/ Month</span></div>
                                        <img src="http://placehold.it/390x230" alt="" class="img-responsive"/></a> </div>
                                    <div class="text-box-inner">
                                        <h5 class="less-mar1"><a href="#">268 Green Hills Lane</a></h5>
                                        <span>New York City</span>
                                        <div class="clearfix"></div>
                                        <br/>
                                        <div class="property-info">
                                            <div class="pull-left"><span><i class="fa fa-bed"></i> 100 ft2</span></div>
                                            <div class="pull-right"><span><i class="fa fa-tasks"></i> 100 ft2</span> <span><i class="fa fa-car"></i> 100 ft2</span></div>
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
                                        <img src="http://placehold.it/390x230" alt="" class="img-responsive"/></a> </div>
                                    <div class="text-box-inner">
                                        <h5 class="less-mar1"><a href="#">268 Green Hills Lane</a></h5>
                                        <span>New York City</span>
                                        <div class="clearfix"></div>
                                        <br/>
                                        <div class="property-info">
                                            <div class="pull-left"><span><i class="fa fa-bed"></i> 100 ft2</span></div>
                                            <div class="pull-right"><span><i class="fa fa-tasks"></i> 100 ft2</span> <span><i class="fa fa-car"></i> 100 ft2</span></div>
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
                                        <img src="http://placehold.it/390x230" alt="" class="img-responsive"/></a> </div>
                                    <div class="text-box-inner">
                                        <h5 class="less-mar1"><a href="#">268 Green Hills Lane</a></h5>
                                        <span>New York City</span>
                                        <div class="clearfix"></div>
                                        <br/>
                                        <div class="property-info">
                                            <div class="pull-left"><span><i class="fa fa-bed"></i> 100 ft2</span></div>
                                            <div class="pull-right"><span><i class="fa fa-tasks"></i> 100 ft2</span> <span><i class="fa fa-car"></i> 100 ft2</span></div>
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


        <section class="sec-padding">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 col-sm-6 align-left clearfix">
                        <div class="item-holder bmargin">
                            <h4 class="uppercase">How it Works</h4>
                            <div class="title-line-4 green less-margin"></div>
                            <br/>
                            <br/>
                            <div class="clearfix"></div>
                            <ul class="tabs11">
                                <li><a href="#example-11-tab-1" target="_self">Listing </a></li>
                                <li><a href="#example-11-tab-2" target="_self">Agent</a></li>
                                <li><a class="last" href="#example-11-tab-3" target="_self">Sell/Buy</a></li>
                            </ul>
                            <div class="tabs-content11">
                                <div id="example-11-tab-1" class="tabs-panel11">
                                    <h6 class="text-green-3">Vivamus sit amet </h6>
                                    <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Suspendisse et justo. Praesent</p>
                                    <h6 class="text-green-3 paddtop2">Aenean arcu tortor</h6>
                                    <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Suspendisse et justo. Praesent</p>
                                </div>
                                <!-- end tab 1 -->

                                <div id="example-11-tab-2" class="tabs-panel11">
                                    <h6 class="text-green-3">Vivamus sit amet </h6>
                                    <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Suspendisse et justo. Praesent</p>
                                    <h6 class="text-green-3 paddtop2">Aenean arcu tortor</h6>
                                    <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Suspendisse et justo. Praesent</p>
                                </div>
                                <!-- end tab 2 -->

                                <div id="example-11-tab-3" class="tabs-panel11"> <strong>Lorem ipsum dolor sit amet, consectetuer adipiscing elit ?</strong><br/>
                                    <h6 class="text-green-3">Vivamus sit amet </h6>
                                    <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Suspendisse et justo. Praesent</p>
                                    <h6 class="text-green-3 paddtop2">Aenean arcu tortor</h6>
                                    <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Suspendisse et justo. Praesent</p>
                                </div>
                                <!-- end tab 3 -->

                            </div>
                            <!-- end all tabs -->
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-6 align-left clearfix">
                        <div class="item-holder bmargin">
                            <h4 class="uppercase">Features</h4>
                            <div class="title-line-4 green less-margin"></div>
                            <br/>
                            <br/>
                            <h6 class="text-green-3">Magna tempus urna</h6>
                            <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Suspendisse et justo. Praesent mattis commodo augue. Aliquam ornare hendrerit augue.</p>
                            <br/>
                            <h6 class="text-green-3">Venenatis quis</h6>
                            <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Suspendisse et justo. Praesent mattis commodo augue. Aliquam ornare hendrerit consectetuer adipiscing elit. Suspendisse et justo.  augue.</p>
                        </div>
                    </div>
                    <!--end item-->
                    <div class="col-md-4 col-sm-6 align-left last">
                        <div class="item-holder bmargin">
                            <h4 class="uppercase">Why Choose</h4>
                            <div class="title-line-4 green less-margin"></div>
                            <br/>
                            <br/>
                            <div class="accordion_holder">
                                <div class="accordion_example1">

                                    <!-- Section 1 -->
                                    <div class="accordion_in two acc_active">
                                        <div class="acc_head">Creative Design</div>
                                        <div class="acc_content"> Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Suspendisse et justo. Praesent mattis commodo augue. Aliquam ornare hendrerit augue. Cras tellus. In pulvinar lectus a est. Curabitur eget orci. </div>
                                    </div>

                                    <!-- Section 2 -->
                                    <div class="accordion_in two">
                                        <div class="acc_head">Graphic Design</div>
                                        <div class="acc_content"> Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Suspendisse et justo. Praesent mattis commodo augue. Aliquam ornare hendrerit augue. Cras tellus. In pulvinar lectus a est. Curabitur eget orci. Cras laoreet ligula. Etiam sit amet dolor. </div>
                                    </div>

                                    <!-- Section 3 -->
                                    <div class="accordion_in two">
                                        <div class="acc_head">Photography</div>
                                        <div class="acc_content"> Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Suspendisse et justo. Praesent mattis commodo augue. Aliquam ornare hendrerit augue. Cras tellus. In pulvinar lectus a est. Curabitur eget orci. Cras laoreet ligula. Etiam sit amet dolor. </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Accordion end -->
                    </div>
                </div>
            </div>
        </section>
        <!--end section-->
        <div class="clearfix"></div>


        <section class="sec-padding">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 slide-controls-color-4">
                        <h4 class="uppercase">People Says</h4>
                        <div class="title-line-4 green less-margin"></div>
                        <br/>
                        <br/>
                        <div class="clearfix"></div>
                        <div id="owl-demo3" class="owl-carousel">
                            <div class="item">
                                <div class="feature-box52 two text-left">
                                    <p>Duis tincidunt, sapien eget accumsan cursus, lectus ante euismod odio, at congue urna erat in eros. Donec cursus ultricies neque. Curabitur augue erat, faucibus nec, dapibus non, rutrum in</p>
                                </div>
                                <div class="col-md-12 col-sm-12 col-xs-12 text-left nopadding">
                                    <div class="iconbox-medium round left overflow-hidden"><img src="http://placehold.it/110x110" alt=""/></div>
                                    <h5 class="less-mar1">Elizabeth</h5>
                                    <span>Mediatricks - Manager</span> </div>

                                <!--end item-->

                            </div>
                            <div class="item">
                                <div class="feature-box52 two text-left">
                                    <p>Duis tincidunt, sapien eget accumsan cursus, lectus ante euismod odio, at congue urna erat in eros. Donec cursus ultricies neque. Curabitur augue erat, faucibus nec, dapibus non, rutrum in</p>
                                </div>
                                <div class="col-md-12 col-sm-12 col-xs-12 text-left nopadding">
                                    <div class="iconbox-medium round left overflow-hidden"><img src="http://placehold.it/110x110" alt=""/></div>
                                    <h5 class="less-mar1">Elizabeth</h5>
                                    <span>Mediatricks - Manager</span> </div>

                                <!--end item-->

                            </div>
                        </div>
                    </div>
                    <!--end item-->

                    <div class="col-md-6 slide-controls-color-4">
                        <h4 class="uppercase">Latest News</h4>
                        <div class="title-line-4 green less-margin"></div>
                        <br/>
                        <br/>
                        <div class="clearfix"></div>
                        <div id="owl-demo2" class="owl-carousel ">
                            <div class="item no-gutter">
                                <div class="col-md-6 col-sm-6">
                                    <div class="feature-box53 bmargin">
                                        <div class="image-holder">
                                            <div class="post-date-box green-3"> 25 <span>May, 2020</span> </div>
                                            <img src="http://placehold.it/800x650" alt="" class="img-responsive"/> </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-6 padding-left-4">
                                    <div class="feature-box53 left-padding bmargin">
                                        <h4 class="uppercase less-mar3"><a href="#">Rutrum Adipiscing</a></h4>
                                        <div class="blog-post-info"> <span><i class="fa fa-user"></i> By Benjamin</span> <span><i class="fa fa-comments-o"></i> 15 Comments</span> </div>
                                        <div class="clearfix"></div>
                                        <br/>
                                        <p>Lorem ipsum dolor sit amet, adipiscing elit. Suspendisse et justo sit amet Praesent mattis et sit justo Suspendisse et lorem .</p>
                                        <p>Lorem ipsum dolor sit amet, adipiscing elit. Suspendisse et justo</p>
                                    </div>
                                </div>
                            </div>
                            <!--end item-->

                            <div class="item no-gutter">
                                <div class="col-md-6 col-sm-6">
                                    <div class="feature-box53 bmargin">
                                        <div class="image-holder">
                                            <div class="post-date-box green-3"> 25 <span>May, 2020</span> </div>
                                            <img src="http://placehold.it/800x650" alt="" class="img-responsive"/> </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-6 padding-left-4">
                                    <div class="feature-box53 left-padding bmargin">
                                        <h4 class="uppercase less-mar3"><a href="#">Rutrum Adipiscing</a></h4>
                                        <div class="blog-post-info"> <span><i class="fa fa-user"></i> By Benjamin</span> <span><i class="fa fa-comments-o"></i> 15 Comments</span> </div>
                                        <div class="clearfix"></div>
                                        <br/>
                                        <p>Lorem ipsum dolor sit amet, adipiscing elit. Suspendisse et justo sit amet Praesent mattis et sit justo Suspendisse et lorem .</p>
                                        <p>Lorem ipsum dolor sit amet, adipiscing elit. Suspendisse et justo</p>
                                    </div>
                                </div>
                            </div>
                            <!--end item-->
                        </div>
                    </div>
                    <!--end item-->
                </div>
            </div>
        </section>
        <!--end section-->
        <div class="clearfix"></div>

<jsp:include page="master/foot.jsp"/>
