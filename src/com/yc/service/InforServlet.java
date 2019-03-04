package com.yc.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		String name = req.getParameter("name");
		String subject = req.getParameter("subject");
		String pro = req.getParameter("pro");
		String mark = req.getParameter("mark");
		String phone = req.getParameter("phone");
		String mail = req.getParameter("mail");
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
		
	}

}
