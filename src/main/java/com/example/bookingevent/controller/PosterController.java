package com.example.bookingevent.controller;

import com.example.bookingevent.daos.EventDAO;
import com.example.bookingevent.models.Category;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Timestamp;
import java.util.ArrayList;


public class PosterController {

    @MultipartConfig
    @WebServlet(name = "CreatePost", urlPatterns = "/new-post")
    public static class CreatePost extends HttpServlet {
        @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("utf-8");

            EventDAO dao = new EventDAO();
            ArrayList<Category> list = dao.getAllCategory();
            System.out.println("Category list: " + list);
            request.setAttribute("cateList", list);

            request.getRequestDispatcher("/createPost.jsp").forward(request, response);

        }

        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("utf-8");

            String title = request.getParameter("title");
            String description = request.getParameter("description");
            String start_date = request.getParameter("start_date");
            String end_date = request.getParameter("end_date");
            String location = request.getParameter("location");
            String state = "1";
            String author = request.getParameter("author");
            String image = "";

            Part part = request.getPart("image");
            //Upload Image
            String realPath = request.getServletContext().getRealPath("/images");
            System.out.println("Real path: " + realPath );  //Print real path
            String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();

            if (!fileName.equals(""))
            {
                if (!Files.exists(Paths.get(realPath)))
                {
                    Files.createDirectory(Paths.get(realPath));
                }

                part.write(realPath + "/" + fileName);

                image = "images/media/" + fileName;
                System.out.println("Image name:" + image);  //print image name
            }

            String category = request.getParameter("category");


            System.out.println("title: "+  title);
            System.out.println("description: "+  description);
            System.out.println("start_date: "+  start_date);
            System.out.println("end_date: "+  end_date);
            System.out.println("location: "+  location);
            System.out.println("state: "+  state);
            System.out.println("author: "+  author);
            System.out.println("image: "+  image);
            System.out.println("category: "+  category);

            EventDAO dao = new EventDAO();
            dao.addEventPost(title, description, start_date, end_date, location, state, author, category, image);

            response.sendRedirect("homepage");

        }
    }




    @WebServlet(name = "PosterEventPost", value = "/my-event")
    public static class ViewPosterEventPost extends HttpServlet {
        @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        }

        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        }
    }
}