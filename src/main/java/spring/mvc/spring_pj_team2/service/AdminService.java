package spring.mvc.spring_pj_team2.service;


import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import spring.mvc.spring_pj_team2.dto.VisitorDTO;


public interface AdminService {
	
	public void uploadMovie(MultipartHttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException ;
	
	public void deleteMovie(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException ;
	
	public void movieDetail(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException ;
	
	public void modifyMovie(MultipartHttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException ;

	public void movieListup(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException ;
	
	public void userListup(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException ;
	
	public void blockUser(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException ;
	
	public void unblockUser(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException ;
	
	public void messagingUser(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException ;

	public void boardListup(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException ;

	public void boardAdd(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException;

	public void deleteBoard(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException;
	
	public void getAllVisitors(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException;
	
	public void exportToExcel(HttpServletRequest request, HttpServletResponse response, Model model) 
			throws ServletException, IOException;
	
	
}
