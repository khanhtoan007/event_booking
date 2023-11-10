<%@ page import="com.example.bookingevent.models.EventPost" %>
<%@ page import="com.example.bookingevent.daos.EventDAO" %>
<%@ page import="java.util.ArrayList" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="master/head.jsp"/>
<%@page pageEncoding="UTF-8" %>
<%ArrayList<EventPost> eventPosts = (ArrayList<EventPost>) request.getAttribute("event");%>
<section class="py-5">

    <div class="container">

        <div class="row gx-5">
            <aside class="col-lg-6">
                <div class="border rounded-4 mb-3 d-flex justify-content-center">
                    <a data-fslightbox="mygalley" class="rounded-4" target="_blank" data-type="image" href="https://bootstrap-ecommerce.com/bootstrap5-ecommerce/images/items/detail1/big.webp">
                        <img style="max-width: 100%; max-height: 100vh; margin: auto;" class="rounded-4 fit" src="https://static.tkbcdn.com/Upload/agenda/2023/10/17/92554A.jpg" />
                    </a>
                </div>
                <div class="d-flex justify-content-center mb-3">
                    <a data-fslightbox="mygalley" class="border mx-1 rounded-2" target="_blank" data-type="image" href="https://bootstrap-ecommerce.com/bootstrap5-ecommerce/images/items/detail1/big1.webp" class="item-thumb">
                        <img width="60" height="60" class="rounded-2" src="https://static.tkbcdn.com/Upload/agenda/2023/10/17/92554A.jpg" />
                    </a>
                    <a data-fslightbox="mygalley" class="border mx-1 rounded-2" target="_blank" data-type="image" href="https://bootstrap-ecommerce.com/bootstrap5-ecommerce/images/items/detail1/big2.webp" class="item-thumb">
                        <img width="60" height="60" class="rounded-2" src="https://static.tkbcdn.com/Upload/agenda/2023/10/17/92554A.jpg" />
                    </a>
                    <a data-fslightbox="mygalley" class="border mx-1 rounded-2" target="_blank" data-type="image" href="https://bootstrap-ecommerce.com/bootstrap5-ecommerce/images/items/detail1/big3.webp" class="item-thumb">
                        <img width="60" height="60" class="rounded-2" src="https://static.tkbcdn.com/Upload/agenda/2023/10/17/92554A.jpg" />
                    </a>
                    <a data-fslightbox="mygalley" class="border mx-1 rounded-2" target="_blank" data-type="image" href="https://bootstrap-ecommerce.com/bootstrap5-ecommerce/images/items/detail1/big4.webp" class="item-thumb">
                        <img width="60" height="60" class="rounded-2" src="https://static.tkbcdn.com/Upload/agenda/2023/10/17/92554A.jpg" />
                    </a>
                    <a data-fslightbox="mygalley" class="border mx-1 rounded-2" target="_blank" data-type="image" href="https://bootstrap-ecommerce.com/bootstrap5-ecommerce/images/items/detail1/big.webp" class="item-thumb">
                        <img width="60" height="60" class="rounded-2" src="https://static.tkbcdn.com/Upload/agenda/2023/10/17/92554A.jpg" />
                    </a>
                </div>
                <!-- thumbs-wrap.// -->
                <!-- gallery-wrap .end// -->
            </aside>
            <main class="col-lg-6">
                <div class="ps-lg-3">
                    <h4 class="title text-dark">
                        <%= eventPosts.get(0).getTitle()%>
                    </h4>
                    <div class="d-flex flex-row my-3">
                        <div class="text-warning mb-1 me-2">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fas fa-star-half-alt"></i>
                            <span class="ms-1">
              </span>
                        </div>
                        <span class="text-muted"><i class="fas fa-shopping-basket fa-sm mx-1"></i>200 người tham dự</span>
                        <span class="text-success ms-2"><%= eventPosts.get(0).getLocation()%></span>
                    </div>

                    <p><%= eventPosts.get(0).getContent()%></p>

                    <div class="row">
                        <dt class="col-3">Thời gian:</dt>
                        <dd class="col-9"><%= eventPosts.get(0).getStart_date()%></dd>

                        <dt class="col-3">Địa điểm</dt>
                        <dd class="col-9"><%= eventPosts.get(0).getLocation()%></dd>

                        <dt class="col-3">Type</dt>
                        <dd class="col-9"><%= eventPosts.get(0).getCategory_name()%></dd>

                        <dt class="col-3">Nhà tổ chức</dt>
                        <dd class="col-9"><%= eventPosts.get(0).getU_name()%></dd>
                    </div>

                    <hr />

                    <div class="row mb-4">
                        <div class="col-md-4 col-6">
                            <label class="mb-2">Loại vé</label>
                            <select class="form-select border border-secondary" style="height: 35px;">
                                <option>VIP</option>
                                <option>Medium</option>
                                <option>Standard</option>
                            </select>
                        </div>
                        <!-- col.// -->
                    </div>
                    <br/><br/>
                    <a href="#" class="btn btn-warning shadow-0"> Book now </a>
                    <a href="#" class="btn btn-primary shadow-0"> <i class="me-1 fa fa-shopping-basket"></i> Add to Favorite </a>
                </div>
            </main>
        </div>
    </div>
</section>
<!-- content -->

<!-- Footer -->
<jsp:include page="master/foot.jsp"/>