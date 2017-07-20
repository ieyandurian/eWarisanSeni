package com.eWarisanSeni.app.servlet;

import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.eWarisanSeni.app.bean.ProductBean;
import com.eWarisanSeni.app.dao.ProductDAO;

 
public class DeleteProductServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		try {
			System.out.println("Stage 1 - deleting address...");
			ProductBean prod = new ProductBean();
			prod.setProd_ID(Integer.parseInt(request.getParameter("prod_ID")));
			prod = ProductDAO.deleteProduct(prod);
			if (prod.isValid()) {
				request.setAttribute("deleteprod", prod);
				response.sendRedirect("ViewStaff/manageproduct.jsp"); // logged-in page
			} else
				out.println("<script type='text/javascript'>alert('Delete Product Failed');</script>");
				response.sendRedirect("ViewStaff/manageproductdfail.jsp"); // error page
		} catch (Throwable theException) {
			System.out.println(theException);
		}
		out.close();
	}
}