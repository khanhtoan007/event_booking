<%@ page import="java.util.ResourceBundle" %>
<%@ page import="com.example.bookingevent.Init.Config" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<% ResourceBundle language = (ResourceBundle) request.getAttribute("language");%>

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
<jsp:include page="./master/head.jsp"/>
<div class="container py-5" id="app">
    <div class="row g-5 align-items-center py-5">
        <h3 class="mb-5 display-3 text-primary mt-5  py-5"><%= language.getString("cart") %></h3>
        <table class="table table-striped table-bordered">
            <thead>
            <tr>
                <th scope="col"></th>
                <th scope="col" class="col-3"><%=language.getString("title")%></th>
                <th scope="col"><%=language.getString("quantity")%></th>
                <th scope="col"><%=language.getString("tickets")%></th>
                <th scope="col"><%=language.getString("bought_tickets")%></th>
                <th scope="col"><%=language.getString("current_price")%></th>
                <th scope="col"><%=language.getString("have2pay")%></th>
                <th scope="col"><%=language.getString("note")%></th>
                <th class="text-center" scope="col"><%=language.getString("action")%></th>
            </tr>
            </thead>
            <tbody>
            <template v-for="(value, key) in carts">
                <tr>
                    <td ><input class="groupCheckbox" id="cart_item" type="checkbox" v-on:change="select2bill" v-model="value.is_checked" ></td>
                    <td class="col-3"><a :href=" '${pageContext.request.contextPath}/event-detail?event_id=' + value.event_id">{{value.event_title}}</a> </td>
                    <td>{{value.tickets}}</td>
                    <td>
                        <div class="input-group quantity" style="width: 100px;">
                            <div class="input-group-btn">
                                <button v-on:click="minus(key)" class="btn btn-sm btn-minus rounded-circle bg-light border" >
                                    <i class="fa fa-minus"></i>
                                </button>
                            </div>
                            <input type="text" class="form-control form-control-sm text-center border-0" :value="value.quantity">
                            <div class="input-group-btn">
                                <button v-on:click="plus(key)" class="btn btn-sm btn-plus rounded-circle bg-light border">
                                    <i class="fa fa-plus"></i>
                                </button>
                            </div>
                        </div>
                    <td>{{value.count + '/' + value.tickets}}</td>
                    <td>{{ formatCurrency(value.price) }}</td>
                    <td>{{ formatCurrency(value.have2pay) }}</td>
                    <td>{{value.note}}</td>
                    <td>
                        <div class="col-md-12">
                            <button v-on:click="deleteCart(value.id)" class="btn btn-danger" style="width: 100%">Delete</button>
                        </div>
                    </td>
                </tr>
            </template>
            </tbody>
        </table>
    </div>
        <input v-model="is_check_all" type="checkbox" id="checkAll">
        <label for="checkAll"><%=language.getString("check_all")%></label>
</div>
<%@ include file="/views/master/foot.jsp" %>
<div id="app2" v-if="bills.selected.length !== 0" class="container">
    <div class="container-fluid footer bg-primary fixed-bottom d-flex justify-content-center">
        <div class="container row m-1">
            <div class="col-5">
                <h3>{{ '<%=language.getString("u_have_chosen")%>'.replace('xx', bills.selected.length) }}</h3>
            </div>
            <div class="col-5">
                <h3>{{ '<%=language.getString("total")%>' + bills.total}}</h3>
            </div>
            <div class="col-2">
                <a :href=" '${pageContext.request.contextPath}/user/checkout?cart_ids=' + bills.selected.join(',') " class="btn bg-white border border-secondary rounded-pill px-3 text-dark"><i class="fa fa-shopping-bag me-2 text-primary"></i>
                        <%=language.getString("pay")%>
                </a>
            </div>
        </div>
    </div>
