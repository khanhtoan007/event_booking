package com.example.bookingevent.controller;

import com.example.bookingevent.Init.Config;
import com.example.bookingevent.Init.SendMail;
import com.example.bookingevent.database.DB;
import com.example.bookingevent.database.MyObject;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.mindrot.jbcrypt.BCrypt;


import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.ResourceBundle;
import java.util.UUID;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import org.json.JSONObject;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
public class AuthController {

    private static final int WORK_FACTOR = 12;
    private static final String[] register_message_array = new String[]{"", "email_used", "phone_used", "password_not_match"};
    private static final String[] register_empty_message_array = new String[]{"", "email", "name", "gender", "phone", "password", "re_password"};

    public static boolean checkEmail(String email){
        return DB.getData("select * from users where email = ?" , new String[]{email}, new String[]{"email"}).size() == 0;
    }
    public static boolean checkPhone(String phone){
        return DB.getData("select * from users where phone = ?" , new String[]{phone}, new String[]{"phone"}).size() == 0;
    }

    public static int checkRegisterInfo(String email, String phone, String password, String re_password){
        if (!checkEmail(email)){
            return 1;
        }
        if (!checkPhone(phone)){
            return 2;
        }
        if (!password.equals(re_password)){
            return 3;
        }
        return 0;
    }
    public static int checkEmpty (String email, String name, String gender, String phone, String password, String re_password){
        if (email.equals("")){
            return 1;
        }
        if (name.equals("")){
            return 2;
        }
        if (gender == null){
            return 3;
        }
        if (phone.equals("")){
            return 4;
        }
        if (password.equals("")){
            return 5;
        }
        if (re_password.equals("")){
            return 6;
        }
        return 0;
    }
    @WebServlet("/register")
    public static class RegisterController extends HttpServlet {
        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            req.getRequestDispatcher("/views/auth/register.jsp").forward(req, resp);
        }

