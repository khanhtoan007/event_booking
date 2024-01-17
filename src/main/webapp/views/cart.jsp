<%@ page import="java.util.ArrayList" %>
<%@ include file="master/head.jsp" %>
<% ArrayList<MyObject> cart = (ArrayList<MyObject>) request.getAttribute("carts");%>
<%@ page contentType="text/html; charset=UTF-8" %>
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
<%@ include file="/views/master/foot.jsp" %>
