<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/change-language" method="post">
  <input type="text" name="current_uri" value="<%=request.getAttribute("uri")%>">
  <input type="text" name="lang" value="en">
  <button type="submit">sub</button>
</form>
</body>
</html>