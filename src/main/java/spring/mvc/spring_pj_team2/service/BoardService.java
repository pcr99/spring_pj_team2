package spring.mvc.spring_pj_team2.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

public interface BoardService {

	//게시글 목록
	public void boardListAction(HttpServletRequest request, Model model)
		throws ServletException, IOException;	
	
	//게시글 상세페이지 
	public void boardDetailAction(HttpServletRequest request, Model model)
			throws ServletException, IOException;

	//게시글 수정
	public void boardModify(HttpServletRequest request, Model model) 
			throws ServletException, IOException;

	//게시글 수정처리
	public void boardUpdateAction(HttpServletRequest request, Model model)
			throws ServletException, IOException;
	
	//게시글 삭제처리
	public void boardDeleteAction(HttpServletRequest request, Model model)
			throws ServletException, IOException;
	
	//게시글 작성처리
	public void boardInsertAction(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException;
	
	//댓글 작성처리
	public void commentAddAction(HttpServletRequest request, HttpServletResponse response,Model model)
			throws ServletException, IOException;
	
	//댓글 목록처리
	public void commentListAction(HttpServletRequest request, HttpServletResponse response,Model model)
			throws ServletException, IOException;
}
