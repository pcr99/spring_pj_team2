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

import spring.mvc.spring_pj_team2.service.UserInfoServiceImpl;

@Controller
public class UserInfoController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserInfoController.class);
	
	@Autowired
	private UserInfoServiceImpl service;
	
	@RequestMapping("login.ui")
	public String login() {
		logger.info("<<< url ==> /login.ui >>>");
		return "common/login/login";
	}
	@RequestMapping("join.ui")
	public String join() {
		logger.info("<<< url ==> /join.ui >>>");
		return "common/login/join";
	}
	@RequestMapping("idConfirmAction.ui")
	public String idConfirmAction(HttpServletRequest request, Model model) {
		logger.info("<<< url ==> /idConfirmAction.ui >>>");
		service.idConfirmAction(request, model);
		return "common/login/idConfirmAction";
	}
	@RequestMapping("joinAction.ui")
	public String joinAction(HttpServletRequest request, Model model) 
			throws ServletException, IOException {
		logger.info("<<< url ==>  /joinAction.ui >>>");
		service.join(request, model);
		return "common/login/joinAction";
	}
	@RequestMapping("emailChkAction.ui")
	public String emailChkAction(HttpServletRequest request, Model model) 
			throws ServletException, IOException {
		logger.info("<<< url ==>  /emailChkAction.ui >>>");
		
		service.emailChkAction(request, model);
		return "common/login/emailChkAction";
	}
	@RequestMapping("logout.ui")
	public String login(HttpServletRequest request,HttpServletResponse response, Model model) 
			throws ServletException, IOException {
		logger.info("<<< url ==>  /logout.do >>>");
		// 세션 삭제
		request.getSession().invalidate();
		response.sendRedirect(request.getContextPath()+"/main.mv");
		return null;
	}
	@RequestMapping("mypage.ui")
	public String mypage(HttpServletRequest request, Model model) 
			throws ServletException, IOException{
		logger.info("<<< url ==> /mypage.ui >>>");
		request.getSession();
		service.userListup2(request, model);
		return "common/mypage/mypage";
	}
	
	@RequestMapping("mypage_update.ui")
	public String mypage_update(HttpServletRequest request, Model model)
			throws ServletException, IOException{
		logger.info("<<< url ==> /mypage_update.ui >>>");
		service.userListup2(request, model);
		return "common/mypage/mypage_update";
	}
	
	
	@RequestMapping("mypage_updateAction.ui")
	public String mypage_updateAction(HttpServletRequest request, Model model) 
			throws ServletException, IOException{
		logger.info("<<< url ==> /mypage_updateAction.ui >>>");
		service.mypage_updateAction(request, model);
		return "common/mypage/mypage_updateAction";
	}
	
	@RequestMapping("deleteInfo.ui")
	public String deleteInfo(HttpServletRequest request, Model model) 
			throws ServletException, IOException{
		logger.info("<<< url ==> /deleteInfo.ui >>>");
 
		return "common/mypage/deletePage";
	}
	
	@RequestMapping("deleteAction.ui")
    public String deleteAction(HttpServletRequest request, Model model) 
            throws ServletException, IOException {
        logger.info("<<< url ==> /deleteAction.ui >>>");

        String userId = request.getParameter("userid");
        String inputPassword = request.getParameter("password");

        if (service.verifyPassword(userId, inputPassword)) {
            service.deleteMyInfo(request, model);

            // 세션 무효화로 로그아웃 처리
            request.getSession().invalidate();

            // 탈퇴 성공 메시지 추가
            model.addAttribute("message", "회원탈퇴가 완료되었습니다. 자동으로 로그아웃 됩니다.");
            return "common/login/logout";
        } else {
            // 비밀번호 검증 실패 시 에러 메시지 추가
            model.addAttribute("errorMessage", "비밀번호가 올바르지 않습니다.");
            return "common/mypage/mypage_deleteAction";
        }
    }

    @RequestMapping("emailChkAction2.ui")
    public String emailChkAction2(HttpServletRequest request, Model model) 
            throws ServletException, IOException {
        logger.info("<<< url ==>  /emailChkAction2.ui >>>");
        
        service.emailChkAction2(request, model);
        return "common/login/emailChkAction2";
    }
    @RequestMapping("messageCheck.ui")
    public String messageCheck(HttpServletRequest request, Model model) 
            throws ServletException, IOException {
        logger.info("<<< url ==>  /messageCheck.ui >>>");
        
        service.messageCheck(request, model);
        return "common/mypage/message_check";
    }
    @RequestMapping("message_detailCheck.ui")
    public String messagedetail(HttpServletRequest request, Model model) 
            throws ServletException, IOException {
        logger.info("<<< url ==>  /messagedetail.ui >>>");
        
        service.getMessageDetail(request, model);
        return "common/mypage/message_detail";
    }
}
