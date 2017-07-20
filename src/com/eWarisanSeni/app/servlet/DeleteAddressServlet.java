package com.eWarisanSeni.app.servlet;

import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.eWarisanSeni.app.bean.AddressBean;
import com.eWarisanSeni.app.dao.AddressDAO;

public class DeleteAddressServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		try {
			System.out.println("Stage 1 - deleting address...");
			HttpSession session = request.getSession(true);
			AddressBean userAdd = new AddressBean();
			userAdd.setAdd_id(Integer.parseInt(request.getParameter("add_id")));
			userAdd = AddressDAO.deleteAddress(userAdd);
			if (userAdd.isValid()) {
				session.setAttribute("currentSessionUserAdd", userAdd);
				response.sendRedirect("ViewCustomer/address.jsp"); // logged-in page
			} else
				response.sendRedirect("ViewCustomer/deleteaddressfail.jsp"); // error page
		} catch (Throwable theException) {
			System.out.println(theException);
		}
		out.close();
	}
}