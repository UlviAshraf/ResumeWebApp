package com.company.resume.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebFilter(filterName = "JSPFileFilter", urlPatterns = {"*"})
public class SecurityFilter implements Filter {
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws java.io.IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        try {
            if (!req.getRequestURI().contains("/login") && req.getSession().getAttribute("loggedInUser") == null) {
                resp.sendRedirect("login");
            }
            chain.doFilter(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}