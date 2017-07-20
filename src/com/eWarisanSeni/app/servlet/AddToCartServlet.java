package com.eWarisanSeni.app.servlet;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.eWarisanSeni.app.bean.CartBean;
import com.eWarisanSeni.app.bean.ProductBean;
import com.eWarisanSeni.app.dao.ProductDAO;

/**
 * Servlet implementation class AddToCartServlet
 */
public class AddToCartServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, java.io.IOException {
		response.setContentType("text/html;charset=UTF-8");

		HttpSession session = request.getSession();
		CartBean shoppingCart;
		shoppingCart = (CartBean) session.getAttribute("cart");
		if (shoppingCart == null) {
			shoppingCart = new CartBean();
			session.setAttribute("cart", shoppingCart);
		}
		ProductBean cart = new ProductBean();
		System.out.println("Stage 1 - adding to cart...");
		System.out.println(request.getParameter("prod_ID"));
		cart.setProd_ID(Integer.parseInt(request.getParameter("prod_ID")));
		cart.setProd_Quantity(Integer.parseInt(request.getParameter("quantity")));
		System.out.println(request.getParameter("quantity"));
		cart = ProductDAO.viewProduct(cart);
		System.out.println(cart.getProd_ID() + " " + cart.getProd_Quantity());
		shoppingCart.addToCart(cart.getProd_ID(), cart.getProd_Quantity());
		session.setAttribute("cart", shoppingCart);
		if(cart != null)
		{
			response.sendRedirect("ViewCustomer/cart.jsp");
		}
	}
}