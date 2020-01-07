package com.spring.mvc.board.model;

public class Board {

	private int no;
	private String subject;
	private String content;
	private int readcount;
	private int recommend;
	private String ip;
	private String reg_date;
	private String up_date;
	private String del_yn;
	private int m_no;
	private String m_nick;
	private String m_passwd;
	
	private int replycount;
	private int byteSize;
	private int sublength;
	
	// 조회용
	private int startRow;
	private int endRow;
	// 검색용
	private String searchType;
	private String searchTxt;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public int getRecommend() {
		return recommend;
	}

	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public String getUp_date() {
		return up_date;
	}

	public void setUp_date(String up_date) {
		this.up_date = up_date;
	}

	public String getDel_yn() {
		return del_yn;
	}

	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
	}

	public int getM_no() {
		return m_no;
	}

	public void setM_no(int m_no) {
		this.m_no = m_no;
	}

	public String getM_nick() {
		return m_nick;
	}

	public void setM_nick(String m_nick) {
		this.m_nick = m_nick;
	}
	
	public String getM_passwd() {
		return m_passwd;
	}

	public void setM_passwd(String m_passwd) {
		this.m_passwd = m_passwd;
	}
	
	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getSearchTxt() {
		return searchTxt;
	}

	public void setSearchTxt(String searchTxt) {
		this.searchTxt = searchTxt;
	}
	
	public int getReplycount() {
		return replycount;
	}

	public void setReplycount(int replycount) {
		this.replycount = replycount;
	}

	public int getByteSize() {
		return byteSize;
	}

	public void setByteSize(int byteSize) {
		this.byteSize = byteSize;
	}

	public int getSublength() {
		return sublength;
	}

	public void setSublength(int sublength) {
		this.sublength = sublength;
	}

	@Override
	public String toString() {
		return "Board [no=" + no + ", subject=" + subject + ", content=" + content + ", readcount=" + readcount
				+ ", recommend=" + recommend + ", ip=" + ip + ", reg_date=" + reg_date + ", up_date=" + up_date
				+ ", del_yn=" + del_yn + ", m_no=" + m_no + ", m_nick=" + m_nick + ", m_passwd=" + m_passwd
				+ ", replycount=" + replycount + ", byteSize=" + byteSize + ", sublength=" + sublength + ", startRow="
				+ startRow + ", endRow=" + endRow + ", searchType=" + searchType + ", searchTxt=" + searchTxt + "]";
	}

}
