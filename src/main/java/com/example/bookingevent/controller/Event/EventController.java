package com.example.bookingevent.controller.Event;

import com.example.bookingevent.daos.EventDAO;
import com.example.bookingevent.models.Category;
import com.example.bookingevent.models.EventPost;
import com.example.bookingevent.models.User;
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

public class EventController {
    @WebServlet("/events")
    @MultipartConfig(
            fileSizeThreshold = 1024 * 1024, // 1 MB
            maxFileSize = 1024 * 1024 * 10,      // 10 MB
            maxRequestSize = 1024 * 1024 * 10  // 10 MB
    )
    public static class LoadEvent extends HttpServlet {
        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

                req.getRequestDispatcher("views/events/shop.jsp").forward(req,resp);
        }
    }


    @WebServlet("/event")
    public static class EventDetail extends HttpServlet {
        @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            EventDAO dao = new EventDAO();
            List<String> images = new ArrayList<String>();
            int id = Integer.parseInt(request.getParameter("id"));

            EventPost eventDetail = dao.getEventPostByID(id);
            images = Arrays.asList(eventDetail.getImage().split(", "));

            request.setAttribute("eventPost", eventDetail);
            request.setAttribute("otherImages", images);
            request.getRequestDispatcher("views/events/event-detail.jsp").forward(request,response);
        }
    }

    @MultipartConfig
    @WebServlet("/new-event")
    public static class CreateEvent extends HttpServlet {
        @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("utf-8");

            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
//            if ( user == null)
            if ( 1==0)
                response.sendRedirect("login");
            else {

                EventDAO dao = new EventDAO();
                ArrayList<Category> list = dao.getAllCategory();
                System.out.println("Category list: " + list);

                request.setAttribute("cateList", list);

                request.getRequestDispatcher("views/events/create-event.jsp").forward(request, response);
            }
        }

        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("utf-8");

            String title = request.getParameter("title");
            String description = request.getParameter("content");
            String start_date = request.getParameter("start_date");
            String end_date = request.getParameter("end_date");
            String location = request.getParameter("location");
            String is_verified = "1";
            String author = request.getParameter("author");
            String tickets = request.getParameter("tickets");
            String price = request.getParameter("price");


            String image = getStringImages("", request);

            String category = request.getParameter("category");

            System.out.println("title: "+  title);
            System.out.println("content: "+  description);
            System.out.println("start_date: "+  start_date);
            System.out.println("end_date: "+  end_date);
            System.out.println("location: "+  location);
            System.out.println("is_verified: "+  is_verified);
            System.out.println("author: "+  author);
            System.out.println("image: "+  image);
            System.out.println("category: "+  category);



//            EventDAO dao = new EventDAO();
//            dao.addEventPost(title, description, start_date, end_date, location, state, author, category, image);
//
//            response.sendRedirect("my-event");

        }

        private String getStringImages(String variableName, HttpServletRequest request) throws ServletException, IOException {
            Part anhBia = null;
            List<Part> otherImages = new ArrayList<>();
            List<String> result = new ArrayList<>();

            //Upload Image
            String realPath = request.getServletContext().getRealPath("/images");
            System.out.println("Real path: " + realPath );  //Print real path
            if (!Files.exists(Paths.get(realPath)))
            {
                Files.createDirectory(Paths.get(realPath));
            }

            for (Part part : request.getParts()) {
                if (part.getName().equals("image1")) {
                    anhBia = part;
                }
                if (part.getName().equals("image2")) {
                    otherImages.add(part);
                }
            }

            if (anhBia != null && !otherImages.isEmpty())
            {
                String fileName = Paths.get(anhBia.getSubmittedFileName()).getFileName().toString();
                result.add(fileName);
                for (Part image : otherImages) {
                    fileName = Paths.get(image.getSubmittedFileName()).getFileName().toString();
                    result.add(fileName);
                }
            }
            else if ( anhBia== null && !otherImages.isEmpty())
            {
                //Khi them su kien, anh bia ko dc null
            }
            else if (anhBia != null && otherImages.isEmpty())
            {
                String fileName = Paths.get(anhBia.getSubmittedFileName()).getFileName().toString();
                result.add(fileName);
            }

            // Trả về kết quả
            return String.join(", ", result);
        }

    }

    @WebServlet("/search-event")
    public static class Search extends HttpServlet {
        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//            EventDAO dao = new EventDAO();
//            int id = Integer.parseInt(req.getParameter("id"));
//            int minPrice = Integer.parseInt(req.getParameter("minPrice"));
//            int maxPrice = Integer.parseInt(req.getParameter("maxPrice"));
//            List<EventPost> eventDetail = dao.getEventPostByID(id);
//            req.setAttribute("eventDetail", eventDetail);
//            eventDetail = dao.getEventByPrice(minPrice,maxPrice);
//            req.setAttribute("eventDetail", eventDetail);
//            req.getRequestDispatcher("views/products/product-detail.jsp").forward(req,resp);
        }
    }




}
