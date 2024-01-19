<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html; charset=UTF-8" %>
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
        <title>Fruitables - Vegetable Website Template</title>
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
    </head>

    <body>

        <%@ include file="./master/head.jsp" %>

        <% ArrayList<MyObject> cart = (ArrayList<MyObject>) request.getAttribute("carts");%>
        
        <div class="container py-5">
            <div class="row g-5 align-items-center py-5">
                <h3 class="mb-5 display-3 text-primary mt-5  py-5"><%= language.getString("cart") %></h3>
                <table class="table">
                    <thead>
                    <tr>
                        <th scope="col"><%=language.getString("title")%></th>
                        <th scope="col"><%=language.getString("quantity")%></th>
                        <th scope="col"><%=language.getString("current_price")%></th>
                        <th scope="col"><%=language.getString("note")%></th>
                        <th class="text-center" scope="col"><%=language.getString("action")%></th>
                    </tr>
                    </thead>
                    <tbody>
                        <% for (int i = 0; i < cart.size(); i++) { %>
                            <tr>
                                <td><a href="${pageContext.request.contextPath}/event-detail?event_id=<%=cart.get(i).id%>"><%=cart.get(i).event_title%></a> </td>
                                <td><%=cart.get(i).quantity%></td>
                                <td><%=cart.get(i).price%></td>
                                <td><%=cart.get(i).note%></td>
                                <td>
                                    <div class="row col-12">
                                        <div class="col-6">
                                            <a href="${pageContext.request.contextPath}/user/delete-cart?id=<%=cart.get(i).id%>">
                                                <button class="btn btn-danger" style="width: 100%">Delete</button>
                                            </a>
                                        </div>
                                        <div class="col-6">
                                            <button class="btn btn-primary" style="width: 100%">Pay</button>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        <% } %>

                    </tbody>
                </table>
            </div>
        </div>

        <%@ include file="./master/foot.jsp" %>
    </body>
</html>
