package com.sbs.java.blog.controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.GenericServlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sbs.java.blog.dto.Member;
import com.sbs.java.blog.service.MailService;
import com.sbs.java.blog.servlet.DispatcherServlet;
import com.sbs.java.blog.util.Util;

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
			return ActionJoin();
		case "doJoin":
			return ActionDoJoin();
		case "login":
			return ActionLogin();
		case "doLogin":
			return ActionDoLogin();
		case "doLogout":
			return ActionDoLogout();
		case "info":
			return ActionDoMemberinfo();
		case "findinfo":
			return ActionFindinfo();
		case "doFindId":
			return ActionFindId();
		case "doFindPw":
			return ActionFindPw();
		case "dodelete":
			return ActionMemberDelete();
		case "Mailing":
			return ActionMemberMailing();
		case "doMailing":
			return ActionMemberdoMailing();
		case "getLoginIdDup":
			return ActionGetLoginIdDup();
		case "passwordForPrivate":
			return actionPasswordForPrivate();
		case "dopasswordForPrivate":
			return actionDoPasswordForPrivate();
		
		}

		return "";
	}

	private String actionDoPasswordForPrivate() {
		String loginPw = req.getParameter("loginPwReal");
		Member loginedMember = (Member)req.getAttribute("loginedMember");
		
		if(loginedMember.getLoginPw().equals(loginPw)) {
			return String.format("html:<script> location.replace('findinfo');</script>");
		}
		
		return String.format("html:<script> alert('비밀번호를 다시 입력해주세요.');history.back() </script>");
	}

	private String actionPasswordForPrivate() {
		return "member/passwordForPrivate.jsp";
	}

	private String ActionGetLoginIdDup() {
		String loginId = req.getParameter("loginId");

		boolean isJoinableLoginId = memberService.isJoinableLoginId(loginId);

		if (isJoinableLoginId) {
			return "json:{\"msg\":\"사용할 수 있는 아이디 입니다.\" ,\"resultCode\": \"S-1\",\"loginId\":\"" + loginId + "\"}";
		} else {
			return "json:{\"msg\":\"이미 사용중인 아이디 입니다.\",\"resultCode\": \"F-1\",\"loginId\":\"" + loginId + "\"}";
		}

	}

	private String ActionMemberdoMailing() {
		String email = req.getParameter("email");
		String title = req.getParameter("title");
		String body = req.getParameter("body");

		MailService mailService = new MailService(gmailId, gmailPw, gmailId, "관리자");
		boolean a = mailService.send(email, title, body) == 1;
		System.out.printf(email, title, body);

		return "html:<script> alert('메일이 발송되었습니다.'); close();opener.location.reload(); </script>";
	}

	private String ActionMemberMailing() {
		return "member/domailing.jsp";
	}

	private String ActionMemberDelete() {
		int id = Util.getInt(req, "id");
		session.removeAttribute("loginedMemberId");
		memberService.memberdelete(id);

		return "html:<script> alert('회원탈퇴되었습니다.'); location.replace('../home/main'); </script>";

	}

	private String ActionFindId() {
		String name = req.getParameter("name");
		String email = req.getParameter("email");

		String loginIdfind = memberService.getMemberSearchId(name, email);

		if (loginIdfind != "") {
			MailService mailService = new MailService(gmailId, gmailPw, gmailId, "관리자");
			boolean a = mailService.send(email, "안녕하세요. " + name + " 님", "가입하신 아이디는[ " + loginIdfind + " ]입니다.") == 1;

		} else {
			return String.format("html:<script> alert('가입하신 정보가 일치하지않습니다.'); history.back(); </script>");

		}
		return "html:<script> alert('메일이 발송되었습니다.');location.replace('../home/main'); </script>";
	}

	private String ActionFindPw() {
		String loginId = req.getParameter("loginId");
		String email = req.getParameter("email");

		String loginPwfind = memberService.getMemberSearchPw(loginId, email);

		if (loginId != "") {
			MailService mailService = new MailService(gmailId, gmailPw, gmailId, "관리자");
			boolean a = mailService.send(email, "안녕하세요.", "비밀번호는 [ " + loginPwfind + " ]입니다.") == 1;

		} else {
			return String.format("html:<script> alert('가입하신 정보가 일치하지않습니다.'); history.back(); </script>");

		}
		return "html:<script> alert('임시비밀번호가 메일로 발송되었습니다.'); location.replace('../home/main'); </script>";
	}

	private String ActionFindinfo() {
		return "member/findinfo.jsp";
	}

	private String ActionDoMemberinfo() {
		return "home/Memberinfo.jsp";
	}

	private String ActionDoLogout() {
		session.removeAttribute("loginedMemberId");

		String redirectUrl = Util.getString(req, "redirectUrl", "../home/main");
		return String.format("html:<script> alert('로그아웃 되었습니다.'); location.replace('" + redirectUrl + "'); </script>");

	}

	private String ActionDoLogin() {
		String loginId = req.getParameter("loginId");
		String loginPw = req.getParameter("loginPwReal");

		int loginedMemberId = memberService.getMemberIdByLoginIdAndLoginPw(loginId, loginPw);

		if (loginedMemberId == -1) {
			return String.format("html:<script> alert('가입하신 아이디/비번이 일치하지않습니다.'); history.back(); </script>");
		}
		// 개인저장소(session) 생성
		session.setAttribute("loginedMemberId", loginedMemberId);
		String redirectUrl = Util.getString(req, "redirectUrl", "../home/main");

		return String.format("html:<script> alert('" + loginId + "님 로그인 되었습니다.'); location.replace('" + redirectUrl
				+ "'); </script>");
	}

	private String ActionLogin() {
		return "member/login.jsp";
	}

	private String ActionJoin() {
		return "member/join.jsp";
	}

	private String ActionDoJoin() {

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
