package com.example.bookingevent.controller;

import com.example.bookingevent.Init.Config;
import com.example.bookingevent.Init.SendMail;
import com.example.bookingevent.daos.AuthDAO;
import com.example.bookingevent.database.DB;
import com.example.bookingevent.database.MyObject;
import com.example.bookingevent.models.Account;
import com.example.bookingevent.models.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;


import java.io.IOException;
import java.util.ArrayList;
import java.util.ResourceBundle;
import java.util.UUID;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

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
}
