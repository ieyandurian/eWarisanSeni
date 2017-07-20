package com.eWarisanSeni.app.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eWarisanSeni.app.bean.AddressBean;
import com.eWarisanSeni.app.bean.CustomerBean;
import com.eWarisanSeni.app.bean.PersonBean;
import com.eWarisanSeni.app.dao.AddressDAO;
import com.eWarisanSeni.app.dao.CustomerDAO;
import com.eWarisanSeni.app.dao.PersonDAO;

public class RegisterServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		CustomerBean cust = new CustomerBean();
		AddressBean add = new AddressBean();
		PersonBean per = new PersonBean();

		String cust_firstname = request.getParameter("cust_firstname");
		String cust_lastname = request.getParameter("cust_lastname");
		String cust_icnum = request.getParameter("cust_icnum");
		String cust_phonenumber = request.getParameter("cust_phonenumber");
		String cust_email = request.getParameter("cust_email");
		String cust_username = request.getParameter("cust_username");
		String cust_password = request.getParameter("cust_password");

		String add_address = request.getParameter("add_address");
		String add_city = request.getParameter("add_city");
		String add_postcode = request.getParameter("add_postcode");
		String add_country = request.getParameter("add_country");
		String add_state = request.getParameter("add_state");

		cust.setCust_firstname(cust_firstname);
		cust.setCust_lastname(cust_lastname);
		cust.setCust_icnum(cust_icnum);
		cust.setCust_phonenumber(cust_phonenumber);
		cust.setCust_email(cust_email);
		cust.setCust_username(cust_username);
		cust.setCust_password(cust_password);

		add.setAdd_address(add_address);
		add.setAdd_city(add_city);
		add.setAdd_postcode(add_postcode);
		add.setAdd_country(add_country);
		add.setAdd_state(add_state);

		try {
			cust = CustomerDAO.createNewCustomer(cust);
			if (cust.isValid()) {
				per = PersonDAO.createPerson(per);
				add = AddressDAO.addAddress(cust, add);
				if (add.isValid()) {
					response.sendRedirect("registersuccess.jsp");
				} else
					response.sendRedirect("register.jsp");
			} else
				System.out.println("Username already existed. Please choose another username.");
				response.sendRedirect("registerfail.jsp");
		} catch (Exception e2) {
			System.out.println(e2);
		}

		out.close();
	}

}