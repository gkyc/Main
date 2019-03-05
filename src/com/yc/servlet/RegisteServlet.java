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

@WebServlet("/registe")
public class RegisteServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String username = req.getParameter("registe-username");
		String password = req.getParameter("registe-password");
        ResultSet rs = null;
        String sql = "select user_id from users where user_id = '"+username+"'";
        rs = JDBCConnect.executeQuery(sql);
        HttpSession session = req.getSession();
        try {
			if(rs.next()){
				req.setAttribute("erro", "用户名已经存在");
				req.getRequestDispatcher("/registe.jsp").forward(req,resp);
			}
			else {
				session.setAttribute("username", username);
				session.setAttribute("password", password);
				String newsql = "INSERT INTO `test`.`users`(`user_id`, `user_key`) VALUES ('"+username+"','"+password+"')";
				JDBCConnect.execute(newsql);
				resp.sendRedirect("infor.jsp");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
