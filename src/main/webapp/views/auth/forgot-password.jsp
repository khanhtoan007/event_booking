<%@ include file="../master/head.jsp" %>
<div class="container-fluid py-5 mb-5 hero-header">
    <div class="container py-5">
        <div class="row g-5 d-flex align-items-center">
            <div class="col-3"></div>
            <div class="col-6">
                <h3 class="mb-5 display-3 text-primary"><%= language.getString("reset_password")%></h3>
                <form action="${pageContext.request.contextPath}/forgot-password" method="post">
                    <div class="form-group">
                        <label for="email"><%=language.getString("email")%></label>
                        <input required type="email" class="form-control" id="email" name="email">
                    </div>
                    <div class="d-grid gap-2 mt-2">
                        <button type="submit" class="btn btn-primary"><%= language.getString("send_request").toUpperCase() %></button>
                    </div>
                </form>
            </div>
            <div class="col-3"></div>
        </div>
    </div>
</div>
<%@ include file="../master/foot.jsp" %>