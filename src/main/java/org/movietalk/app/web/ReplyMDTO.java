package org.movietalk.app.web;

import java.sql.Date;

public class ReplyMDTO {
	private int mreply_seq;
	private int board_seq;
	private String mreply_writer;
	private String mreply_content;
	private Date mreply_regdate;
	private int m_rating;

	public int getM_rating() {
		return m_rating;
	}

	public void setM_rating(int m_rating) {
		this.m_rating = m_rating;
	}
	public int getMreply_seq() {
		return mreply_seq;
	}

	public void setMreply_seq(int mreply_seq) {
		this.mreply_seq = mreply_seq;
	}

	public int getM_seq() {
		return board_seq;
	}

	public void setM_seq(int board_seq) {
		this.board_seq = board_seq;
	}

	public String getMreply_content() {
		return mreply_content;
	}

	public void setMreply_content(String mreply_content) {
		this.mreply_content = mreply_content;
	}

	public Date getMreply_regdate() {
		return mreply_regdate;
	}

	public void setMreply_regdate(Date mreply_regdate) {
		this.mreply_regdate = mreply_regdate;
	}

	public String getMreply_writer() {
		return mreply_writer;
	}

	public void setMreply_writer(String mreply_writer) {
		this.mreply_writer = mreply_writer;
	}

	@Override
	public String toString() {
		return "ReplyMDTO [mreply_seq=" + mreply_seq + ", board_seq=" + board_seq + ", mreply_writer=" + mreply_writer
				+ ", mreply_content=" + mreply_content + ", mreply_regdate=" + mreply_regdate + ",m_rating=" + m_rating + "]";
	}

	public ReplyMDTO(int mreply_seq, int board_seq, String mreply_writer, String mreply_content, Date mreply_regdate, int m_rating) {

		this.mreply_seq = mreply_seq;
		this.board_seq = board_seq;
		this.mreply_writer = mreply_writer;
		this.mreply_content = mreply_content;
		this.mreply_regdate = mreply_regdate;
		
	}

	public ReplyMDTO() {
		// TODO Auto-generated constructor stub
	}

}
