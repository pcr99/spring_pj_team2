package spring.mvc.spring_pj_team2.dao;

import java.util.List;

import spring.mvc.spring_pj_team2.dto.MovieDTO;


public interface MovieListDAO {
	
	// 한국영화 목록
	public List<MovieDTO> k_mvList();
	
	// 한국 공포영화 목록
	public List<MovieDTO> k_horrormvList();
	
	// 한국 코미디영화 목록
	public List<MovieDTO> k_comedymvList();
	
	// 한국 액션영화 목록
	public List<MovieDTO> k_actionmvList();
	
	// 외국영화 목록
	public List<MovieDTO> f_mvList();
	
	// 외국 sf영화 목록
	public List<MovieDTO> f_sfmvList();
	
	// 외국 히어로영화 목록
	public List<MovieDTO> f_heromvList();
	
	// 외국 액션영화 목록
	public List<MovieDTO> f_actionmvList();
	
	public void incrementkVisitorCount();
	
	public void incrementfVisitorCount();

}
