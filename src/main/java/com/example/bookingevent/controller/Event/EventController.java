package com.example.bookingevent.controller.Event;

import com.example.bookingevent.daos.EventDAO;
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

public class EventController {
    @WebServlet("/events")
    @MultipartConfig(
            fileSizeThreshold = 1024 * 1024, // 1 MB
            maxFileSize = 1024 * 1024 * 10,      // 10 MB
            maxRequestSize = 1024 * 1024 * 10  // 10 MB
    )
    public static class LoadEvent extends HttpServlet {
        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

                req.getRequestDispatcher("views/events/shop.jsp").forward(req,resp);
        }
    }


    @WebServlet("/event-detail")
    @MultipartConfig(
            fileSizeThreshold = 1024 * 1024, // 1 MB
            maxFileSize = 1024 * 1024 * 10,      // 10 MB
            maxRequestSize = 1024 * 1024 * 10  // 10 MB
    )
    public static class EventDetail extends HttpServlet{
        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            int id = Integer.parseInt(req.getParameter("event_id"));
            EventPost eventPosts = new EventDAO().getEventPostByID(id);
            req.setAttribute("event", eventPosts);
            req.getRequestDispatcher("views/events/event-detail.jsp").forward(req,resp);
        }
    }




}
