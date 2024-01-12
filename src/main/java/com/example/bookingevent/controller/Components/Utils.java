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
    @WebServlet("/search")
    public static class Search extends HttpServlet{
        @Override
        protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            String location = req.getParameter("location");
            String category = req.getParameter("category");
            String title = "%" +  req.getParameter("title") + "%";
            String[] vars = new String[]{"event_id", "title", "content", "start_date", "end_date", "location", "state", "user_id", "category_id", "image", "cate_name"};
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
