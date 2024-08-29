package spring.mvc.spring_pj_team2.dto;

import java.sql.Date;

public class MovieDTO {

	private int mvNo;
	private String title;
	private String content;
	private String director;
	private String actor;
	private String genre;
	private int audience;
	private String poster;
	private String grade;
	private Date releaseDate;
	private String country;
	
	public MovieDTO() {
		super();
	}
	
	public MovieDTO(int mvNo, String title, String content, String director, String actor, String genre, int audience,
			String poster, String grade, Date releaseDate, String country) {
		super();
		this.mvNo = mvNo;
		this.title = title;
		this.content = content;
		this.director = director;
		this.actor = actor;
		this.genre = genre;
		this.audience = audience;
		this.poster = poster;
		this.grade = grade;
		this.releaseDate = releaseDate;
		this.country = country;
	}

	public int getMvNo() {
		return mvNo;
	}
	public void setMvNo(int mvNo) {
		this.mvNo = mvNo;
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
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getActor() {
		return actor;
	}
	public void setActor(String actor) {
		this.actor = actor;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public int getAudience() {
		return audience;
	}
	public void setAudience(int audience) {
		this.audience = audience;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public Date getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}
	
	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	@Override
	public String toString() {
		return "MovieDTO [mvNo=" + mvNo + ", title=" + title + ", content=" + content + ", director=" + director
				+ ", actor=" + actor + ", genre=" + genre + ", audience=" + audience + ", poster=" + poster + ", grade="
				+ grade + "]";
	}
	
}
