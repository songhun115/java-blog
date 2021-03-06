package com.sbs.java.blog.dto;

import java.util.Map;

public class Article extends Dto {
	private String updateDate;
	private int cateItemId;
	private int memberId;
	private String title;
	private String body;
	private int hit;

	public Article(Map<String, Object> row) {
		super(row);

		this.updateDate = (String) row.get("updateDate");
		this.cateItemId = (int) row.get("cateItemId");
		this.title = (String) row.get("title");
		this.body = (String) row.get("body");
		this.hit = (int) row.get("hit");
		this.memberId = (int) row.get("memberId");
	}

	@Override
	public String toString() {
		return "Article [updateDate=" + updateDate + ", cateItemId=" + cateItemId + ", hit=" + hit + ", title=" + title
				+ ", body=" + body + ", memberId=" + memberId + ", dto=" + super.toString() + "]";
	}

	public void setMemberId(int hit) {
		this.memberId = memberId;
	}

	public int getMemberId() {
		return memberId;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public int getHit() {
		return memberId;
	}

	public String getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}

	public int getCateItemId() {
		return cateItemId;
	}

	public void setCateItemId(int cateItemId) {
		this.cateItemId = cateItemId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getBody() {
		return body;
	}

	public String getBodyForXTemplate() {
		return body.replaceAll("(?i)script", "<!--REPLACE:script-->");
	}

	public void setBody(String body) {
		this.body = body;
	}

}