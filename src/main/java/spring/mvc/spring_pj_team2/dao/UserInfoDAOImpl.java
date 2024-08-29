package spring.mvc.spring_pj_team2.dao;

import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.spring_pj_team2.dto.MessageDTO;
import spring.mvc.spring_pj_team2.dto.UserInfoDTO;
import spring.mvc.spring_pj_team2.util.SettingValues;

@Repository
public class UserInfoDAOImpl implements UserInfoDAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int join(UserInfoDTO dto) {
		System.out.println("DAO - join()");
		int insertCnt = sqlSession.insert("spring.mvc.spring_pj_team2.dao.UserInfoDAO.join", dto);
		return insertCnt;
	}

	// 시큐리티 - 회원가입 성공시 이메일 인증을 위한 이메일 정보 전송
	@Override
	public void sendEmail(String email, String key) {
		System.out.println("DAO - sendEmail()");
		
		// 이메일 설정 => 네이버까페 > SPRING > 스프링 시큐리티 > 스프링_ 네이버로 이메일 보내기 설정_ict_03기 참조
		
		final String username = SettingValues.ADMIN;    // 네이버 이메일 ID : @naver.com은 입력하지 않는다.
		final String password = SettingValues.PW;		// 네이버 비밀번호
		// naver의 이메일 > 환경설정 > POP/IMAP 설정
		final String host = "smtp.naver.com";			// Google일 경우 smtp.gmail.com
		int port = 465;	
		
		// 메일내용 - localhost:포트번호 주의!!!!!!!;
		String recipient = email;  // 받는 사람의 메일 주소 입력
		String subject = "회원가입 인증메일";  			// 메일 제목 입력
		String content = "회원가입을 축하드립니다. 링크를 눌러 회원가입을 완료하세요. "
						+ "<a href='http://localhost:8081/spring_pj_team2/emailChkAction.ui?key=" + key + "'>링크</a>"; // emailChkAction.do를 컨트롤러에 추가
		
		Properties props = System.getProperties();
		
		// 정보를 담기 위한 객체 생성
		// SMTP 서버 설정 정보
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", host);
		
		// Session 생성
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			String uname = username;
			String pwd = password;
			protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
				return new javax.mail.PasswordAuthentication(uname, pwd);
			}
		});
		
		session.setDebug(true);
		
		try {
			// import javax.mail.Message
			// import javax.mail.Transport;
			Message mimeMessage = new MimeMessage(session);
			mimeMessage.setFrom(new InternetAddress("team2email@naver.com"));	// 발신자 세팅
			mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); // 수신자 세팅
			mimeMessage.setSubject(subject);	// 제목세팅
			mimeMessage.setContent(content, "text/html; charset=utf-8");
			Transport.send(mimeMessage);
			System.out.println("<<< Email SEND >>>");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override 
	public int useridCheck(String strUserId) {
		System.out.println("DAO - useridCheck()");
		int checkCnt = sqlSession.selectOne("spring.mvc.spring_pj_team2.dao.UserInfoDAO.useridCheck", strUserId);
		return checkCnt;
	}
	
	// 시큐리티 -로그인전에 이메일 인증을 한다. 
	@Override
	public int selectKey(String key) {
		System.out.println("DAO - selectKey()");
		int selectCnt = sqlSession.selectOne("spring.mvc.spring_pj_team2.dao.UserInfoDAO.selectKey", key);
		System.out.println("DAO- selectCnt : " + selectCnt);
		return selectCnt;
	}

	// 시큐리티 - enabled를 1로 update
	@Override
	public int updateGrade(String key) {
		System.out.println("DAO - updateGrade()");
		int updateCnt = sqlSession.update("spring.mvc.spring_pj_team2.dao.UserInfoDAO.updateGrade", key);
		System.out.println("DAO- updateCnt : " + updateCnt);
		return updateCnt;
	}
	@Override
	public UserInfoDTO getUserInfoBySessionID(String userid) {
		UserInfoDTO user = sqlSession.selectOne("spring.mvc.spring_pj_team2.dao.UserInfoDAO.getUserInfoBySessionID",userid);
		
		return user;
	}
	
	@Override
	public int updateMyInfo(UserInfoDTO dto) {
		
		int updateCnt = sqlSession.update("spring.mvc.spring_pj_team2.dao.UserInfoDAO.updateMyInfo",dto);
		return updateCnt;
	}

	@Override
	public int deleteMyInfo(String userId) {
		int deleteCnt = sqlSession.update("spring.mvc.spring_pj_team2.dao.UserInfoDAO.deleteMyInfo",userId);
		return deleteCnt;
	}

	@Override
	public int downGrade(String userid) {
		System.out.println("DAO - downGrade()");
		int updateCnt = sqlSession.update("spring.mvc.spring_pj_team2.dao.UserInfoDAO.downGrade", userid);
		System.out.println("DAO- updateCnt : " + updateCnt);
		return updateCnt;
	}

	@Override
	public void sendEmail2(String email, String userid) {
		System.out.println("DAO - sendEmail()");
		
		// 이메일 설정 => 네이버까페 > SPRING > 스프링 시큐리티 > 스프링_ 네이버로 이메일 보내기 설정_ict_03기 참조
		
		final String username = SettingValues.ADMIN;    // 네이버 이메일 ID : @naver.com은 입력하지 않는다.
		final String password = SettingValues.PW;		// 네이버 비밀번호
		// naver의 이메일 > 환경설정 > POP/IMAP 설정
		final String host = "smtp.naver.com";			// Google일 경우 smtp.gmail.com
		int port = 465;	
		
		// 메일내용 - localhost:포트번호 주의!!!!!!!;
		String recipient = email;  // 받는 사람의 메일 주소 입력
		String subject = "회원탈퇴 인증메일";  			// 메일 제목 입력
		String content = "링크를 눌러 회원탈퇴를 완료하세요. "
						+ "<a href='http://localhost:8081/spring_pj_team2/emailChkAction2.ui?userid=" + userid + "'>링크</a>"; // emailChkAction.do를 컨트롤러에 추가
		
		Properties props = System.getProperties();
		
		// 정보를 담기 위한 객체 생성
		// SMTP 서버 설정 정보
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", host);
		
		// Session 생성
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			String uname = username;
			String pwd = password;
			protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
				return new javax.mail.PasswordAuthentication(uname, pwd);
			}
		});
		
		session.setDebug(true);
		
		try {
			// import javax.mail.Message
			// import javax.mail.Transport;
			Message mimeMessage = new MimeMessage(session);
			mimeMessage.setFrom(new InternetAddress("team2email@naver.com"));	// 발신자 세팅
			mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); // 수신자 세팅
			mimeMessage.setSubject(subject);	// 제목세팅
			mimeMessage.setContent(content, "text/html; charset=utf-8");
			Transport.send(mimeMessage);
			System.out.println("<<< Email SEND >>>");
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	@Override
    public String getPasswordByUserId(String userId) {
        return sqlSession.selectOne("spring.mvc.spring_pj_team2.dao.UserInfoDAO.getPasswordByUserId", userId);
    }

	@Override
	public int selectId(String userid) {
		System.out.println("DAO - selectKey()");
		int selectCnt = sqlSession.selectOne("spring.mvc.spring_pj_team2.dao.UserInfoDAO.selectId", userid);
		System.out.println("DAO- selectCnt : " + selectCnt);
		System.out.println("userid : " + userid);
		return selectCnt;
	}

	@Override
	public List<MessageDTO> getMessageList(String userid) {
		List<MessageDTO> list = sqlSession.selectList("spring.mvc.spring_pj_team2.dao.UserInfoDAO.getMessageList",userid);
		return list;
	}

	@Override
	public MessageDTO getMessageDetail(int mesNo) {
		MessageDTO dto = sqlSession.selectOne("spring.mvc.spring_pj_team2.dao.UserInfoDAO.getMessageDetail",mesNo);
		return dto;
	}

}
