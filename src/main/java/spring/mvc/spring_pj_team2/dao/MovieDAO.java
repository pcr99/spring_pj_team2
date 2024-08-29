package spring.mvc.spring_pj_team2.dao;

import java.util.List;
import java.util.Map;

import spring.mvc.spring_pj_team2.dto.MovieCommentDTO;
import spring.mvc.spring_pj_team2.dto.MovieDTO;

public interface MovieDAO {

	// 영화목록 조회 (인기순)
	public List<MovieDTO> getPopularList();
	// 영화목록 조회 (최신순)
	public List<MovieDTO> getLatestList();
	// 영화목록 조회 (국내)
	public List<MovieDTO> getDomesticList();
	// 영화목록 조회 (국외)
	public List<MovieDTO> getGlobalList();
	// 영화 검색
	public List<MovieDTO> movieSearch(String title);
	
	public MovieDTO movieDetail(int mvNo);
	
	public List<MovieCommentDTO> commentList(int mvNo);
	
	public int commentInsert(MovieCommentDTO dto);
	
	public int commentDelete(int comment_num);
	
	public int password_chk(Map<String, Object> map);
}
