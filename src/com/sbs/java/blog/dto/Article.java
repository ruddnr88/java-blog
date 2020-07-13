package com.sbs.java.blog.dto;

import java.util.Map;

public class Article extends Dto {
	private String updateDate;
	private String title;
	private String body;
	private int cateItemId;
	private int hit;

	public Article(Map<String, Object> row) {
		super(row);
		this.updateDate = (String) row.get("updateDate");
		this.cateItemId = (int) row.get("cateItemId");
		this.hit = (int) row.get("hit");
		this.title = (String) row.get("title");
		this.body = (String) row.get("body");
	}

	@Override
	public String toString() {
		return "Article [updateDate=" + updateDate + ", cateItemId=" + cateItemId + ", title=" + title + ", body="
				+ body + ", hit=" + hit + ", dto=" + super.toString() + "]";
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
	
	public String getBodyForXTemplate() {
		return body.replaceAll("(?i)script", "<!--REPLACE:SCRIPT-->");
	}

	public void setBody(String body) {
		this.body = body;
	}

}
