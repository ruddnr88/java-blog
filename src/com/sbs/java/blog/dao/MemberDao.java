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

	public int dojoin(String loginId, String loginPw, String name, String nickname, String email) {
		SecSql secSql = new SecSql();

		secSql.append("INSERT INTO `member`");
		secSql.append("SET regDate = NOW()");
		secSql.append(", updateDate = NOW()");
		secSql.append(", `name` = ?", name);
		secSql.append(", `loginId` = ?", loginId);
		secSql.append(", `loginPw` = ?", loginPw);
		secSql.append(", `nickname` = ?", nickname);
		secSql.append(", `email` = ?", email);

		return DBUtil.insert(dbConn, secSql);
	}

	public boolean isJoinableLoginId(String loginId) {
		SecSql sql = SecSql.from("SELECT COUNT(*) AS cnt");
		sql.append("FROM `member`");
		sql.append("WHERE loginId = ?", loginId);

		return DBUtil.selectRowIntValue(dbConn, sql) == 0;
		//0이어야 한다 값이 없어야해서 
	}

	public int getMemberIdByLoginIdAndLoginPw(String loginId, String loginPw) {
		SecSql sql = SecSql.from("SELECT id");
		sql.append("FROM `member`");
		sql.append("WHERE loginId = ?", loginId);
		sql.append("AND loginPw = ?", loginPw);

		return DBUtil.selectRowIntValue(dbConn, sql);
	}
	
	public Member getMemberById(int id) {
		SecSql sql = SecSql.from("SELECT *");
		sql.append("FROM `member`");
		sql.append("WHERE id = ?", id);

		Map<String, Object> row = DBUtil.selectRow(dbConn, sql);

		if (row.isEmpty()) {
			return null;
		}

		return new Member(row);
	}

	public boolean isJoinableNickname(String nickname) {
		SecSql sql = SecSql.from("SELECT COUNT(*) AS cnt");
		sql.append("FROM `member`");
		sql.append("WHERE nickname = ?", nickname);

		return DBUtil.selectRowIntValue(dbConn, sql) == 0;
	}

	public boolean isJoinableEmail(String email) {
		SecSql sql = SecSql.from("SELECT COUNT(*) AS cnt");
		sql.append("FROM `member`");
		sql.append("WHERE email = ?", email);

		return DBUtil.selectRowIntValue(dbConn, sql) == 0;
	}

	public Member getMemberByNameAndEmail(String name, String email) {
		SecSql sql = SecSql.from("SELECT *");
		sql.append("FROM `member`");
		sql.append("WHERE `name` = ?", name);
		sql.append("AND email = ?", email);

		Map<String,Object> row = DBUtil.selectRow(dbConn, sql);
		
		if(row.isEmpty()) {
			return null;
		}
		
		return new Member(row);
		
	}

	public Member getMemberByloginId(String loginId) {
		SecSql sql = SecSql.from("SELECT *");
		sql.append("FROM `member`");
		sql.append("WHERE `loginId` = ?", loginId);
		
		Map<String,Object> row = DBUtil.selectRow(dbConn, sql);
		
		if(row.isEmpty()) {
			return null;
		}
		
		return new Member(row);
		
	}

	public int memberdelete(int id) {

		SecSql sql = SecSql.from("UPDATE `member`");
		sql.append("SET delDate = NOW()");
		sql.append(", delStatus = 0");
		sql.append("WHERE id = ?", id);

		return DBUtil.update(dbConn, sql);
	}

	public void modify(int actorId, String loginPw) {
		
		SecSql sql = SecSql.from("UPDATE `member`");
		sql.append("SET updateDate = NOW()");
		sql.append(", loginPw = ?", loginPw);
		sql.append("WHERE id = ?", actorId);

		DBUtil.update(dbConn, sql);
	}


}
