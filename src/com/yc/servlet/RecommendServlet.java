package com.yc.servlet;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 预策划，接受页面参数，调用算法，返回结果数据
 */
@WebServlet("/recommend")
public class RecommendServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response ) {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response ) {

    }
}
