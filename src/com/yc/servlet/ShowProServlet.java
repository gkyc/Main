package com.yc.servlet;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 预策划，接受页面参数，调用算法，返回结果数据
 */
@WebServlet("/showPro")
public class ShowProServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response ) {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response ) {
        String province = request.getParameter("province");
        String subject = request.getParameter("subject");
        int score = Integer.parseInt(request.getParameter("score"));
        String[] schools = request.getParameterValues("schools[]");

        System.out.println("ShowProServlet");
        System.out.println("province: "+province);
        System.out.println("subject: "+subject);
        System.out.println("score: "+score);
        for( int i = 0; i < schools.length; i++ ) {
            System.out.println(schools[i]);
        }

        /**
         * 调用算法,返回数据到 yucepro.jsp
         */
    }
}
