package com.sbs.java.blog.dto;

import java.util.Map;

public class Article extends Dto {
	private String title;
	private String body;
	private int cateItemId;
	private int hit;
	private int memberId;

	public Article(Map<String, Object> row) {
		super(row);
		this.cateItemId = (int) row.get("cateItemId");
		this.hit = (int) row.get("hit");
		this.title = (String) row.get("title");
		this.body = (String) row.get("body");
		this.memberId = (int) row.get("memberId");
	}
	
	@Override
	public String toString() {
		return "Article [title=" + title + ", body=" + body + ", cateItemId=" + cateItemId + ", hit=" + hit
				+ ", memberId=" + memberId + ", getId()=" + getId() + ", getUpdateDate()=" + getUpdateDate()
				+ ", getRegDate()=" + getRegDate() + ", getExtra()=" + getExtra() + "]";
	}

	public int getCateItemId() {
		return cateItemId;
	}

	public void setCateItemId(int cateItemId) {
		this.cateItemId = cateItemId;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
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

	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	public String getBodyForXTemplate() {
		return body.replaceAll("(?i)script", "<!--REPLACE:SCRIPT-->");
	}

	public void setBody(String body) {
		this.body = body;
	}

}
