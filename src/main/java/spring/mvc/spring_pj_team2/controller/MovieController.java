package spring.mvc.spring_pj_team2.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.mvc.spring_pj_team2.service.MovieListServiceImpl;

@Controller
public class MovieController {
	
	private static final Logger logger = LoggerFactory.getLogger(MovieController.class);

	@Autowired
	private MovieListServiceImpl service;
	
	// 한국영화 목록
	@RequestMapping("k_mvList.mo")
	public String k_mvList(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==> /k_mvList.mo >>>");
		
		service.k_mvListAction(request, model);
		service.incrementkVisitorCount(request, response, model);
		return "common/movie/k_mvList";
	}
	
	// 한국 공포영화 목록
	@RequestMapping("k_horrormv.mo")
	public String k_horrormv(HttpServletRequest request, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==> /k_horrormv.mo >>>");
		
		service.k_horrormvListAction(request, model);
		return "common/movie/k_horrormv";
	}
	
	@RequestMapping("k_comedymv.mo")
	public String k_comedymv(HttpServletRequest request, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==> /k_comedymv.mo >>>");
		
		service.k_comedymvListAction(request, model);
		return "common/movie/k_comedymv";
	}
	
	@RequestMapping("k_actionmv.mo")
	public String k_actionmv(HttpServletRequest request, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==> /k_actionmv.mo >>>");
		
		service.k_actionmvListAction(request, model);
		return "common/movie/k_actionmv";
	}
	
	@RequestMapping("f_mvList.mo")
	public String f_mvList(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==> /f_mvList.mo >>>");
		
		service.f_mvListAction(request, model);
		service.incrementfVisitorCount(request, response, model);
		return "common/movie/f_mvList";
	}
	
	@RequestMapping("f_sfmv.mo")
	public String f_sfmv(HttpServletRequest request, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==> /f_sfmv.mo >>>");
		
		service.f_sfmvListAction(request, model);
		return "common/movie/f_sfmv";
	}
	
	@RequestMapping("f_heromv.mo")
	public String f_heromv(HttpServletRequest request, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==> /f_heromv.mo >>>");
		
		service.f_heromvListAction(request, model);
		return "common/movie/f_heromv";
	}
	
	@RequestMapping("f_actionmv.mo")
	public String f_actionmv(HttpServletRequest request, Model model)
			throws ServletException, IOException {
		logger.info("<<< url ==> /f_actionmv.mo >>>");
		
		service.f_actionmvListAction(request, model);
		return "common/movie/f_actionmv";
	}
	
}
