package com.example.bookingevent.controller;

import com.example.bookingevent.database.DB;
import com.example.bookingevent.database.MyObject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.mindrot.jbcrypt.BCrypt;

import java.io.IOException;
import java.util.ArrayList;

public class AuthController {
    @WebServlet("/login")
    public static class LoginController extends HttpServlet {
        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            if (req.getSession().getAttribute("username") != null) {
                req.setAttribute("username", req.getSession().getAttribute("username"));
                req.getSession().removeAttribute("username");
            }
            if (req.getSession().getAttribute("password") != null) {
                req.setAttribute("password", req.getSession().getAttribute("password"));
                req.getSession().removeAttribute("password");
            }
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
        }

        @Override
        protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            String email = req.getParameter("name");
            String password = req.getParameter("password");
            String sql = "select * from [User] where username = ? and password = ?";
            String[] fields = new String[]{"user_id","username", "email", "phone", "role"};
            String[] vars = new String[]{email, password};
            ArrayList<MyObject> user = DB.getData(sql, vars, fields);
            boolean login_status;
            if (user.size() == 0) {
                req.getSession().setAttribute("mess", "error|Tài khoản hoặc mật khẩu không đúng.");
                login_status = false;
            } else if (user.get(0).is_verify.equals("0")) {
                req.getSession().setAttribute("mess", "warning|Bạn chưa xác nhận email của bạn, vui lòng kiểm tra email.");
                login_status = false;
            } else if (!BCrypt.checkpw(password, user.get(0).password)) {
                req.getSession().setAttribute("mess", "error|Tài khoản hoặc mật khẩu không đúng.");
                login_status = false;
            } else {
                login_status = true;
                req.getSession().setAttribute("mess", "success|Đăng nhập thành công.");
            }
            if (login_status){
                req.getSession().setAttribute("login", user.get(0));
                resp.sendRedirect(req.getContextPath() + "/homepage");
            } else {
                req.getSession().setAttribute("email",email);
                req.getSession().setAttribute("password", password);
                resp.sendRedirect(req.getContextPath() + "/login");
            }
        }
    }

    @WebServlet("/logout")
    public static class Logout extends HttpServlet{
        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            req.getSession().removeAttribute("login");
            resp.sendRedirect(req.getContextPath());
        }
    }
}
