package spring.mvc.spring_pj_team2.dto;

import java.sql.Date;

//댓글 DTO
public class MovieCommentDTO {
	
	//멤버변수
	private int comment_num;
	private int mvNo;
	private String password;
	private String review;
	private String rating;
	private Date regDate;
	
	public MovieCommentDTO() {
		super();
	}

	public MovieCommentDTO(int comment_num, int mvNo, String password, String review, String rating, Date regDate) {
		super();
		this.comment_num = comment_num;
		this.mvNo = mvNo;
		this.password = password;
		this.review = review;
		this.rating = rating;
		this.regDate = regDate;
	}

	public int getComment_num() {
		return comment_num;
	}

	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}

	public int getMvNo() {
		return mvNo;
	}

	public void setMvNo(int mvNo) {
		this.mvNo = mvNo;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public String getRating() {
		return rating;
	}

	public void setRating(String rating) {
		this.rating = rating;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "MovieCommentDTO [comment_num=" + comment_num + ", mvNo=" + mvNo + ", password=" + password
				+ ", review=" + review + ", rating=" + rating + ", regDate=" + regDate + "]";
	}

	
	
	
	
	
	
	
	
}
