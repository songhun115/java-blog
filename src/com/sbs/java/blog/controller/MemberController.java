package com.sbs.java.blog.controller;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sbs.java.blog.util.Util;

public class MemberController extends Controller {

	public MemberController(Connection dbConn, String actionMethodName, HttpServletRequest req,
			HttpServletResponse resp) {
		super(dbConn, actionMethodName, req, resp);

	}

	@Override
	public String doAction() {
		switch (actionMethodName) {
		case "join":
			return doActionJoin();
		case "doJoin":
			return doActionDoJoin();
		case "login":
			return doActionLogin();
		case "doLogin":
			return doActionDoLogin();
		case "doLogout":
			return doActionDoLogout();
		}

		return "";
	}

	private String doActionDoLogin() {
		String loginId = req.getParameter("loginId");
		String loginPw = req.getParameter("loginPwReal");

		int logindMemberId = memberService.getMemberByLoginIdAndLoginPw(loginId, loginPw);
		if (logindMemberId == -1) {
			return String.format("html:<script> alert('존재하지 않는 회원입니다.');history.back(); </script>", loginId);
		}
		HttpSession session = req.getSession();
		session.setAttribute("logindMemberId", logindMemberId);
		
		String redirectUrl = Util.getString(req, "redirectUrl", "../home/main");
		
		
		return String.format("html:<script> alert('로그인 되었습니다.'); location.replace('" + redirectUrl + "'); </script>");
	}

	private String doActionDoLogout() {
		session.removeAttribute("logindMemberId");

		return String.format("html:<script> alert('로그아웃 되었습니다'); location.replace('../home/main'); </script>");
	}

	private String doActionLogin() {
		return "member/login.jsp";
	}

	private String doActionDoJoin() {
		String loginId = req.getParameter("loginId");
		String loginPw = req.getParameter("loginPwReal");
		String name = req.getParameter("name");
		String nickname = req.getParameter("nickname");
		String email = req.getParameter("email");

		boolean isJoinableLoginId = memberService.isJoinableLoginId(loginId);
		boolean isJoinableNickname = memberService.isJoinableNickname(nickname);
		boolean isJoinableEmail = memberService.isJoinableEmail(email);

		if (isJoinableLoginId == false) {
			return String.format("html:<script> alert('%s(은)는 이미 사용중인 아이디 입니다.');history.back(); </script>", loginId);
		}

		if (isJoinableNickname == false) {
			return String.format("html:<script> alert('%s(은)는 이미 사용중인 닉네임 입니다.');history.back(); </script>", nickname);
		}

		if (isJoinableEmail == false) {
			return String.format("html:<script> alert ('%s(은)는 이미 사용중인 이메일 입니다.');history.back(); </script>", email);
		}

		memberService.join(loginId, loginPw, name, nickname, email);

		return String.format("html:<script> alert('%s님 환영합니다.'); location.replace('../home/main'); </script>", name);
	}

	private String doActionJoin() {
		return "member/join.jsp";
	}

	@Override
	public String getControllerName() {
		return "member";
	}

}
