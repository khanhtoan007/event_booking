package com.example.bookingevent.controller;

import com.example.bookingevent.daos.EventDAO;
import com.example.bookingevent.database.DB;
import com.example.bookingevent.database.MyObject;
import com.example.bookingevent.models.EventPost;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
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
            req.getRequestDispatcher("views/index.jsp").forward(req,resp);
        }
    }

    @WebServlet("/change-language")
    public static class ChangeLanguage extends HttpServlet{

        @Override
        protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            String lang = req.getParameter("lang");
            resp.addCookie(new Cookie("lang", lang));
            resp.sendRedirect(req.getParameter("current_uri"));
        }
    }
    @WebServlet("/events")
    public static class ShowEvents extends HttpServlet{
        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            req.getRequestDispatcher("/views/products/shop.jsp").forward(req, resp);
        }
    }
    @WebServlet("/get-categories")
    public static class GetCategories extends HttpServlet{
        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            String sql = "select categories.*, count(events.id) as count from categories left join events on categories.id = events.category_id group by categories.id, name";
            String[] fields = new String[]{"id", "name", "count"};
            ArrayList<MyObject> categories = DB.getData(sql, fields);
            com.google.gson.JsonObject job = new JsonObject();
            ObjectMapper objectMapper = new ObjectMapper();
            objectMapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);
            objectMapper.setSerializationInclusion(JsonInclude.Include.NON_EMPTY);
            String categories_json_string = objectMapper.writeValueAsString(categories);
            job.addProperty("categories", categories_json_string);
            Gson gson = new Gson();
            resp.getWriter().write(gson.toJson(job));
        }
    }
    @WebServlet("/get-locations")
    public static class GetLocations extends HttpServlet{
        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            String sql = "select location from events group by location";
            String[] fields = new String[]{"location"};
            ArrayList<MyObject> locations = DB.getData(sql, fields);
            com.google.gson.JsonObject job = new JsonObject();
            ObjectMapper objectMapper = new ObjectMapper();
            objectMapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);
            objectMapper.setSerializationInclusion(JsonInclude.Include.NON_EMPTY);
            String locations_json_string = objectMapper.writeValueAsString(locations);
            job.addProperty("locations", locations_json_string);
            Gson gson = new Gson();
            resp.getWriter().write(gson.toJson(job));
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
            req.getRequestDispatcher("views/Detail.jsp").forward(req,resp);
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
            req.getRequestDispatcher("views/listings.jsp").forward(req,resp);
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
            req.getRequestDispatcher("views/index.jsp").forward(req,resp);
        }
    }
}
