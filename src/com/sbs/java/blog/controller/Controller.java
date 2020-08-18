package com.sbs.java.blog.controller;

import java.sql.Connection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sbs.java.blog.dto.CateItem;
import com.sbs.java.blog.dto.Member;
import com.sbs.java.blog.service.ArticleService;
import com.sbs.java.blog.service.MemberService;
import com.sbs.java.blog.util.Util;

public abstract class Controller {
	protected Connection dbConn;
	protected String actionMethodName;
	protected HttpServletRequest req;
	protected HttpServletResponse resp;
	protected HttpSession session;

	protected ArticleService articleService;
	protected MemberService memberService;

	public Controller(Connection dbConn, String actionMethodName, HttpServletRequest req, HttpServletResponse resp) {
		this.dbConn = dbConn;
		this.actionMethodName = actionMethodName;
		this.req = req;
		this.session = req.getSession();
		this.resp = resp;
		articleService = new ArticleService(dbConn);
		memberService = new MemberService(dbConn);
	}

	public abstract String getControllerName();

	public void beforeAction() {
		// 액션 전 실행
		// 이 메서드는 모든 컨트롤러의 모든 액션이 실행되기 전에 실행된다.
		List<CateItem> cateItems = articleService.getForPrintCateItems();

		req.setAttribute("cateItems", cateItems);

		// 사용자 관련 정보를 리퀘스트 객체에 정리해서 넣기
		int logindMemberId = -1;
		boolean isLogind = false;
		Member logindMember = null;

		if (session.getAttribute("logindMemberId") != null) {
			logindMemberId = (int) session.getAttribute("logindMemberId");
			isLogind = true;
			logindMember = memberService.getMemberId(logindMemberId);
		}

		req.setAttribute("logindMember", logindMember);
		req.setAttribute("isLogind", isLogind);
		req.setAttribute("logindMemberId", logindMemberId);

		// 현재 URL

		String currentUri = req.getRequestURI();

		if (req.getQueryString() != null) {
			currentUri += "?" + req.getQueryString();
		}

		String encodedCurrentUri = Util.getUriEncoded(currentUri);

		// 현재 접속된 페이지와 관련된 유용한 정보 담기
		req.setAttribute("currentUri", currentUri);
		req.setAttribute("encodedCurrentUri", encodedCurrentUri);
		req.setAttribute("encodedAfterLoginRedirectUri", encodedCurrentUri);

		// 로그인 페이지에서 로그인 페이지로 이동하는 버튼을 또 누른 경우
		// 기존 afterLoginRedirectUri 정보를 유지시키기 위한 로직
		if (currentUri.contains("/s/member/login")) {
			String encodedOldAfterLoginRedirectUri = Util.getString(req, "afterLoginRedirectUri", "");
			encodedOldAfterLoginRedirectUri = Util.getUriEncoded(encodedOldAfterLoginRedirectUri);
			req.setAttribute("encodedAfterLoginRedirectUri", encodedOldAfterLoginRedirectUri);
		}
		
		req.setAttribute("encodedAfterLogoutRedirectUri",currentUri);

	}

	public void afterAction() {
		// 액션 후 실행
	}

	public abstract String doAction();

	public String executeAction() {
		beforeAction();

		String doGuardRs = doGuard();

		if (doGuardRs != null) {
			return doGuardRs;
		}

		String rs = doAction();
		afterAction();

		return rs;
	}

	private String doGuard() {
		// 로그인에 관련된 가드 시작
		boolean isLogind = (boolean) req.getAttribute("isLogind");

		boolean needToLogin = false;

		String controllerName = getControllerName();

		switch (controllerName) {
		case "member":
			switch (actionMethodName) {
			case "doLogout":
				needToLogin = true;
				break;
			}
			break;
		case "article":
			switch (actionMethodName) {
			case "write":
			case "doWrite":
			case "doModify":
			case "modify":
			case "dodelete":
			case "delete":
				needToLogin = true;
				break;
			}
			break;
		}
		
		String encodedAfterLoginRedirectUri = (String)req.getAttribute("encodedAfterLoginRedirectUri");
		
		if (needToLogin && isLogind == false) {
			return "html:<script> alert('로그인 후 이용해주세요.'); location.href = '../member/login?afterLoginRedirectUri=" + encodedAfterLoginRedirectUri + "'; </script>";
		}
		// 로그인에 관련된 가드 끝

		// 로그아웃에 관련된 가드 시작
		boolean needToLogout = false;

		switch (controllerName) {
		case "member":
			switch (actionMethodName) {
			case "login":
			case "join":
				needToLogout = true;
				break;
			}
			break;
		}

		if (needToLogout && isLogind) {
			return "html:<script> alert('로그아웃 후 이용해주세요.'); history.back(); </script>";
		}
		// 로그아웃에 관련된 가드 끝

		return null;

		// 로그아웃에 관련된 가드 끝

	}
}