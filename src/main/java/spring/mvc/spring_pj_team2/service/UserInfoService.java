package spring.mvc.spring_pj_team2.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;


public interface UserInfoService {

	
	public void join(HttpServletRequest request, Model model);
	
	public void idConfirmAction(HttpServletRequest request, Model model);
	  
	public void emailChkAction(HttpServletRequest request, Model model)
			throws ServletException, IOException;

	public void mypage_updateAction(HttpServletRequest request, Model model) 
			throws ServletException, IOException;

	public void userListup2(HttpServletRequest request, Model model) 
			throws ServletException, IOException;

	public boolean verifyPassword(String userId, String inputPassword);

	public void deleteMyInfo(HttpServletRequest request, Model model) 
			throws ServletException, IOException;

	public void emailChkAction2(HttpServletRequest request, Model model) 
			throws ServletException, IOException;
	
	public void messageCheck(HttpServletRequest request, Model model) 
			throws ServletException, IOException;

	public void getMessageDetail(HttpServletRequest request, Model model)
			throws ServletException, IOException;
}
