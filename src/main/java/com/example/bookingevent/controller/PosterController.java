package com.example.bookingevent.controller;

import com.example.bookingevent.daos.EventDAO;
//import com.example.bookingevent.models.Category;
//import com.example.bookingevent.models.EventPost;
//import com.example.bookingevent.models.EventPostDTO;
import com.example.bookingevent.database.DB;
import com.example.bookingevent.database.MyObject;
import com.example.bookingevent.models.User;
import com.fasterxml.jackson.core.JsonProcessingException;
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

import java.util.List;


public class PosterController {

    @MultipartConfig
    @WebServlet(name = "CreatePost", urlPatterns = "/new-post")
    public static class CreatePost extends HttpServlet {
        @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("utf-8");

            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            if ( user == null)
                response.sendRedirect("login");
            else {

                EventDAO dao = new EventDAO();
//                ArrayList<Category> list = dao.getAllCategory();
//                System.out.println("Category list: " + list);
//
//                request.setAttribute("cateList", list);

                request.getRequestDispatcher("/createPost.jsp").forward(request, response);
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
            System.out.println("content: "+  description);
            System.out.println("start_date: "+  start_date);
            System.out.println("end_date: "+  end_date);
            System.out.println("location: "+  location);
            System.out.println("state: "+  state);
            System.out.println("author: "+  author);
            System.out.println("image: "+  image);
            System.out.println("category: "+  category);

            EventDAO dao = new EventDAO();
            dao.addEventPost(title, description, start_date, end_date, location, state, author, category, image);

            response.sendRedirect("my-event");

        }
    }



//    @MultipartConfig
//    @WebServlet(name = "PosterEventPost", value = "/my-event")
//    public static class ViewPosterEventPost extends HttpServlet {
//        @Override
//        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//            response.setContentType("text/html;charset=UTF-8");
//            request.setCharacterEncoding("utf-8");
//
//            HttpSession session = request.getSession();
//            User user = (User) session.getAttribute("user");
//            if ( user == null)
//                response.sendRedirect("login");
//            else {
//
//
//                EventDAO dao = new EventDAO();
//                List<EventPostDTO> eventList = dao.getEventPostListById(user.getId());
//
//
//                // Định dạng ngày hiện tại
//                SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//                SimpleDateFormat outputFormat = new SimpleDateFormat("dd/MM/yyyy");
//
//                for (int i=0; i<eventList.size(); i++) {
//                    try {
//                        // Chuyển đổi start_date thành đối tượng Date
//                        Date startDate = inputFormat.parse(eventList.get(i).getStart_date());
//                        Date endDate = inputFormat.parse(eventList.get(i).getEnd_date());
//
//                        // Chuyển đổi đối tượng Date thành định dạng mới
//                        eventList.get(i).setStart_date(outputFormat.format(startDate));
//                        eventList.get(i).setEnd_date(outputFormat.format(endDate));
//                    } catch (ParseException e) {
//                        e.printStackTrace();
//                    }
//                }
//                request.setAttribute("eventList", eventList);
//                System.out.println("eventList: " + eventList);
//                request.getRequestDispatcher("myPost.jsp").forward(request, response);
//            }
//        }
//
//        @Override
//        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
//        }
//    }

//    @MultipartConfig
//    @WebServlet(name = "PosterUpdateEvent", value = "/update-event")
//    public static class PosterUpdateEvent extends HttpServlet {
//        @Override
//        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//            response.setContentType("text/html;charset=UTF-8");
//            request.setCharacterEncoding("utf-8");
//
//            HttpSession session = request.getSession();
//            User user = (User) session.getAttribute("user");
//            if ( user == null)
//                response.sendRedirect("login");
//            else {
//                int id = Integer.parseInt(request.getParameter("id"));
//                System.out.println("id: " + id);
//                EventPostDTO eventPost = new EventDAO().getEventPostByEventId(id);
//                ArrayList<Category> list = new EventDAO().getAllCategory();
//
//                request.setAttribute("cateList", list);
//                request.setAttribute("eventPost", eventPost);
//
//                request.getRequestDispatcher("PosterUpdateEvent.jsp").forward(request, response);
//            }
//        }
//
//        @Override
//        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//            response.setContentType("text/html;charset=UTF-8");
//            request.setCharacterEncoding("utf-8");
//
//            int id = Integer.parseInt(request.getParameter("id"));
//            EventDAO dao = new EventDAO();
//            EventPostDTO eventPost = dao.getEventPostByEventId(id);
//            System.out.println("eventPost: " + eventPost);
//
//            String title = request.getParameter("title");
//            String content = request.getParameter("content");
//            String start_date = request.getParameter("start_date");
//            String end_date = request.getParameter("end_date");
//            String location = request.getParameter("location");
//            String state = request.getParameter("state");
//            String author = request.getParameter("author");
//            String image = request.getParameter("image");
//
//            Part part = request.getPart("image");
//            if (!Paths.get(part.getSubmittedFileName()).getFileName().toString().equals("")) {
//                //Upload Image
//                String realPath = request.getServletContext().getRealPath("/images");
//                System.out.println("Real path: " + realPath);  //Print real path
//                String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
//
//                if (!fileName.equals("")) {
//                    if (!Files.exists(Paths.get(realPath))) {
//                        Files.createDirectory(Paths.get(realPath));
//                    }
//
//                    part.write(realPath + "/" + fileName);
//
//                    image = "images/media/" + fileName;
//                    System.out.println("Image name:" + image);  //print image name
//                }
//            }
//
//            String category = request.getParameter("category");
//
//            if (start_date.isEmpty()) start_date = eventPost.getStart_date();
//            if (end_date.isEmpty()) end_date = eventPost.getEnd_date();
//            if (image == null) image = eventPost.getImage();
//
//
//            System.out.println("title: "+  title);
//            System.out.println("content: "+  content);
//            System.out.println("start_date: "+  start_date);
//            System.out.println("end_date: "+  end_date);
//            System.out.println("location: "+  location);
//            System.out.println("state: "+  state);
//            System.out.println("author: "+  author);
//            System.out.println("image: "+  image);
//            System.out.println("category: "+  category);
//
//            dao.updateEventPost(title, content, start_date, end_date, location, state, id, category, image);
//
//            response.sendRedirect("event-detail?id=" + id);
//
//        }
//    }

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