-Hướng dẫn sử dụng multi-lang
  + ở file jsp: <%=language.getString("key")%> // cặp key=value sẽ được khai báo ở file .properties ở thư mục resouce, nếu cần tạo thêm thì tạo file language_<language_code>.properties, sau đó vào file head.jsp tìm form thay đổi ngôn ngữ thêm option là xong
  + ở trong servlet thì thêm dòng "ResourceBundle language = (ResourceBundle) req.getAttribute("language");" rồi dùng như ở jsp
- Lấy user_id đang login: String user_id = (String) req.getSession().getAttribute("login");
- lấy object user đang login: MyObject user = DB.getUser(user_id);
- /user/*: đã đăng nhập mới được vào link này (role_id = 1)
- /poster/*: quyền poster hoặc admin mới được vài link này (role_id = 2 || role_id = 3)
- /admin/*: chỉ admin (role_id = 3)
