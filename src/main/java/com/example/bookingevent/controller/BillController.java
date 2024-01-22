package com.example.bookingevent.controller;

import com.example.bookingevent.daos.BillDAO;
import com.example.bookingevent.database.DB;
import com.example.bookingevent.database.MyObject;
import com.example.bookingevent.models.Bills;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;


public class BillController {
    @WebServlet("/user/bill")
    public static class GetBill extends HttpServlet {
        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            HttpSession session = req.getSession();
            session.getAttribute("cart");
            int cart_id = Integer.parseInt(req.getParameter("cart_id"));
            Bills bills = new BillDAO().getBillByCartID(4);
            req.setAttribute("bill", bills);
            req.getRequestDispatcher("/views/events/checkout.jsp").forward(req,resp);
        }
    }

}
