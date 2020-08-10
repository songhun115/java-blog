package com.sbs.java.blog.dao;

import java.sql.Connection;

import com.sbs.java.blog.util.DBUtil;
import com.sbs.java.blog.util.SecSql;

public class MemberDao extends Dao {
	private Connection dbConn;
	
	public MemberDao(Connection dbConn) {
		this.dbConn = dbConn;
	}

	public boolean isJoinableLoginId(String loginId) {
		SecSql sql = SecSql.from("SELECT COUNT(*) AS cnt");
		sql.append("FROM `member`");
		sql.append("WHERE loginId = ?", loginId);

		return DBUtil.selectRowIntValue(dbConn, sql) == 0;
	}

	public int join(String loginId, String loginPw, String name, String nickname, String email) {
		SecSql sql = new SecSql();

		sql.append("INSERT INTO `member`");
		sql.append("SET regDate = NOW()");
		sql.append(", updateDate = NOW()");
		sql.append(", loginId = ? ", loginId);
		sql.append(", loginPw = ? ", loginPw);
		sql.append(", name = ?", name);
		sql.append(", nickname = ?", nickname);
		sql.append(", email = ?", email);

		return DBUtil.insert(dbConn, sql);
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

	public int getMemberByLoginIdAndLoginPw(String loginId, String loginPw) {
		SecSql sql = SecSql.from("SELECT id");
		sql.append("FROM `member`");
		sql.append("WHERE loginId = ?", loginId);
		sql.append("AND  loginPw = ?", loginPw);

		return DBUtil.selectRowIntValue(dbConn, sql);
	}
}
