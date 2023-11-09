package com.example.bookingevent.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.example.bookingevent.daos.ManageAccountDAO;
import com.example.bookingevent.database.DB;
import com.example.bookingevent.models.Account;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class  ManagerAccount  {

    @WebServlet("/load-account")
    public static class LoadAccount extends HttpServlet{
        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            List<Account> list = new ManageAccountDAO().getAllAccount();
            req.setAttribute("listP",list);
            System.out.println(list);
            req.getRequestDispatcher("ManagerAccount.jsp").forward(req,resp);
        }
        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {

        }

    }
    @WebServlet("/edit-account")
    public static class EditAccount extends HttpServlet{
        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
            int id = Integer.parseInt(request.getParameter("id"));

            String name = request.getParameter("name_update");
            String password = request.getParameter("password_update");
            String phone = request.getParameter("phone_update");
            String role = request.getParameter("role_update");
            String email = request.getParameter("email_update");
            String sql = "update [User] set name = ?, email = ?, password = ?, phone= ?, role = ? where user_id = ?";
            String[] vars = new String[]{name,email,password,phone,role, String.valueOf(id)};
            if (DB.executeUpdate(sql,vars)){
                request.getSession().setAttribute("mess", "success|Cập nhật thành công.");
            } else {
                request.getSession().setAttribute("mess", "error|Cập nhật không thành công.");
            }
            response.sendRedirect(request.getContextPath() + "/load-account");
        }

    }
    @WebServlet("/delete-account")
    public static class GenreDelete extends HttpServlet{
        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            String id = req.getParameter("id");
            String sql = "delete from [User] where user_id = ?";
            String[] vars = new String[]{id};
            System.out.println(DB.executeUpdate(sql,vars));
            resp.sendRedirect(req.getContextPath() + "/load-account");
        }
    }

}
