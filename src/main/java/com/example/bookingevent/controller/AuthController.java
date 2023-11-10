package com.example.bookingevent.controller;

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

public class AuthController {


    @WebServlet("/register")
    public static class RegisterController extends HttpServlet {
        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            resp.setContentType("text/html;charset=UTF-8");
            req.setCharacterEncoding("utf-8");

            req.getRequestDispatcher("register.jsp").forward(req, resp);
        }

        @Override
        protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            resp.setContentType("text/html;charset=UTF-8");
            req.setCharacterEncoding("utf-8");

            String email = req.getParameter("email");
            String name = req.getParameter("name");
            String username = req.getParameter("username");
            String password = req.getParameter("password");
            String repassword = req.getParameter("repassword");
            String phone = req.getParameter("phone");

            // Tạo salt ngẫu nhiên
            String salt = BCrypt.gensalt();
            // Mã hóa mật khẩu với salt
            String hashedPassword = BCrypt.hashpw(password, salt);

            AuthDAO dao = new AuthDAO();
            dao.register(username, hashedPassword, name, phone, email, "User");

            req.getRequestDispatcher("/login.jsp").forward(req, resp);


            System.out.println("email: " + email);
            System.out.println("name: " + name);
            System.out.println("username: " + username);
            System.out.println("password: " + password);
            System.out.println("repassword: " + hashedPassword);
            System.out.println("phone: " + phone);


        }
    }

    @WebServlet("/login")
    public static class LoginController extends HttpServlet {
        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            resp.setContentType("text/html;charset=UTF-8");
            req.setCharacterEncoding("utf-8");

            HttpSession session = req.getSession();
            if (session.getAttribute("user") == null)
                req.getRequestDispatcher("login.jsp").forward(req, resp);
            else resp.sendRedirect("homepage");
        }

        @Override
        protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            String username = req.getParameter("username");
            String password = req.getParameter("password");

            System.out.println("username: " + username);
            System.out.println("password: " + password);

            AuthDAO dao = new AuthDAO();
            User user = dao.login(username);

            if (user != null && BCrypt.checkpw(password, user.getPassword()))
            {
                System.out.println(user.getName());
                HttpSession session = req.getSession();
                session.setAttribute("user", user);
                resp.sendRedirect("homepage");
            }
            else {
                String message = "Wrong username or password";
                req.setAttribute("message", message);
                req.getRequestDispatcher("login.jsp").forward(req, resp);
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
