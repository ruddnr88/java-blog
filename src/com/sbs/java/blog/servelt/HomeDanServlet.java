package com.sbs.java.blog.servelt;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/home/dan")
public class HomeDanServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {		
		RequestDispatcher rd =  request.getRequestDispatcher("/jsp/home/dan.jsp");
		int dan =Integer.parseInt(request.getParameter("dan"));
		
		request.setAttribute("name", dan + "단");
		request.setAttribute("dan", dan);
		
		
		rd.forward(request, response);
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
