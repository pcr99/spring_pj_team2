package spring.mvc.spring_pj_team2.dto;

import java.sql.Date;  // 주의

public class BoardDTO {
	
	private int num; 			// 글번호
	private String title;		// 글제목
	private String content;		// 글내용
	private String writer; 		// 작성자
	private String password; 	// 수정, 삭제용 비밀번호
	private int readCnt; 		// 조회수
	private Date regDate;		// 작성일
	private int comment_count; 	//  댓글갯수
	private String show;
	private int notice;
	
	public BoardDTO() {
		super();
	}

	public BoardDTO(int num, String title, String content, String writer, String password, int readCnt, Date regDate,
			int comment_count, int notice, String show) {
		super();
		this.num = num;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.password = password;
		this.readCnt = readCnt;
		this.regDate = regDate;
		this.comment_count = comment_count;
		this.notice = notice;
		this.show = show;
	}

	public String getShow() {
		return show;
	}

	public void setShow(String show) {
		this.show = show;
	}

	public int getNotice() {
		return notice;
	}

	public void setNotice(int notice) {
		this.notice = notice;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
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

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getReadCnt() {
		return readCnt;
	}

	public void setReadCnt(int readCnt) {
		this.readCnt = readCnt;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public int getComment_count() {
		return comment_count;
	}

	public void setComment_count(int comment_count) {
		this.comment_count = comment_count;
	}

	@Override
	public String toString() {
		return "BoardDTO [num=" + num + ", title=" + title + ", content=" + content + ", writer=" + writer
				+ ", password=" + password + ", readCnt=" + readCnt + ", regDate=" + regDate + ", comment_count="
				+ comment_count + "]";
	}

}
