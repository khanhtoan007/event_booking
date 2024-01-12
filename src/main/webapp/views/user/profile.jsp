<%@ include file="../master/head.jsp" %>
<div class="container-fluid py-5 mb-5 hero-header">
  <div class="container py-5">
    <div class="row g-5 d-flex align-items-center">
      <div class="col-7">
        <h1 class="mb-5 display-3 text-primary"><%= language.getString("profile") %></h1>

        <form action="${pageContext.request.contextPath}/user/profile-update-name-gender" method="post">
          <div class="card-body">
            <div class="form-group">
              <label for="name"><%=language.getString("name")%></label>
              <input required value="<%=user.name%>" type="text" class="form-control" id="name" name="name">
            </div>
            <div class="form-group">
              <label><%=language.getString("gender")%></label>
              <div class="row">
                <div class="col-6">
                  <div class="form-check">
                    <input class="form-check-input" type="radio" name="gender" id="flexRadioDefault1" value="true" <%=user.gender.equals("1") ? "checked" : ""%>>
                    <label class="form-check-label" for="flexRadioDefault1">
                      <%=language.getString("male")%>
                    </label>
                  </div>
                </div>
                <div class="col-6">
                  <div class="form-check">
                    <input class="form-check-input" type="radio" name="gender" id="flexRadioDefault2"  value="false" <%=user.gender.equals("0") ? "checked" : ""%>>
                    <label class="form-check-label" for="flexRadioDefault2">
                      <%=language.getString("female")%>
                    </label>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="d-grid gap-2 mt-2">
            <button type="submit" class="btn btn-primary"><%= language.getString("update").toUpperCase() %></button>
          </div>
        </form>

        <form action="${pageContext.request.contextPath}/user/profile-update-email" method="post">
          <div class="row">
            <div class="col-9">
              <div class="form-group">
                <label for="email"><%=language.getString("email")%>(<%=language.getString("have_to_re_verify")%>)</label>
                <input required value="<%=user.email%>" type="email" class="form-control" id="email" name="email">
              </div>
            </div>
            <div class="col-3">
              <label for="email"><%=language.getString("update")%></label>
              <div class="d-grid gap-2">
                <button type="submit" class="btn btn-primary"><%= language.getString("update").toUpperCase() %></button>
              </div>
            </div>
          </div>
        </form>

        <form action="${pageContext.request.contextPath}/user/profile-update-phone" method="post">
          <div class="row">
            <div class="col-9">
              <div class="form-group">
                <label for="phone"><%=language.getString("phone")%></label>
                <input required value="<%=user.phone%>" type="tel" class="form-control" id="phone" name="phone">
              </div>
            </div>
            <div class="col-3">
              <div class="d-grid">
                <label for="phone"><%=language.getString("update")%></label>
                <button type="submit" class="btn btn-primary"><%= language.getString("update").toUpperCase() %></button>
              </div>
            </div>
          </div>
        </form>

        <form action="${pageContext.request.contextPath}/user/profile-update-password" method="post">
          <div class="form-group">
            <label for="password"><%=language.getString("password")%></label>
            <input required value="" type="password" class="form-control" id="password" name="password">
          </div>
          <div class="form-group">
            <label for="new_password"><%=language.getString("new_password")%></label>
            <input required value="" type="password" class="form-control" id="new_password" name="new_password">
          </div>
          <div class="form-group">
            <label for="new_re_password"><%=language.getString("new_re_password")%></label>
            <input required value="" type="password" class="form-control" id="new_re_password" name="new_re_password">
          </div>
          <div class="d-grid gap-2 mt-2">
            <button type="submit" class="btn btn-primary"><%= language.getString("update").toUpperCase() %></button>
          </div>
        </form>

      </div>
      <div class="col-5">
        <div class="col-12 row">
            <div class="col-6">
              <img src="<%=user.avatar.startsWith("http") ? user.avatar : request.getContextPath() + user.avatar%>" style="max-width: 100%" alt="">
            </div>
            <div class="col-6">
              <img src="" style="width: 100%;" id="preview_avatar" alt="">
            </div>
            <div class="d-grid gap-2 mt-2">
            <div class="row">
              <div class="col-6">
                <label for="new_avatar" style="width: 100%" class="btn btn-primary"><%= language.getString("choose_avatar").toUpperCase() %></label>
              </div>
              <div class="col-6">
                <form action="${pageContext.request.contextPath}/user/update-avatar" enctype="multipart/form-data" method="post">
                  <input required onchange="chooseAvatar(event)" type="file" hidden="hidden" name="new_avatar" id="new_avatar" accept="image/*">
                  <button type="submit" hidden="hidden" id="update_avatar_button" class="btn btn-primary"><%= language.getString("update_avatar").toUpperCase() %></button>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<%@ include file="../master/foot.jsp" %>
<script>
  function chooseAvatar(e) {
    var file = e.target.files[0];
    var reader = new FileReader();
    reader.onload = function (e) {
      document.getElementById('preview_avatar').setAttribute('src', e.target.result);
    }
    const button = document.getElementById("update_avatar_button");
    if (button) {
      button.removeAttribute("hidden");
    }
    reader.readAsDataURL(file);
  }
</script>
