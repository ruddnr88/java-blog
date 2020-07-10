package com.sbs.java.blog.service;

import java.sql.Connection;

import com.sbs.java.blog.dao.MemberDao;
import com.sbs.java.blog.dto.Member;

public class MemberService extends Service {

	private MemberDao memberDao;

	public MemberService(Connection dbConn) {
		memberDao = new MemberDao(dbConn);
	}

	public boolean isUsedLoginId(String loginId) {
		Member member = memberDao.getMemberByLoginId(loginId);

		if (member == null) {
			return false;
		}
		return true;
	}
	



	public int dojoin(String name, String loginId, String loginPw, String loginPwConfirm, String nickname) {
		return memberDao.dojoin(name,loginId,loginPw,loginPwConfirm,nickname);
	}

	public Member getMemberByLoginIdAndLoginPw(String loginId, String loginPw) {
		
		return memberDao.getMemberByLoginIdAndLoginPw(loginId,loginPw);
	}

}
