package com.yc.service;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;

@WebServlet("/select_sh")
public class SelectUniversity extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response ) throws IOException {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response ) throws IOException {

        String location = request.getParameter("loc");
        String leixing = request.getParameter("cate");
        String tese = request.getParameter("feat");
        String xingzhi = request.getParameter("edu");

        // 将选定条件规范化为数据库相应数据
        if(location.equals("全部")){
            location = "*";
        }else{
            location = "高校所在地："+location;
        }
        if(leixing.equals("全部")){
            leixing = "*";
        }else{
            leixing = "高校类型："+leixing;
        }
        if(tese.equals("全部")){
            tese = "*";
        }else if( tese.equals("211高校")) {
            tese = "211";
        }else {
            tese = "211 985";
        }
        if(xingzhi.equals("全部")){
            xingzhi = "*";
        }else{
            xingzhi = "高校性质："+xingzhi;
        }



        System.out.println(xingzhi + " " + location + " " + leixing + " " + tese);

        response.setContentType("text/html; charset=utf-8");
        response.getWriter().write(xingzhi);
    }
}
