package com.yc.servlet;

import com.google.gson.Gson;
import com.yc.domain.Score;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/showdata")
public class ShowDataServlet extends HttpServlet {

    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws IOException {
        doPost(request,response);

    }

    public void doPost( HttpServletRequest request, HttpServletResponse response ) throws IOException {
        request.setCharacterEncoding("utf-8");
        String university = request.getParameter("university");
        String province = request.getParameter("province");
        String subject = request.getParameter("subject");

        System.out.println(university+" "+province+" "+subject);

        /* 测试 */
        List<Score>  list = new ArrayList<>();
        list.add(new Score(2011,630));
        list.add(new Score(2012,638));
        list.add(new Score(2013,650));
        list.add(new Score(2014,633));
        list.add(new Score(2015,648));
        list.add(new Score(2016,660));
        list.add(new Score(2017,662));
        list.add(new Score(2018,678));

        Gson gson = new Gson();
        String data = gson.toJson(list);

        System.out.println("showdata servlet");
        response.setContentType("text/html; charset=utf-8");
        response.getWriter().write(data);

    }
}
