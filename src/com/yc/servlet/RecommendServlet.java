package com.yc.servlet;

import com.google.gson.Gson;
import com.yc.domain.RecommendSch;
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
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 预策划，接受页面参数，调用算法，返回结果数据
 */
@WebServlet("/recommend")
public class RecommendServlet extends HttpServlet {

    /**
     * 获取被录取概率函数
     * @return
     */
    public double getPro() {
        return Math.random() * 10;
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response ) throws IOException {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response ) throws IOException {
        String province = request.getParameter("province");
        String subject = request.getParameter("subject");
        int score = Integer.parseInt(request.getParameter("score"));
        String[] toProvince = request.getParameterValues("toProvince");
        String[] major = request.getParameterValues("major");

        System.out.println("RecommendServlet");
        System.out.println("province: "+province);
        System.out.println("subject: "+subject);
        System.out.println("score: "+score);

        for( int i = 0; i < major.length; i++ ) {
            System.out.println(major[i]);
        }
        for( int i = 0; i < toProvince.length; i++ ) {
            System.out.println(toProvince[i]);
        }

        /**
         * 调用算法，假设可以获取被任意高校录取的概率
         */

        /**
         * 一. 根据用户输入分数和选择向往的省份进行推荐
         * 1. 挑选出用户向往省份的所有大学
         * 2. 计算用户被每所大学录取的概率[0,1]
         * 3. 将每所大学的省排名归一化[0,1]
         * 4. 返回省排名+录取概率得分最高的六所大学
         */

        List<RecommendSch> list = new ArrayList<>();
        Connection connection = null;
        /**
         * 假设算法返回的数据有
         * 高校名--被该高校录取概率
         */
        String[] schName = {"北京大学","清华大学","中国人民大学","北京航空航天大学","中国科学院大学"};
        Double[] beAdmit = {0.7, 0.7, 0.8, 0.93,0.76};
        try {
            connection = JdbcConnector.getConnection();
            for( int i = 0; i < schName.length; i++ ) {
                RecommendSch recommendSch = new RecommendSch();
                // 查询省排名
                String sName = schName[i];
                String sql = "SELECT sch_proranking FROM school WHERE sch_name = '" +
                        sName +"' LIMIT 1";
                PreparedStatement preparedStatement = connection.prepareStatement(sql);
                ResultSet resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    recommendSch.setSchName(schName[i]);
                    recommendSch.setProRank(20-resultSet.getInt(1)*2); // 省排名得分
                    recommendSch.setBeAdmit(beAdmit[i] * 70);

                }

                // 查询全国排名分数
                recommendSch.setConRank(getPro());

                list.add(recommendSch);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        Gson gson = new Gson();
        String result = gson.toJson(list);
        System.out.println(result);
        System.out.println("===========================");
        // 将结果数据返回带showpro.jsp
        response.setContentType("text/html; charset=utf-8");
        response.getWriter().write(result);


    }
}
