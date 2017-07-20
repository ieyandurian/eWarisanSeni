package com.eWarisanSeni.app.servlet;

import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.eWarisanSeni.app.bean.AddressBean;
import com.eWarisanSeni.app.bean.CartBean;
import com.eWarisanSeni.app.bean.CustomerBean;
import com.eWarisanSeni.app.bean.OrderItemBean;
import com.eWarisanSeni.app.bean.OrderListBean;
import com.eWarisanSeni.app.bean.ProductBean;
import com.eWarisanSeni.app.dao.OrderItemDAO;
import com.eWarisanSeni.app.dao.OrderListDAO;

public class CreateOrderServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		try {
			System.out.println("Stage 1 - creating order...");
			HttpSession session = request.getSession(true);
			CustomerBean user = ((CustomerBean) (session
					.getAttribute("currentSessionUser")));
			AddressBean userAdd = ((AddressBean) (session
					.getAttribute("currentSessionAddress")));
			CartBean shoppingCart = (CartBean) session.getAttribute("cart");
			CartBean newShoppingCart = new CartBean();
			ProductBean cart = new ProductBean();
			OrderItemBean item = new OrderItemBean();
			OrderListBean order = new OrderListBean();
			String address = request.getParameter("address");
			userAdd.setAdd_id(Integer.parseInt(request.getParameter("add_id")));
			double totalprice = Double.parseDouble(request.getParameter("totalprice"));
			String payment = request.getParameter("payment");
			System.out.println("Stage 2 - creating order...");
			order = OrderListDAO.createOrder(address, payment, userAdd, totalprice);
			if(order.isValid())
			{
				session.setAttribute("currentSessionOrder", order);
			}
			item = OrderItemDAO.createOrderItem(item, shoppingCart, user, order, cart);
			if (item.isValid()) {
				session.setAttribute("currentSessionOrderItem", item);
				session.setAttribute("cart", newShoppingCart);
				response.sendRedirect("ViewCustomer/checkoutsuccess.jsp"); // logged-in page
			} else
				response.sendRedirect("ViewCustomer/checkoutfail.jsp"); // error page
		} catch (Throwable theException) {
			System.out.println(theException);
		}
		out.close();
	}
}