package org.movietalk.app.web;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class BoardMDTO {

	private int board_seq;
	private String board_title;
	private String board_writer;
	private Date board_regdate;
	private int board_hit;
	private String movie_content;
	private int movie_grade;
	private String movie_director;
	private String movie_character;
	private String movie_story;
	private String movie_genre;
	private String searchCondition = "board_title";
	private String searchKeyword = "";
	private MultipartFile uploadFile;
	private String fileName;
	
	

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

	public int getBoard_seq() {
		return board_seq;
	}

	public void setBoard_seq(int board_seq) {
		this.board_seq = board_seq;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_writer() {
		return board_writer;
	}

	public void setBoard_writer(String board_writer) {
		this.board_writer = board_writer;
	}

	public Date getBoard_regdate() {
		return board_regdate;
	}

	public void setBoard_regdate(Date board_regdate) {
		this.board_regdate = board_regdate;
	}

	public int getBoard_hit() {
		return board_hit;
	}

	public void setBoard_hit(int board_hit) {
		this.board_hit = board_hit;
	}

	public String getMovie_content() {
		return movie_content;
	}

	public void setMovie_content(String movie_content) {
		this.movie_content = movie_content;
	}

	public int getMovie_grade() {
		return movie_grade;
	}

	public void setMovie_grade(int movie_grade) {
		this.movie_grade = movie_grade;
	}

	public String getMovie_director() {
		return movie_director;
	}

	public void setMovie_director(String movie_director) {
		this.movie_director = movie_director;
	}

	public String getMovie_character() {
		return movie_character;
	}

	public void setMovie_character(String movie_character) {
		this.movie_character = movie_character;
	}

	public String getMovie_story() {
		return movie_story;
	}

	public void setMovie_story(String movie_story) {
		this.movie_story = movie_story;
	}

	public String getMovie_genre() {
		return movie_genre;
	}

	public void setMovie_genre(String movie_genre) {
		this.movie_genre = movie_genre;
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

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	public BoardMDTO(int board_seq, String board_title, String board_writer, Date board_regdate, int board_hit,
			String movie_content, int movie_grade, String movie_director, String movie_character, String movie_story,
			String movie_genre, String searchCondition, String searchKeyword) {

		this.board_seq = board_seq;
		this.board_title = board_title;
		this.board_writer = board_writer;
		this.board_regdate = board_regdate;
		this.board_hit = board_hit;
		this.movie_content = movie_content;
		this.movie_grade = movie_grade;
		this.movie_director = movie_director;
		this.movie_character = movie_character;
		this.movie_story = movie_story;
		this.movie_genre = movie_genre;
		this.searchCondition = searchCondition;
		this.searchKeyword = searchKeyword;

	}
	
	



	public BoardMDTO(int board_seq, String board_title, String board_writer, Date board_regdate, int board_hit,
			String movie_content, int movie_grade, String movie_director, String movie_character, String movie_story,
			String movie_genre, String searchCondition, String searchKeyword, MultipartFile uploadFile,
			String fileName) {
		this.board_seq = board_seq;
		this.board_title = board_title;
		this.board_writer = board_writer;
		this.board_regdate = board_regdate;
		this.board_hit = board_hit;
		this.movie_content = movie_content;
		this.movie_grade = movie_grade;
		this.movie_director = movie_director;
		this.movie_character = movie_character;
		this.movie_story = movie_story;
		this.movie_genre = movie_genre;
		this.searchCondition = searchCondition;
		this.searchKeyword = searchKeyword;
		this.uploadFile = uploadFile;
		this.fileName = fileName;
	}

	public BoardMDTO() {
	}

	@Override
	public String toString() {
		return "BoardMDTO [board_seq=" + board_seq + ", board_title=" + board_title + ", board_writer=" + board_writer
				+ ", board_regdate=" + board_regdate + ", board_hit=" + board_hit + ", movie_content=" + movie_content
				+ ", movie_grade=" + movie_grade + ", movie_director=" + movie_director + ", movie_character="
				+ movie_character + ", movie_story=" + movie_story + ", movie_genre=" + movie_genre
				+ ", searchCondition=" + searchCondition + ", searchKeyword=" + searchKeyword + ", uploadFile="
				+ uploadFile + ", fileName=" + fileName + "]";
	}




}
