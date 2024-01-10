<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: FPTSHOP
  Date: 1/10/2024
  Time: 1:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

    <c:forEach var="categories" items="${categories}">
        <a class="category-link" data-category="${categories.category_id}">${categories.name}</a>
    </c:forEach>

    <br/>
    <br/>



        <h3 class="products"></h3>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
    $(document).ready(function () {
        $('.category-link').click(function (e) {
            e.preventDefault();
            var category = $(this).data('category');
            $.ajax({
                type: 'GET',
                url: '/filter-product?id=' + category,
                success: function (data) {
                    $('#products').html(data);
                },
                error: function () {
                    alert('Error loading products.');
                }

            });
        });
    });
</script>
</body>
</html>
