package com.mycart.servlets;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.mycart.dao.CategoryDao;
import com.mycart.dao.ProductDao;
import com.mycart.entities.Category;
import com.mycart.entities.Product;
import com.mycart.helper.FactoryProvider;

/**
 * Servlet implementation class ProductOperationServlet
 */
@WebServlet("/ProductOperationServlet")
@MultipartConfig
public class ProductOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();

		String op = request.getParameter("operation");
		if (op.trim().equals("addcategory")) {

//			fetch category data

			String CatTitle = request.getParameter("cat_title");
			String Catdescription = request.getParameter("cat_description");

//			  category database save

			Category category = new Category();
			category.setCategoryTitle(CatTitle);
			category.setCategoryDescription(Catdescription);

			CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
			int catID = categoryDao.saveCategory(category);

			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("message", "Category added Successfully");
			response.sendRedirect("admin.jsp");
			return;

		} else if (op.trim().equals("addproduct")) {

			String pName = request.getParameter("pod_name");
			String pDescription = request.getParameter("pod_description");
			double pPrice = Double.parseDouble(request.getParameter("pod_price"));
			double pDiscount = Double.parseDouble(request.getParameter("pod_discount"));
			int pQuantity = Integer.parseInt(request.getParameter("pod_quantity"));
			int catID = Integer.parseInt(request.getParameter("catID"));
			
			Part part = request.getPart("pod_pic");
			
			Product p = new Product();
			p.setpName(pName);
			p.setpDesc(pDescription);
			p.setpPrice(pPrice);
			p.setpDiscount(pDiscount);
			p.setpQuantity(pQuantity);
			p.setpPhoto(part.getSubmittedFileName());
			
			
			//get category by id
			CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
		Category category = 	categoryDao.getCategoryById(catID);
		
		p.setCategory(category);
		
		//product save
		ProductDao pDao = new ProductDao(FactoryProvider.getFactory());
		pDao.saveProduct(p);
		
		try {
			
			//pic upload
			
			//path to upload pic
			String path = request.getRealPath("img")+File.separator+"products_img"+File.separator+part.getSubmittedFileName();
		//	System.out.println(path);
			
			//upload code
			FileOutputStream fos = new FileOutputStream(path);
			InputStream is = part.getInputStream();
			
			//reading data
			byte[]data = new byte[is.available()];
			is.read(data);
			
			//writing data
			fos.write(data);
			fos.close();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
		
		
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("message", "Product added Successfully");
		response.sendRedirect("admin.jsp");
		return;
		}

	}

}
