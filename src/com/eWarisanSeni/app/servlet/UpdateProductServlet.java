package com.eWarisanSeni.app.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eWarisanSeni.app.bean.ProductBean;
import com.eWarisanSeni.app.dao.ProductDAO;

public class UpdateProductServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		ProductBean prod = new ProductBean();

		prod.setProd_ID(Integer.parseInt(request.getParameter("prod_ID")));
		prod.setProd_Name(request.getParameter("prod_Name"));
		prod.setProd_Desc(request.getParameter("prod_Desc"));
		prod.setProd_Size(request.getParameter("prod_Size"));
		prod.setProd_Price(Double.parseDouble(request.getParameter("prod_Price")));
		prod.setProd_Type(request.getParameter("prod_Type"));

		try {
			prod = ProductDAO.updateProduct(prod);
			if (prod.isValid()) {
				System.out.println("Update success!!!");
				response.sendRedirect("ViewStaff/manageproduct.jsp");
			}
		} catch (Exception e2) {
			System.out.println(e2);
		}
		out.close();
	}
}