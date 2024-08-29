package spring.mvc.spring_pj_team2.service;

import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import spring.mvc.spring_pj_team2.dao.UserInfoDAOImpl;
import spring.mvc.spring_pj_team2.dto.MessageDTO;
import spring.mvc.spring_pj_team2.dto.UserInfoDTO;
import spring.mvc.spring_pj_team2.util.EmailChkHandler;

@Service
public class UserInfoServiceImpl implements UserInfoService {

	@Autowired
	private UserInfoDAOImpl dao;

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	@Override
	public void join(HttpServletRequest request, Model model) {
		System.out.println("서비스 - join()");
		UserInfoDTO dto = new UserInfoDTO();

		dto.setUserId(request.getParameter("userid"));

		String pwd = request.getParameter("password");
		String encryptPwd = bCryptPasswordEncoder.encode(pwd);
		dto.setUserPwd(encryptPwd);

		dto.setUserName(request.getParameter("username"));
		dto.setBirth(Date.valueOf(request.getParameter("birthday")));
		dto.setAddress(request.getParameter("address"));

		String hp = request.getParameter("hp1") + "-" + request.getParameter("hp2") + "-" + request.getParameter("hp3");
		dto.setHp(hp);

		String email = request.getParameter("email1") + "@" + request.getParameter("email2");
		dto.setEmail(email);

		String key = EmailChkHandler.getKey();
		dto.setKey(key);

		// 5단계. 회원가입 처리
		int insertCnt = dao.join(dto);
		System.out.println("insertCnt : " + insertCnt);

		// 시큐리티 - 회원가입시 이메일 인증
		if (insertCnt == 1) {
			dao.sendEmail(email, key);
		}

		// 6단계. jsp로 처리결과 전달
		model.addAttribute("insertCnt", insertCnt);
	}

	@Override
	public void idConfirmAction(HttpServletRequest request, Model model) {
		System.out.println("서비스 - idConfirmAction()"); 
		String strUserId = request.getParameter("userid"); 
		int checkCnt = dao.useridCheck(strUserId);
		System.out.println("checkCnt : " + checkCnt);
		model.addAttribute("checkCnt", checkCnt); 
		model.addAttribute("strUserId",strUserId); 
	}

	@Override
	public void emailChkAction(HttpServletRequest request, Model model) 
			throws ServletException, IOException {
		System.out.println("서비스 - emailChkAction()");

		String key = request.getParameter("key");
		int selectCnt = dao.selectKey(key);
		
		int insertCnt = 0;
		if(selectCnt == 1) {
			insertCnt = dao.updateGrade(key);  // enabled를 1로 update
			System.out.println("emailChkAction - insertCnt : " + insertCnt);
		}
		model.addAttribute("insertCnt", insertCnt);
	}
	@Override
	public void mypage_updateAction(HttpServletRequest request, Model model)
			throws ServletException, IOException {
		System.out.println("서비스 - mypage_updateAction");
		UserInfoDTO dto = new UserInfoDTO();
		dto.setUserName(request.getParameter("username"));
		dto.setEmail(request.getParameter("email"));
		dto.setAddress(request.getParameter("address"));
		dto.setHp(request.getParameter("hp"));
		dto.setBirth(Date.valueOf(request.getParameter("birthday")));
		dto.setUserId(request.getParameter("userid"));
		
		int updateCnt = dao.updateMyInfo(dto);
		System.out.println("updateCnt"+updateCnt);
		
		model.addAttribute("updateCnt",updateCnt);
	}

	@Override
	public void userListup2(HttpServletRequest request, Model model) 
			throws ServletException, IOException {
		System.out.println("서비스 - userListup2");
	 String userid = (String)request.getSession().getAttribute("sessionID"); 
	    UserInfoDTO user = dao.getUserInfoBySessionID(userid);
	    model.addAttribute("user",user);
	}

	@Override
    public boolean verifyPassword(String userId, String inputPassword) {
        String storedPassword = dao.getPasswordByUserId(userId);
        return bCryptPasswordEncoder.matches(inputPassword, storedPassword);
    }

    @Override
    public void deleteMyInfo(HttpServletRequest request, Model model) throws ServletException, IOException {
        System.out.println("서비스 - deleteMyInfo");
        UserInfoDTO dto = new UserInfoDTO();
        
        String userId = request.getParameter("userid");
        
        String email = request.getParameter("email1") + "@" + request.getParameter("email2");
        dto.setEmail(email);
        
        String key = request.getParameter("key");
        dto.setKey(key);
        System.out.println("key : " + key);
        
        //회원정보 삭제처리 - show를 1에서 0으로
        int deleteCnt = dao.deleteMyInfo(userId);
        System.out.println("deleteCnt : " + deleteCnt);
        
        // 시큐리티 - 회원가입시 이메일 인증
        if (deleteCnt == 1) {
            dao.sendEmail2(email, userId);
        }
        model.addAttribute("key",key);
        model.addAttribute("deleteCnt", deleteCnt);
    }

    @Override
    public void emailChkAction2(HttpServletRequest request, Model model) 
    		throws ServletException, IOException {
        System.out.println("서비스 - emailChkAction2()");

        String userid = request.getParameter("userid");
        
        int selectCnt = dao.selectId(userid);
        
        int insertCnt = 0;
        if(selectCnt == 1) {
            insertCnt = dao.downGrade(userid);  // enabled를 1로 update
            System.out.println("emailChkAction - insertCnt : " + insertCnt);
        }
        model.addAttribute("insertCnt", insertCnt);
    }

	@Override
	public void messageCheck(HttpServletRequest request, Model model) 
			throws ServletException, IOException {
		System.out.println("서비스 - messageCheck()");
		String userid = (String)request.getSession().getAttribute("sessionID");
		List<MessageDTO> list = dao.getMessageList(userid);
		
		model.addAttribute("list", list);
	}

	@Override
	public void getMessageDetail(HttpServletRequest request, Model model) 
			throws ServletException, IOException {
		System.out.println("서비스 - getMessageDetail()");
		int mesNo = Integer.parseInt(request.getParameter("messageNo")); 
		MessageDTO dto = dao.getMessageDetail(mesNo); 
		model.addAttribute("dto", dto);
		
	}
	
}
