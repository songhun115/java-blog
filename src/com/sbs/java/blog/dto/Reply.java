package com.sbs.java.blog.dto;

import java.util.Map;

public class Reply extends Dto {
	private int memberId;
	private int articleId;
	private String updateDate;
	private String body;

	public Reply(Map<String, Object> row) {
		super(row);
		this.updateDate = (String) row.get("updateDate");
		this.body = (String) row.get("body");
		this.memberId = (int) row.get("memberId");
		this.articleId = (int) row.get("articleId");
	}

	@Override
	public String toString() {
		return "Reply [memberId=" + memberId + ", articleId=" + articleId + ", updateDate=" + updateDate + ", body="
				+ body + ", getExtra()=" + getExtra() + ", toString()=" + super.toString() + ", getClass()="
				+ getClass() + "]";
	}

	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	public int getArticleId() {
		return articleId;
	}

	public void setArticleId(int articleId) {
		this.articleId = articleId;
	}

	public String getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

}