package com.example.bookingevent.controller;

import com.example.bookingevent.controller.Chat.MyWebSocket;
import com.example.bookingevent.database.DB;
import com.example.bookingevent.database.MyObject;
import com.example.bookingevent.Init.Config;
import com.example.bookingevent.models.User;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClients;


import java.io.IOException;
import java.net.URI;
import java.util.ArrayList;
import java.util.UUID;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class UserController {
    private static final int WORK_FACTOR = 12;

    @WebServlet("/admin/user")
    @MultipartConfig(
            fileSizeThreshold = 1024 * 1024, // 1 MB
            maxFileSize = 1024 * 1024 * 10,      // 10 MB
            maxRequestSize = 1024 * 1024 * 10  // 10 MB
    )
    public static class GetUser extends HttpServlet{
        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

            String sql = "select * from user";


            String[] var = new String[]{"id","name", "email", "phone", "role_id"};
            ArrayList<MyObject> user = DB.getData(sql,var);
            req.setAttribute("users",user);
            req.getRequestDispatcher("/views/admin/user.jsp").forward(req,resp);
        }
    }

    @WebServlet("/poster-register")
    @MultipartConfig(
            fileSizeThreshold = 1024 * 1024, // 1 MB
            maxFileSize = 1024 * 1024 * 10,      // 10 MB
            maxRequestSize = 1024 * 1024 * 10  // 10 MB
    )
    public static class RegisterPoster extends HttpServlet{
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


            req.getRequestDispatcher("addPoster.jsp").forward(req,resp);
        }
        @Override
        protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            User user = (User) req.getSession().getAttribute("user");
            String user_id = String.valueOf(user.getId());
            String businessName = req.getParameter("businessName");
            String mst = req.getParameter("mst");
            String address = req.getParameter("address");
            String sql = "insert into PosterRequest (user_id, businessName, mst, address, is_accepted) values (?,?,?,?,0)";
            String[] var = new String[]{user_id,businessName,mst,address};
            int id =  DB.insertGetLastId(sql,var);
            System.out.println("send socket");
            MyWebSocket.broadcastToChannel("0", id + "," +user.getUsername());
            if (id > 0) {
                System.out.println("request success!!!!");
                resp.sendRedirect(req.getContextPath());
            }
        }
    }



}
