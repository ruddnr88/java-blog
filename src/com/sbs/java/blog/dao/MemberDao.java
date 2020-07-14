package com.sbs.java.blog.dao;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import com.sbs.java.blog.dto.Member;
import com.sbs.java.blog.util.DBUtil;
import com.sbs.java.blog.util.SecSql;

public class MemberDao extends Dao {

	private Connection dbConn;

	public MemberDao(Connection dbConn) {
		this.dbConn = dbConn;
	}

	public Member getMemberByLoginId(String loginId) {
		SecSql secSql = new SecSql();
		
		secSql.append("SELECT * ");
		secSql.append("FROM `member` ");
		secSql.append("WHERE 1 ");
		secSql.append("AND loginId = ? ", loginId);

		Map<String, Object> memberRow = DBUtil.selectRow(dbConn, secSql);

		if (memberRow.isEmpty()) {
			return null;
		}

		return new Member(DBUtil.selectRow(dbConn, secSql));
	}

	public int dojoin(String name, String loginId, String loginPw, String loginPwConfirm, String nickname, String email) {
		SecSql secSql = new SecSql();

		secSql.append("INSERT INTO `member`");
		secSql.append("SET regDate = NOW()");
		secSql.append(", name = ? ", name);
		secSql.append(", loginId = ? ", loginId);
		secSql.append(", loginPw = ? ", loginPw);
		secSql.append(", loginPwConfirm = ?", loginPwConfirm);
		secSql.append(", nickname = ?", nickname);
		secSql.append(", email = ?", email);

		return DBUtil.insert(dbConn, secSql);
	}

	public Member getMemberByLoginIdAndLoginPw(String loginId, String loginPw) {
		SecSql secSql = new SecSql();
		
		
		secSql.append("SELECT * ");
		secSql.append("FROM `member` ");
		secSql.append("WHERE 1 ");
		secSql.append("AND loginId = ? ", loginId);
		secSql.append("AND loginPw = ? ", loginPw);

		Map<String, Object> row = DBUtil.selectRow(dbConn, secSql);

		if (row.isEmpty()) {
			return null;
		}

		return new Member(row);

	}

}
