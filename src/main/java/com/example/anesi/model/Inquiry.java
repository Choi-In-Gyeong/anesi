package com.example.anesi.model;


public class Inquiry {
	
	private String cDateTime;
	private String content;
	private String inquiryCategory;
	private String reply;
	private String openYn;
	private String nick;
	private String purchaseYn;
	private int cnt;
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getPurchaseYn() {
		return purchaseYn;
	}
	public void setPurchaseYn(String purchaseYn) {
		this.purchaseYn = purchaseYn;
	}
	public String getcDateTime() {
		return cDateTime;
	}
	public void setcDateTime(String cDateTime) {
		this.cDateTime = cDateTime;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getInquiryCategory() {
		return inquiryCategory;
	}
	public void setInquiryCategory(String inquiryCategoet) {
		this.inquiryCategory = inquiryCategoet;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public String getOpenYn() {
		return openYn;
	}
	public void setOpenYn(String openYn) {
		this.openYn = openYn;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
}