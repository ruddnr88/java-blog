package com.sbs.java.blog.service;

import java.sql.Connection;
import java.util.UUID;

import com.sbs.java.blog.dao.MemberDao;
import com.sbs.java.blog.dto.Member;

public class MemberService extends Service {
	private MailService mailService;
	private MemberDao memberDao;
	private AttrService attrService;

	public MemberService(Connection dbConn, MailService mailService, AttrService attrService) {
		memberDao = new MemberDao(dbConn);
		this.mailService = mailService;
		this.attrService = attrService;
	}

	public int dojoin(String name, String loginId, String loginPw, String nickname, String email) {
		int id = memberDao.dojoin(name, loginId, loginPw, nickname, email);

		mailService.send(email, "가입을 환영합니다!",
				"아래 링크를 클릭하시면 홈페이지로 이동됩니다.<br><a href=\"https://kyky1211.my.iu.gy/\" target=\"_blank\">사이트로 이동</a>");
		return id;
	}

	public boolean isJoinableLoginId(String loginId) {
		return memberDao.isJoinableLoginId(loginId);
	}

	public boolean isJoinableNickname(String nickname) {
		return memberDao.isJoinableNickname(nickname);
	}

	public boolean isJoinableEmail(String email) {
		return memberDao.isJoinableEmail(email);
	}

	public int getMemberIdByLoginIdAndLoginPw(String loginId, String loginPw) {
		return memberDao.getMemberIdByLoginIdAndLoginPw(loginId, loginPw);
	}

	public Member getMemberById(int id) {
		return memberDao.getMemberById(id);
	}

	public int getMemberBynameAndEmail(String name, String email) {
		return memberDao.getMemberBynameAndEmail(name, email);
	}

	public String getMemberSearchId(String name, String email) {
		return memberDao.getMemberSearchId(name, email);
	}

	public String getMemberSearchPw(String loginId, String email) {
		return memberDao.getMemberSearchPw(loginId, email);
	}

	public int memberdelete(int id) {
		return memberDao.memberdelete(id);

	}

	public String genModiyfyPrivateAuthCode(int actorId) {
		String authCode = UUID.randomUUID().toString();
		attrService.setValue("member__" + actorId + "__extra__modifyPrivateAuthCode", authCode);

		return authCode;
	}

	public boolean isValidModifyPrivateAuthCode(int actorId, String authCode) {
		String authCodeOnDB = attrService.getValue("member__" + actorId + "__extra__modifyPrivateAuthCode");

		return authCodeOnDB.equals(authCode);
	}

	public void modify(int actorId, String loginPw) {
		memberDao.modify(actorId, loginPw);

	}

}
