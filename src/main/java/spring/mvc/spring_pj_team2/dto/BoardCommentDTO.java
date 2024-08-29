package spring.mvc.spring_pj_team2.dto;

import java.sql.Date;

//게시판 댓글 DTO
public class BoardCommentDTO {

	private int comment_num;	//PK, 댓글 일련번호
	private int board_num; 		//FK, 게시글 번호--REFERENCES mvc_board_tbl(num)
	private String writer;		//작성자
	private String content;		//글내용
	private Date regDate;		//등록일
	
	//디폴트 생성자
	public BoardCommentDTO() {
		
	}
	//매개변수 생성자
	public BoardCommentDTO(int comment_num, int board_num, String writer, String content, Date regDate) {
		super();
		this.comment_num = comment_num;
		this.board_num = board_num;
		this.writer = writer;
		this.content = content;
		this.regDate = regDate;
	}
	
	//getter setter
	public int getComment_num() {
		return comment_num;
	}
	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	@Override
	public String toString() {
		return "BoardCommentDTO [comment_num=" + comment_num + ", board_num=" + board_num + ", writer=" + writer
				+ ", content=" + content + ", regDate=" + regDate + "]";
	}
}
