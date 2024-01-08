package com.example.bookingevent.controller.Event;

import com.example.bookingevent.daos.EventDAO;
import com.example.bookingevent.models.EventPost;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

public class EventController {
    @WebServlet("/events")
    public static class LoadEvent extends HttpServlet {
        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            EventDAO dao = new EventDAO();
            List<EventPost> list = dao.getEventPostList();
            req.setAttribute("list", list);
            req.getRequestDispatcher("views/products/shop.jsp").forward(req,resp);
        }
    }

    @WebServlet("/events")
    public static class EventDetail extends HttpServlet {
        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            EventDAO dao = new EventDAO();
            int id = Integer.parseInt(req.getParameter("id"));
            List<EventPost> eventDetail = dao.getEventPostByID(id);
            req.setAttribute("eventDetail", eventDetail);
            req.getRequestDispatcher("views/products/product-detail.jsp").forward(req,resp);
        }
    }
}
