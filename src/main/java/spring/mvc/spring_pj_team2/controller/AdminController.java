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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import spring.mvc.spring_pj_team2.service.AdminServiceImpl;

@Controller
public class AdminController {
	
	@Autowired
	private AdminServiceImpl service;
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@RequestMapping("/export")
    public String exportToExcel(HttpServletRequest request, HttpServletResponse response, Model model) 
            throws ServletException, IOException {
        logger.info("<<< url ==> /export >>>");

        service.exportToExcel(request, response, model);
        
        return "admin/admin_main/admin_main";
    }
	
	
	@RequestMapping("admin_main.an")
	public String admin_main(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		logger.info("<<< url ==> /admin_main.an >>>");
		
		service.getAllVisitors(request, response, model);
		return "admin/admin_main/admin_main";
	}
	
	@RequestMapping("admin_movie.an")
	public String admin_movie(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		logger.info("<<< url ==> /admin_movie.an >>>");
		
		service.movieListup(request, response, model);
		return "admin/admin_main/movie_tab";
	}
	
	@RequestMapping("admin_board.an")
	public String admadmin_boardin_main(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		logger.info("<<< url ==> /admin_board.an >>>");
		
		service.boardListup(request, response, model);
		return "admin/admin_main/board_tab";
	}
	
	@RequestMapping("admin_manage.an")
	public String admin_manage(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		logger.info("<<< url ==> /admin_manage.an >>>");
		
		service.userListup(request, response, model);
		return "admin/admin_main/manage_tab";
	}
	
	@RequestMapping("add_movie.an")
	public String add_movie(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		logger.info("<<< url ==> /add_movie.an >>>");
		
		return "admin/movie_tab/add_movie";
	}
	

	@RequestMapping("admin_addMovie.an")
	public String admin_addMovie(MultipartHttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		logger.info("<<< url ==> /admin_addMovie.an >>>");
		
		service.uploadMovie(request, response, model);
		return "admin/movie_tab/admin_addmovie";
	}
	
	@RequestMapping("admin_deleteMovie.an")
	public String admin_deleteMovie(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		logger.info("<<< url ==> /admin_deleteMovie.an >>>");
		
		service.deleteMovie(request, response, model);
		return "admin/movie_tab/delete_movieAction";
	}
	
	@RequestMapping("admin_movieDetail.an")
	public String admin_movieDetail(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		logger.info("<<< url ==> /admin_movieDetail.an >>>");
		
		service.movieDetail(request, response, model);
		return "admin/movie_tab/admin_movieDetail";
	}
	
	@RequestMapping("admin_modifyAction.an")
	public String admin_modifyAction(MultipartHttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		logger.info("<<< url ==> /admin_modifyAction.an >>>");
		
		service.modifyMovie(request, response, model);
		return "admin/movie_tab/modify_movieAction";
	}
	
	@RequestMapping("blockUser.an")
	public String blockUser(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		logger.info("<<< url ==> /blockUser.an >>>");
		
		service.blockUser(request, response, model);
		return "admin/manage_tab/admin_manageAction";
	}
	
	@RequestMapping("unblockUser.an")
	public String unblockUser(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		logger.info("<<< url ==> /unblockUser.an >>>");
		
		service.unblockUser(request, response, model);
		return "admin/manage_tab/admin_manageAction2";
	}
	
	@RequestMapping("messagingUser.an")
	public String messagingUser(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		logger.info("<<< url ==> /messagingUser.an >>>");
		
		return "admin/manage_tab/messagingUser";
	}
	
	@RequestMapping("message_Action.an")
	public String message_Action(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		logger.info("<<< url ==> /message_Action.an >>>");
		
		service.messagingUser(request, response, model);
		return "admin/manage_tab/message_Action";
	}
	
	@RequestMapping("add_board.an")
	public String add_board(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		logger.info("<<< url ==> /add_board.an >>>");
		
		return "admin/board_tab/add_board";
	}
	
	@RequestMapping("board_addAction.an")
	public String board_addAction(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		logger.info("<<< url ==> /board_addAction.an >>>");
		
		service.boardAdd(request, response, model);
		return "admin/board_tab/board_addAction";
	}
	
	@RequestMapping("delete_board.an")
	public String delete_board(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		logger.info("<<< url ==> /delete_board.an >>>");
		
		service.deleteBoard(request, response, model);
		return "admin/board_tab/delete_board";
	}
	

}
