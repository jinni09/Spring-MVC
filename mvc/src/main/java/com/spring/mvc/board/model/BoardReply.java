package com.spring.mvc.board.model;

public class BoardReply {
	private int re_no;
	private String re_content;
	private String up_content;	
	private String re_reg_date;
	private String re_up_date;
	private String re_del_yn;
	private int no;
	private int m_no;
	private String m_nick;
	private int relength;

	public int getRe_no() {
		return re_no;
	}

	public void setRe_no(int re_no) {
		this.re_no = re_no;
	}

	public String getRe_content() {
		return re_content;
	}

	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}

	public String getUp_content() {
		return up_content;
	}

	public void setUp_content(String up_content) {
		this.up_content = up_content;
	}
	
	public String getRe_reg_date() {
		return re_reg_date;
	}

	public void setRe_reg_date(String re_reg_date) {
		this.re_reg_date = re_reg_date;
	}

	public String getRe_up_date() {
		return re_up_date;
	}

	public void setRe_up_date(String re_up_date) {
		this.re_up_date = re_up_date;
	}

	public String getRe_del_yn() {
		return re_del_yn;
	}

	public void setRe_del_yn(String re_del_yn) {
		this.re_del_yn = re_del_yn;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
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
	
	public int getRelength() {
		return relength;
	}

	public void setRelength(int relength) {
		this.relength = relength;
	}

}
