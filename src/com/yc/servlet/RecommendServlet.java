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
        String province = request.getParameter("province");
        String subject = request.getParameter("subject");
        int score = Integer.parseInt(request.getParameter("score"));
        String[] toProvince = request.getParameterValues("toProvince[]");
        String[] major = request.getParameterValues("major[]");

        System.out.println("RecommendServlet");
        System.out.println("province: "+province);
        System.out.println("subject: "+subject);
        System.out.println("score: "+score);

        for( int i = 0; i < major.length; i++ ) {
            System.out.println(major[i]);
        }
        for( int i = 0; i < major.length; i++ ) {
            System.out.println(toProvince[i]);
        }

        /**
         * 调用算法
         */
        /**
         * 假设算法返回的数据有
         * 高校名--高校所在省--高校省内名次--被该高校录取概率--高校学科排名
         */
    }
}
