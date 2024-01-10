<%@ include file="../master/head.jsp" %>
<div class="container-fluid py-5 mb-5 hero-header">
  <div class="container py-5">
    <div class="row g-5 d-flex align-items-center">
      <% if (request.getAttribute("verify_status").equals("success")){ %>
        <h1 class="text-primary"><%=language.getString("verify_success")%></h1>
      <% } else { %>
        <h1 class="text-danger"><%=language.getString("verify_fail")%></h1>
      <% } %>
      <h3 id="countdown"></h3>
      <h3><%=language.getString("go_to_login").replace("url", request.getContextPath() + "/login")%></h3>
    </div>
  </div>
</div>
<%@ include file="../master/foot.jsp" %>
<script>
  window.onload = function() {
    window.setTimeout(function () {
      location.href = "${pageContext.request.contextPath}/login";
    }, 10000);
    let timeLeft = 10;
    const x = setInterval(function() {
      document.getElementById("countdown").innerHTML = "<%=language.getString("time_redirect")%>".replace("xx", timeLeft);
      timeLeft--;
      if (timeLeft < 0) {
        clearInterval(x);
        document.getElementById("countdown").innerHTML = "0";
      }
    }, 1000);
  };
</script>