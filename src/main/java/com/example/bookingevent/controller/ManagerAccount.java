package com.example.bookingevent.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.example.bookingevent.daos.ManageAccountDAO;
import com.example.bookingevent.models.Account;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet(name = "ManagerAccount", urlPatterns = {"/admin/load-account"})
public class  ManagerAccount extends HttpServlet {

    protected void processRequest()
            throws ServletException, IOException {
        processRequest(null, null);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        ManageAccountDAO dao = new ManageAccountDAO();
        List<Account> list = dao.getAllAccount();
        request.setAttribute("listP", list);
        request.getRequestDispatcher("ManagerAccount.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        processRequest(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
