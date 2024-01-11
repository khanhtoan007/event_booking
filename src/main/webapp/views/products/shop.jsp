<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../master/head.jsp" %>


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


        <!-- Single Page Header start -->
        <div class="container-fluid page-header py-5" style="background: url('../../assets/img/cart-page-header-img.jpg')">
            <h1 class="text-center text-white display-6">Shop</h1>
            <ol class="breadcrumb justify-content-center mb-0">
                <li class="breadcrumb-item"><a href="#">Home</a></li>
                <li class="breadcrumb-item"><a href="#">Pages</a></li>
                <li class="breadcrumb-item active text-white">Shop</li>
            </ol>
        </div>
        <!-- Single Page Header End -->


        <!-- Fruits Shop Start-->
        <div id="app" class="container-fluid fruite py-5">
            <div class="container py-5">
                <h1 class="mb-4">Event</h1>
                <div class="row g-4">
                    <div class="col-lg-12">
                        <div class="row g-4">
                            <div class="col-xl-3">
                                <div class="input-group w-100 mx-auto d-flex">
                                    <input type="search" class="form-control p-3" placeholder="keywords" aria-describedby="search-icon-1">
                                    <span id="search-icon-1" class="input-group-text p-3"><i class="fa fa-search"></i></span>
                                </div>
                            </div>
                            <div class="col-6"></div>
