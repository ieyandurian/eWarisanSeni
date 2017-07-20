package com.eWarisanSeni.app.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.eWarisanSeni.app.bean.CustomerBean;
import com.eWarisanSeni.app.dao.CustomerDAO;

public class UpdateAccountServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		try {
			System.out.println("Stage 1 - Updating account...");
			HttpSession session = request.getSession(true);
			CustomerBean user = ((CustomerBean) (session
					.getAttribute("currentSessionUser")));
			
			System.out.println(user.getCust_id());
			user.setCust_email(request.getParameter("cust_email"));
			System.out.println(user.getCust_email());
			user.setCust_firstname(request.getParameter("cust_firstname"));
			user.setCust_lastname(request.getParameter("cust_lastname"));
			user.setCust_icnum(request.getParameter("cust_icnum"));
			user.setCust_phonenumber(request.getParameter("cust_phonenumber"));
			user = CustomerDAO.updateAccount(user);
			if (user.isValid()) {
				session.setAttribute("currentSessionUserAdd", user);
				response.sendRedirect("ViewCustomer/editaccountsuccess.jsp"); // logged-in page
			} else
				response.sendRedirect("ViewCustomer/editaddressfail.jsp"); // error page
		} catch (Throwable theException) {
			System.out.println(theException);
		}
		out.close();
	}
}