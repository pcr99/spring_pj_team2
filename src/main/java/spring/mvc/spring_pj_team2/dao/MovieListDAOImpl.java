package spring.mvc.spring_pj_team2.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.spring_pj_team2.dto.MovieDTO;


@Repository
public class MovieListDAOImpl implements MovieListDAO{
	
	@Autowired
	private SqlSession sqlSession;

	// 한국영화 목록
	@Override
	public List<MovieDTO> k_mvList() {
		System.out.println("MovieDAOImpl - kmovieList");

		List<MovieDTO> list = sqlSession.selectList("spring.mvc.spring_pj_team2.dao.MovieDAO.k_mvList");
		return list;
	}

	
	// 한국 공포영화 목록
	@Override
	public List<MovieDTO> k_horrormvList() {
		System.out.println("MovieDAOImpl - k_horrormvList");
		
		List<MovieDTO> list = sqlSession.selectList("spring.mvc.spring_pj_team2.dao.MovieDAO.k_horrormvList");
		return list;
	}
	
	// 한국 코미디영화 목록
	@Override
	public List<MovieDTO> k_comedymvList() {
		System.out.println("MovieDAOImpl - k_comedymvList");
		
		List<MovieDTO> list = sqlSession.selectList("spring.mvc.spring_pj_team2.dao.MovieDAO.k_comedymvList");
		return list;
	}

	// 한국 액션영화 목록
	@Override
	public List<MovieDTO> k_actionmvList() {
		System.out.println("MovieDAOImpl - k_actionmvList");
		
		List<MovieDTO> list = sqlSession.selectList("spring.mvc.spring_pj_team2.dao.MovieDAO.k_actionmvList");
		return list;
	}

	// 외국영화 목록
	@Override
	public List<MovieDTO> f_mvList() {
		System.out.println("MovieDAOImpl - f_mvList");
		
		List<MovieDTO> list = sqlSession.selectList("spring.mvc.spring_pj_team2.dao.MovieDAO.f_mvList");
		return list;
	}

	// 외국 sf영화 목록
	@Override
	public List<MovieDTO> f_sfmvList() {
		System.out.println("MovieDAOImpl - f_sfmvList");
		
		List<MovieDTO> list = sqlSession.selectList("spring.mvc.spring_pj_team2.dao.MovieDAO.f_sfmvList");
		
		return list;
	}

	// 외국 히어로영화 목록
	@Override
	public List<MovieDTO> f_heromvList() {
		System.out.println("MovieDAOImpl - f_heromvList");
		
		
		List<MovieDTO> list = sqlSession.selectList("spring.mvc.spring_pj_team2.dao.MovieDAO.f_heromvList");
		return list;
	}

	// 외국 액션영화 목록
	@Override
	public List<MovieDTO> f_actionmvList() {
		System.out.println("MovieDAOImpl - f_actionmvList");
		
		List<MovieDTO> list = sqlSession.selectList("spring.mvc.spring_pj_team2.dao.MovieDAO.f_actionmvList");
		return list;
	}
	
	@Override
	public void incrementkVisitorCount() {
		sqlSession.update("spring.mvc.spring_pj_team2.dao.MovieDAO.incrementkVisitorCount");		
	}
	
	@Override
	public void incrementfVisitorCount() {
		sqlSession.update("spring.mvc.spring_pj_team2.dao.MovieDAO.incrementfVisitorCount");		
	}

}
