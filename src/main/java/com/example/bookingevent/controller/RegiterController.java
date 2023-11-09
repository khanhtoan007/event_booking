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

public class RegiterController {
    @WebServlet("/register")
    public static class RegitersController extends HttpServlet {
        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            req.getRequestDispatcher("/register.jsp").forward(req, resp);
        }

        @Override
        protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            String email = req.getParameter("emailInput");
            String name = req.getParameter("name");
            String username = req.getParameter("username");
            String password = req.getParameter("password");
            String sqls = "select * from user where email = ?";
            String[] vars = new String[]{email};
            String[] field = new String[]{"id","name", "email", "phone", "role_id"};
            ArrayList<MyObject> user = DB.getData(sqls, vars, field);
            boolean regiter_status;
            if(user == null){
                String sql = "insert into user values email = ?, name = ?, username = ?, password = ?";
                String[] fields = new String[]{"email", "name", "username", "password"};
                boolean register = DB.executeUpdate(sql, fields);
                if (register == true){
                    req.getSession().setAttribute("mess", "Đăng ký thành công.");
                    regiter_status = true;
                }else{
                    req.getSession().setAttribute("mess", "Đăng ký không thành công.");
                    regiter_status = false;
                }
            }else{
                req.getSession().setAttribute("mess", "Email đã được sử dụng.");
                regiter_status = false;
            }
            if (regiter_status){
                resp.sendRedirect(req.getContextPath() + "/login");
            }else{
                req.getSession().setAttribute("email",email);
                req.getSession().setAttribute("password", password);
                req.getSession().setAttribute("name",name);
                req.getSession().setAttribute("username", username);
                resp.sendRedirect(req.getContextPath() + "/register");
            }
        }
    }
}
