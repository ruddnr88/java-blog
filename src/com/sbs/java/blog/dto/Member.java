package com.sbs.java.blog.dto;

import java.util.Map;

public class Member extends Dto {
	private String name;
	private String loginId;
	private String loginPw;
	private String loginPwConfirm;
	private String nickname;

	public Member(Map<String, Object> row) {
		super(row);

		this.name = (String) row.get("name");
		this.loginId = (String) row.get("loginId");
		this.loginPw = (String) row.get("loginPw");
		this.loginPwConfirm = (String) row.get("loginPwConfirm");
		this.nickname = (String) row.get("nickname");
	}

	@Override
	public String toString() {
		return "Member [name=" + name + ", loginId=" + loginId + ", loginPw=" + loginPw + ", loginPwConfirm="
				+ loginPwConfirm + ", nickname=" + nickname + "]";
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLoginId() {
		return loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	public String getLoginPw() {
		return loginPw;
	}

	public void setLoginPw(String loginPw) {
		this.loginPw = loginPw;
	}

	public String getLoginPwConfirm() {
		return loginPwConfirm;
	}

	public void setLoginPwConfirm(String loginPwConfirm) {
		this.loginPwConfirm = loginPwConfirm;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

}
