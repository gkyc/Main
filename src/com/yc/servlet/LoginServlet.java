package com.yc.servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yc.utils.JDBCConnect;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String username = req.getParameter("login-username");
        String password = req.getParameter("login-password");
        ResultSet rs = null; 
        ResultSet ncrs = null; 
        String sql = "select user_id from users where user_id = '"+username+"' and user_key = '"+password+"'";
        rs = JDBCConnect.executeQuery(sql);
        HttpSession session = req.getSession();
        try {
			if(rs.next()){
				String ncsql = "select user_name,subject,user_pro,mark,mail,phone,ideal_sch1,ideal_sch2,ideal_sch3,ideal_pro1,ideal_pro2,ideal_pro3,major1,major2,major3 from users where user_id = '"+username+"' and user_key = '"+password+"'";
				ncrs = JDBCConnect.executeQuery(ncsql);
				if(ncrs.next()){
					String user_name = ncrs.getString(1);
					String subject = ncrs.getString(2);
					String user_pro = ncrs.getString(3);
					String mark = ncrs.getString(4);
					String mail = ncrs.getString(5);
					String phone = ncrs.getString(6);
					String ideal_sch1 = ncrs.getString(7);
					String ideal_sch2 = ncrs.getString(8);
					String ideal_sch3 = ncrs.getString(9);
					String ideal_pro1 = ncrs.getString(10);
					String ideal_pro2 = ncrs.getString(11);
					String ideal_pro3 = ncrs.getString(12);
					String major1 = ncrs.getString(13);
					String major2 = ncrs.getString(14);
					String major3 = ncrs.getString(15);
					session.setAttribute("usernc", user_name);
					session.setAttribute("username", username);
					session.setAttribute("password", password);
					session.setAttribute("subject", subject);
					session.setAttribute("user_pro", user_pro);
					session.setAttribute("mark", mark);
					session.setAttribute("mail", mail);
					session.setAttribute("phone", phone);
					session.setAttribute("ideal_sch1", ideal_sch1);
					session.setAttribute("ideal_sch2", ideal_sch2);
					session.setAttribute("ideal_sch3", ideal_sch3);
					session.setAttribute("ideal_pro1", ideal_pro1);
					session.setAttribute("ideal_pro2", ideal_pro2);
					session.setAttribute("ideal_pro3", ideal_pro3);
					session.setAttribute("major1", major1);
					session.setAttribute("major2", major2);
					session.setAttribute("major3", major3);
					resp.sendRedirect("index.jsp");
				}
			}
			else{
				req.setAttribute("erro", "用户名或密码错误");
				req.getRequestDispatcher("/login.jsp").forward(req,resp);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
