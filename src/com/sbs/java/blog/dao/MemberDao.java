package com.sbs.java.blog.dao;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import com.sbs.java.blog.dto.Member;
import com.sbs.java.blog.util.DBUtil;

public class MemberDao extends Dao {

	private Connection dbConn;

	public MemberDao(Connection dbConn) {
		this.dbConn = dbConn;
	}

	public Member getMemberByLoginId(String loginId) {
		String sql = "";

		sql += String.format("SELECT * ");
		sql += String.format("FROM `member` ");
		sql += String.format("WHERE 1 ");
		sql += String.format("AND loginId = '%s' ", loginId);

		Map<String, Object> memberRow = DBUtil.selectRow(dbConn, sql);

		if (memberRow.isEmpty()) {
			return null;
		}

		return new Member(DBUtil.selectRow(dbConn, sql));
	}

	public int dojoin(String name, String loginId, String loginPw, String loginPwConfirm, String nickname) {
		String sql = "";

		sql += String.format("INSERT INTO `member` ");
		sql += String.format("SET regDate = NOW() ");
		sql += String.format(", name = '%s' ", name);
		sql += String.format(", loginId = '%s' ", loginId);
		sql += String.format(", loginPw = '%s' ", loginPw);
		sql += String.format(", loginPwConfirm = '%s' ", loginPwConfirm);
		sql += String.format(", nickname = '%s' ", nickname);

		return DBUtil.insert(dbConn, sql);
	}

	public Member getMemberByLoginIdAndLoginPw(String loginId, String loginPw) {
		String sql = "";

		sql += String.format("SELECT * ");
		sql += String.format("FROM `member` ");
		sql += String.format("WHERE 1 ");
		sql += String.format("AND loginId = '%s' ", loginId);
		sql += String.format("AND loginPw = '%s' ", loginPw);

		Map<String, Object> row = DBUtil.selectRow(dbConn, sql);

		if (row.isEmpty()) {
			return null;
		}

		return new Member(row);

	}

}
