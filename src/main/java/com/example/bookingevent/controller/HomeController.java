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
    @WebServlet("/homepage")
    @MultipartConfig(
            fileSizeThreshold = 1024 * 1024, // 1 MB
            maxFileSize = 1024 * 1024 * 10,      // 10 MB
            maxRequestSize = 1024 * 1024 * 10  // 10 MB
    )
    public static class Home extends HttpServlet{
        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            EventDAO dao = new EventDAO();
            List<EventPost> list = dao.getEventPostList();
            req.setAttribute("list", list);
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
            ArrayList<EventPost> eventPosts = new EventDAO().getEventPostByID(id);
            req.setAttribute("event", eventPosts);
            req.getRequestDispatcher("Detail.jsp").forward(req,resp);
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
            String id = req.getParameter("id");
            List<EventPost> eventPosts = new EventDAO().getEventPostList();
            req.setAttribute("list", eventPosts);
            req.getRequestDispatcher("listings.jsp").forward(req,resp);
        }
    }

    @WebServlet("/search")
    public static class Search extends HttpServlet{
        @Override
        protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            String location = req.getParameter("location");
            String category = req.getParameter("category");
            String title = "%" +  req.getParameter("title") + "%";
            String[] vars = new String[]{"event_id", "title", "description", "start_date", "end_date", "location", "state", "user_id", "category_id", "image", "cate_name"};
            String sql;
            String[] para;
            if (location.equals("0") && category.equals("0")){
                System.out.println("k search theo cate and location");
                sql = "select Event.*, Category.name as cate_name from Event inner join Category on Event.category_id = Category.category_id where title like ?";
                para = new String[]{title};
            } else {
                if (!location.equals("0") && !category.equals("0")){
                    System.out.println("search theo cate va locaiton");
                    sql = "select Event.*, Category.name as cate_name from Event inner join Category on Event.category_id = Category.category_id where title like ? and location = ? and Category.category_id = ?";
                    para = new String[]{title, location, category};
                } else {
                    if (location.equals("0")){
                        System.out.println("search theo moi cate");
                        sql = "select Event.*, Category.name as cate_name from Event inner join Category on Event.category_id = Category.category_id where title like ? and Category.category_id = ?";
                        para = new String[]{title, category};
                    }else {
                        System.out.println("search theo moi location");
                        sql = "select Event.*, Category.name as cate_name from Event inner join Category on Event.category_id = Category.category_id where title like ? and location = ?";
                        para = new String[]{title, location};
                    }
                }
            }
            ArrayList<MyObject> events_search = DB.getData(sql, para, vars);
            req.setAttribute("events_search", events_search);
            req.getRequestDispatcher("index.jsp").forward(req,resp);
        }
    }
}
