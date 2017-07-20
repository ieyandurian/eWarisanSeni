package com.eWarisanSeni.app.servlet;

import com.eWarisanSeni.app.bean.ProductBean;
import com.eWarisanSeni.app.bean.StaffBean;
import com.eWarisanSeni.app.dao.ProductDAO;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.annotation.MultipartConfig;

@MultipartConfig(maxFileSize = 16177215)
public class AddProductServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession(true);
		StaffBean staff = ((StaffBean) (session
				.getAttribute("currentSessionStaff")));
		ProductBean prod = new ProductBean();
		try {
			// Apache Commons-Fileupload library classes
			DiskFileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload sfu = new ServletFileUpload(factory);

			if (!ServletFileUpload.isMultipartContent(request)) {
				System.out.println("sorry. No file uploaded");
				return;
			}
			// parse request
			List<FileItem> items = sfu.parseRequest(request);
			FileItem name = (FileItem) items.get(0);
			prod.setProd_Name(name.getString());

			FileItem desc = (FileItem) items.get(1);
			prod.setProd_Desc(desc.getString());

			FileItem price = (FileItem) items.get(2);
			prod.setProd_Price(Double.parseDouble(price.getString()));

			FileItem size = (FileItem) items.get(3);
			prod.setProd_Size(size.getString());

			FileItem type = (FileItem) items.get(4);
			prod.setProd_Type(type.getString());

			// get uploaded file
			FileItem file = (FileItem) items.get(5);

			prod = ProductDAO.addProduct(prod, file, staff);
			response.sendRedirect("ViewStaff/manageproduct.jsp");
		} catch (Exception ex) {
			out.println("Error --> " + ex.getMessage());
		}
	}
}