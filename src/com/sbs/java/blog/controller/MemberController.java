package com.sbs.java.blog.controller;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sbs.java.blog.service.MemberService;

public class MemberController extends Controller {

	public MemberController(Connection dbConn, String actionMethodName, HttpServletRequest req,
			HttpServletResponse resp) {
		super(dbConn, actionMethodName, req,resp);

	}

	public String doAction() {
		switch (actionMethodName) {
		case "join":
			return doMemberJoin();
		case "doJoin":
			return doMemberDoJoin();
		case "login":
			return doMemberLogin();
		case "doLogin":
			return doMemberDoLogin();
		case "doLogout":
			return doMemberLogout();
		}
		return "";
	}

	private String doMemberLogout() {
		return null;
	}

	private String doMemberDoLogin() {
		String loginId = req.getParameter("loginId");
		String loginPw = req.getParameter("loginPwReal");

		int loginedMemberId = memberService.getMemberIdByLoginIdAndLoginPw(loginId, loginPw);

		if (loginedMemberId == -1) {
			return String.format("html:<script> alert('가입하신 아이디/비번이 일치하지않습니다.'); history.back(); </script>");
		}
		//개인저장소(session) 생성
		HttpSession session = req.getSession();
		session.setAttribute("loginedMemberId", loginedMemberId);

		return String.format(
				"html:<script> alert('" + loginId + "님 로그인 되었습니다.'); location.replace('../home/main'); </script>");

	}

	private String doMemberLogin() {
		return "member/login.jsp";
	}

	private String doMemberJoin() {
		return "member/join.jsp";
	}

	private String doMemberDoJoin() {

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

		memberService.dojoin(loginId, loginPw, name, email, nickname);

		return "html:<script> alert('" + name + "님 가입을 축하드립니다.'); location.replace('login'); </script>";
	}
}
