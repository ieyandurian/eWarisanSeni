package com.eWarisanSeni.app.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.eWarisanSeni.app.bean.CustomerBean;
import com.eWarisanSeni.app.dao.CustomerDAO;

public class UpdatePasswordServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		try {
			HttpSession session = req.getSession();
			CustomerBean currentUser = ((CustomerBean) (session
					.getAttribute("currentSessionUser")));
			String newpswd = req.getParameter("newcust_password");
			String cpswd = req.getParameter("concust_password");
			String msg;
			if (newpswd.equals(" ") && cpswd.equals(" ")) {
				msg = ("New Password and Comfirm password , both are required.");
				req.setAttribute("reg", msg);
				getServletContext().getRequestDispatcher(
						"/ViewCustomer/updatepassword.jsp")
						.forward(req, res);
				return;
			} else if (newpswd.equals(" ") || cpswd.equals(" ")) {
				msg = ("New Password and Comfirm password , both are required.");
				req.setAttribute("reg", msg);
				getServletContext().getRequestDispatcher(
						"/ViewCustomer/updatepassword.jsp")
						.forward(req, res);
				return;
			} else if (!newpswd.equals(cpswd)) {
				msg = ("Your New password and confirm password does not match.");
				req.setAttribute("reg", msg);
				getServletContext().getRequestDispatcher("/ViewCustomer/updatepassword.jsp")
						.forward(req, res);
				return;
			}
			try {
				 currentUser = CustomerDAO.updatePassword(currentUser, newpswd);
				 if (currentUser.isValid()) {
						System.out.println("Your password Change Successfully….");
						msg = ("Your password Change Successfully….");
						req.setAttribute("reg", msg);
						getServletContext().getRequestDispatcher(
								"/ViewCustomer/updatepasswordsuccess.jsp").forward(
								req, res);
						return;
					} else {
						System.out.println("Password doesnot Change..Try Again…");
						msg = ("Password doesnot Change..Try Again…");
						req.setAttribute("reg", msg);
						getServletContext().getRequestDispatcher(
								"/ViewCustomer/updatepasswordfail.jsp").forward(
								req, res);
						return;
					}
			} catch (Exception e) {
				e.getMessage();
			}
		} catch (Exception e) {
			e.getMessage();
		}
	}
}