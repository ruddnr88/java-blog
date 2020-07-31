package com.sbs.java.blog.controller;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sbs.java.blog.dto.Member;
import com.sbs.java.blog.service.MemberService;

public class HomeController extends Controller {
	public HomeController(Connection dbConn, String actionMethodName, HttpServletRequest req,
			HttpServletResponse resp) {
		super(dbConn, actionMethodName, req, resp);
	}

	@Override
	public String doAction() {
		switch (actionMethodName) {
		case "main":
			return ActionMain();
		case "aboutMe":
			return ActionAboutMe();
		case "SNS":
			return ActionSNS();
		
		}

		return "";
	}



	private String ActionSNS() {
		return "home/SNS.jsp";
	}

	private String ActionAboutMe() {
		return "home/aboutMe.jsp";
	}

	private String ActionMain() {
	
		return "home/main.jsp";
	}

	@Override
	public String getControllerName() {
		return "home";
	}
}