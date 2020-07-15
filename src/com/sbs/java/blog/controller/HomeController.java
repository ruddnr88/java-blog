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
			return doActionMain();
		case "aboutMe":
			return doActionAboutMe();
		case "SNS":
			return doActionSNS();
		}

		return "";
	}

	private String doActionSNS() {
		return "home/SNS.jsp";
	}

	private String doActionAboutMe() {
		return "home/aboutMe.jsp";
	}

	private String doActionMain() {
	
		return "home/main.jsp";
	}

	@Override
	public String getControllerName() {
		return "home";
	}
}