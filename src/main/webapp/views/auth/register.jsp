<%@ include file="../master/head.jsp" %>
<div class="container-fluid py-5 mb-5 hero-header">
  <div class="container py-5">
    <div class="row g-5 align-items-center">
      <h3 class="mb-5 display-3 text-primary"><%= language.getString("register") %></h3>
      <form action="${pageContext.request.contextPath}/register" method="post">
        <div class="row">
          <div class="col-6">
            <div class="form-group">
              <label for="email"><%=language.getString("email")%></label>
              <input required value="<%=request.getAttribute("email") != null ? request.getAttribute("email") : ""%>" type="email" class="form-control" id="email" name="email">
            </div>
            <div class="form-group">
              <label for="name"><%=language.getString("name")%></label>
              <input required value="<%=request.getAttribute("name") != null ? request.getAttribute("name") : ""%>" type="text" class="form-control" id="name" name="name">
            </div>
            <div class="form-group">
              <label for="phone"><%=language.getString("phone")%></label>
              <input required value="<%=request.getAttribute("phone") != null ? request.getAttribute("phone") : ""%>" type="tel" class="form-control" id="phone" name="phone">
            </div>
          </div>
          <div class="col-6">
            <div class="form-group">
              <label for="password"><%=language.getString("password")%></label>
              <input required value="<%=request.getAttribute("password") != null ? request.getAttribute("password") : ""%>" type="password" class="form-control" id="password" name="password">
            </div>
            <div class="form-group">
              <label for="re_password"><%=language.getString("re_password")%></label>
              <input required value="<%=request.getAttribute("re_password") != null ? request.getAttribute("re_password") : ""%>" type="password" class="form-control" id="re_password" name="re_password">
            </div>
            <div class="form-group">
              <label><%=language.getString("gender")%></label>
              <div class="row">
                <div class="col-6">
                  <div class="form-check">
                    <input class="form-check-input" type="radio" name="gender" id="flexRadioDefault1" value="true" <%=request.getAttribute("gender")!=null ? request.getAttribute("gender").equals("true") ? "checked" : "" : ""%>>
                    <label class="form-check-label" for="flexRadioDefault1">
                      <%=language.getString("male")%>
                    </label>
                  </div>
                </div>
                <div class="col-6">
                  <div class="form-check">
                    <input class="form-check-input" type="radio" name="gender" id="flexRadioDefault2"  value="false" <%=request.getAttribute("gender")!=null ? request.getAttribute("gender").equals("false") ? "checked" : "" : ""%>>
                    <label class="form-check-label" for="flexRadioDefault2">
                      <%=language.getString("female")%>
                    </label>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="d-grid gap-2 mt-2">
          <button type="submit" class="btn btn-primary"><%= language.getString("register").toUpperCase() %></button>
          <p><%=language.getString("already_have_account").replace("url", request.getContextPath() + "/login")%></p><br>
        </div>
      </form>
    </div>
  </div>
</div>
<%@ include file="../master/foot.jsp" %>
