package com.example.bookingevent.Filter;

import com.example.bookingevent.database.DB;
import com.example.bookingevent.database.MyObject;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ResourceBundle;
@WebFilter("/admin/*")

public class AdminFilter implements Filter {
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse resp = (HttpServletResponse) servletResponse;
        String user_id = (String) req.getSession().getAttribute("login");
        ResourceBundle language = (ResourceBundle) req.getAttribute("language");
        if (user_id != null){
            MyObject user = DB.getUser(user_id);
            if (user.role_id.equals("3")){
                filterChain.doFilter(req, resp);
            } else {
                req.getSession().setAttribute("mess", "warning|" + language.getString("not_admin"));
                resp.sendRedirect(req.getContextPath() + "/login");
            }
        } else {
            req.getSession().setAttribute("mess", "warning|" + language.getString("please_login"));
            resp.sendRedirect(req.getContextPath() + "/login");
        }
    }
}
