package com.example.anesi.model;


public class Board {
	private int boardNo;
	private String title;
	private String content;
	private String nick;
	private int view;
	private String cDateTime;
	private String uDateTime;
	private int commentNo;
	private String cNick;
	private String comm;
	private String cCDateTime;
	private String cUDatetime;
	private int commCnt;
	
	
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	public int getCommCnt() {
		return commCnt;
	}
	public void setCommCnt(int commCnt) {
		this.commCnt = commCnt;
	}
	public String getComm() {
		return comm;
	}
	public void setComm(String comm) {
		this.comm = comm;
	}
	public String getcCDateTime() {
		return cCDateTime;
	}
	public void setcCDateTime(String cCDateTime) {
		this.cCDateTime = cCDateTime;
	}
	public String getcUDatetime() {
		return cUDatetime;
	}
	public void setcUDatetime(String cUDatetime) {
		this.cUDatetime = cUDatetime;
	}
	public String getcNick() {
		return cNick;
	}
	public void setcNick(String cNick) {
		this.cNick = cNick;
	}
	public String getcContent() {
		return comm;
	}
	public void setcContent(String cContent) {
		this.comm = cContent;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public int getView() {
		return view;
	}
	public void setView(int view) {
		this.view = view;
	}
	public String getcDateTime() {
		return cDateTime;
	}
	public void setcDateTime(String cDateTime) {
		this.cDateTime = cDateTime;
	}
	public String getuDateTime() {
		return uDateTime;
	}
	public void setuDateTime(String uDateTime) {
		this.uDateTime = uDateTime;
	}

}
