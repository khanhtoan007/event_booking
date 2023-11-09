<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.bookingevent.database.MyObject" %>
<%@ page import="com.example.bookingevent.database.DB" %>
<% ArrayList<MyObject> cates = DB.getData("select distinct category from Event", new String[]{"category"}); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="master/head.jsp"/>
  <div class="clearfix"></div>

<div class="clearfix"></div>

<section class="property-search">
  <div class="container">
    <div class="row">
      <form action="${pageContext.request.contextPath}/search" method="post">
        <div class="col-md-3 col-sm-6">
          <label>Location</label>
          <select name="location">
            <option value="0" selected="selected"> Any </option>
            <c:forEach items="${list}" var="list">
              <option value="${list.id}">${list.location}</option>
            </c:forEach>
          </select>
        </div>
        <div class="col-md-3 col-sm-6">
          <label>Event Type</label>
          <select name="category">
            <option value="0" selected="selected"> Any </option>
            <% for (int i = 0; i < cates.size(); i++) { %>
            <option value="<%=cates.get(i).category%>"><%=cates.get(i).category%></option>
            <% } %>
          </select>
        </div>
        <div class="col-md-3 col-sm-6">
          <label>Event Status</label>
          <select name="state">
            <option value="0" selected="selected"> Any </option>
            <c:forEach items="${state}" var="list">
              <option value="${state.id}">${state.state = "1" ? "Available":"Expired"}</option>
            </c:forEach>
          </select>
        </div>
        <div class="col-md-3 col-sm-6">
          <label for="title">Event Status</label>
          <input class="form-control" name="title" id="title" />
        </div>
        <div class="clearfix"></div>
        <div class="col-divider-margin-1"></div>
        <div class="col-md-2 col-sm-6"> <br/>
          <input class="search-btn" type="submit" value="Search">
        </div>
        <!--end item-->
      </form>
    </div>
  </div>
</section>
<!-- end section -->
  
  <section>
    <div class="header-inner two">
      <div class="inner text-center">
        <h4 class="title text-white uppercase">Properties Listing</h4>
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

        <c:forEach items="${list}" var="list">
          <div class="col-md-6 col-sm-6">
            <div class="feature-box-66 border">
              <div class="image-holder"> <a href="${pageContext.request.contextPath}/event-detail?id=${list.id}">
                <div class="status">${list.state = "0" ? "Available":"Expired"}</div>
                <div class="price">${list.category}</div>
                <img src="${list.image}" alt="" class="img-responsive"/></a> </div>
              <div class="text-box-inner">
                <h5 class="less-mar1"><a href="${pageContext.request.contextPath}/event-detail?id=${list.id}">${list.title}</a></h5>
                <span>${list.location}</span>
                <div class="clearfix"></div>
                <br/>
                <div class="property-info">
                  <div class="pull-left"><span><i class="fa fa-bed"></i>${list.category}</span></div>
                  <div class="pull-right"><span><i class="fa fa-tasks"></i>${list.start_date}</span> <span><i class="fa fa-tasks"></i> ${list.end_date}</span></div>
                </div>
              </div>
            </div>
          </div>
        </c:forEach>
        <!--end item-->
          
        </div>
        <!--end left-->
        
        <div class="col-md-3">
          <h4>Featured Events</h4>
            <div class="title-line-4 green less-margin"></div>
            <div class="clearfix"></div>
          <c:forEach items="${list}" var="list">
            <a href="${pageContext.request.contextPath}/event-detail?id=${list.id}"><img src="${list.image}" alt="" class="img-responsive"/></a>
            <h5 class="paddtop1"><a href="#">${list.location}</a></h5>
            <p>${list.title}</p>
            <h6 class="text-green-3">${list.state = "1" ? "Available":"Expired"}</h6>
            <br/>
            <div class="divider-line solid light"></div>
            <br/>
            <br/>
          </c:forEach>


          <h4>Categories</h4>
          <div class="title-line-4 green less-margin"></div>
          <div class="clearfix"></div>
          <ul class="category-list">
            <li><a href="#">Activity <span class="pull-right">2</span></a></li>
            <li><a href="#">Handmade <span class="pull-right">3</span></a></li>
            <li><a href="#">Workshop <span class="pull-right">2</span></a></li>
          </ul>
        </div>
        <!--end right--> 
        
      </div>
    </div>
  </section>
  <!-- end section -->
  <div class="clearfix"></div>

<jsp:include page="master/foot.jsp"/>
