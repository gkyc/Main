package com.yc.servlet;

import com.google.gson.Gson;
import com.yc.domain.ShowPro;
import com.yc.utils.JdbcConnector;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

/**
 * 预策划，接受页面参数，调用算法，返回结果数据
 */
@WebServlet("/showPro")
public class ShowProServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response ) throws IOException {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response ) throws IOException {
        String province = request.getParameter("province");
        String subject = request.getParameter("subject");
        int score = Integer.parseInt(request.getParameter("score"));
        String[] schools = request.getParameterValues("schools[]");

        System.out.println("ShowProServlet");
        System.out.println("province: "+province);
        System.out.println("subject: "+subject);
        System.out.println("score: "+score);
        if( schools != null ){
            for( int i = 0; i < schools.length; i++ ) {
                System.out.println(schools[i]);
            }
        }

        /**
         * 调用算法,返回数据到 yucepro.jsp
         */
        /**
         * 假设返回的数据共十条（院校名称---录取概率）
         */
        Map<String, Double> map = new HashMap<>();
        map.put("北京大学", 0.7);
        map.put("清华大学", 0.7);
        map.put("复旦大学", 0.8);
        map.put("上海交通大学", 0.85);
        map.put("浙江大学", 0.85);
        map.put("南京大学", 0.9);
        map.put("中国科技大学", 0.9);
        map.put("西安交通大学", 1.0);
        map.put("哈尔滨工业大学", 1.0);
        map.put("北京理工大学", 1.0);

        // 将返回信息对象存在list中
        List<ShowPro> list = new ArrayList<>();
        Set<String> keyset = map.keySet();
        // 根据key遍历map
        Connection connection = null;
        try {
            connection = JdbcConnector.getConnection();
            for( String key : keyset ) {
                ShowPro showPro = new ShowPro();
                showPro.setSchoolName(key);
                showPro.setSchoolPro(map.get(key));
                // 查询该key对应的高校所在省份
                String sql = "select sch_province from school where sch_name = '"+key+"'";
                PreparedStatement preparedStatement = connection.prepareStatement(sql);
                ResultSet resultSet = preparedStatement.executeQuery();
                if (resultSet.next()) {
                    showPro.setSchoolLoc(resultSet.getString(1));
                } else {
                    showPro.setSchoolLoc("---");
                }
                list.add(showPro);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        Gson gson = new Gson();
        String result = gson.toJson(list);
        System.out.println(result);

        // 将结果数据返回带showpro.jsp
        response.setContentType("text/html; charset=utf-8");
        response.getWriter().write(result);
    }
}
