package com.eWarisanSeni.app.servlet;

import java.io.*;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.eWarisanSeni.app.bean.ProductBean;
import com.eWarisanSeni.app.dao.ProductDAO;

public class SearchServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		try {

			System.out.println("Stage 1 - ...");
			ProductBean bean = new ProductBean();
			bean.setProd_SearchName(request.getParameter("search"));
			bean = ProductDAO.searchProduct(bean);

			if (bean.isValid()) {
				System.out.println("Is valid");
				HttpSession session = request.getSession(true);
				session.setAttribute("product", bean);
				response.sendRedirect("ViewCustomer/productSearch.jsp"); // logged-in
																			// page
			} else
				response.sendRedirect("ViewCustomer/productSearchFail.jsp");
		} catch (Exception e2) {
			e2.printStackTrace();
		} finally {
			out.close();
		}

	}
}