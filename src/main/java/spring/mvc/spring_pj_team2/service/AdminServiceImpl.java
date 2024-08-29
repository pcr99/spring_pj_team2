package spring.mvc.spring_pj_team2.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import Page.Paging;
import spring.mvc.spring_pj_team2.dao.AdminDAO;
import spring.mvc.spring_pj_team2.dao.AdminDAOImpl;
import spring.mvc.spring_pj_team2.dao.UserInfoDAO;
import spring.mvc.spring_pj_team2.dao.UserInfoDAOImpl;
import spring.mvc.spring_pj_team2.dto.BoardDTO;
import spring.mvc.spring_pj_team2.dto.MovieDTO;
import spring.mvc.spring_pj_team2.dto.UserInfoDTO;
import spring.mvc.spring_pj_team2.dto.VisitorDTO;
import spring.mvc.spring_pj_team2.dto.MessageDTO;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminDAO dao;
	
	@Override
	public void userListup(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("서비스 - userListup()");
		String pageNum = request.getParameter("pageNum");
		
		Paging paging = new Paging(pageNum);
		int total = dao.userCnt();
		System.out.println("total => " + total);
		
		paging.setTotalCount(total);
		
		// 5-2단계. 게시글 목록 조회
		int start = paging.getStartRow();
		int end = paging.getEndRow();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		
		List<UserInfoDTO> u_list = dao.userListup(map);
		
		model.addAttribute("u_list", u_list);
		model.addAttribute("paging", paging);
	}
	
	@Override
	public void uploadMovie(MultipartHttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		System.out.println("서비스 - uploadMovie()");
		
		// 추가 S : JSP의 ImageUploadHandler.java 기능
		MultipartFile file = request.getFile("poster");
		System.out.println("file : " + file);
		
		// input 경로
		String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload/");
		System.out.println("saveDir : " + saveDir);
		
		// 이미지 추가를 위한 샘플 이미지 경로(upload 폴더 우클릭 > properties > location 정보 복사해서 붙여넣기), 맨뒤 \\ 추가
		String realDir = "D:\\dev\\workspace_spring\\spring_pj_team2\\src\\main\\webapp\\resources\\upload\\";
		System.out.println("realDir : " + realDir);
		
		FileInputStream fis = null;
		FileOutputStream fos = null;
		
		try {
			file.transferTo(new File(saveDir + file.getOriginalFilename()));	// import java.io.File;
			fis = new FileInputStream(saveDir + file.getOriginalFilename());
			fos = new FileOutputStream(realDir + file.getOriginalFilename());
			
			int data = 0;
			while((data = fis.read()) != -1) {
				fos.write(data);
			}
		
			MovieDTO dto = new MovieDTO();
			if(request.getParameter("mvNo") != null) {
				dto.setMvNo(Integer.parseInt(request.getParameter("mvNo")));
			}
			dto.setTitle(request.getParameter("title"));
			dto.setContent(request.getParameter("content"));
			dto.setActor(request.getParameter("actor"));
			dto.setAudience(Integer.parseInt(request.getParameter("audience")));
			dto.setDirector(request.getParameter("director"));
			dto.setGenre(request.getParameter("genre"));
			dto.setGrade(request.getParameter("grade"));
			
			String poster = "/spring_pj_team2/resources/upload/"+  file.getOriginalFilename();
			dto.setPoster(poster);
			
			dto.setReleaseDate(Date.valueOf(request.getParameter("releaseDate")));
			dto.setCountry(request.getParameter("country"));
			dto.toString();
			System.out.println(dto.getTitle());
			
			int resultCnt = dao.addMovie(dto);
			
			model.addAttribute("resultCnt", resultCnt);
			
		} catch(IOException e) {
			e.printStackTrace();
		} finally {
			if(fis != null) fis.close();
			if(fos != null) fos.close();
		}
	}

	@Override
	public void deleteMovie(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		System.out.println("서비스 - deleteMovie()");
		int mvNo = Integer.parseInt(request.getParameter("movieNo"));
		int resultCnt = dao.deleteMovie(mvNo);
		model.addAttribute("resultCnt", resultCnt);
		String id = request.getParameter("sessionID");
		request.getSession().setAttribute("sessionID", id);
	}
	
	@Override
	public void movieDetail(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("서비스 - movieDetail()");
		int mvNo = Integer.parseInt(request.getParameter("movieNo"));
		MovieDTO dto = dao.movieDetail(mvNo);
		model.addAttribute("dto", dto);
	}

	@Override
	public void modifyMovie(MultipartHttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		System.out.println("서비스 - deleteMovie()");
		
		// 추가 S : JSP의 ImageUploadHandler.java 기능
		MultipartFile file = request.getFile("poster");
		System.out.println("file : " + file);
		
		// input 경로
		String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload/");
		System.out.println("saveDir : " + saveDir);
		
		// 이미지 추가를 위한 샘플 이미지 경로(upload 폴더 우클릭 > properties > location 정보 복사해서 붙여넣기), 맨뒤 \\ 추가
		String realDir = "D:\\dev\\workspace_spring\\spring_pj_team2\\src\\main\\webapp\\resources\\upload\\";
		System.out.println("realDir : " + realDir);
		
		FileInputStream fis = null;
		FileOutputStream fos = null;
		String poster = "";
		
		if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			
			try {
				file.transferTo(new File(saveDir + file.getOriginalFilename()));	// import java.io.File;
				fis = new FileInputStream(saveDir + file.getOriginalFilename());
				fos = new FileOutputStream(realDir + file.getOriginalFilename());
				
				int data = 0;
				while((data = fis.read()) != -1) {
					fos.write(data);
				}
				// 추가 E: JSP의 ImageUploadHandler.java 기능
				
			} catch(IOException e) {
				e.printStackTrace();
			} finally {
				if(fis != null) fis.close();
				if(fos != null) fos.close();
			}
			
			// 수정 S 
			// pdImg => ImageUploadHandler 클래스에서 setAttribute()로 넘겼으므로 getAttribute로 처리 
			poster = "/spring_pj_team2/resources/upload/" + file.getOriginalFilename();
			System.out.println("poster : " + poster);
			// 수정 E
		}
		else {
			System.out.println("poster : " + poster);
		}
		
		MovieDTO dto = new MovieDTO();
		int mvNo = Integer.parseInt(request.getParameter("mvNo"));
		dto.setMvNo(mvNo);
		dto.setTitle(request.getParameter("title"));
		dto.setContent(request.getParameter("content"));
		dto.setAudience(Integer.parseInt(request.getParameter("audience")));
		dto.setDirector(request.getParameter("director"));
		dto.setPoster(poster);
		dto.setActor(request.getParameter("actor"));
		dto.setGenre(request.getParameter("genre"));
		dto.setGrade(request.getParameter("grade"));
		dto.setReleaseDate(Date.valueOf(request.getParameter("releaseDate")));
		dto.setCountry(request.getParameter("country"));
		
		int resultCnt = dao.modifyMovie(dto);
		
		model.addAttribute("resultCnt", resultCnt);
		
		String id = request.getParameter("sessionID");
		request.getSession().setAttribute("sessionID", id);
	}

	

	@Override
	public void blockUser(HttpServletRequest request, HttpServletResponse response, Model model) {
	      System.out.println("서비스 - blockUser()");
	      int resultCnt = 0;
	      String[] userIds = request.getParameterValues("userIds");
	        if (userIds != null) {
	            for (String userNo : userIds) {
	                System.out.println("차단처리할 사용자 아이디: " + userNo);
	                
	                dao.blockUser(userNo);
	            }
	            resultCnt = 1;
	            model.addAttribute("resultCnt", resultCnt);
	        } else {
	            System.out.println("선택된 사용자가 없습니다.");
	        }
	   }
	
	@Override
	public void unblockUser(HttpServletRequest request, HttpServletResponse response, Model model) {
	      System.out.println("서비스 - unblockUser()");
	      int resultCnt = 0;
	      String[] userIds = request.getParameterValues("userIds");
	        if (userIds != null) {
	            for (String userNo : userIds) {
	                System.out.println("차단해제할 사용자 번호: " + userNo);
	                
	                dao.unblockUser(userNo);
	            }
	            resultCnt = 1;
	            model.addAttribute("resultCnt", resultCnt);
	        } else {
	            System.out.println("선택된 사용자가 없습니다.");
	        }
	   }

	@Override
	public void messagingUser(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
			System.out.println("서비스 - messagingUser()");
			int resultCnt = 0;
			String[] userIds = request.getParameterValues("user_row");
			System.out.println("userIds : " + userIds);
	        if (userIds != null) {
	            for (String userId : userIds) {
	                System.out.println("메세지를 보낼 사용자 아이디: " + userId);
	              
	                MessageDTO dto = new MessageDTO();
	                dto.setUserId(userId);
	                dto.setMessageTitle(request.getParameter("messageTitle"));
	                dto.setMessageContent(request.getParameter("content"));
	                dao.messaging(dto);
	            }
	            resultCnt = 1;
	            model.addAttribute("resultCnt", resultCnt);
	        } else {
	            System.out.println("선택된 사용자가 없습니다.");
	        }
	}



	@Override
	public void movieListup(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("서비스 - movieListup()");
		
		String pageNum = request.getParameter("pageNum");
		
		Paging paging = new Paging(pageNum);
		int total = dao.movieCnt();
		System.out.println("total => " + total);
		
		paging.setTotalCount(total);
		
		// 5-2단계. 게시글 목록 조회
		int start = paging.getStartRow();
		int end = paging.getEndRow();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		
		List<MovieDTO> m_list = dao.movieListup(map);
		model.addAttribute("m_list", m_list);
		model.addAttribute("paging", paging);
	}
	
	@Override
	public void boardListup(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("서비스 - boardListup()");
		
		String pageNum = request.getParameter("pageNum");
		
		Paging paging = new Paging(pageNum);
		int total = dao.boardCnt();
		System.out.println("total => " + total);
		
		paging.setTotalCount(total);
		
		// 5-2단계. 게시글 목록 조회
		int start = paging.getStartRow();
		int end = paging.getEndRow();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		
		List<BoardDTO> b_list = dao.boardListUp(map);
		
		model.addAttribute("b_list", b_list);
		model.addAttribute("paging", paging);
	}
	
	

	@Override
	public void boardAdd(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		System.out.println("서비스 - boardAdd()");
		BoardDTO dto = new BoardDTO();
		dto.setWriter(request.getParameter("adminId"));
		dto.setTitle(request.getParameter("title"));
		dto.setContent(request.getParameter("content"));
		int resultCnt = dao.addBoard(dto);
		model.addAttribute("resultCnt", resultCnt);
	}

	@Override
	public void deleteBoard(HttpServletRequest request, HttpServletResponse response, Model model)
			throws ServletException, IOException {
		System.out.println("서비스 - deleteBoard()");
		int resultCnt = 0;
	      String[] nums = request.getParameterValues("boardNo");
	        if (nums != null) {
	            for (String num : nums) {
	                System.out.println("삭제처리할 게시판 번호: " + num);
	                int number = Integer.parseInt(num);
	                dao.deleteBoard(number);
	            }
	            resultCnt = 1;
	            model.addAttribute("resultCnt", resultCnt);
	        } else {
	            System.out.println("선택된 게시글이 없습니다.");
	        }
	}

	@Override
	public void getAllVisitors(HttpServletRequest request, HttpServletResponse response, Model model)
	        throws ServletException, IOException {
	    
	    List<VisitorDTO> visitors1 = dao.getAllVisitors();
	    List<VisitorDTO> visitors2 = dao.getAllVisitors2();
	    
	    System.out.println("visitors1: " + visitors1);
	    for (VisitorDTO visitor : visitors1) {
	        System.out.println("vdate: " + visitor.getVdate() + ", visitors: " + visitor.getVisitors1());
	    }
	    
	    System.out.println("visitors2: " + visitors2);
	    for (VisitorDTO visitor : visitors2) {
	        System.out.println("vdate: " + visitor.getVdate() + ", visitors: " + visitor.getVisitors2());
	    }

	    Map<String, Map<String, Integer>> combinedData = new HashMap<String, Map<String, Integer>>();
	    for (VisitorDTO visitor : visitors1) {
	        Map<String, Integer> dataMap = new HashMap<String, Integer>();
	        dataMap.put("visitors1", visitor.getVisitors1());
	        combinedData.put(visitor.getVdate().toString(), dataMap); // Date 타입을 문자열로 변환
	    }

	    for (VisitorDTO visitor : visitors2) {
	        if (combinedData.containsKey(visitor.getVdate().toString())) {
	            combinedData.get(visitor.getVdate().toString()).put("visitors2", visitor.getVisitors2());
	        } else {
	            Map<String, Integer> dataMap = new HashMap<String, Integer>();
	            dataMap.put("visitors2", visitor.getVisitors2());
	            combinedData.put(visitor.getVdate().toString(), dataMap);
	        }
	    }

	    Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create(); // 날짜 포맷 지정
	    String json = gson.toJson(combinedData);
	    model.addAttribute("json", json);
	    System.out.println("json :" + json);
	}

	@Override
    public void exportToExcel(HttpServletRequest request, HttpServletResponse response, Model model) 
            throws IOException {
        
        List<VisitorDTO> visitors1 = dao.getAllVisitors();
        List<VisitorDTO> visitors2 = dao.getAllVisitors2();

        // 엑셀 워크북과 시트 생성
        Workbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet("Visitor Stats");

        Row headerRow = sheet.createRow(0);
        headerRow.createCell(0).setCellValue("날짜");
        headerRow.createCell(1).setCellValue("국내영화 방문자 수");
        headerRow.createCell(2).setCellValue("국외영화 방문자 수");

        // 데이터 매핑
        Map<String, Map<String, Integer>> combinedData = new HashMap<String, Map<String, Integer>>();
        for (VisitorDTO visitor : visitors1) {
            Map<String, Integer> dataMap = new HashMap<String, Integer>();
            dataMap.put("visitors1", visitor.getVisitors1());
            combinedData.put(visitor.getVdate().toString(), dataMap);
        }

        for (VisitorDTO visitor : visitors2) {
            if (combinedData.containsKey(visitor.getVdate().toString())) {
                combinedData.get(visitor.getVdate().toString()).put("visitors2", visitor.getVisitors2());
            } else {
                Map<String, Integer> dataMap = new HashMap<String, Integer>();
                dataMap.put("visitors2", visitor.getVisitors2());
                combinedData.put(visitor.getVdate().toString(), dataMap);
            }
        }

        int rowNum = 1;
        for (String date : combinedData.keySet()) {
            Row row = sheet.createRow(rowNum++);
            row.createCell(0).setCellValue(date);
            row.createCell(1).setCellValue(combinedData.get(date).getOrDefault("visitors1", 0));
            row.createCell(2).setCellValue(combinedData.get(date).getOrDefault("visitors2", 0));
        }

        // 엑셀 파일 다운로드 설정
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setHeader("Content-Disposition", "attachment; filename=visitor.xlsx");

        // 엑셀 파일 쓰기
        ServletOutputStream outputStream = response.getOutputStream();
        workbook.write(outputStream);
        workbook.close();
        outputStream.close();
    }

}
