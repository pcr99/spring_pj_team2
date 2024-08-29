package spring.mvc.spring_pj_team2.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import spring.mvc.spring_pj_team2.dao.MovieDAOImpl;
import spring.mvc.spring_pj_team2.dto.MovieCommentDTO;
import spring.mvc.spring_pj_team2.dto.MovieDTO;

@Service
public class MovieServiceImpl implements MovieService {

	@Autowired
	private MovieDAOImpl dao;
	
	@Override
	public void getMainList(HttpServletRequest request, Model model) throws ServletException, IOException {
		System.out.println("서비스 - getMainList");
		List<MovieDTO> list = dao.getPopularList();
		model.addAttribute("p_list", list);
		List<MovieDTO> list2 = dao.getLatestList();
		model.addAttribute("l_list", list2);
		List<MovieDTO> list3 = dao.getDomesticList();
		model.addAttribute("d_list", list3);
		List<MovieDTO> list4 = dao.getGlobalList();
		model.addAttribute("g_list", list4);
	}
	@Override
    public void movieSearchAction(HttpServletRequest request, Model model) 
            throws ServletException, IOException {
    	String searchTitle = request.getParameter("keyword");
        List<MovieDTO> searchResult = dao.movieSearch(searchTitle);
        model.addAttribute("searchResult", searchResult);
    }
	
	@Override
	public void movieDetailAction(HttpServletRequest request, Model model) 
			throws ServletException, IOException {
		System.out.println("서비스 - movieDetailAction");
		
		int mvNo = Integer.parseInt(request.getParameter("mvNo"));
		MovieDTO dto =  dao.movieDetail(mvNo);
		
		model.addAttribute("dto",dto);
		
	}
	@Override
	   public void commentAddAction(HttpServletRequest request, Model model) 
	         throws ServletException, IOException {
	      System.out.println("서비스 - commentAddAction");
	      
	      
	      MovieCommentDTO dto = new MovieCommentDTO();
	      
	      dto.setMvNo(Integer.parseInt(request.getParameter("mvNo")));
	      dto.setReview(request.getParameter("review"));
	      dto.setRating(request.getParameter("rating"));
	      dto.setPassword(request.getParameter("password"));
	      
	      int insertCnt = dao.commentInsert(dto);
	      model.addAttribute("insertCnt",insertCnt);
	      model.addAttribute("dto",dto);
	   }
	@Override
	public void commentListAction(HttpServletRequest request, Model model) 
			throws ServletException, IOException {
		System.out.println("commentListAction");
		
		int mvNo = Integer.parseInt(request.getParameter("mvNo"));
		
		List<MovieCommentDTO> list = 	dao.commentList(mvNo);
	      
	      model.addAttribute("list",list);
	}
	@Override
	public void delete_comment(HttpServletRequest request, Model model) 
			throws ServletException, IOException {
		System.out.println("서비스 - delete_comment");
		
		//int mvNo = Integer.parseInt(request.getParameter("mvNo"));
		int commnet_num = Integer.parseInt(request.getParameter("comment_num"));
	    String password = request.getParameter("password");
	    
	    Map<String, Object>map = new HashMap<String, Object>();
	    map.put("comment_num", commnet_num);
	    map.put("password", password);

	    int selectCnt = dao.password_chk(map);
	    System.out.println("selectCnt :" +selectCnt);
	    int deleteCnt = 0;
	    if (selectCnt == 1) {
	    	deleteCnt = dao.commentDelete(commnet_num);
	    	model.addAttribute("deleteCnt",deleteCnt);
	    }
	  int mvNo = Integer.parseInt(request.getParameter("mvNo"));
	    
	    MovieDTO dto =  dao.movieDetail(mvNo);
    	model.addAttribute("dto",dto);
	}
}
