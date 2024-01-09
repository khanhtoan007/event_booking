package com.example.bookingevent.Filter;

import jakarta.servlet.*;

import java.io.IOException;
import java.util.Locale;
import java.util.ResourceBundle;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
public class AllRouteFilter implements Filter {

    public static String getCookieValue(HttpServletRequest request, String cookieName) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals(cookieName)) {
                    return cookie.getValue();
                }
            }
        }
        return null;
    }
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        if (request.getSession().getAttribute("mess") != null){
            String session_mess = (String) request.getSession().getAttribute("mess");
            request.setAttribute(session_mess.split("\\|")[0], session_mess.split("\\|")[1]);
            request.getSession().removeAttribute("mess");
        }
        String lang = getCookieValue(request, "lang");
        if (lang == null){
            lang = "vi";
        }
        Locale userLocale = new Locale.Builder().setLanguage(lang).build();
        ResourceBundle language = ResourceBundle.getBundle("language", userLocale);
        request.setAttribute("language", language);
        request.setAttribute("uri", request.getRequestURI());
        filterChain.doFilter(request, response);
    }
}
