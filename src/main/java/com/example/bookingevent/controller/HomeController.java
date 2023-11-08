package com.example.bookingevent.controller;

import com.example.bookingevent.daos.EventDAO;
import com.example.bookingevent.models.EventPost;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

public class HomeController {
    @WebServlet("/homepage")
    public static class Home extends HttpServlet{
        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            List<EventPost> eventPosts = new EventDAO().getEventPostList();
            req.setAttribute("list", eventPosts);
            System.out.println(eventPosts);
            req.getRequestDispatcher("index.jsp").forward(req,resp);
        }
    }
}
