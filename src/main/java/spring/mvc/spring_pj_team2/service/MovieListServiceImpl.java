package spring.mvc.spring_pj_team2.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import spring.mvc.spring_pj_team2.dao.MovieListDAO;
import spring.mvc.spring_pj_team2.dto.MovieDTO;

@Service
public class MovieListServiceImpl implements MovieListService{
	
	@Autowired
	private MovieListDAO dao;

	// 한국영화 목록
	@Override
	public void k_mvListAction(HttpServletRequest request, Model model)
			throws ServletException, IOException {
		System.out.println("서비스 - kmvListAction");
		
		// 3단계. 화면에서 입력받은 값 가져오기
		// String country = request.getParameter("country");
		
		// 4단계. 싱글톤 방식으로 DAO 객체 생성, 다형성 적용
		//MovieListDAO dao = MovieListDAOImpl.getInstance();
		
		// 5단계.
		List<MovieDTO> list = dao.k_mvList();
		
		// 6단계. jsp로 처리결과 전달
		model.addAttribute("list", list);
	}

	// 한국 공포영화 목록
	@Override
	public void k_horrormvListAction(HttpServletRequest request, Model model)
			throws ServletException, IOException {
		System.out.println("서비스 - k_horrormvListAction");
		
		// 3단계. 화면에서 입력받은 값 가져오기
		// String country = request.getParameter("country");
		
		// 4단계. 싱글톤 방식으로 DAO 객체 생성, 다형성 적용
		// MovieListDAO dao = MovieListDAOImpl.getInstance();
		
		// 5단계.
		List<MovieDTO> list = dao.k_horrormvList();
		
		// 6단계. jsp로 처리결과 전달
		request.setAttribute("list", list);
		
	}

	// 한국 코미디영화 목록
	@Override
	public void k_comedymvListAction(HttpServletRequest request, Model model)
			throws ServletException, IOException {
		System.out.println("서비스 - k_comedymvListAction");
		
		// 4단계. 싱글톤 방식으로 DAO 객체 생성, 다형성 적용
		// MovieListDAO dao = MovieListDAOImpl.getInstance();
		
		// 5단계.
		List<MovieDTO> list = dao.k_comedymvList();
		
		// 6단계. jsp로 처리결과 전달
		request.setAttribute("list", list);
	}

	// 한국 액션영화 목록
	@Override
	public void k_actionmvListAction(HttpServletRequest request, Model model)
			throws ServletException, IOException {
		System.out.println("서비스 - k_actionmvListAction");
		
		// 4단계. 싱글톤 방식으로 DAO 객체 생성, 다형성 적용
		// MovieListDAO dao = MovieListDAOImpl.getInstance();
		
		// 5단계.
		List<MovieDTO> list = dao.k_actionmvList();
		
		// 6단계. jsp로 처리결과 전달
		request.setAttribute("list", list);
		
	}

	// 외국영화 목록
	@Override
	public void f_mvListAction(HttpServletRequest request, Model model)
			throws ServletException, IOException {
		System.out.println("서비스 - f_mvListAction");
		
		// 4단계. 싱글톤 방식으로 DAO 객체 생성, 다형성 적용
		// MovieListDAO dao = MovieListDAOImpl.getInstance();
		
		// 5단계.
		List<MovieDTO> list = dao.f_mvList();
		
		// 6단계. jsp로 처리결과 전달
		request.setAttribute("list", list);
		
	}

	// 외국 sf영화 목록
	@Override
	public void f_sfmvListAction(HttpServletRequest request, Model model)
			throws ServletException, IOException {
		System.out.println("서비스 - f_sfmvListAction");
		
		// 4단계. 싱글톤 방식으로 DAO 객체 생성, 다형성 적용
		// MovieListDAO dao = MovieListDAOImpl.getInstance();
		
		// 5단계.
		List<MovieDTO> list = dao.f_sfmvList();
		
		// 6단계. jsp로 처리결과 전달
		request.setAttribute("list", list);
		
	}

	// 외국 히어로영화 목록
	@Override
	public void f_heromvListAction(HttpServletRequest request, Model model)
			throws ServletException, IOException {
		System.out.println("서비스 - f_heromvListAction");
		
		// 4단계. 싱글톤 방식으로 DAO 객체 생성, 다형성 적용
		// MovieListDAO dao = MovieListDAOImpl.getInstance();
		
		// 5단계.
		List<MovieDTO> list = dao.f_heromvList();
		
		// 6단계. jsp로 처리결과 전달
		request.setAttribute("list", list);
		
	}

	// 외국 액션영화 목록
	@Override
	public void f_actionmvListAction(HttpServletRequest request, Model model)
			throws ServletException, IOException {
		System.out.println("서비스 - f_actionmvListAction");
		
		// 4단계. 싱글톤 방식으로 DAO 객체 생성, 다형성 적용
		// MovieListDAO dao = MovieListDAOImpl.getInstance();
		
		// 5단계.
		List<MovieDTO> list = dao.f_actionmvList();
		
		// 6단계. jsp로 처리결과 전달
		request.setAttribute("list", list);
		
	}
	
	@Override
	public void incrementkVisitorCount(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		dao.incrementkVisitorCount();
	}
	
	@Override
	public void incrementfVisitorCount(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		dao.incrementfVisitorCount();
	}

}
