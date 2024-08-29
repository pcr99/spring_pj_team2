package spring.mvc.spring_pj_team2.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.mvc.spring_pj_team2.service.MovieServiceImpl;

@Controller
public class CommonController {

	private static final Logger logger = LoggerFactory.getLogger(CommonController.class);
	
	@Autowired
	private MovieServiceImpl service;
	
	@RequestMapping("main.mv")
	public String main(HttpServletRequest request,Model model) throws ServletException, IOException {
		logger.info("<<< url ==> /main.mv >>>");
		service.getMainList(request, model);
		return "common/main/main";
	}
	// 검색 
    @RequestMapping("movie_search.mv")
    public String movie_search(HttpServletRequest request, Model model) 
            throws ServletException, IOException {
        
        logger.info("<<< url ==> /movie_search.mv >>>");
        service.movieSearchAction(request, model);
        return "common/movie_search/search_result";
    }
  //상세페이지
  	@RequestMapping("movie_detailAction.mv")
  	public String movie_detailAction(HttpServletRequest request,Model model) 
  			throws ServletException, IOException {
  		logger.info("<<< url ==> /movie_detailAction.mv >>>");
  		service.movieDetailAction(request, model);
  		
  		return "common/movie_detail/movie_detail";
  	}
  	@RequestMapping("comment_insert.mv")
    public String comment_insert(HttpServletRequest request ,Model model) 
          throws ServletException, IOException {
       logger.info("<<< url ==> /comment_insert.mv >>>");
       
       service.commentAddAction(request, model);
       return "common/movie_detail/comment_insertAction";
    }
  	//댓글목록-상세페이지
  	@RequestMapping("comment_list.mv")
  	public String comment_list(HttpServletRequest request,Model model) 
  			throws ServletException, IOException {
  		logger.info("<<< url ==> /comment_list.mv >>>");
  		service.commentListAction(request, model);
  		return "common/movie_detail/comment_list";
  	}
  	//댓글삭제-상세페이지
  	@RequestMapping("comment_delete.mv")
  	public String comment_delete(HttpServletRequest request,Model model) 
  			throws ServletException, IOException {
  		logger.info("<<< url ==> /comment_delete.mv >>>");
  		service.delete_comment(request, model);
  		return "common/movie_detail/movie_detail";
  	}
}
