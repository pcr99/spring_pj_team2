package spring.mvc.spring_pj_team2.dao;

import java.util.List;
import java.util.Map;

import spring.mvc.spring_pj_team2.dto.BoardDTO;
import spring.mvc.spring_pj_team2.dto.MovieDTO;
import spring.mvc.spring_pj_team2.dto.UserInfoDTO;
import spring.mvc.spring_pj_team2.dto.VisitorDTO;
import spring.mvc.spring_pj_team2.dto.MessageDTO;

public interface AdminDAO {

	public int getMaxMvNo();
	
	public int addMovie(MovieDTO dto);
	
	public int deleteMovie(int mvNo);

	public int modifyMovie(MovieDTO dto);
	
	public MovieDTO movieDetail(int mvNo);
	
	public int blockUser(String userNo);
	
	public int unblockUser(String userNo);
	
	public int messaging(MessageDTO dto);

	public List<MovieDTO> movieListup(Map map);
	
	public List<UserInfoDTO> userListup(Map map);
	
	public List<BoardDTO> boardListUp(Map map);
	
	public int movieCnt();

	public int boardCnt();
	
	public int userCnt();

	public int addBoard(BoardDTO dto);

	public int deleteBoard(int userno);
	
	public List<VisitorDTO> getAllVisitors();
	
	public List<VisitorDTO> getAllVisitors2();
	
}
