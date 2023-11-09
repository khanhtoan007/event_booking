package com.example.bookingevent.controller;

import com.example.bookingevent.daos.EventDAO;
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
    @WebServlet("/homepage")
    @MultipartConfig(
            fileSizeThreshold = 1024 * 1024, // 1 MB
            maxFileSize = 1024 * 1024 * 10,      // 10 MB
            maxRequestSize = 1024 * 1024 * 10  // 10 MB
    )
    public static class Home extends HttpServlet{
        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            List<EventPost> eventPosts = new EventDAO().getEventPostList();
            req.setAttribute("list", eventPosts);
//            System.out.println(eventPosts);
            EventDAO getCategory = new EventDAO();
            String sql = "SELECT DISTINCT state FROM Event";
            String[] field = new String[]{"state"};
            req.getRequestDispatcher("index.jsp").forward(req,resp);
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
            int id = Integer.parseInt(req.getParameter("id"));
            EventPost eventPosts = new EventDAO().getEventPostByID(id);
            req.setAttribute("list", eventPosts);
            System.out.println(eventPosts);
            req.getRequestDispatcher("event-detail.jsp").forward(req,resp);
        }
    }
    @WebServlet("/event-listing")
    @MultipartConfig(
            fileSizeThreshold = 1024 * 1024, // 1 MB
            maxFileSize = 1024 * 1024 * 10,      // 10 MB
            maxRequestSize = 1024 * 1024 * 10  // 10 MB
    )
    public static class EventListing extends HttpServlet{
        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            List<EventPost> eventPosts = new EventDAO().getEventPostList();
            req.setAttribute("list", eventPosts);
            System.out.println(eventPosts);
            req.getRequestDispatcher("listings.jsp").forward(req,resp);
        }
    }

    @WebServlet("/search")
    public static class Search extends HttpServlet{
        @Override
        protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            String location = req.getParameter("location");
            String category = req.getParameter("category");
            String state = req.getParameter("state");
            String title = req.getParameter("location");
            String sql = "select * from Event where title like ?";
            ArrayList<String> paras = new ArrayList<>();
            paras.add("%" + title + "%");
            if (location.equals("0")){
                sql += " and location = ?";
                paras.add(location);
            }
            if (category.equals("0")){
                sql += " and category = ?"; //lag ko a nghien|hoi lag| lag vcl nhi =)) || cam cung mang LAN cai thien duong truyen nhi ?
                paras.add(category);
            }
            if (state.equals("0")){
                sql += " and state = ?";
                paras.add(state);
            }
            ArrayList<>
        }
    }
}
