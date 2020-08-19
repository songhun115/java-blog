package com.sbs.java.blog.service;

import java.sql.Connection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sbs.java.blog.config.Config;
import com.sbs.java.blog.dto.CateItem;
import com.sbs.java.blog.dto.Member;
import com.sbs.java.blog.service.ArticleService;
import com.sbs.java.blog.service.MailService;
import com.sbs.java.blog.service.MemberService;
import com.sbs.java.blog.util.Util;

import com.sbs.java.blog.util.Util;

public class MailService {
	private String gmailId;
	private String gmailPw;
	private String from;
	private String fromName;

	public MailService(String gmailId, String gmailPw, String from, String fromName) {
		this.gmailId = gmailId;
		this.gmailPw = gmailPw;
		this.from = from;
		this.fromName = fromName;
	}

	public int send(String to, String title, String body) {
		return Util.sendMail(gmailId, gmailPw, from, fromName, to, title, body);
	}
}