<%--                            <div class="col-xl-3">--%>
<%--                                <div class="bg-light ps-3 py-3 rounded d-flex justify-content-between mb-4">--%>
<%--                                    <label for="fruits">Default Sorting:</label>--%>
<%--                                    <select id="fruits" name="fruitlist" class="border-0 form-select-sm bg-light me-3" form="fruitform">--%>
<%--                                        <option value="volvo">Nothing</option>--%>
<%--                                        <option value="saab">Popularity</option>--%>
<%--                                        <option value="opel">Organic</option>--%>
<%--                                        <option value="audi">Fantastic</option>--%>
<%--                                    </select>--%>
<%--                                </div>--%>
<%--                            </div>--%>
                        </div>
                        <div class="row g-4">
                            <div class="col-lg-3">
                                <div class="row g-4">
                                    <div class="col-lg-12">
                                        <div class="mb-3">
                                            <h4>Categories</h4>
                                            <template v-for="(value, key) in categories">
                                                <div class="form-check">
                                                    <input v-model="categories_selection[key]" class="form-check-input" type="checkbox" value="" :id="value.id">
                                                    <label class="form-check-label" :for="value.id">
                                                        {{value.name}}({{value.count}})
                                                    </label>
                                                </div>
                                            </template>
                                            <button v-on:click="check">check</button>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="mb-3">
                                            <h4 class="mb-2">Min price</h4>
                                            <input type="range" class="form-range w-100" id="rangeInput_min" name="rangeInput_min" min="30000" max="100000" value="0" oninput="amount_min.value=rangeInput_min.value">
                                            <input class="form-control" type="number" id="amount_min" name="amount_min" min="30000" max="100000" value="0">
                                        </div>
                                        <div class="mb-3">
                                            <h4 class="mb-2">Max price</h4>
                                            <input type="range" class="form-range w-100" id="rangeInput_max" name="rangeInput_max" min="30000" max="100000" value="0" oninput="amount_max.value=rangeInput_max.value">
                                            <input class="form-control" id="amount_max" name="amount_max" min="30000" max="100000" type="text" value="0">
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <h4 class="mb-3">Featured products</h4>
                                        <div class="d-flex align-items-center justify-content-start">
                                            <div class="rounded me-4" style="width: 100px; height: 100px;">
                                                <img src="${pageContext.request.contextPath}/assets/img/featur-1.jpg" class="img-fluid rounded" alt="">
                                            </div>
                                            <div>
                                                <h6 class="mb-2">Big Banana</h6>
                                                <div class="d-flex mb-2">
                                                    <i class="fa fa-star text-secondary"></i>
                                                    <i class="fa fa-star text-secondary"></i>
                                                    <i class="fa fa-star text-secondary"></i>
                                                    <i class="fa fa-star text-secondary"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                                <div class="d-flex mb-2">
                                                    <h5 class="fw-bold me-2">2.99 $</h5>
                                                    <h5 class="text-danger text-decoration-line-through">4.11 $</h5>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="d-flex align-items-center justify-content-start">
                                            <div class="rounded me-4" style="width: 100px; height: 100px;">
                                                <img src="${pageContext.request.contextPath}/assets/img/featur-2.jpg" class="img-fluid rounded" alt="">
                                            </div>
                                            <div>
                                                <h6 class="mb-2">Big Banana</h6>
                                                <div class="d-flex mb-2">
                                                    <i class="fa fa-star text-secondary"></i>
                                                    <i class="fa fa-star text-secondary"></i>
                                                    <i class="fa fa-star text-secondary"></i>
                                                    <i class="fa fa-star text-secondary"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                                <div class="d-flex mb-2">
                                                    <h5 class="fw-bold me-2">2.99 $</h5>
                                                    <h5 class="text-danger text-decoration-line-through">4.11 $</h5>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="d-flex align-items-center justify-content-start">
                                            <div class="rounded me-4" style="width: 100px; height: 100px;">
                                                <img src="${pageContext.request.contextPath}/assets/img/featur-3.jpg" class="img-fluid rounded" alt="">
                                            </div>
                                            <div>
                                                <h6 class="mb-2">Big Banana</h6>
                                                <div class="d-flex mb-2">
                                                    <i class="fa fa-star text-secondary"></i>
                                                    <i class="fa fa-star text-secondary"></i>
                                                    <i class="fa fa-star text-secondary"></i>
                                                    <i class="fa fa-star text-secondary"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                                <div class="d-flex mb-2">
                                                    <h5 class="fw-bold me-2">2.99 $</h5>
                                                    <h5 class="text-danger text-decoration-line-through">4.11 $</h5>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="d-flex justify-content-center my-4">
                                            <a href="#" class="btn border border-secondary px-4 py-3 rounded-pill text-primary w-100">Vew More</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-9">
                                <div class="row g-4 justify-content-center">
                                    <c:forEach items="${list}" var="list" >
                                        <div href="/event-detail/${list.id}" class=" col-md-6 col-lg-6 col-xl-4">
                                            <div class="card-body rounded position-relative fruite-item">
                                                <div class="fruite-img">
                                                    <img src="${pageContext.request.contextPath}${list.image}" class="img-fluid w-100 rounded-top" alt="https://images.tkbcdn.com/1/780/300/Upload/eventcover/2023/12/05/BD6288.jpg">
                                                </div>
                                                <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">${list.category_name}</div>
                                                <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                    <h4 class="card-title">${list.title}</h4>
                                                    <p class="card-text">${list.content}</p>
                                                    <div class="d-flex justify-content-between flex-lg-wrap">
                                                        <p class="text-dark fs-5 fw-bold mb-0">${list.price}VND/person</p>
                                                        <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Fruits Shop End-->
<%@ include file="../master/foot.jsp" %>
<script>
    var app = new Vue({
        el: "#app",
        data: {
            categories: [],
            categories_selection: [],
        },
        created() {
            this.getCategories()
        },
        methods: {
            getCategories(){
                axios.get('<%=request.getContextPath()%>/get-categories')
                    .then((res)=>{
                        this.categories = JSON.parse(res.data.categories)
                        let sum = 0;
                        for (let i = 0; i < this.categories.length; i++) {
                            sum += parseInt(this.categories[i].count)
                        }
                        this.categories.unshift({id: "0", name: "<%=language.getString("all_cate")%>", count: sum.toString()})
                    })
            },
            check(){
                for (let i = 0; i < this.categories_selection.length; i++) {
                    console.log(this.categories_selection[i])
                }
            }
            // selectCategory(selected_category){
            //     if (this.categories_selection.indexOf(selected_category) === -1){
            //         this.categories_selection.push(selected_category)
            //     } else {
            //         var index = this.categories.indexOf(selected_category)
            //         this.categories_selection.splice(index, 1)
            //     }
            //     console.log(this.categories_selection)
            // }
        }
    })
</script>