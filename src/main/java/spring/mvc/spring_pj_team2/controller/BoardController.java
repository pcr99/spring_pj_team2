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

import spring.mvc.spring_pj_team2.service.BoardServiceImpl;

@Controller
public class BoardController  {
       
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Autowired
    private BoardServiceImpl service;	
	
	String viewPage = "";
	
	// 게시글 목록
    @RequestMapping("board_list.bc")
    public String boardList(HttpServletRequest request, Model model) 
    	throws ServletException, IOException {
       
    	logger.info("<<< uri ==> board_list.bc >>>");
        service.boardListAction(request, model);
        
        return "common/board/board_list";
    }

    // 상세페이지
    @RequestMapping("board_detailAction.bc")
    public String boardDetail(HttpServletRequest request, Model model) 
    	throws ServletException, IOException {
        logger.info("<<< url ==> /board_detailAction.bc >>>");
        service.boardDetailAction(request, model);
        return "common/board/board_detailAction";
    }
    
    // 게시글 수정페이지
    @RequestMapping("board_update.bc")
    public String boardModify(HttpServletRequest request, Model model) 
    		throws ServletException, IOException {
        logger.info("<<< url ==> /board_update.bc >>>");
        service.boardModify(request, model);
        return "common/board/board_update";
    }
    
    // 게시글 수정처리
    @RequestMapping("board_updateAction.bc")
    public String board_updateAction(HttpServletRequest request, HttpServletResponse response, Model model) 
    		throws ServletException, IOException {
        logger.info("<<< url ==> /board_updateAction.bc >>>");

        service.boardUpdateAction(request, model);
		viewPage = request.getContextPath() + "/board_list.bc";
		response.sendRedirect(viewPage);
		return "common/board/board_edit";
    }
    // 게시글 삭제
    @RequestMapping("board_deleteAction.bc")
    public String boardDelete(HttpServletRequest request, HttpServletResponse response, Model model) 
    		throws ServletException, IOException {
       
    	logger.info("<<< url ==> /board_deleteAction.bc >>>");
    	
    	service.boardDeleteAction(request, model);
		viewPage = request.getContextPath() + "/board_list.bc";
		response.sendRedirect(viewPage);
		return "common/board/board_list";
    }
    // 게시글 작성 화면
    @RequestMapping("board_insert.bc")
    public String boardInsertForm(HttpServletRequest request, Model model) 
    	throws ServletException, IOException {
        
        logger.info("<<< url ==> /board_insert.bc >>>");
        
        return "common/board/board_insert";
    }

    // 게시글 작성 처리
    @RequestMapping("board_insertAction.bc")
    public String boardInsert(HttpServletRequest request, HttpServletResponse response, Model model) 
    		throws ServletException, IOException {
        logger.info("<<< url ==> /board_insertAction.bc >>>");
       
        service.boardInsertAction(request, response, model);
        
        String viewPage = request.getContextPath() + "/board_list.bc";
        response.sendRedirect(viewPage);
        return null;
    }

    // 댓글 작성 처리
    @RequestMapping("comment_insert.bc")
    public void commentInsert(HttpServletRequest request, HttpServletResponse response,Model model) throws ServletException, IOException {
        logger.info("<<< url ==> /comment_insert.bc >>>");
        service.commentAddAction(request, response, model);
    }

    // 댓글 목록 처리
    @RequestMapping("comment_list.bc")
    public String commentList(HttpServletRequest request, HttpServletResponse response,Model model) throws ServletException, IOException {
        logger.info("<<< url ==> /comment_list.bc >>>");
        service.commentListAction(request, response, model);
        return "common/board/comment_list";
    }
}
