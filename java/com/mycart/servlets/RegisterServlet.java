package com.mycart.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.mycart.entities.Users;
import com.mycart.helper.FactoryProvider;

/**
 * Servlet implementation class RegisterServlet
 */
//@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		PrintWriter out = response.getWriter();
		try {
			
			String userName = request.getParameter("user_name");
			String userEmail = request.getParameter("user_email");
			String userPassword = request.getParameter("user_password");
			int userPhone = Integer.parseInt(request.getParameter("user_phone").trim());
			String userAddress = request.getParameter("user_address");
			
			Users user = new Users(userName,userEmail,userPassword,userPhone,"default.jpg",userAddress,"normal");
			
			
			Session s = FactoryProvider.getFactory().openSession();
			Transaction tx = s.beginTransaction();
			
		    int userID = (Integer) s.save(user);
			
			tx.commit();
			s.close();
			
			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("message", "Registration Successful !!");
			
			response.sendRedirect("register.jsp");
			return;
			
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

}
}
