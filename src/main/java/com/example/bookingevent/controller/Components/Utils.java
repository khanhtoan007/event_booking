package com.example.bookingevent.controller.Components;

import com.example.bookingevent.daos.EventDAO;
import com.example.bookingevent.database.DB;
import com.example.bookingevent.database.MyObject;
import com.example.bookingevent.models.Category;
import com.example.bookingevent.models.EventPost;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class Utils {

    @WebServlet("/category")
    public static class EventByCategory extends HttpServlet {
        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            String cateID = req.getParameter("cateID");
            String price = req.getParameter("price");
            String additional = req.getParameter("add");

        }
    }
}
