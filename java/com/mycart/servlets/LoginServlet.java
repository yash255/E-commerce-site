package com.mycart.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mycart.dao.UserDao;
import com.mycart.entities.Users;
import com.mycart.helper.FactoryProvider;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		
		String login_email = request.getParameter("login_email");
		String login_password = request.getParameter("login_password");
		
		
		//authenticate user
		
UserDao userDao = new UserDao(FactoryProvider.getFactory());
Users users = userDao.getUserByEmailPassword(login_email, login_password);


HttpSession   httpSession =      request.getSession();

if (users == null) {
		httpSession.setAttribute("message", "Invalid Details !! Please try again");
	response.sendRedirect("login.jsp");
	return;
	
} else {
	out.println("hello");
	
	
	httpSession.setAttribute("current-user", users);
	
	if(users.getUserType().equals("admin")) {
		
		response.sendRedirect("admin.jsp");
	}
	else if (users.getUserType().equals("normal")) {
		response.sendRedirect("normal.jsp");
		
	}
	else {
		out.println("We don't identified you");
	}


}

}
}
	
