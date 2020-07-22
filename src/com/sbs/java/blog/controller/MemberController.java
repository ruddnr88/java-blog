package com.sbs.java.blog.controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.GenericServlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.sbs.java.blog.service.MailService;
import com.sbs.java.blog.servlet.DispatcherServlet;

public class MemberController extends Controller {
	private String gmailId;
	private String gmailPw;

	public MemberController(Connection dbConn, String actionMethodName, HttpServletRequest req,
			HttpServletResponse resp, String gmailId, String gmailPw) {
		super(dbConn, actionMethodName, req, resp);
		this.gmailId = gmailId;
		this.gmailPw = gmailPw;

	}

	public String doAction() {
		switch (actionMethodName) {
		case "join":
			return doActionJoin();
		case "doJoin":
			return doActionDoJoin();
		case "login":
			return doActionLogin();
		case "doLogin":
			return doActionDoLogin();
		case "doLogout":
			return doActionDoLogout();
		case "info":
			return doActionDoMemberinfo();
		case "findinfo":
			return doActionFindinfo();
		case "findId":
			return doActionFindId();
		case "findPw":
			return doActionFindPw();
		}

		return "";
	}

	private String doActionFindId() {
		// TODO Auto-generated method stub
		return null;
	}

	private String doActionFindPw() {
		// TODO Auto-generated method stub
		return null;
	}

	private String doActionFindinfo() {
		return "member/findinfo.jsp";
	}

	private String doActionDoMemberinfo() {
		return "home/Memberinfo.jsp";
	}

	private String doActionDoLogout() {
		session.removeAttribute("loginedMemberId");

		return String.format("html:<script> alert('로그아웃 되었습니다.'); location.replace('../home/main'); </script>");

	}

	private String doActionDoLogin() {
		String loginId = req.getParameter("loginId");
		String loginPw = req.getParameter("loginPwReal");

		int loginedMemberId = memberService.getMemberIdByLoginIdAndLoginPw(loginId, loginPw);

		if (loginedMemberId == -1) {
			return String.format("html:<script> alert('가입하신 아이디/비번이 일치하지않습니다.'); history.back(); </script>");
		}
		// 개인저장소(session) 생성
		session.setAttribute("loginedMemberId", loginedMemberId);

		return String.format(
				"html:<script> alert('" + loginId + "님 로그인 되었습니다.'); location.replace('../home/main'); </script>");
	}

	private String doActionLogin() {
		return "member/login.jsp";
	}

	private String doActionJoin() {
		return "member/join.jsp";
	}

	private String doActionDoJoin() {

		String loginId = req.getParameter("loginId");
		String loginPw = req.getParameter("loginPwReal");
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String nickname = req.getParameter("nickname");

		boolean isJoinableLoginId = memberService.isJoinableLoginId(loginId);

		if (isJoinableLoginId == false) {
			return String.format("html:<script> alert('%s(은)는 이미 사용중인 아이디 입니다.'); history.back(); </script>", loginId);
		}
		boolean isJoinableNickname = memberService.isJoinableNickname(nickname);

		if (isJoinableNickname == false) {
			return String.format("html:<script> alert('%s(은)는 이미 사용중인 닉네임 입니다.'); history.back(); </script>", nickname);
		}

		boolean isJoinableEmail = memberService.isJoinableEmail(email);

		if (isJoinableEmail == false) {
			return String.format("html:<script> alert('%s(은)는 이미 사용중인 이메일 입니다.'); history.back(); </script>", email);
		}

		memberService.dojoin(loginId, loginPw, name, nickname, email);

		MailService mailService = new MailService(gmailId, gmailPw, gmailId, "관리자");
		boolean sendMailDone = mailService.send(email, "안녕하세요." + name + "님", "반갑습니다.!!") == 1;

		try {
			resp.getWriter().append(String.format("발송성공 : %b", sendMailDone));
		} catch (IOException e) {
			e.printStackTrace();
		}

		return "html:<script> alert('" + name + "님 가입을 축하드립니다.'); location.replace('login'); </script>";
	}

	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}

	@Override
	public String getControllerName() {
		return "member";
	}
}
