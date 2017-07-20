package com.eWarisanSeni.app.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eWarisanSeni.app.bean.CustomerBean;
import com.eWarisanSeni.app.bean.AddressBean;
import com.eWarisanSeni.app.dao.AddressDAO;
import com.eWarisanSeni.app.dao.CustomerDAO;
 
public class UpdateCustomerAccountServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        CustomerBean cust = new CustomerBean();
        AddressBean add = new AddressBean();
 
        int cust_id = Integer.parseInt(request.getParameter("cust_id"));
        String cust_username = request.getParameter("cust_username");
        String cust_password = request.getParameter("cust_password");
        String cust_email = request.getParameter("cust_email");
        String cust_firstname = request.getParameter("cust_firstname");
        String cust_lastname = request.getParameter("cust_lastname");
        String cust_icnum = request.getParameter("cust_icnum");
        String cust_phonenumber = request.getParameter("cust_phonenumber");
        
        String add_address = request.getParameter("add_address");
        String add_postcode = request.getParameter("add_postcode");
        String add_city = request.getParameter("add_city");
        String add_state = request.getParameter("add_state");
        String add_country = request.getParameter("add_country");
        
        cust.setCust_id(cust_id);
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
			cust = CustomerDAO.updateCustomerAccount(cust);
			add = AddressDAO.updateAddress(cust, add);
			if (add.isValid()) {
				System.out.println("Update success!!!");
				response.sendRedirect("ViewStaff/managecustomer.jsp");
			}
		} catch (Exception e2) {
			System.out.println(e2);
		}
        out.close();
	}
}