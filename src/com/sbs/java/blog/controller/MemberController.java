package com.sbs.java.blog.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sbs.java.blog.dto.Member;
import com.sbs.java.blog.service.MemberService;
import com.sbs.java.blog.util.Util;

public class MemberController extends Controller {

	public MemberController(Connection dbConn, String actionMethodName, HttpServletRequest req,
			HttpServletResponse resp) {
		super(dbConn, actionMethodName, req, resp);
	}

	public String doAction() {
		switch (actionMethodName) {
		case "join":
			return doMemberJoin(req, resp);
		case "doJoin":
			return doMemberDoJoin(req, resp);
		case "login":
			return doMemberLogin(req, resp);
		case "doLogin":
			return doMemberDoLogin(req, resp);
		}
		return "";
	}

	private String doMemberDoLogin(HttpServletRequest req, HttpServletResponse resp) {
		String loginId = req.getParameter("loginId");
		String loginPw = req.getParameter("loginPw");

		PrintWriter out = null;

		try {
			out = resp.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}

		Member member = memberService.getMemberByLoginIdAndLoginPw(loginId, loginPw);

		if (member == null) {
			out.print("<script> alert('가입하신 회원이 존재하지 않습니다.'); location.replace('login'); </script>");
		} else {
			return "html:<script> alert('" + loginId + "님 로그인되셨습니다.'); location.replace('.././home/main'); </script>";
		}
		return loginId;
	}

	private String doMemberLogin(HttpServletRequest req, HttpServletResponse resp) {
		return "member/login.jsp";
	}

	private String doMemberJoin(HttpServletRequest req, HttpServletResponse resp) {
		return "member/join.jsp";
	}

	private String doMemberDoJoin(HttpServletRequest req, HttpServletResponse resp) {
		String name = req.getParameter("name");
		String loginId = req.getParameter("loginId");
		String loginPw = req.getParameter("loginPw");
		String loginPwConfirm = req.getParameter("loginPwConfirm");
		String nickname = req.getParameter("nickname");
		String email = req.getParameter("email");

		PrintWriter out = null;

		try {
			out = resp.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}

		if (memberService.isUsedLoginId(loginId)) {
			out.print("<script> alert('입력하신 아이디는 사용 중입니다.'); history.back(); </script>");
		}
		
		if (memberService.isUsedLoginId(nickname)) {
			out.print("<script> alert('입력하신 닉네임은 사용 중입니다.'); history.back(); </script>");
		}

		memberService.dojoin(name, loginId, loginPw, loginPwConfirm, nickname,email);

		return "html:<script> alert('" + name + "님 가입을 축하드립니다.'); location.replace('login'); </script>";
	}
}
