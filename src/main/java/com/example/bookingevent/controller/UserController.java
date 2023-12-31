//package com.example.bookingevent.controller;
//
//import com.example.bookingevent.database.DB;
//import com.example.bookingevent.database.MyObject;
//import com.example.bookingevent.Init.Config;
//import com.example.bookingevent.Init.SendMail;
//import com.fasterxml.jackson.databind.JsonNode;
//import com.fasterxml.jackson.databind.ObjectMapper;
//import com.google.gson.Gson;
//import com.google.gson.JsonObject;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.MultipartConfig;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import org.apache.http.HttpEntity;
//import org.apache.http.HttpResponse;
//import org.apache.http.client.HttpClient;
//import org.apache.http.client.methods.HttpGet;
//import org.apache.http.client.methods.HttpPost;
//import org.apache.http.entity.ContentType;
//import org.apache.http.entity.StringEntity;
//import org.apache.http.impl.client.HttpClients;

//
//import java.io.IOException;
//import java.net.URI;
//import java.util.ArrayList;
//import java.util.UUID;
//import java.util.concurrent.ExecutorService;
//import java.util.concurrent.Executors;
//
//public class UserController {
//    private static final int WORK_FACTOR = 12;
//
//    @WebServlet("/register")
//    public static class RegisterController extends HttpServlet {
//        public static boolean checkEmail(String email) {
//            return DB.getData("select * from users where email = ?", new String[]{email}, new String[]{"id"}).size() == 0;
//        }
//
//
//        public static boolean checkPhone(String phone) {
//            return DB.getData("select * from users where email = ?", new String[]{phone}, new String[]{"id"}).size() == 0;
//        }
//
//        public static boolean checkPhoneExcept(String phone, String id) {
//            return DB.getData("select * from users where email = ? and id != ?", new String[]{phone, id}, new String[]{"id"}).size() == 0;
//        }
//
//        @Override
//        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//            if (req.getSession().getAttribute("form") != null) {
//                MyObject form = (MyObject) req.getSession().getAttribute("form");
//                req.setAttribute("form", form);
//                req.getSession().removeAttribute("form");
//            }
//            req.getRequestDispatcher("/views/auth/register.jsp").forward(req, resp);
//        }
//
//        @Override
//        protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//            String email = req.getParameter("email");
//            String phone = req.getParameter("phone");
//            boolean check_email = checkEmail(email);
//            boolean check_phone = checkPhone(phone);
//            String gender = req.getParameter("gender");
//            String name = req.getParameter("name");
//            String password = req.getParameter("password");
//            String re_password = req.getParameter("re_password");
//            String dob = req.getParameter("dob");
//            String address = req.getParameter("address");
//            MyObject form = new MyObject();
//            form.email = email;
//            form.phone = phone;
//            form.password = password;
//            form.re_password = re_password;
//            form.dob = dob;
//            form.address = address;
//            form.name = name;
//            boolean register_success = true;
//            if (check_email && check_phone) {
//                String uuid = UUID.randomUUID().toString();
//                if (re_password.equals(password)) {
//                    String sql = "insert into users(name, email, phone, password, is_verify, role_id, uuid) values (?,?,?,?,?,?,?)";
//                    password = BCrypt.hashpw(password, BCrypt.gensalt(WORK_FACTOR));
//                    String[] vars = {name, email, phone, password, "false", "1", uuid};
//                    boolean check = DB.executeUpdate(sql, vars);
//                    if (check) {
//                        ExecutorService executorService = Executors.newSingleThreadExecutor();
//                        executorService.submit(() -> {
//                            try {
//                                String url = Config.app_url + req.getContextPath() + "/active?uuid=" + uuid;
//                                String html = "<h1>Nhấn vào <a href='" + url + "'> đây </a> để kích hoạt tải khoản của bạn</h1>";
//                                SendMail.send(email, "Kích hoạt tài khoản", html);
//                            } catch (Exception e) {
//                                e.printStackTrace();
//                            }
//                        });
//                        executorService.shutdown();
//                        req.getSession().setAttribute("mess", "success|Đăng kí thành công, vui lòng kiểm tra email.");
//                    } else {
//                        register_success = false;
//                        req.getSession().setAttribute("mess", "error|Đăng kí không thành công, vui lòng liên hệ admin.");
//                    }
//                } else {
//                    req.getSession().setAttribute("form", form);
//                    req.getSession().setAttribute("mess", "warning|Mật khẩu và nhập lại mật khẩu không trùng nhau.");
//                    register_success = false;
//                }
//            } else {
//                req.getSession().setAttribute("form", form);
//                if (!check_email && !check_phone) {
//                    req.getSession().setAttribute("mess", "warning|Số điện thoại và email đã được sử dụng.");
//                    register_success = false;
//                } else {
//                    if (!check_email) {
//                        req.getSession().setAttribute("mess", "warning|Email đã được sử dụng.");
//                        register_success = false;
//                    }
//                    if (!check_phone) {
//                        req.getSession().setAttribute("mess", "warning|Số điện thoại đã được sử dụng.");
//                        register_success = false;
//                    }
//                }
//            }
//            resp.sendRedirect(req.getContextPath() + (register_success ? "/login" : "/register"));
//        }
//    }
//
//    @WebServlet("/login")
//    public static class LoginController extends HttpServlet {
//        @Override
//        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//            if (req.getSession().getAttribute("email") != null) {
//                req.setAttribute("email", req.getSession().getAttribute("email"));
//                req.getSession().removeAttribute("email");
//            }
//            if (req.getSession().getAttribute("password") != null) {
//                req.setAttribute("password", req.getSession().getAttribute("password"));
//                req.getSession().removeAttribute("password");
//            }
//            req.getRequestDispatcher("/views/auth/login.jsp").forward(req, resp);
//        }
//
//        @Override
//        protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//            String email = req.getParameter("email");
//            String password = req.getParameter("password");
//            String sql = "select users.*, roles.name as role_name from users inner join roles on users.role_id = roles.id where email = ?";
//            String[] vars = {email};
//            String[] fields = new String[]{"id", "name", "email", "phone", "avatar", "dob", "address", "password", "is_verify", "role_id", "is_block", "uuid", "gender", "role_name"};
//            ArrayList<MyObject> user = DB.getData(sql, vars, fields);
//            boolean login_status;
//            if (user.size() == 0) {
//                req.getSession().setAttribute("mess", "error|Tài khoản hoặc mật khẩu không đúng.");
//                login_status = false;
//            } else if (user.get(0).is_verify.equals("0")) {
//                req.getSession().setAttribute("mess", "warning|Bạn chưa xác nhận email của bạn, vui lòng kiểm tra email.");
//                login_status = false;
//            } else if (!BCrypt.checkpw(password, user.get(0).password)) {
//                req.getSession().setAttribute("mess", "error|Tài khoản hoặc mật khẩu không đúng.");
//                login_status = false;
//            } else {
//                login_status = true;
//                req.getSession().setAttribute("mess", "success|Đăng nhập thành công.");
//            }
//            if (login_status){
//                req.getSession().setAttribute("login", user.get(0));
//                resp.sendRedirect(req.getContextPath());
//            } else {
//                req.getSession().setAttribute("email",email);
//                req.getSession().setAttribute("password", password);
//                resp.sendRedirect(req.getContextPath() + "/login");
//            }
//        }
//    }
//    @WebServlet("/logout")
//    public static class Logout extends HttpServlet{
//        @Override
//        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//            req.getSession().removeAttribute("login");
//            resp.sendRedirect(req.getContextPath());
//        }
//    }
//
//    @WebServlet("/admin/user")
//    @MultipartConfig(
//            fileSizeThreshold = 1024 * 1024, // 1 MB
//            maxFileSize = 1024 * 1024 * 10,      // 10 MB
//            maxRequestSize = 1024 * 1024 * 10  // 10 MB
//    )
//    public static class GetUser extends HttpServlet{
//        @Override
//        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//
//            String sql = "select * from users";
//
//
//            String[] var = new String[]{"id","name", "email", "phone", "role_id"};
//            ArrayList<MyObject> user = DB.getData(sql,var);
//            req.setAttribute("users",user);
//            req.getRequestDispatcher("/views/admin/user.jsp").forward(req,resp);
//        }
//    }
//
//
//
//}
