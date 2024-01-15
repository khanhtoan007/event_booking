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


    @WebServlet("/event")
    public static class EventDetail extends HttpServlet {
        @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            EventDAO dao = new EventDAO();
            int id = Integer.parseInt(request.getParameter("id"));
//            List<EventPost> eventDetail = dao.getEventPostByID(id);

            EventPost event = new EventPost();
            event.setTitle("TEST TITLE");
            event.setLocation("TEST LOCATION");

            System.out.println("Event detail: "+ event);
            request.setAttribute("eventPost", event);
            request.getRequestDispatcher("views/events/event-detail.jsp").forward(request,response);
        }
    }

    @WebServlet("/new-event")
    public static class CreateEvent extends HttpServlet {
        @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            EventDAO dao = new EventDAO();

            request.getRequestDispatcher("views/events/create-event.jsp").forward(request,response);
        }
    }

    @WebServlet("/search-event")
    public static class Search extends HttpServlet {
        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//            EventDAO dao = new EventDAO();
//            int id = Integer.parseInt(req.getParameter("id"));
//            int minPrice = Integer.parseInt(req.getParameter("minPrice"));
//            int maxPrice = Integer.parseInt(req.getParameter("maxPrice"));
//            List<EventPost> eventDetail = dao.getEventPostByID(id);
//            req.setAttribute("eventDetail", eventDetail);
//            eventDetail = dao.getEventByPrice(minPrice,maxPrice);
//            req.setAttribute("eventDetail", eventDetail);
//            req.getRequestDispatcher("views/products/product-detail.jsp").forward(req,resp);
        }
    }




}
