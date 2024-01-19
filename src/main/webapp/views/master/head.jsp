


<!-- Spinner Start -->
<div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
    <div class="spinner-grow text-primary" role="status"></div>
</div>
<!-- Spinner End -->


<!-- Navbar start -->
<div class="container-fluid fixed-top" style="z-index: 100;">
    <div class="container topbar bg-primary d-none d-lg-block">
        <div class="d-flex justify-content-between">
            <div class="top-info ps-2">
                <small class="me-3"><i class="fas fa-map-marker-alt me-2 text-secondary"></i> <a href="#" class="text-white">123 Street, New York</a></small>
                <small class="me-3"><i class="fas fa-envelope me-2 text-secondary"></i><a href="#" class="text-white">Email@Example.com</a></small>
            </div>
            <div class="top-link pe-2">
                <a href="#" class="text-white"><small class="text-white mx-2">Privacy Policy</small>/</a>
                <a href="#" class="text-white"><small class="text-white mx-2">Terms of Use</small>/</a>
                <a href="#" class="text-white"><small class="text-white ms-2">Sales and Refunds</small></a>
            </div>
        </div>
    </div>
    <div class="container px-0">
        <nav class="navbar navbar-light bg-white navbar-expand-xl">
            <a href="${pageContext.request.contextPath}/" class="navbar-brand"><h1 class="text-primary display-6"><%=Config.app_name%></h1></a>
            <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="fa fa-bars text-primary"></span>
            </button>
            <div class="collapse navbar-collapse bg-white" id="navbarCollapse">
                <div class="navbar-nav mx-auto">
                    <a href="${pageContext.request.contextPath}/" class="nav-item nav-link active">Home</a>
                    <a href="${pageContext.request.contextPath}/events" class="nav-item nav-link">Shop</a>
                    <a href="${pageContext.request.contextPath}/event-detail" class="nav-item nav-link">Shop Detail</a>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Pages</a>
                        <div class="dropdown-menu m-0 bg-secondary rounded-0">
                            <a href="${pageContext.request.contextPath}/views/cart.jsp" class="dropdown-item">Cart</a>
                            <a href="${pageContext.request.contextPath}/views/products/checkout.jsp" class="dropdown-item">Chackout</a>
                            <a href="${pageContext.request.contextPath}/views/testimonial.html" class="dropdown-item">Testimonial</a>
                            <a href="${pageContext.request.contextPath}/views/404.html" class="dropdown-item">404 Page</a>
                        </div>
                    </div>
                    <a href="${pageContext.request.contextPath}/views/contact.html" class="nav-item nav-link">Contact</a>
                </div>
                <div class="d-flex m-3 me-0">
                        <form class="position-relative me-4 my-auto" action="${pageContext.request.contextPath}/change-language" onchange="submit()" method="post">
                            <input type="hidden" name="current_uri" value="<%=request.getAttribute("uri")%>">
                            <select class="form-control" name="lang" id="lang">
                                    <option <%=language.getLocale().getLanguage().equals("en") ? "selected" : ""%> value="en"><%=language.getString("english")%></option>
                                    <option <%=language.getLocale().getLanguage().equals("vi") ? "selected" : ""%> value="vi"><%=language.getString("vietnamese")%></option>
                            </select>
                        </form>
                    <button class="btn-search btn border border-secondary btn-md-square rounded-circle bg-white me-4 ml-2" data-bs-toggle="modal" data-bs-target="#searchModal"><i class="fas fa-search text-primary"></i></button>
                    <a href="${pageContext.request.contextPath}/user/viewCart" class="position-relative me-4 my-auto">
                        <i class="fa fa-shopping-bag fa-2x"></i>
                        <%if (user_id != null) { %>
                            <span class="position-absolute bg-secondary rounded-circle d-flex align-items-center justify-content-center text-dark px-1" style="top: -5px; left: 15px; height: 20px; min-width: 20px;"><%=user.count%></span>
                        <% } else { %>
                            <span class="position-absolute bg-secondary rounded-circle d-flex align-items-center justify-content-center text-dark px-1" style="top: -5px; left: 15px; height: 20px; min-width: 20px;">0</span>
                         <% } %>
                    </a>
                    <% if (user_id == null) { %>
                        <div class="row">
                            <div class="col-6 p-0" >
                                <a href="${pageContext.request.contextPath}/register"><span class="">
                                    <button class="btn btn-warning"><%=language.getString("register")%></button>
                                </span></a>
                            </div>
                            <div class="col-6 p-0" >
                                <a href="${pageContext.request.contextPath}/login"><span class="">
                                    <button class="btn btn-primary"><span class="text-nowrap"><%=language.getString("login")%></span></button>
                                </span></a>
                            </div>
                        </div>
                    <% } else { %>
                        <% if (user != null) { %>
                            <a href="${pageContext.request.contextPath}/user/profile" class="mr-1">
                                <img src="<%=user.avatar.startsWith("http") ? user.avatar : request.getContextPath() + user.avatar%>" alt="" style="width: 44px; height: 44px;border-radius: 50%; object-fit: cover">
                            </a>
                            <div class="dropdown d-flex flex-column justify-content-center">
                                <p class="dropdown-toggle align-items-center m-0 ml-1" id="dropdownMenuButton1" data-bs-toggle="dropdown"><%=user.name%></p>
                                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/user/profile"><%=language.getString("profile")%></a></li>
                                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/logout"><%=language.getString("logout")%></a></li>
                                </ul>
                            </div>
                        <% } %>
                    <% } %>
                </div>
            </div>
        </nav>
    </div>
</div>
<!-- Navbar End -->



        <!-- Modal Search Start -->
        <div class="modal fade" id="searchModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-fullscreen">
                <div class="modal-content rounded-0">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Search by keyword</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body d-flex align-items-center">
                        <div class="input-group w-75 mx-auto d-flex">
                            <input type="search" class="form-control p-3" placeholder="keywords" aria-describedby="search-icon-1">
                            <span id="search-icon-1" class="input-group-text p-3"><i class="fa fa-search"></i></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal Search End -->