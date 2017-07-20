package com.eWarisanSeni.app.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.eWarisanSeni.app.bean.StaffBean;
import com.eWarisanSeni.app.dao.StaffDAO;

/**
 * Servlet implementation class LoginServlet
 */
public class StaffLoginServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {
		try {
			StaffBean user = new StaffBean();
			user.setStaff_id(request.getParameter("id"));
			user.setStaff_password(request.getParameter("pw"));
			user = StaffDAO.loginStaff(user);
			if (user.isValid()) {
				HttpSession session = request.getSession(true);
				session.setAttribute("currentSessionStaff", user);
				response.sendRedirect("ViewStaff/dashboard.jsp"); // logged-in page
			} else
				response.sendRedirect("ViewStaff/adminlogininvalid.jsp"); // error page
			
		} 
		catch (Throwable theException) {
			System.out.println(theException);
		}
	}
}