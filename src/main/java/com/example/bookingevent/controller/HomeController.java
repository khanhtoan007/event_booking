package com.example.bookingevent.controller;

import com.example.bookingevent.daos.EventDAO;
import com.example.bookingevent.database.DB;
import com.example.bookingevent.database.MyObject;
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

public class HomeController {




//    @WebServlet("/event-detail")
//    public static class EventDetail extends HttpServlet{
//        @Override
//        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//            int id = Integer.parseInt(req.getParameter("id"));
//            ArrayList<EventPost> eventPosts = new EventDAO().getEventPostByID(id);
//            req.setAttribute("event", eventPosts);
//            req.getRequestDispatcher("views/Detail.jsp").forward(req,resp);
//        }
//    }
    @WebServlet("/homepage")
    @MultipartConfig(
            fileSizeThreshold = 1024 * 1024, // 1 MB
            maxFileSize = 1024 * 1024 * 10,      // 10 MB
            maxRequestSize = 1024 * 1024 * 10  // 10 MB
    )
    public static class EventListing extends HttpServlet{
        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            String id = req.getParameter("id");
            List<EventPost> eventPosts = new EventDAO().getEventPostList();
            req.setAttribute("list", eventPosts);
            req.getRequestDispatcher("views/index.jsp").forward(req,resp);
        }
    }


}
