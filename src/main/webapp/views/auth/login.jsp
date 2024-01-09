<%@ include file="../master/head.jsp" %>
<div class="container-fluid py-5 mb-5 hero-header">
    <div class="container py-5">
        <div class="row g-5 d-flex align-items-center">
            <div class="col-3"></div>
            <div class="col-6">
                <h1 class="mb-5 display-3 text-primary"><%= language.getString("login")%></h1>
                <form action="${pageContext.request.contextPath}/login" method="post">
                    <div class="form-group">
                        <label for="email"><%=language.getString("email")%></label>
                        <input required value="<%=request.getAttribute("email") != null ? request.getAttribute("email") : ""%>" type="email" class="form-control" id="email" name="email">
                    </div>
                    <div class="form-group">
                        <label for="password"><%=language.getString("password")%></label>
                        <input required value="<%=request.getAttribute("password") != null ? request.getAttribute("password") : ""%>" type="password" class="form-control" id="password" name="password">
                    </div>
                    <div class="d-grid gap-2 mt-2">
                        <button type="submit" class="btn btn-primary"><%= language.getString("login").toUpperCase() %></button>
                    </div>
                </form>
            </div>
            <div class="col-3"></div>
        </div>
    </div>
</div>
<%@ include file="../master/foot.jsp" %>