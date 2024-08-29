package spring.mvc.spring_pj_team2.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.spring_pj_team2.dto.BoardDTO;
import spring.mvc.spring_pj_team2.dto.MovieDTO;
import spring.mvc.spring_pj_team2.dto.UserInfoDTO;
import spring.mvc.spring_pj_team2.dto.VisitorDTO;
import spring.mvc.spring_pj_team2.dto.MessageDTO;

@Repository
public class AdminDAOImpl implements AdminDAO{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int getMaxMvNo() {
		 int mvNo = sqlSession.selectOne("spring.mvc.spring_pj_team2.dao.AdminDAO.getMaxMvNo");
		 return mvNo;
	}

	@Override
	public int addMovie(MovieDTO dto) {
        System.out.println("DAO-addMovie");
        int resultCnt = sqlSession.insert("spring.mvc.spring_pj_team2.dao.AdminDAO.addMovie", dto);
        return resultCnt;
    }

	@Override
	public int deleteMovie(int mvNo) {
        System.out.println("DAO-deleteMovie");
        int resultCnt = sqlSession.delete("spring.mvc.spring_pj_team2.dao.AdminDAO.deleteMovie", mvNo);
        return resultCnt;
    }

	@Override
	public List<MovieDTO> movieListup(Map map) {
		System.out.println("DAO-movieListup");
		List<MovieDTO> list = sqlSession.selectList("spring.mvc.spring_pj_team2.dao.AdminDAO.movieListup", map);
        return list;
	}

	@Override
	public MovieDTO movieDetail(int mvNo) {
		System.out.println("DAO-movieDetail");
		MovieDTO dto = sqlSession.selectOne("spring.mvc.spring_pj_team2.dao.AdminDAO.movieDetail", mvNo);
		return dto;
	}

	@Override
	public int modifyMovie(MovieDTO dto) {
		System.out.println("DAO-modifyMovie");
        int resultCnt = sqlSession.update("spring.mvc.spring_pj_team2.dao.AdminDAO.modifyMovie", dto);
        return resultCnt;
	}

	@Override
	public List<UserInfoDTO> userListup(Map map) {
		System.out.println("DAO-userListup");
		List<UserInfoDTO> list = sqlSession.selectList("spring.mvc.spring_pj_team2.dao.AdminDAO.userListup", map);
        return list;
	}
	
	
    @Override
    public int blockUser(String userNo) {
        System.out.println("DAO - blockUser()");
        int resultCnt = sqlSession.update("spring.mvc.spring_pj_team2.dao.AdminDAO.blockUser", userNo);
        return resultCnt;
    }
    
    @Override
    public int unblockUser(String userNo) {
    	System.out.println("DAO - unblockUser()");
    	int resultCnt = sqlSession.update("spring.mvc.spring_pj_team2.dao.AdminDAO.unblockUser", userNo);
    	return resultCnt;
    }

	@Override
	public int messaging(MessageDTO dto) {
		System.out.println("DAO - messaging()");
        int resultCnt = sqlSession.insert("spring.mvc.spring_pj_team2.dao.AdminDAO.messaging", dto);
        return resultCnt;
	}

	@Override
	public List<BoardDTO> boardListUp(Map map) {
		System.out.println("DAO-boardListUp");
		List<BoardDTO> list = sqlSession.selectList("spring.mvc.spring_pj_team2.dao.AdminDAO.boardListUp", map);
        return list;
	}
	
	@Override
	public int addBoard(BoardDTO dto) {
		System.out.println("DAO - addBoard()");
        int resultCnt = sqlSession.insert("spring.mvc.spring_pj_team2.dao.AdminDAO.addBoard", dto);
        return resultCnt;
	}
	
	@Override
	public int deleteBoard(int num) {
		 System.out.println("DAO - blockUser()");
         int resultCnt = sqlSession.update("spring.mvc.spring_pj_team2.dao.AdminDAO.deleteBoard", num);
         return resultCnt;
	}

	@Override
	public List<VisitorDTO> getAllVisitors() {
		return sqlSession.selectList("spring.mvc.spring_pj_team2.dao.AdminDAO.getAllVisitors");
	}
	
	@Override
	public List<VisitorDTO> getAllVisitors2() {
		return sqlSession.selectList("spring.mvc.spring_pj_team2.dao.AdminDAO.getAllVisitors2");
	}

	@Override
	public int movieCnt() {
		int total = sqlSession.selectOne("spring.mvc.spring_pj_team2.dao.AdminDAO.movieCnt");
		return total;
	}

	@Override
	public int boardCnt() {
		int total = sqlSession.selectOne("spring.mvc.spring_pj_team2.dao.AdminDAO.boardCnt");
		return total;
	}

	@Override
	public int userCnt() {
		int total = sqlSession.selectOne("spring.mvc.spring_pj_team2.dao.AdminDAO.userCnt");
		return total;
	}

}
