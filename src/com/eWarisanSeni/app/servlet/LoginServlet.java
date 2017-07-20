package com.eWarisanSeni.app.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.eWarisanSeni.app.bean.AddressBean;
import com.eWarisanSeni.app.bean.CartBean;
import com.eWarisanSeni.app.bean.CustomerBean;
import com.eWarisanSeni.app.dao.AddressDAO;
import com.eWarisanSeni.app.dao.CustomerDAO;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {
		try {
			CustomerBean user = new CustomerBean();
			AddressBean add = new AddressBean();
			user.setCust_username(request.getParameter("un"));
			user.setCust_password(request.getParameter("pw"));
			user = CustomerDAO.loginCustomer(user);
			add = AddressDAO.viewAddress(user);

			if (user.isValid()) {
				HttpSession session = request.getSession(true);
				session.setAttribute("currentSessionUser", user);
				session.setAttribute("currentSessionAddress", add);
				CartBean shoppingCart;
				shoppingCart = (CartBean) session.getAttribute("cart");
				if (shoppingCart == null) {
					shoppingCart = new CartBean();
					session.setAttribute("cart", shoppingCart);
				}
				response.sendRedirect("ViewCustomer/home.jsp"); // logged-in
																// page
			} else
				response.sendRedirect("loginInvalid.jsp"); // error page
		} catch (Throwable theException) {
			System.out.println(theException);
		}
	}
}