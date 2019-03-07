package com.yc.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yc.utils.JDBCConnect;

@WebServlet("/infor")
public class InforServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("username");
		String name = req.getParameter("name");
		String subject = req.getParameter("subject");
		String pro = req.getParameter("pro");
		String mark = req.getParameter("mark");
		String phone = req.getParameter("phone");
		String mail = req.getParameter("mail");
		String ideal_sch_pro1 =req.getParameter("ideal_sch_pro1");
		String ideal_sch_pro2 =req.getParameter("ideal_sch_pro2");
		String ideal_sch_pro3 =req.getParameter("ideal_sch_pro3");
		String ideal_sch1 = req.getParameter("ideal_sch1");
		String ideal_sch2 = req.getParameter("ideal_sch2");
		String ideal_sch3 = req.getParameter("ideal_sch3");
		String ideal_pro1 = req.getParameter("ideal_pro1");
		String ideal_pro2 = req.getParameter("ideal_pro2");
		String ideal_pro3 = req.getParameter("ideal_pro3");
		String major1 = req.getParameter("major1");
		String major2 = req.getParameter("major2");
		String major3 = req.getParameter("major3");
		String password = req.getParameter("password");
		if(ideal_sch_pro1.equals("--请选择高校所在省份--")){ideal_sch_pro1="";}
		if(ideal_sch_pro2.equals("--请选择高校所在省份--")){ideal_sch_pro2="";}
		if(ideal_sch_pro3.equals("--请选择高校所在省份--")){ideal_sch_pro3="";}
		if(ideal_sch1.equals("---请选择---")){ideal_sch1="";}
		if(ideal_sch2.equals("---请选择---")){ideal_sch2="";}
		if(ideal_sch3.equals("---请选择---")){ideal_sch3="";}
		if(ideal_pro1.equals("---请选择---")){ideal_pro1="";}
		if(ideal_pro2.equals("---请选择---")){ideal_pro2="";}
		if(ideal_pro3.equals("---请选择---")){ideal_pro3="";}
		if(major1.equals("---请选择---")){major1="";}
		if(major2.equals("---请选择---")){major2="";}
		if(major3.equals("---请选择---")){major3="";}
		session.setAttribute("usernc", name);
		session.setAttribute("password", password);
		session.setAttribute("subject", subject);
		session.setAttribute("user_pro", pro);
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
		session.setAttribute("ideal_sch_pro1", ideal_sch_pro1);
		session.setAttribute("ideal_sch_pro2", ideal_sch_pro2);
		session.setAttribute("ideal_sch_pro3", ideal_sch_pro3);
		String sql = "UPDATE `scourse`.`users` SET `user_name` = '"+name+"', `user_key` = '"+password+"',`subject` = '"+subject+"', `user_pro` = '"+pro+"', `mark` = "+mark+", `mail` = '"+mail+"', `phone` = '"+phone+"', `ideal_sch1` = '"+ideal_sch1+"', `ideal_sch2` = '"+ideal_sch2+"', `ideal_sch3` = '"+ideal_sch3+"', `ideal_pro1` = '"+ideal_pro1+"', `ideal_pro2` = '"+ideal_pro2+"', `ideal_pro3` = '"+ideal_pro3+"', `major1` = '"+major1+"', `major2` = '"+major2+"', `major3` = '"+major3+"' WHERE `user_id` = '"+id+"'";
		JDBCConnect.execUpdate(sql, null);
		resp.sendRedirect("infor.jsp");
	}

}
