package org.movietalk.app.web;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class BoardRDTO {

	private int rboard_seq;
	private String rboard_title;
	private String rboard_writer;
	private String rboard_content;
	private Date rboard_regdate;
	private int rboard_hit;
	private int rboard_grade;

	// 검색
	private String searchCondition;
	private String searchKeyword;

	// 업로드
	private MultipartFile uploadFile;
	private String fileName;

	// 댓글
	private int rreply_seq;
	private String rreply_writer;
	private String rreply_content;
	private Date rreply_regdate;
	private int r_seq;

	public BoardRDTO() {
	}

	public BoardRDTO(int rboard_seq, String rboard_title, String rboard_writer, String rboard_content,
			Date rboard_regdate, int rboard_hit, int rboard_grade, MultipartFile uploadFile, String fileName,
			int rreply_seq, String rreply_writer, String rreply_content, Date rreply_regdate, int r_seq) {
		this.rboard_seq = rboard_seq;
		this.rboard_title = rboard_title;
		this.rboard_writer = rboard_writer;
		this.rboard_content = rboard_content;
		this.rboard_regdate = rboard_regdate;
		this.rboard_hit = rboard_hit;
		this.rboard_grade = rboard_grade;

		this.uploadFile = uploadFile;
		this.fileName = fileName;
		this.rreply_seq = rreply_seq;
		this.rreply_writer = rreply_writer;
		this.rreply_content = rreply_content;
		this.rreply_regdate = rreply_regdate;
		this.r_seq = r_seq;
	}

	public BoardRDTO(int rboard_seq, String rboard_title, String rboard_writer, String rboard_content,
			Date rboard_regdate, int rboard_hit, int rboard_grade, String searchCondition, String searchKeyword,
			MultipartFile uploadFile, String fileName, int rreply_seq, String rreply_writer, String rreply_content,
			Date rreply_regdate, int r_seq) {
		this.rboard_seq = rboard_seq;
		this.rboard_title = rboard_title;
		this.rboard_writer = rboard_writer;
		this.rboard_content = rboard_content;
		this.rboard_regdate = rboard_regdate;
		this.rboard_hit = rboard_hit;
		this.rboard_grade = rboard_grade;

		this.searchCondition = searchCondition;
		this.searchKeyword = searchKeyword;

		this.uploadFile = uploadFile;
		this.fileName = fileName;
		this.rreply_seq = rreply_seq;
		this.rreply_writer = rreply_writer;
		this.rreply_content = rreply_content;
		this.rreply_regdate = rreply_regdate;
		this.r_seq = r_seq;
	}

//	public BoardRDTO(int rboard_seq, String rboard_title, String rboard_writer, String rboard_content,
//			Date rboard_regdate, int rboard_hit, int rboard_grade) {
//		System.out.println("BoardDTO의 검색/파일 제외 생성자");
//		this.rboard_seq = rboard_seq;
//		this.rboard_title = rboard_title;
//		this.rboard_writer = rboard_writer;
//		this.rboard_content = rboard_content;
//		this.rboard_regdate = rboard_regdate;
//		this.rboard_hit = rboard_hit;
//		this.rboard_grade = rboard_grade;
//	}
//
//	public BoardRDTO(int rboard_seq, String rboard_title, String rboard_writer, String rboard_content,
//			Date rboard_regdate, int rboard_hit, int rboard_grade, String searchCondition, String searchKeyword) {
//		System.out.println("BoardDTO의 파일 제외 생성자");
//		this.rboard_seq = rboard_seq;
//		this.rboard_title = rboard_title;
//		this.rboard_writer = rboard_writer;
//		this.rboard_content = rboard_content;
//		this.rboard_regdate = rboard_regdate;
//		this.rboard_hit = rboard_hit;
//		this.rboard_grade = rboard_grade;
//		this.searchCondition = searchCondition;
//		this.searchKeyword = searchKeyword;
//	}
//
//	public BoardRDTO(int rboard_seq, String rboard_title, String rboard_writer, String rboard_content,
//			Date rboard_regdate, int rboard_hit, int rboard_grade, String searchCondition, String searchKeyword,
//			MultipartFile uploadFile, String fileName) {
//		System.out.println("BoardDTO의 검색/파일 포함된 생성자");
//		this.rboard_seq = rboard_seq;
//		this.rboard_title = rboard_title;
//		this.rboard_writer = rboard_writer;
//		this.rboard_content = rboard_content;
//		this.rboard_regdate = rboard_regdate;
//		this.rboard_hit = rboard_hit;
//		this.rboard_grade = rboard_grade;
//		this.searchCondition = searchCondition;
//		this.searchKeyword = searchKeyword;
//		this.uploadFile = uploadFile;
//		this.fileName = fileName;
//	}

	public int getRreply_seq() {
		return rreply_seq;
	}

	public void setRreply_seq(int rreply_seq) {
		this.rreply_seq = rreply_seq;
	}

	public String getRreply_writer() {
		return rreply_writer;
	}

	public void setRreply_writer(String rreply_writer) {
		this.rreply_writer = rreply_writer;
	}

	public String getRreply_content() {
		return rreply_content;
	}

	public void setRreply_content(String rreply_content) {
		this.rreply_content = rreply_content;
	}

	public Date getRreply_regdate() {
		return rreply_regdate;
	}

	public void setRreply_regdate(Date rreply_regdate) {
		this.rreply_regdate = rreply_regdate;
	}

	public int getR_seq() {
		return r_seq;
	}

	public void setR_seq(int r_seq) {
		this.r_seq = r_seq;
	}

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchkeyword) {
		this.searchKeyword = searchkeyword;
	}

	public void setRboard_content(String rboard_content) {
		this.rboard_content = rboard_content;
	}

	public int getRboard_seq() {
		return rboard_seq;
	}

	public void setRboard_seq(int rboard_seq) {
		this.rboard_seq = rboard_seq;
	}

	public String getRboard_title() {
		return rboard_title;
	}

	public void setRboard_title(String rboard_title) {
		this.rboard_title = rboard_title;
	}

	public String getRboard_writer() {
		return rboard_writer;
	}

	public void setRboard_writer(String rboard_writer) {
		this.rboard_writer = rboard_writer;
	}

	public String getRboard_content() {
		return rboard_content;
	}

	public void setRboad_content(String rboard_content) {
		this.rboard_content = rboard_content;
	}

	public Date getRboard_regdate() {
		return rboard_regdate;
	}

	public void setRboard_regdate(Date rboard_regdate) {
		this.rboard_regdate = rboard_regdate;
	}

	public int getRboard_hit() {
		return rboard_hit;
	}

	public void setRboard_hit(int rboard_hit) {
		this.rboard_hit = rboard_hit;
	}

	public int getRboard_grade() {
		return rboard_grade;
	}

	public void setRboard_grade(int rboard_grade) {
		this.rboard_grade = rboard_grade;
	}

	public MultipartFile getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((rboard_content == null) ? 0 : rboard_content.hashCode());
		result = prime * result + rboard_grade;
		result = prime * result + rboard_hit;
		result = prime * result + ((rboard_regdate == null) ? 0 : rboard_regdate.hashCode());
		result = prime * result + rboard_seq;
		result = prime * result + ((rboard_title == null) ? 0 : rboard_title.hashCode());
		result = prime * result + ((rboard_writer == null) ? 0 : rboard_writer.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		BoardRDTO other = (BoardRDTO) obj;
		if (rboard_content == null) {
			if (other.rboard_content != null)
				return false;
		} else if (!rboard_content.equals(other.rboard_content))
			return false;
		if (rboard_grade != other.rboard_grade)
			return false;
		if (rboard_hit != other.rboard_hit)
			return false;
		if (rboard_regdate == null) {
			if (other.rboard_regdate != null)
				return false;
		} else if (!rboard_regdate.equals(other.rboard_regdate))
			return false;
		if (rboard_seq != other.rboard_seq)
			return false;
		if (rboard_title == null) {
			if (other.rboard_title != null)
				return false;
		} else if (!rboard_title.equals(other.rboard_title))
			return false;
		if (rboard_writer == null) {
			if (other.rboard_writer != null)
				return false;
		} else if (!rboard_writer.equals(other.rboard_writer))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "BoardRDTO [rboard_seq=" + rboard_seq + ", rboard_title=" + rboard_title + ", rboard_writer="
				+ rboard_writer + ", rboard_content=" + rboard_content + ", rboard_regdate=" + rboard_regdate
				+ ", rboard_hit=" + rboard_hit + ", rboard_grade=" + rboard_grade + ", searchCondition="
				+ searchCondition + ", searchKeyword=" + searchKeyword + ", uploadFile=" + uploadFile + ", fileName="
				+ fileName + ", rreply_seq=" + rreply_seq + ", rreply_writer=" + rreply_writer + ", rreply_content="
				+ rreply_content + ", rreply_regdate=" + rreply_regdate + ", r_seq=" + r_seq + "]";
	}

}