<%@ page import="com.example.bookingevent.database.MyObject" %>
<%@ page import="java.util.ResourceBundle" %>
<%@ page import="com.example.bookingevent.Init.Config" %>
<%@ page import="com.example.bookingevent.database.DB" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<% ResourceBundle language = (ResourceBundle) request.getAttribute("language");%>
<% String user_id = (String) session.getAttribute("login"); %>
<%MyObject user = DB.getUser(user_id);%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title><%=Config.app_name%></title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="${pageContext.request.contextPath}/assets/lib/lightbox/css/lightbox.min.css" rel="stylesheet">

    <link href="${pageContext.request.contextPath}/assets/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


    <!-- Customized Bootstrap Stylesheet -->
    <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="${pageContext.request.contextPath}/assets/css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css"
          integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>

<body>

<%@ include file="../master/head.jsp" %>




        <!-- Single Page Header start -->
        <div class="container-fluid page-header py-5" style="background: linear-gradient(rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.3)), url(/images/IMG_3098.JPG);">
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
                                    <input v-model="keywords" type="search" class="form-control p-3" placeholder="keywords" aria-describedby="search-icon-1">
                                    <span class="input-group-text p-3 btn btn-primary"><i class="fa fa-search"></i></span>
                                </div>
                            </div>
                            <div class="col-6"></div>
                            <div class="col-xl-3">
                                <div class="bg-light ps-3 py-3 rounded d-flex justify-content-between mb-4">
                                    <label for="fruits">Default Sorting:</label>
                                    <select id="fruits" name="fruitlist" class="border-0 form-select-sm bg-light me-3">
                                        <option value="volvo">Nothing</option>
                                        <option value="saab">Popularity</option>
                                        <option value="opel">Organic</option>
                                        <option value="audi">Fantastic</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row g-4">
                            <div class="col-lg-3">
                                <div class="row g-4">
                                    <div class="col-lg-12">
                                        <div class="mb-3">
                                            <h4><%=language.getString("category")%></h4>
                                            <template v-for="(value, key) in categories">
                                                <div class="form-check">
                                                    <input v-model="categories_selection[key]" class="form-check-input" type="checkbox" value="" :id="value.id">
                                                    <label class="form-check-label" :for="value.id">
                                                        {{value.name}}({{value.count}})
                                                    </label>
                                                </div>
                                            </template>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="mb-3">
                                            <h4 class="mb-2"><%=language.getString("min_price")%></h4>
                                            <input v-model="min_price" type="range" class="form-range w-100" id="rangeInput_min" name="rangeInput_min" min="30000" max="1000000" value="30000">
                                            <input v-model="min_price" class="form-control" type="number" id="amount_min" name="amount_min" min="30000" max="1000000" value="30000">
                                        </div>
                                        <div class="mb-3">
                                            <h4 class="mb-2"><%=language.getString("max_price")%></h4>
                                            <input v-model="max_price" type="range" class="form-range w-100" id="rangeInput_max" name="rangeInput_max" min="30000" max="1000000" value="30000">
                                            <input v-model="max_price" class="form-control" id="amount_max" name="amount_max" min="30000" max="1000000" type="text" value="30000">
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="mb-3">
                                            <h4><%=language.getString("location")%></h4>
                                            <template v-for="(value, key) in locations">
                                                <div class="form-check">
                                                    <input v-model="locations_selection[key]" class="form-check-input" type="checkbox" value="" :id="'location_' + key">
                                                    <label class="form-check-label" :for="'location_' + key">
                                                        {{value.location}}({{value.count}})
                                                    </label>
                                                </div>
                                            </template>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-9">
                                <div class="row g-4 justify-content-center">
                                    <template v-for="(value, key) in view_list">
                                        <a :href="'${pageContext.request.contextPath}/event-detail?event_id=' + value.id" class="col-md-6 col-lg-6 col-xl-4">
                                            <div  >
                                                <div class="rounded position-relative fruite-item">
                                                    <div class="fruite-img">
                                                        <img :src="'${pageContext.request.contextPath}/images/' + value.first_image" class="img-fluid w-100 rounded-top" alt="">
                                                    </div>
                                                    <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;">{{value.category_name}}</div>
                                                    <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                        <h4>{{value.title}}</h4>
                                                        <p>{{value.description}}</p>
                                                        <div class="d-flex justify-content-between flex-lg-wrap">
                                                            <p class="text-dark fs-5 fw-bold mb-0" style="width: 100%"><%=language.getString("added_by")%>: {{value.username}}</p>
                                                            <p class="text-dark fs-5 fw-bold mb-0" style="width: 100%">{{ formatCurrency(value.price) }}</p>
                                                            <p class="text-dark fs-5 fw-bold mb-0" style="width: 100%">{{ '<%=language.getString("sold")%>'.replace('xx', value.count).replace('yy', value.tickets) }}</p>
                                                            <p class="text-dark fs-5 fw-bold mb-0" style="width: 100%">{{ '<%=language.getString("interested")%>'.replace('xx', value.interested) }}</p>
                                                            <a :href="'${pageContext.request.contextPath}/event-detail?event_id=' + value.id" class="btn border border-secondary rounded-pill px-3 text-primary mt-2" style="width: 100%"><i class="fa fa-shopping-bag me-2 text-primary"></i><%=language.getString("view_details")%></a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </a>
                                    </template>
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
                locations_selection: [],
                min_price: 0,
                max_price: 0,
                keywords: '',
                locations: [],
                events: [],
                view_list: []
            },
            created() {
                this.getCategories()
                this.getLocations()
                this.getEvents()
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
                            for (let i = 0; i < this.categories.length; i++) {
                                this.categories_selection[i] = false
                            }
                        })
                },
                getLocations(){
                    axios.get('<%=request.getContextPath()%>/get-locations')
                        .then((res)=>{
                            this.locations = JSON.parse(res.data.locations)
                            let sum = 0;
                            for (let i = 0; i < this.locations.length; i++) {
                                sum += parseInt(this.locations[i].count)
                            }
                            this.locations.unshift({location: "<%=language.getString("all_locations")%>", count: sum})
                            for (let i = 0; i < this.locations.length; i++) {
                                this.locations_selection[i] = false
                            }
                        })

                },
                getEvents(){
                    axios.get('<%=request.getContextPath()%>/all-events')
                        .then((res)=>{
                            this.events = JSON.parse(res.data.events)
                            this.view_list = this.events
                        })
                },
                formatCurrency(value) {
                    const formattedValue = new Intl.NumberFormat('vi-VN', {
                        style: 'currency',
                        currency: 'VND',
                    }).format(value);
                    return formattedValue;
                },
                removeDiacritics(str){
                    return str.normalize("NFD").replace(/[\u0300-\u036f]/g, "");
                },
                updatedList(){
                    this.view_list = this.events.filter( item => {
                        if (this.keywords !== ''){
                            if ( this.removeDiacritics(item.title.toLowerCase()).includes(this.removeDiacritics(this.keywords.toLowerCase())) || this.removeDiacritics(item.description.toLowerCase()).includes(this.removeDiacritics(this.keywords.toLowerCase()))){
                                return true;
                            }
                        }
                        if (this.categories_selection[0] === true){
                            return true;
                        } else {
                            for (let i = 0; i < this.categories_selection.length; i++) {
                                if (this.categories_selection[i] === true){
                                    if (this.categories[i].id.toString() === item.category_id){
                                        return true;
                                    }
                                }
                            }
                        }
                        if (this.locations_selection[0] === true){
                            return true;
                        } else {
                            for (let i = 0; i < this.locations_selection.length; i++) {
                                if (this.locations_selection[i] === true){
                                    if (this.locations[i].location === item.location){
                                        return true;
                                    }
                                }
                            }
                        }
                        let temp_min = parseInt(this.min_price)
                        let temp_max = parseInt(this.max_price)
                        if (temp_min !== 0 && temp_max !== 0){
                            if (temp_min < parseInt(item.price) && temp_max > parseInt(item.price)){
                                return true;
                            }
                        } else {
                            if (temp_min !== 0){
                                if (temp_min < parseInt(item.price)){
                                    return true
                                }
                            }
                            if (temp_max !== 0){
                                if (temp_max > parseInt(item.price)){
                                    return true
                                }
                            }
                        }
                        return false
                    })
                }
            },
            watch: {
                categories_selection(newValue, oldValue) {
                    this.updatedList()
                },
                locations_selection(newValue, oldValue) {
                    this.updatedList()
                },
                min_price(newValue, oldValue) {
                    this.updatedList()
                },
                max_price(newValue, oldValue) {
                    this.updatedList()
                },
                keywords(newValue, oldValue) {
                    this.updatedList()
                },
            }
        })
    </script>
    </body>
</html>
