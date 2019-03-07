package com.yc.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
        session.setMaxInactiveInterval(1000*60*60);
        session.removeAttribute("username");   
        session.removeAttribute("usernc");
		session.removeAttribute("username");
		session.removeAttribute("password");
		session.removeAttribute("subject");
		session.removeAttribute("user_pro");
		session.removeAttribute("mark");
		session.removeAttribute("mail");
		session.removeAttribute("phone");
		session.removeAttribute("ideal_sch1");
		session.removeAttribute("ideal_sch2");
		session.removeAttribute("ideal_sch3");
		session.removeAttribute("ideal_pro1");
		session.removeAttribute("ideal_pro2");
		session.removeAttribute("ideal_pro3");
		session.removeAttribute("major1");
		session.removeAttribute("major2");
		session.removeAttribute("major3");
		session.removeAttribute("ideal_sch_pro1");
		session.removeAttribute("ideal_sch_pro2");
		session.removeAttribute("ideal_sch_pro3");
        resp.sendRedirect("index.jsp");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doGet(req,resp);
    }		
}

