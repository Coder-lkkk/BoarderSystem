package com.boardsystem.po;

public class Blog {
	private int id;
	private String title;
	private String type;
	private String author;
	private int vip;
	private String date;
	private String like;
	private String content;
	
	@Override
	public String toString() {
		return "Blog [id=" + id + ", title=" + title + ", type=" + type
				+ ", author=" + author + ", vip=" + vip + ", date=" + date
				+ ", like=" + like + ", content=" + content + "]";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public int getVip() {
		return vip;
	}
	public void setVip(int vip) {
		this.vip = vip;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getLike() {
		return like;
	}
	public void setLike(String like) {
		this.like = like;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
}
