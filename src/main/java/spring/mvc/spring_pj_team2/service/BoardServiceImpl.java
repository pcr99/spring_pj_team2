package spring.mvc.spring_pj_team2.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import spring.mvc.spring_pj_team2.service.BoardService;
import spring.mvc.spring_pj_team2.dao.BoardDAO;
import spring.mvc.spring_pj_team2.dto.BoardCommentDTO;
import spring.mvc.spring_pj_team2.dto.BoardDTO;
import Page.Paging;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
    private BoardDAO dao;

	// 게시글 목록
    @Override
    public void boardListAction(HttpServletRequest req, Model model) {
    	System.out.println("서비스 - boardListAction");

        String pageNum = req.getParameter("pageNum");
        Paging paging = new Paging(pageNum);
        int total = dao.boardCnt();
        paging.setTotalCount(total);

        int start = paging.getStartRow();
        int end = paging.getEndRow();

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("start", start);
        map.put("end", end);

        List<BoardDTO> list = dao.boardList(map);
        model.addAttribute("list", list);
        model.addAttribute("paging", paging);
    }

    // 게시글 상세페이지
    @Override
    public void boardDetailAction(HttpServletRequest request, Model model) 
    		throws ServletException, IOException {
        int num = Integer.parseInt(request.getParameter("num"));
        BoardDTO dto = dao.getBoardDetail(num);
        model.addAttribute("dto", dto);
    }

    @Override
	public void boardModify(HttpServletRequest request, Model model) 
			throws ServletException, IOException {
    	System.out.println("서비스 :  +boardModify");
    	
    	BoardDTO dto = new BoardDTO();
    	
    	int num = Integer.parseInt(request.getParameter("hidden_num"));
    	
    	 dto = dao.getBoardDetail(num);
    
    	model.addAttribute("dto", dto);
    }
    
    // 게시글 수정 처리
    @Override
    public void boardUpdateAction(HttpServletRequest request, Model model) throws ServletException, IOException {
        BoardDTO dto = new BoardDTO();
        System.out.println("서비스 :  +boardUpdateAction");
        dto.setNum(Integer.parseInt(request.getParameter("num")));
        dto.setTitle(request.getParameter("title"));
        dto.setContent(request.getParameter("content"));

        dao.updateBoard(dto);
        model.addAttribute("dto", dto);
        System.out.println("서비스 :  +boardUpdateAction123");
    }

    // 게시글 삭제 처리
    @Override
    public void boardDeleteAction(HttpServletRequest request, Model model) 
    		throws ServletException, IOException {
        dao.deleteBoard(Integer.parseInt(request.getParameter("hidden_num")));
    }
    
    // 게시글 작성 처리
    @Override
    public void boardInsertAction(HttpServletRequest request, HttpServletResponse response, Model model) 
    		throws ServletException, IOException {
        BoardDTO dto = new BoardDTO();
      
        dto.setWriter(request.getParameter("writer"));
        dto.setTitle(request.getParameter("title"));
        dto.setContent(request.getParameter("content"));

        int insertCnt = dao.insertBoard(dto);
        model.addAttribute("insertCnt", insertCnt);
        System.out.println("insertCnt : " + insertCnt);
    }

    // 댓글 작성 처리
    @Override
    public void commentAddAction(HttpServletRequest request,HttpServletResponse response, Model model) throws ServletException, IOException {
        BoardCommentDTO dto = new BoardCommentDTO();
        dto.setBoard_num(Integer.parseInt(request.getParameter("board_num")));
        dto.setWriter(request.getParameter("writer"));
        dto.setContent(request.getParameter("content"));

        dao.commentInsert(dto);
    }

    // 댓글 목록 처리
    @Override
    public void commentListAction(HttpServletRequest request,HttpServletResponse response, Model model) throws ServletException, IOException {
        int board_num = Integer.parseInt(request.getParameter("board_num"));
        List<BoardCommentDTO> list = dao.commentList(board_num);
        model.addAttribute("list", list);
    }

}
