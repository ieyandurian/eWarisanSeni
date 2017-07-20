package com.eWarisanSeni.app.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eWarisanSeni.app.bean.OrderListBean;
import com.eWarisanSeni.app.dao.OrderListDAO;

public class UpdateOrderServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		OrderListBean ord = new OrderListBean();
		ord.setOrder_id(Integer.parseInt(request.getParameter("order_ID")));
		ord.setOrder_status(request.getParameter("order_Status"));
		try {
			ord = OrderListDAO.updateOrder(ord);
			if (ord.isValid()) {
				response.sendRedirect("ViewStaff/manageorder.jsp");
			}
		}
		catch (Exception e2) {
			System.out.println(e2);
		}
		out.close();
	}
}
