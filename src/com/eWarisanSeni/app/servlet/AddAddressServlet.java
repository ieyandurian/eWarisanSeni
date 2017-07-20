package com.eWarisanSeni.app.servlet;

import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.eWarisanSeni.app.bean.AddressBean;
import com.eWarisanSeni.app.bean.CustomerBean;
import com.eWarisanSeni.app.dao.AddressDAO;

public class AddAddressServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		try {
			System.out.println("Stage 1 - adding new address...");
			HttpSession session = request.getSession(true);
			CustomerBean user = ((CustomerBean) (session
					.getAttribute("currentSessionUser")));
			AddressBean userAdd = new AddressBean();
			userAdd.setAdd_address(request.getParameter("add_address"));
			userAdd.setAdd_postcode(request.getParameter("add_postcode"));
			userAdd.setAdd_city(request.getParameter("add_city"));
			userAdd.setAdd_state(request.getParameter("add_state"));
			userAdd.setAdd_country(request.getParameter("add_country"));
			userAdd = AddressDAO.addAddress(user, userAdd);
			if (userAdd.isValid()) {
				session.setAttribute("currentSessionUserAdd", userAdd);
				response.sendRedirect("ViewCustomer/address.jsp"); // logged-in page
			} else
				response.sendRedirect("ViewCustomer/insertaddressfail.jsp"); // error page
		} catch (Throwable theException) {
			System.out.println(theException);
		}
		out.close();
	}
}