package com.sbs.java.blog.dto;

import java.util.Map;

public class Article extends Dto {
	private String updateDate;
	private String title;
	private String body;
	private int cateItemId;
	
	public Article() {
		
	}
	
	public Article(Map<String, Object> row) {
		super(row);
		this.updateDate = (String)row.get("updateDate");
		this.title = (String)row.get("title");
		this.body = (String)row.get("body");
		this.cateItemId = (int)row.get("cateItemId");
	}

	public String getUpdateDate() {
		return updateDate;
	}
	
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
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
	
	public void setBody(String body) {
		this.body = body;
	}
	
	
	@Override
	public String toString() {
		return "Article [id=" + getId() + ", regdate=" + getRegDate() + ", updateDate=" + updateDate + ", title=" + title
				+ ", body=" + body + ", cateItemId=" + cateItemId + "]";
	}

	public int getCateItemId() {
		return cateItemId;
	}

	public void setCateItemId(int cateItemId) {
		this.cateItemId = cateItemId;
	}
	
}
