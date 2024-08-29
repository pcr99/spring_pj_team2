package spring.mvc.spring_pj_team2.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface MovieService {

	// 메인화면 영화 나열
	public void getMainList(HttpServletRequest request,Model model) 
			throws ServletException, IOException;
	// 영화 검색
	public void movieSearchAction(HttpServletRequest request, Model model) 
			throws ServletException, IOException;
	
	public void movieDetailAction(HttpServletRequest request, Model model) 
			throws ServletException, IOException;
	
	public void commentAddAction(HttpServletRequest request, Model model) 
			throws ServletException, IOException;
	
	public void commentListAction(HttpServletRequest request, Model model) 
			throws ServletException, IOException;
	
	public void delete_comment(HttpServletRequest request, Model model) 
			throws ServletException, IOException;

}
