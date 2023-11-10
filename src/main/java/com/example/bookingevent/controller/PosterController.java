package com.example.bookingevent.controller;

import com.example.bookingevent.database.DB;
import com.example.bookingevent.database.MyObject;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


public class PosterController extends HttpServlet {

    @WebServlet(name = "PosterEventPost", value = "/my-event")
    public class ViewPosterEventPost extends HttpServlet {
        @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        }

        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        }
    }

    @WebServlet("/get-all-notifications")
    public static class GetAllNotifications extends HttpServlet{

        private static String convertListToJson(List<?> list) {
            ObjectMapper objectMapper = new ObjectMapper();
            try {
                return objectMapper.writeValueAsString(list);
            } catch (JsonProcessingException e) {
                e.printStackTrace();
                return null;
            }
        }
        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            String sql = "select PosterRequest.*, [User].name as username from PosterRequest inner join [User] on PosterRequest.user_id = [User].user_id order by PosterRequest.request_id desc";
            String[] vars = new String[]{"request_id", "user_id", "businessName", "mst", "address", "is_accepted", "username"};
            ArrayList<MyObject> poster_requests = DB.getData(sql, vars);
            String jsonString = convertListToJson(poster_requests);
            com.google.gson.JsonObject job = new JsonObject();
            job.addProperty("data", jsonString);
            Gson gson = new Gson();
            resp.getWriter().write(gson.toJson(job));
        }
    }
}