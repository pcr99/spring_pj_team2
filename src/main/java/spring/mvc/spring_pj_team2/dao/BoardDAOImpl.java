package spring.mvc.spring_pj_team2.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.spring_pj_team2.dao.BoardDAO;
import spring.mvc.spring_pj_team2.dto.BoardCommentDTO;
import spring.mvc.spring_pj_team2.dto.BoardDTO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Autowired
    private SqlSession sqlSession;

	// 게시글 목록 조회
    @Override
    public List<BoardDTO> boardList(Map map) {
        System.out.println("DAO - boardList()");
        return sqlSession.selectList("spring.mvc.spring_pj_team2.dao.BoardDAO.boardList", map);
   
       // return list
    }

    // 게시글 갯수 구하기
    @Override
    public int boardCnt() {
        System.out.println("DAO - boardCnt()");
        
        return sqlSession.selectOne("spring.mvc.spring_pj_team2.dao.BoardDAO.boardCnt");
        
      //  return total
    }

    // 조회수 증가
    @Override
    public void plusReadCnt(int num) {
        System.out.println("DAO - plusReadCnt");
        sqlSession.update("spring.mvc.spring_pj_team2.dao.BoardDAO.plusReadCnt", num);
    }

    // 게시글 상세페이지
    @Override
    public BoardDTO getBoardDetail(int num) {
        System.out.println("DAO - getBoardDetail");
        
        return sqlSession.selectOne("spring.mvc.spring_pj_team2.dao.BoardDAO.getBoardDetail", num);
    
       // return dto
    }
    
    // 게시글 수정 처리
    @Override
    public int updateBoard(BoardDTO dto) {
        System.out.println("DAO - updateBoard");
        
        return sqlSession.update("spring.mvc.spring_pj_team2.dao.BoardDAO.updateBoard", dto);
    
     //   return result; 
    }

    // 게시글 삭제 처리
    @Override
    public int deleteBoard(int num) {
        System.out.println("DAO - deleteBoard");
        return sqlSession.update("spring.mvc.spring_pj_team2.dao.BoardDAO.deleteBoard", num);
    
      //  return deleteCnt
    }
    
    // 게시글 작성 처리
    @Override
    public int insertBoard(BoardDTO dto) {
        System.out.println("DAO - insertBoard");
        return sqlSession.insert("spring.mvc.spring_pj_team2.dao.BoardDAO.insertBoard", dto);
    
       // return insertCnt
    }

    // 댓글 작성 처리
    @Override
    public int commentInsert(BoardCommentDTO dto) {
        System.out.println("DAO - commentInsert");
        
        return sqlSession.insert("spring.mvc.spring_pj_team2.dao.BoardDAO.commentInsert", dto);
       
       // return commentList;
    }

    // 댓글 목록 처리
    @Override
    public List<BoardCommentDTO> commentList(int board_num) {
        System.out.println("DAO - commentList");
        return sqlSession.selectList("spring.mvc.spring_pj_team2.dao.BoardDAO.commentList", board_num);
    }

}
