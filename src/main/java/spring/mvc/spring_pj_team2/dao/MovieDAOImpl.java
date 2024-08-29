package spring.mvc.spring_pj_team2.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.spring_pj_team2.dto.MovieCommentDTO;
import spring.mvc.spring_pj_team2.dto.MovieDTO;

@Repository
public class MovieDAOImpl implements MovieDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<MovieDTO> getPopularList() {
		System.out.println("DAO - getPopularList");
		List<MovieDTO> list = sqlSession.selectList("spring.mvc.spring_pj_team2.dao.MovieDAO.getPopularList");
		return list;
	}

	@Override
	public List<MovieDTO> getLatestList() {
		System.out.println("DAO - getLatestList");
		List<MovieDTO> list = sqlSession.selectList("spring.mvc.spring_pj_team2.dao.MovieDAO.getLatestList");
		return list;
	}

	@Override
	public List<MovieDTO> getDomesticList() {
		System.out.println("DAO - getDomesticList");
		List<MovieDTO> list = sqlSession.selectList("spring.mvc.spring_pj_team2.dao.MovieDAO.getDomesticList");
		return list;
	}

	@Override
	public List<MovieDTO> getGlobalList() {
		System.out.println("DAO - getGlobalList");
		List<MovieDTO> list = sqlSession.selectList("spring.mvc.spring_pj_team2.dao.MovieDAO.getGlobalList");
		return list;
	}
	@Override
    public List<MovieDTO> movieSearch(String title) {
        // MyBatis 매퍼 XML에서 정의한 id 'movieSearch'를 호출
        return sqlSession.selectList("spring.mvc.spring_pj_team2.dao.MovieDAO.movieSearch", title);
    }
	
	@Override
	public MovieDTO movieDetail(int mvNo) {
		
		MovieDTO dto = sqlSession.selectOne("spring.mvc.spring_pj_team2.dao.MovieDAO.movieDetail",mvNo);
		return dto;
	}

	@Override
	public int commentInsert(MovieCommentDTO dto) {
		
		int insertCnt = sqlSession.insert("spring.mvc.spring_pj_team2.dao.MovieDAO.commentInsert",dto);
		return insertCnt;
	}

	@Override
	public List<MovieCommentDTO> commentList(int mvNo) {
		List<MovieCommentDTO> list = sqlSession.selectList("spring.mvc.spring_pj_team2.dao.MovieDAO.commentList",mvNo);
		return list;
	}

	@Override
	public int password_chk(Map<String, Object> map) {
		int selectCnt = sqlSession.selectOne("spring.mvc.spring_pj_team2.dao.MovieDAO.password_chk",map);
		return selectCnt;
	}

	@Override
	public int commentDelete(int comment_num) {
		int deleteCnt = sqlSession.delete("spring.mvc.spring_pj_team2.dao.MovieDAO.commentDelete",comment_num);
		return deleteCnt;
	}

}