        @Override
        protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            ResourceBundle language = (ResourceBundle) req.getAttribute("language");
            String email = req.getParameter("email");
            String name = req.getParameter("name");
            String gender = req.getParameter("gender");
            String phone = req.getParameter("phone");
            String password = req.getParameter("password");
            String re_password = req.getParameter("re_password");
            req.setAttribute("name", name);
            req.setAttribute("email", email);
            req.setAttribute("gender", gender);
            req.setAttribute("phone", phone);
            req.setAttribute("password", password);
            req.setAttribute("re_password", re_password);
            int check_empty = checkEmpty(email, name, gender, phone, password, re_password);
            if (check_empty == 0){
                String salt = BCrypt.gensalt();
                int code = checkRegisterInfo(email, phone, password, re_password);
                if (code == 0){
                    String hashed_password = BCrypt.hashpw(password, salt);
                    String sql = "insert into users(name, email, phone, password, avatar, gender, token, is_verified, role_id) values (?, ?, ?, ?, ?, ?, ?, 'false', ?)";
                    String token = UUID.randomUUID().toString();
                    boolean check = DB.executeUpdate(sql, new String[]{name, email, phone, hashed_password, "/avatars/default-avatar.png", gender, token, "1"});
                    ExecutorService executorService = Executors.newSingleThreadExecutor();
                    executorService.submit(() -> {
                        try {
                            String url = Config.app_url + Config.context_path + "/verify?token=" + token;
                            String html = language.getString("verify_email").replace("xxx", Config.app_name).replace("yyy", url);
                            SendMail.send(email, language.getString("verify_mail_subject"), html);
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    });
                    executorService.shutdown();
                    if (check){
                        req.getSession().setAttribute("mess", "success|" + language.getString("register_success"));
                        resp.sendRedirect(req.getContextPath() + "/login");
                    } else {
                        req.setAttribute("warning", language.getString("something_wrong"));
                        req.getRequestDispatcher("/views/auth/register.jsp").forward(req, resp);
                    }

                } else {
                    req.setAttribute("warning", language.getString(register_message_array[code]));
                    req.getRequestDispatcher("/views/auth/register.jsp").forward(req, resp);
                }
            } else {
                req.setAttribute("warning", language.getString(register_empty_message_array[check_empty]) + " " + language.getString("cannot_be_null"));
                req.getRequestDispatcher("/views/auth/register.jsp").forward(req, resp);
            }
        }
    }

    @WebServlet("/login")
    public static class LoginController extends HttpServlet {
        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            req.getRequestDispatcher("/views/auth/login.jsp").forward(req, resp);
        }

        @Override
        protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            ResourceBundle language = (ResourceBundle) req.getAttribute("language");
            String email = req.getParameter("email");
            String password = req.getParameter("password");
            ArrayList<MyObject> user = DB.getData("select * from users where email = ?", new String[]{email}, new String[]{"id", "password", "role_id", "is_verified"});
            if (user.size() == 0){
                req.setAttribute("email", email);
                req.setAttribute("password", password);
                req.setAttribute("warning", language.getString("login_fail"));
                req.getRequestDispatcher("/views/auth/login.jsp").forward(req, resp);
            } else {
                if (user.get(0).is_verified.equals("0")){
                    req.setAttribute("email", email);
                    req.setAttribute("password", password);
                    req.setAttribute("warning", language.getString("not_verified"));
                    req.getRequestDispatcher("/views/auth/login.jsp").forward(req, resp);
                } else {
                    if (BCrypt.checkpw(password, user.get(0).password)){
                        req.getSession().setAttribute("mess", "success|" + language.getString("login_success"));
                        req.getSession().setAttribute("login", user.get(0).id);
                        resp.sendRedirect(req.getContextPath() + "/");
                    } else {
                        req.setAttribute("email", email);
                        req.setAttribute("password", password);
                        req.setAttribute("warning", language.getString("login_fail"));
                        req.getRequestDispatcher("/views/auth/login.jsp").forward(req, resp);
                    }
                }
            }
        }
    }

    @WebServlet("/verify")
    public static class Verify extends HttpServlet{
        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            String token = req.getParameter("token");
            boolean check = DB.executeUpdate("update users set is_verified = 'true', token = '' where token = ?", new String[]{token});
            if (check){
                req.setAttribute("verify_status", "success");
            } else {
                req.setAttribute("verify_status","fail");
            }
            req.getRequestDispatcher("/views/auth/verify.jsp").forward(req, resp);
        }
    }

    @WebServlet("/logout")
    public static class Logout extends HttpServlet{
        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            req.getSession().removeAttribute("login");
            resp.sendRedirect(req.getContextPath() + "/");
        }
    }

    @WebServlet("/login-google")
    public static class LoginGoogle extends HttpServlet{
        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            ResourceBundle language = (ResourceBundle) req.getAttribute("language");
            String code = req.getParameter("code");
            JSONObject json = new JSONObject();
            json.put("code", code);
            json.put("client_id", Config.client_id);
            json.put("client_secret", Config.client_secret);
            json.put("redirect_uri", Config.redirect_uri);
            json.put("grant_type", "authorization_code");
            try {
                HttpClient httpClient = HttpClients.createDefault();
                HttpPost httpPost = new HttpPost(new URI("https://oauth2.googleapis.com/token"));
                httpPost.setHeader("Content-Type", "application/json");
                httpPost.setEntity(new StringEntity(json.toString(), ContentType.APPLICATION_JSON));
                HttpResponse response = httpClient.execute(httpPost);
                HttpEntity responseEntity = response.getEntity();

                if (responseEntity != null) {
                    String responseString = EntityUtils.toString(responseEntity);
                    ObjectMapper objectMapper = new ObjectMapper();
                    try {
                        JsonNode jsonResponse = objectMapper.readTree(responseString);
                        String access_token = jsonResponse.get("access_token").asText();
                        HttpClient httpGetClient = HttpClients.createDefault();
                        HttpGet httpGet = new HttpGet("https://www.googleapis.com/oauth2/v1/userinfo?access_token=" + access_token);
                        try {
                            HttpResponse responseFromGet = httpGetClient.execute(httpGet);
                            HttpEntity responseEntityFromGet = responseFromGet.getEntity();
                            if (responseEntityFromGet != null) {
                                String responseStringFromGet = EntityUtils.toString(responseEntityFromGet);
                                objectMapper = new ObjectMapper();
                                jsonResponse = objectMapper.readTree(responseStringFromGet);
                                String email = jsonResponse.get("email").asText();
                                boolean checkMail = checkEmail(email);
                                if (checkMail) { // chưa có acc
                                    String name = jsonResponse.get("name").asText();
                                    String avatar = jsonResponse.get("picture").asText();
                                    req.setAttribute("email", email);
                                    req.setAttribute("name", name);
                                    req.setAttribute("avatar", avatar);
                                    req.getRequestDispatcher("/views/auth/add-more-info.jsp").forward(req, resp);
                                } else {
                                    MyObject user = DB.getData("select * from users where email = ?", new String[]{email}, new String[]{"id"}).get(0);
                                    req.getSession().setAttribute("login", user.id);
                                    req.getSession().setAttribute("mess", "success|" + language.getString("login_success"));
                                    resp.sendRedirect(req.getContextPath() + "/");
                                }
                            }
                        } catch (IOException e) {
                            e.printStackTrace();
                            req.getSession().setAttribute("mess", "success|" + language.getString("login_fail"));
                        }

                    } catch (IOException e) {
                        e.printStackTrace();
                        req.getSession().setAttribute("mess", "success|" + language.getString("login_fail"));
                    }
                }
            } catch (URISyntaxException e) {
                e.printStackTrace();
                req.getSession().setAttribute("mess", "success|" + language.getString("login_fail"));
            }
        }
    }

    @WebServlet("/add-more-info")
    public static class AddMoreInfo extends HttpServlet{

        @Override
        protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            String email = req.getParameter("email");
            String name = req.getParameter("name");
            String phone = req.getParameter("phone");
            String gender = req.getParameter("gender");
            String password = req.getParameter("password");
            String re_password = req.getParameter("re_password");
            String avatar = req.getParameter("avatar");
            ResourceBundle language = (ResourceBundle) req.getAttribute("language");
            int code = checkEmpty(email, name, gender, phone, password, re_password);
            if (code == 0){
                String salt = BCrypt.gensalt();
                String hashed_password = BCrypt.hashpw(password, salt);
                String sql = "insert into users(name, email, phone, password, avatar, gender, is_verified, role_id) values (?, ?, ?, ?, ?, ?, 'true', 1)";
                int created_user_id = DB.insertGetLastId(sql, new String[]{name, email, phone, hashed_password, avatar, gender});
                if (created_user_id != 0){
                    req.getSession().setAttribute("login", String.valueOf(created_user_id));
                    req.getSession().setAttribute("mess", "success|" + language.getString("login_success"));
                    resp.sendRedirect(req.getContextPath() + "/");
                } else {
                    req.setAttribute("email", email);
                    req.setAttribute("name", name);
                    req.setAttribute("phone", phone);
                    req.setAttribute("gender", gender);
                    req.setAttribute("password", password);
                    req.setAttribute("re_password", re_password);
                    req.setAttribute("avatar", avatar);
                    req.setAttribute("warning", language.getString("login_fail"));
                    req.getRequestDispatcher("/views/auth/add-more-info.jsp").forward(req, resp);
                }
            } else {
                req.setAttribute("email", email);
                req.setAttribute("name", name);
                req.setAttribute("phone", phone);
                req.setAttribute("gender", gender);
                req.setAttribute("password", password);
                req.setAttribute("re_password", re_password);
                req.setAttribute("avatar", avatar);
                req.setAttribute("warning", language.getString(register_message_array[code]));
                req.getRequestDispatcher("/views/auth/add-more-info.jsp").forward(req, resp);
            }
        }
    }
    @WebServlet("/forgot-password")
    public static class ForgotPassword extends HttpServlet{
        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            req.getRequestDispatcher("/views/auth/forgot-password.jsp").forward(req, resp);
        }

        @Override
        protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            ResourceBundle language = (ResourceBundle) req.getAttribute("language");
            String email = req.getParameter("email");
            String token = UUID.randomUUID().toString();
            String sql = "update users set token = ? where email = ?";
            boolean check = DB.executeUpdate(sql, new String[]{token, email});
            if (check){
                ExecutorService executorService = Executors.newSingleThreadExecutor();
                executorService.submit(() -> {
                    try {
                        String url = Config.app_url + Config.context_path + "/reset-password?token=" + token;
                        String html = language.getString("mail_reset_password").replace("url", url);
                        SendMail.send(email, language.getString("reset_password"), html);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                });
                executorService.shutdown();
                req.getSession().setAttribute("mess", "success|" + language.getString("please_check_email"));
                resp.sendRedirect(req.getContextPath() + "/forgot-password");
            } else {
                req.getSession().setAttribute("mess", "error|" + language.getString("reset_pass_err"));
                resp.sendRedirect(req.getContextPath() + "/forgot-password");
            }

        }
    }

    @WebServlet("/reset-password")
    public static class ResetPassword extends HttpServlet{
        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            req.getRequestDispatcher("/views/auth/reset-password.jsp").forward(req, resp);
        }

        @Override
        protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            ResourceBundle language = (ResourceBundle) req.getAttribute("language");
            String token = req.getParameter("token");
            String password = req.getParameter("password");
            String re_password = req.getParameter("re_password");
            if (password.equals(re_password)){
                String salt = BCrypt.gensalt();
                String hashed_password = BCrypt.hashpw(password, salt);
                String sql = "update users set password = ?, token = '' where token = ?";
                boolean check = DB.executeUpdate(sql, new String[]{hashed_password, token});
                if (check){
                    req.getSession().setAttribute("mess", "success|" + language.getString("reset_password_success"));
                    resp.sendRedirect(req.getContextPath() + "/login");
                }
            } else {
                req.getSession().setAttribute("mess", "warning|" + language.getString("reset_password_fail"));
                resp.sendRedirect(req.getContextPath() + "/reset-password?token=" + token);
            }
        }
    }
}
