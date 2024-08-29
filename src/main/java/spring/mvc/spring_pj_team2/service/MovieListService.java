package spring.mvc.spring_pj_team2.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

public interface MovieListService {
	
	// 한국영화 목록
	public void k_mvListAction(HttpServletRequest request, Model model) 
		throws ServletException, IOException;
	
	// 한국 공포영화 목록
	public void k_horrormvListAction(HttpServletRequest request, Model model) 
			throws ServletException, IOException;
	
	// 한국 코미디영화 목록
	public void k_comedymvListAction(HttpServletRequest request, Model model) 
			throws ServletException, IOException;
	
	// 한국 액션영화 목록
	public void k_actionmvListAction(HttpServletRequest request, Model model) 
			throws ServletException, IOException;
	
	// 외국영화 목록
	public void f_mvListAction(HttpServletRequest request, Model model) 
			throws ServletException, IOException;
	
	// 외국 sf영화 목록
	public void f_sfmvListAction(HttpServletRequest request, Model model) 
			throws ServletException, IOException;
	
	// 외국 히어로영화 목록
	public void f_heromvListAction(HttpServletRequest request, Model model) 
			throws ServletException, IOException;
	
	// 외국 액션영화 목록
	public void f_actionmvListAction(HttpServletRequest request, Model model) 
			throws ServletException, IOException;
	
	public void incrementkVisitorCount(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException;
	
	public void incrementfVisitorCount(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException;

}