</div>
<script>
    var app = new Vue({
        el: "#app",
        data: {
            carts: [],
            events: [],
            bills: {
                selected: [],
                total: 0
            },
            is_check_all: false
        },
        created() {
            this.getAllCarts();
        },
        methods: {
            getAllCarts(){
                axios.get("<%=request.getContextPath()%>/user/get-items-cart")
                    .then((res)=>{
                        this.carts = JSON.parse(res.data.carts)
                        for (let i = 0; i < this.carts.length; i++) {
                            this.carts[i].have2pay = parseInt(this.carts[i].quantity) * parseInt(this.carts[i].price)
                            this.carts[i].tickets = '0'
                            this.carts[i].count = '0'
                            this.carts[i].is_checked = false
                            for (let i = 0; i <this.bills.selected.length; i++) {
                                if (this.bills.selected[i] === this.carts[i].id){
                                    this.carts[i].is_checked = true
                                }
                            }
                        }
                        this.select2bill()
                        this.getEvents();
                    })
            },
            minus(index){
                this.carts[index].quantity--
                this.carts[index].have2pay = parseInt(this.carts[index].quantity) * parseInt(this.carts[index].price)
                this.select2bill()
                axios.get("<%=request.getContextPath()%>/user/change-cart-quantity?cart_id=" + this.carts[index].id + "&status=minus")
                    .then((res)=>{
                        if (res.data.status === false){
                            toastr.warning(res.data.message)
                            this.carts[index].quantity++
                            this.carts[index].have2pay = parseInt(this.carts[index].quantity) * parseInt(this.carts[index].price)
                            this.select2bill()
                        }
                    })
            },
            plus(index){
                this.carts[index].quantity++
                this.carts[index].have2pay = parseInt(this.carts[index].quantity) * parseInt(this.carts[index].price)
                this.select2bill()
                axios.get("<%=request.getContextPath()%>/user/change-cart-quantity?cart_id=" + this.carts[index].id + "&status=plus")
                    .then((res)=>{
                        if (res.data.status === false){
                            toastr.warning(res.data.message)
                            this.carts[index].quantity--
                            this.carts[index].have2pay = parseInt(this.carts[index].quantity) * parseInt(this.carts[index].price)
                            this.select2bill()
                        }
                    })
            },
            getEvents(){
                axios.get('<%=request.getContextPath()%>/all-events')
                    .then((res)=>{
                        this.events = JSON.parse(res.data.events)
                        for (let i = 0; i < this.carts.length; i++) {
                            for (let j = 0; j < this.events.length; j++) {
                                if (this.carts[i].event_id === this.events[j].id){
                                    this.carts[i].tickets = this.events[j].tickets
                                    this.carts[i].count = this.events[j].count
                                }
                            }
                        }
                    })
            },
            deleteCart(id){
                axios.get("<%=request.getContextPath()%>/user/delete-cart?id=" + id)
                    .then((res)=>{
                        if (res.data.status === true){
                            toastr.success("<%=language.getString("delete_success")%>")
                            let index2remove = this.bills.selected.indexOf(id)
                            if (index2remove !== -1){
                                this.bills.selected.splice(index2remove, 1)
                            }
                            this.getAllCarts()
                        } else {
                            toastr.error("<%=language.getString("delete_fail")%>")
                        }
                    })
            },
            formatCurrency(value) {
                const formattedValue = new Intl.NumberFormat('vi-VN', {
                    style: 'currency',
                    currency: 'VND',
                }).format(value);
                return formattedValue;
            },
            select2bill(){
                this.bills.total = 0
                this.bills.selected = []
                for (let i = 0; i < this.carts.length; i++) {
                    if (this.carts[i].is_checked){
                        this.bills.total += parseInt(this.carts[i].quantity) * parseInt(this.carts[i].price)
                        this.bills.selected.push(this.carts[i].id)
                    }
                }
                app2.bills = this.bills
            },
            check_out(){
                axios.get('<%=request.getContextPath()%>/user/bill')
            }
        },
        watch:{
            is_check_all(newValue, oldValue){
                if (newValue){
                    for (let i = 0; i < this.carts.length; i++){
                        this.carts[i].is_checked = true
                    }
                } else {
                    for (let i = 0; i < this.carts.length; i++){
                        this.carts[i].is_checked = false
                    }
                }
                this.select2bill()
            }
        }
    })
</script>
<script>
    var app2 = new Vue({
        el: "#app2",
        data:{
            bills: {
                selected: [],
                total: 0
            },
        },
    })
</script>