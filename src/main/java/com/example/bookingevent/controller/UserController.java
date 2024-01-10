package com.example.bookingevent.controller;

import com.example.bookingevent.Init.SendMail;
import com.example.bookingevent.database.DB;
import com.example.bookingevent.database.MyObject;
import com.example.bookingevent.Init.Config;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import org.mindrot.jbcrypt.BCrypt;


import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.ResourceBundle;
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

    /*@WebServlet("/poster-register")
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
    }*/
    @WebServlet("/user/profile")
    public static class Profile extends HttpServlet{
        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            req.getRequestDispatcher("/views/user/profile.jsp").forward(req, resp);
        }
        public static int checkUpdateInfo(String email, String phone){
            if (!AuthController.checkEmail(email)){
                return 1;
            }
            if (!AuthController.checkPhone(phone)){
                return 2;
            }
            return 0;
        }
        /*@Override
        protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            String user_id = (String) req.getSession().getAttribute("login");
            String email = req.getParameter("email");
            String phone = req.getParameter("phone");
            String name = req.getParameter("name");
            String gender = req.getParameter("gender");
            String password = req.getParameter("password");
            String new_password = req.getParameter("new_password");
            String new_re_password = req.getParameter("new_re_password");
            String sql = "update users set name = ?, gender = ? where id = ?";

        }*/
    }
    @WebServlet("/user/profile-update-name-gender")
    public static class UpdateNameGender extends HttpServlet{
        @Override
        protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            ResourceBundle language = (ResourceBundle) req.getAttribute("language");
            String name = req.getParameter("name");
            String gender = req.getParameter("gender");
            String user_id = (String) req.getSession().getAttribute("login");
            String sql = "update users set name = ?, gender = ? where id = ?";
            boolean check = DB.executeUpdate(sql, new String[]{name, gender, user_id});
            if (check) {
                req.getSession().setAttribute("mess", "success|" + language.getString("update_success"));
            } else {
                req.getSession().setAttribute("mess", "error|" + language.getString("update_fail"));
            }
            resp.sendRedirect(req.getContextPath() + "/user/profile");
        }
    }
    @WebServlet("/user/profile-update-email")
    public static class UpdateEmail extends HttpServlet{
        @Override
        protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            ResourceBundle language = (ResourceBundle) req.getAttribute("language");
            String email = req.getParameter("email");
            if (AuthController.checkEmail(email)){
                String user_id = (String) req.getSession().getAttribute("login");
                String token = UUID.randomUUID().toString();
                String sql = "update users set email = ?, token = ?, is_verified = 'false' where id = ?";
                boolean check = DB.executeUpdate(sql, new String[]{email, token, user_id});
                if (check) {
                    ExecutorService executorService = Executors.newSingleThreadExecutor();
                    executorService.submit(() -> {
                        try {
                            String url = Config.app_url + Config.context_path + "/verify?token=" + token;
                            String html = language.getString("verify_email").replace("xxx", Config.app_name).replace("yyy", url);
                            SendMail.send(email, language.getString("verify_mail_subject"), html);
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    });
                    executorService.shutdown();
                    req.getSession().setAttribute("mess", "success|" + language.getString("update_mail_success"));
                    req.getSession().removeAttribute("login");
                    resp.sendRedirect(req.getContextPath() + "/login");
                } else {
                    req.getSession().setAttribute("mess", "error|" + language.getString("update_fail"));
                    resp.sendRedirect(req.getContextPath() + "/user/profile");
                }
            } else {
                req.getSession().setAttribute("mess", "warning|" + language.getString("email_used"));
                resp.sendRedirect(req.getContextPath() + "/user/profile");
            }
        }
    }
    @WebServlet("/user/profile-update-phone")
    public static class UpdatePhone extends HttpServlet{
        @Override
        protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            ResourceBundle language = (ResourceBundle) req.getAttribute("language");
            String phone = req.getParameter("phone");
            if (AuthController.checkPhone(phone)){
                String user_id = (String) req.getSession().getAttribute("login");
                String sql = "update users set phone = ? where id = ?";
                boolean check = DB.executeUpdate(sql, new String[]{phone, user_id});
                if (check) {
                    req.getSession().setAttribute("mess", "success|" + language.getString("update_success"));
                } else {
                    req.getSession().setAttribute("mess", "error|" + language.getString("update_fail"));
                }
            } else {
                req.getSession().setAttribute("mess", "warning|" + language.getString("phone_used"));
            }
            resp.sendRedirect(req.getContextPath() + "/user/profile");
        }
    }
    @WebServlet("/user/profile-update-password")
    public static class UpdatePassword extends HttpServlet{
        public static int checkEmptyPasswords(String password, String new_password, String new_re_password){
            if (password.equals("")){
                return 1;
            }
            if (new_password.equals("")){
                return 2;
            }
            if (new_re_password.equals("")){
                return 3;
            }
            return 0;
        }
        @Override
        protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            ResourceBundle language = (ResourceBundle) req.getAttribute("language");
            String password = req.getParameter("password");
            String new_password = req.getParameter("new_password");
            String new_re_password = req.getParameter("new_re_password");
            String[] checkEmptyPasswordMessages = new String[]{"", "password_cant_null", "new_password_cant_null", "new_re_password_cant_null"};
            int check = checkEmptyPasswords(password, new_password, new_re_password);
            if (check == 0){
                if (new_password.equals(new_re_password)){
                    MyObject user = DB.getUser((String) req.getSession().getAttribute("login"));
                    if (BCrypt.checkpw(password, user.password)){
                        String salt = BCrypt.gensalt();
                        String new_hash_password = BCrypt.hashpw(new_password, salt);
                        String sql = "update users set password = ? where id = ?";
                        boolean status = DB.executeUpdate(sql, new String[]{new_hash_password, user.id});
                        if (status) {
                            req.getSession().setAttribute("mess", "success|" + language.getString("update_success"));
                        } else {
                            req.getSession().setAttribute("mess", "error|" + language.getString("update_fail"));
                        }
                    }
                    else {
                        req.getSession().setAttribute("mess", "warning|" + language.getString("current_password_wrong"));
                    }
                } else {
                    req.getSession().setAttribute("mess", "warning|" + language.getString("new_and_re_new_not_match"));
                }
            } else {
                req.getSession().setAttribute("mess", "warning|" + language.getString(checkEmptyPasswordMessages[check]));
            }
            resp.sendRedirect(req.getContextPath() + "/user/profile");
        }
    }
    @MultipartConfig(
            fileSizeThreshold = 1024 * 1024, // 1 MB
            maxFileSize = 1024 * 1024 * 10,      // 10 MB
            maxRequestSize = 1024 * 1024 * 10  // 10 MB
    )
    @WebServlet("/user/update-avatar")
    public static class UpdateAvatar extends HttpServlet{
        public static String generateUniqueFileName(String originalFileName) {
            String extension = "";
            int dotIndex = originalFileName.lastIndexOf('.');
            if (dotIndex >= 0 && dotIndex < originalFileName.length() - 1) {
                extension = originalFileName.substring(dotIndex + 1);
            }
            String uniquePart = UUID.randomUUID().toString();
            return uniquePart + "." + extension;
        }
        public static String getFileName(Part part) {
            String contentDisposition = part.getHeader("content-disposition");
            String[] tokens = contentDisposition.split(";");
            for (String token : tokens) {
                if (token.trim().startsWith("filename")) {
                    return token.substring(token.indexOf('=') + 1).trim()
                            .replace("\"", "");
                }
            }
            return null;
        }
        @Override
        protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            ResourceBundle language = (ResourceBundle) req.getAttribute("language");
            try {
                Part filePart = req.getPart("new_avatar");
                String fileName = getFileName(filePart);
                assert fileName != null;
                String newFileName = generateUniqueFileName(fileName);
                String uploadDir = req.getServletContext().getRealPath("/") + "avatars";
                Path filePath = Paths.get(uploadDir, newFileName);
                try (InputStream fileContent = filePart.getInputStream()) {
                    Files.copy(fileContent, filePath, StandardCopyOption.REPLACE_EXISTING);
                }
                String user_id = (String) req.getSession().getAttribute("login");
                String sql = "update users set avatar = ? where id = ?";
                boolean check_update = DB.executeUpdate(sql, new String[]{"/avatars/" + newFileName, user_id});
                if (check_update){
                    req.getSession().setAttribute("mess", "success|" + language.getString("update_success"));
                } else {
                    req.getSession().setAttribute("mess", "error|" + language.getString("update_fail"));
                }
            }catch (Exception e){
                e.printStackTrace();
                req.getSession().setAttribute("mess", "error|" + language.getString("something_wrong"));
            }
            resp.sendRedirect(req.getContextPath() + "/user/profile");
        }
    }
}
