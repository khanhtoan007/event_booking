package com.example.bookingevent.controller.Admin;

import com.example.bookingevent.daos.EventDAO;
import com.example.bookingevent.database.DB;
import com.example.bookingevent.database.MyObject;
import com.example.bookingevent.models.Category;
import com.example.bookingevent.models.EventPost;
import com.example.bookingevent.models.User;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class HomeController {
    @WebServlet("/admin/home")
    @MultipartConfig(
            fileSizeThreshold = 1024 * 1024, // 1 MB
            maxFileSize = 1024 * 1024 * 10,      // 10 MB
            maxRequestSize = 1024 * 1024 * 10  // 10 MB
    )
    public static class AdminHome extends HttpServlet{
        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            String sql = "select  bills.id, carts.user_id,users.name ,carts.event_id , events.title, carts.quantity, amount , bills.paid_at\n" +
                    "from bills\n" +
                    "        left join carts  on bills.id = carts.bill_id\n" +
                    "        left join events on carts.event_id = events.id\n" +
                    "        left join users on carts.user_id = users.id\n" +
                    "where bills.status = 'true'\n" +
                    "group by bills.id, carts.user_id, users.name, carts.event_id, events.title, carts.quantity, amount, bills.paid_at";

            String chart = "SELECT\n" +
                    "    events.title,\n" +
                    "    SUM(amount) AS total\n" +
                    "FROM\n" +
                    "    bills\n" +
                    "        LEFT JOIN\n" +
                    "    carts ON bills.id = carts.bill_id\n" +
                    "        LEFT JOIN\n" +
                    "    events ON carts.event_id = events.id\n" +
                    "        LEFT JOIN\n" +
                    "    users ON carts.user_id = users.id\n" +
                    "WHERE\n" +
                    "        bills.status = 'true'\n" +
                    "GROUP BY\n" +
                    "    events.title;";
            ArrayList<MyObject> chartjs = DB.getData(chart, new String[]{ "title", "total"});
            ArrayList<MyObject> statistics = DB.getData(sql, new String[]{"id", "user_id", "name","event_id", "title", "quantity", "amount", "paid_at"});
            req.setAttribute("chartjs", chartjs);
            req.setAttribute("statistic", statistics);
            req.getRequestDispatcher("/views/admin/home.jsp").forward(req,resp);
        }
    }

}
