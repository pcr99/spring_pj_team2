package spring.mvc.spring_pj_team2.dao;

import java.util.List;
import java.util.Map;

import spring.mvc.spring_pj_team2.dto.BoardCommentDTO;
import spring.mvc.spring_pj_team2.dto.BoardDTO;

public interface BoardDAO {

	//게시글 목록
	public List<BoardDTO> boardList(Map map);
	
	//게시글 갯수 구하기
	public int boardCnt();
	
	//조회수 증가
	public void plusReadCnt(int num);
	
	//게시글 상세페이지
	public BoardDTO getBoardDetail(int num);
	
	//게시글 수정처리
	public int updateBoard(BoardDTO dto);
	
	//게시글 삭제처리
	public int deleteBoard(int num);
	
	//게시글 작성처리
	public int insertBoard(BoardDTO dto);
	
	//댓글 작성처리
	public int commentInsert(BoardCommentDTO dto);
	
	//댓글 목록처리
	public List<BoardCommentDTO>commentList(int board_num);
}
