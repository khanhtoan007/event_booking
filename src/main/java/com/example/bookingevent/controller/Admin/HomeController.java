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

            String sql = "select bills.id, carts.user_id, events.title, carts.quantity,bills.amount , bills.paid_at\n" +
                    "    from bills\n" +
                    "        left join carts  on bills.id = carts.bill_id\n" +
                    "        left join events on carts.event_id = events.id\n" +
                    "    where bills.status = 'true'";

            ArrayList<MyObject> statistics = DB.getData(sql, new String[]{"id","user_id", "title", "quantity", "amount", "paid_at"});
            System.out.println(statistics);
            req.setAttribute("statistic", statistics);
            req.getRequestDispatcher("/views/admin/home.jsp").forward(req,resp);
        }
    }

}
