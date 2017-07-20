package com.eWarisanSeni.app.servlet;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.eWarisanSeni.app.bean.CartBean;
/**
 * Servlet implementation class AddToCartServlet
 */
public class DeleteFromCartServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {
		response.setContentType("text/html;charset=UTF-8");
		int prod_ID = Integer.parseInt(request.getParameter("prod_ID"));
		HttpSession session = request.getSession();
		CartBean shoppingCart;
		shoppingCart = (CartBean) session.getAttribute("cart");
		shoppingCart.deleteFromCart(prod_ID);
		System.out.println("The item has been deleted form your cart.");
		session.setAttribute("cart", shoppingCart);
		shoppingCart = (CartBean) session.getAttribute("cart");
		if(shoppingCart != null)
		{
			response.sendRedirect("ViewCustomer/cart.jsp");
		}
	}
}